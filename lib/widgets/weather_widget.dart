import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../services/location_service.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = LocationService();
  
  WeatherData? _weatherData;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    if (!mounted) return;
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      print('🌍 Intentando obtener ubicación...');
      
      // Obtener ubicación actual
      final coordinates = await _locationService.getCoordinates();
      
      if (coordinates != null) {
        print('📍 Ubicación obtenida: ${coordinates['latitude']}, ${coordinates['longitude']}');
        
        // Obtener clima por coordenadas
        final weather = await _weatherService.getWeatherByCoordinates(
          coordinates['latitude']!,
          coordinates['longitude']!,
        );
        
        if (!mounted) return;
        
        if (weather != null) {
          print('☀️ Clima obtenido: ${weather.temperature}°C, ${weather.description}');
          setState(() {
            _weatherData = weather;
            _isLoading = false;
            _errorMessage = null;
          });
        } else {
          print('❌ No se pudo obtener datos del clima');
          setState(() {
            _weatherData = null;
            _errorMessage = 'Límite de peticiones alcanzado.\nObtén tu API key gratis.';
            _isLoading = false;
          });
        }
      } else {
        print('❌ No se pudo obtener ubicación');
        if (!mounted) return;
        
        setState(() {
          _weatherData = null;
          _errorMessage = 'Activa el GPS para ver el clima';
          _isLoading = false;
        });
      }
    } catch (e) {
      print('💥 Error al cargar clima: $e');
      if (!mounted) return;
      
      setState(() {
        _weatherData = null;
        _errorMessage = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Siempre mostrar algo - nunca desaparecer
    if (_isLoading) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 12),
            Text(
              'Obteniendo clima...',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    }

    if (_errorMessage != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.orange, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.location_off, size: 32, color: Colors.orange),
            const SizedBox(height: 8),
            Text(
              _errorMessage!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    await _locationService.openLocationSettings();
                    // Esperar un poco y reintentar
                    await Future.delayed(const Duration(seconds: 1));
                    _loadWeather();
                  },
                  icon: const Icon(Icons.settings, size: 16),
                  label: const Text(
                    'Activar GPS',
                    style: TextStyle(fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _loadWeather,
                  icon: const Icon(Icons.refresh),
                  color: Colors.orange,
                  tooltip: 'Reintentar',
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Si llegamos aquí y weatherData es null, mostrar mensaje
    if (_weatherData == null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off, size: 24, color: Colors.grey),
            const SizedBox(width: 12),
            const Text(
              'Clima no disponible',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.refresh, size: 20),
              onPressed: _loadWeather,
              color: Colors.grey,
              tooltip: 'Reintentar',
            ),
          ],
        ),
      );
    }

    // Mostrar datos del clima
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Emoji del clima
          Text(
            _weatherData!.weatherEmoji,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(width: 12),
          
          // Información del clima
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${_weatherData!.temperature.round()}°C',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0080FF),
                ),
              ),
              Text(
                _weatherData!.descriptionInSpanish,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          
          const SizedBox(width: 8),
          
          // Botón de actualizar
          IconButton(
            icon: const Icon(Icons.refresh, size: 20),
            onPressed: _loadWeather,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            color: const Color(0xFF0080FF),
          ),
        ],
      ),
    );
  }
}

// Widget compacto de clima para la barra superior
class CompactWeatherWidget extends StatefulWidget {
  const CompactWeatherWidget({Key? key}) : super(key: key);

  @override
  State<CompactWeatherWidget> createState() => _CompactWeatherWidgetState();
}

class _CompactWeatherWidgetState extends State<CompactWeatherWidget> {
  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = LocationService();
  
  WeatherData? _weatherData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    setState(() => _isLoading = true);

    try {
      final coordinates = await _locationService.getCoordinates();
      
      if (coordinates != null) {
        final weather = await _weatherService.getWeatherByCoordinates(
          coordinates['latitude']!,
          coordinates['longitude']!,
        );
        
        if (mounted) {
          setState(() {
            _weatherData = weather;
            _isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading || _weatherData == null) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _weatherData!.weatherEmoji,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 6),
          Text(
            '${_weatherData!.temperature.round()}°C',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

