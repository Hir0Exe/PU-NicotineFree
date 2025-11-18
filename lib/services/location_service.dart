import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  // Solicitar permisos de ubicación
  Future<bool> requestLocationPermission() async {
    // Verificar si el permiso ya fue otorgado
    var status = await Permission.location.status;
    
    if (status.isGranted) {
      return true;
    }
    
    // Solicitar permiso
    var result = await Permission.location.request();
    return result.isGranted;
  }

  // Verificar si el GPS está habilitado
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Abrir configuración de ubicación
  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  // Obtener ubicación actual
  Future<Position?> getCurrentLocation() async {
    try {
      // Verificar si el servicio de ubicación está habilitado
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('El servicio de ubicación está deshabilitado');
        // Intentar abrir configuración de ubicación
        try {
          await Geolocator.openLocationSettings();
        } catch (e) {
          print('No se pudo abrir configuración de ubicación: $e');
        }
        return null;
      }

      // Verificar permisos
      bool hasPermission = await requestLocationPermission();
      if (!hasPermission) {
        print('Permiso de ubicación denegado');
        return null;
      }

      // Obtener posición actual con timeout
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
        timeLimit: const Duration(seconds: 10),
      );

      return position;
    } catch (e) {
      print('Error al obtener ubicación: $e');
      return null;
    }
  }

  // Obtener coordenadas como string
  Future<Map<String, double>?> getCoordinates() async {
    Position? position = await getCurrentLocation();
    
    if (position != null) {
      return {
        'latitude': position.latitude,
        'longitude': position.longitude,
      };
    }
    
    return null;
  }
}

