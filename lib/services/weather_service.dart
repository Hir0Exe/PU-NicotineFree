import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherData {
  final double temperature;
  final String description;
  final String mainCondition;
  final String cityName;

  WeatherData({
    required this.temperature,
    required this.description,
    required this.mainCondition,
    required this.cityName,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      mainCondition: json['weather'][0]['main'],
      cityName: json['name'],
    );
  }

  // Método para obtener la descripción en español
  String get descriptionInSpanish {
    final Map<String, String> translations = {
      'Clear': 'Despejado',
      'Clouds': 'Nublado',
      'Rain': 'Lluvioso',
      'Drizzle': 'Llovizna',
      'Thunderstorm': 'Tormenta',
      'Snow': 'Nevado',
      'Mist': 'Neblina',
      'Smoke': 'Humo',
      'Haze': 'Bruma',
      'Dust': 'Polvo',
      'Fog': 'Niebla',
      'Sand': 'Arena',
      'Ash': 'Ceniza',
      'Squall': 'Ráfaga',
      'Tornado': 'Tornado',
    };
    return translations[mainCondition] ?? mainCondition;
  }

  // Método para obtener el emoji del clima
  String get weatherEmoji {
    switch (mainCondition.toLowerCase()) {
      case 'clear':
        return '☀️';
      case 'clouds':
        return '☁️';
      case 'rain':
        return '🌧️';
      case 'drizzle':
        return '🌦️';
      case 'thunderstorm':
        return '⛈️';
      case 'snow':
        return '❄️';
      case 'mist':
      case 'fog':
        return '🌫️';
      default:
        return '🌤️';
    }
  }
}

class WeatherService {
  // Usando Open-Meteo: API GRATUITA, SIN API KEY, ilimitada
  // Documentación: https://open-meteo.com/en/docs
  static const String _baseUrl = 'https://api.open-meteo.com/v1';
  
  // Caché para evitar llamadas repetidas
  static WeatherData? _cachedWeather;
  static DateTime? _lastFetch;
  static const Duration _cacheDuration = Duration(minutes: 10);

  // Obtener clima por coordenadas usando Open-Meteo
  Future<WeatherData?> getWeatherByCoordinates(
    double latitude,
    double longitude,
  ) async {
    // Verificar si tenemos datos en caché y aún son válidos
    if (_cachedWeather != null && _lastFetch != null) {
      final timeSinceLastFetch = DateTime.now().difference(_lastFetch!);
      if (timeSinceLastFetch < _cacheDuration) {
        print('📦 Usando clima desde caché (válido por ${_cacheDuration.inMinutes - timeSinceLastFetch.inMinutes} minutos más)');
        return _cachedWeather;
      }
    }

    try {
      print('🌐 Haciendo petición a Open-Meteo API (GRATIS, sin límites)...');
      
      // Open-Meteo no requiere API key
      final url = Uri.parse(
        '$_baseUrl/forecast?latitude=$latitude&longitude=$longitude&current_weather=true&timezone=auto',
      );

      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Timeout al obtener clima');
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final weatherData = _parseOpenMeteoData(data, latitude, longitude);
        
        if (weatherData != null) {
          // Guardar en caché
          _cachedWeather = weatherData;
          _lastFetch = DateTime.now();
          
          print('✅ Clima obtenido y guardado en caché');
          return weatherData;
        }
        return null;
      } else {
        print('Error al obtener clima: ${response.statusCode}');
        print('Respuesta: ${response.body}');
        
        // Si tenemos caché, devolverlo
        if (_cachedWeather != null) {
          print('📦 Usando clima antiguo desde caché');
          return _cachedWeather;
        }
        return null;
      }
    } catch (e) {
      print('Error al hacer petición del clima: $e');
      
      // Si tenemos caché, devolverlo en caso de error
      if (_cachedWeather != null) {
        print('📦 Usando clima antiguo desde caché debido a error');
        return _cachedWeather;
      }
      return null;
    }
  }

  // Parsear datos de Open-Meteo
  WeatherData? _parseOpenMeteoData(
    Map<String, dynamic> data,
    double latitude,
    double longitude,
  ) {
    try {
      final currentWeather = data['current_weather'];
      final temperature = currentWeather['temperature'].toDouble();
      final weatherCode = currentWeather['weathercode'] as int;
      
      // Convertir código del clima a descripción
      final weatherInfo = _getWeatherInfoFromCode(weatherCode);
      
      return WeatherData(
        temperature: temperature,
        description: weatherInfo['description']!,
        mainCondition: weatherInfo['main']!,
        cityName: 'Tu ubicación', // Open-Meteo no da nombre de ciudad
      );
    } catch (e) {
      print('Error al parsear datos de Open-Meteo: $e');
      return null;
    }
  }

  // Convertir código WMO del clima a descripción
  // Referencia: https://open-meteo.com/en/docs
  Map<String, String> _getWeatherInfoFromCode(int code) {
    switch (code) {
      case 0:
        return {'main': 'Clear', 'description': 'Cielo despejado'};
      case 1:
      case 2:
      case 3:
        return {'main': 'Clouds', 'description': 'Parcialmente nublado'};
      case 45:
      case 48:
        return {'main': 'Fog', 'description': 'Niebla'};
      case 51:
      case 53:
      case 55:
        return {'main': 'Drizzle', 'description': 'Llovizna'};
      case 61:
      case 63:
      case 65:
        return {'main': 'Rain', 'description': 'Lluvia'};
      case 71:
      case 73:
      case 75:
        return {'main': 'Snow', 'description': 'Nieve'};
      case 77:
        return {'main': 'Snow', 'description': 'Granizo'};
      case 80:
      case 81:
      case 82:
        return {'main': 'Rain', 'description': 'Aguacero'};
      case 85:
      case 86:
        return {'main': 'Snow', 'description': 'Nevada'};
      case 95:
        return {'main': 'Thunderstorm', 'description': 'Tormenta eléctrica'};
      case 96:
      case 99:
        return {'main': 'Thunderstorm', 'description': 'Tormenta con granizo'};
      default:
        return {'main': 'Clear', 'description': 'Clima despejado'};
    }
  }

  // Nota: Open-Meteo no soporta búsqueda por nombre de ciudad
  // Solo funciona con coordenadas GPS
  Future<WeatherData?> getWeatherByCity(String cityName) async {
    print('⚠️ Open-Meteo no soporta búsqueda por nombre de ciudad');
    print('💡 Usa getWeatherByCoordinates() en su lugar');
    return null;
  }
}

