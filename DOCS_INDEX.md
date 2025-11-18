# 📚 Índice de Documentación - NicotineFree

Guía completa de toda la documentación disponible del proyecto.

---

## 🚀 Para Empezar

### Si tienes experiencia con Flutter:
👉 **[QUICK_START.md](QUICK_START.md)** - 5 minutos
- Comandos rápidos
- Configuración básica
- Solución de problemas comunes

### Si es tu primera vez con Flutter:
👉 **[SETUP.md](SETUP.md)** - 30-60 minutos
- Instalación completa de Flutter
- Instalación de Android SDK
- Configuración paso a paso
- Solución detallada de problemas

### Para verificar tu instalación:
👉 **[INSTALLATION_CHECKLIST.md](INSTALLATION_CHECKLIST.md)** - 10 minutos
- Checklist interactivo
- Verificación paso a paso
- Diagnóstico de problemas

---

## 📖 Documentación del Proyecto

### Información General
- **[README.md](README.md)** - Descripción general del proyecto
  - Características principales
  - Tecnologías utilizadas
  - Capturas de pantalla
  - Estructura del proyecto

### Contribución
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Guía para contribuidores
  - Cómo contribuir
  - Estándares de código
  - Proceso de Pull Requests
  - Código de conducta

### Changelog
- **[CHANGELOG.md](CHANGELOG.md)** - Historial de cambios
  - Versiones del proyecto
  - Nuevas características
  - Correcciones de bugs

### Licencia
- **[LICENSE](LICENSE)** - MIT License
  - Términos de uso
  - Permisos
  - Limitaciones

---

## 🔧 Configuración Específica

### Firebase
📄 **Archivos de configuración:**
- `lib/firebase_options.dart` - Configuración de Flutter
- `android/app/google-services.json` - Configuración de Android

📖 **Documentación:**
- Ver [SETUP.md - Configuración de Firebase](SETUP.md#🔥-configuración-de-firebase)

**Proyecto Firebase:** `pu-nicotinefree`

**Servicios utilizados:**
- ✅ Authentication (Email/Password)
- ✅ Cloud Firestore
- ✅ Firebase Storage

### API del Clima
👉 **[WEATHER_API_SETUP.md](WEATHER_API_SETUP.md)**
- Configuración de Open-Meteo
- Sin API key requerida
- Códigos WMO del clima
- Solución de problemas

---

## 💻 Guías de Desarrollo

### Arquitectura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada
├── firebase_options.dart     # Config Firebase
│
├── models/                   # Modelos de datos
│   ├── user_model.dart       # Usuario + Avatar
│   ├── challenge_model.dart  # Retos
│   └── reward_model.dart     # Recompensas
│
├── screens/                  # Pantallas
│   ├── auth/                 # Login/Registro
│   ├── home/                 # Pantalla principal
│   ├── challenges/           # Retos
│   ├── rewards/              # Premios
│   └── notifications/        # Alertas
│
├── services/                 # Servicios
│   ├── auth_service.dart     # Firebase Auth
│   ├── location_service.dart # GPS
│   └── weather_service.dart  # Clima (Open-Meteo)
│
├── widgets/                  # Componentes reutilizables
│   ├── avatar_selector.dart  # Selector de avatares
│   └── weather_widget.dart   # Widget del clima
│
└── providers/                # Estado global (Provider)
    └── auth_provider.dart    # Estado de autenticación
```

### Patrones de Diseño Utilizados

**Estado Global:**
- `Provider` para gestión de estado
- `ChangeNotifier` para notificar cambios

**Arquitectura:**
- Separación por capas (Models, Services, Screens, Widgets)
- Principio de responsabilidad única
- Inyección de dependencias

**Navegación:**
- Named routes
- Navigator 2.0

---

## 🎨 Guías de Diseño

### Tema de Colores

```dart
// Colores principales
Primary: Color(0xFF0080FF)      // Azul principal
Secondary: Color(0xFF00D4AA)    // Verde agua
Success: Color(0xFF4CAF50)      // Verde éxito
Warning: Color(0xFFFF9800)      // Naranja alerta
Error: Color(0xFFF44336)        // Rojo error

// Gradientes
LinearGradient(
  colors: [Color(0xFF0080FF), Color(0xFF00D4AA)]
)
```

### Componentes UI

**Avatares:**
- Tamaño: 64px (pantalla principal)
- Forma: Circular con gradiente
- Estados: Normal, Seleccionado (borde azul)

**Clima:**
- Background: Blanco con sombra
- Temperatura: 20px, bold, azul
- Estado: 14px, gris
- Emoji: 32px

**Botones:**
- Primary: Azul con texto blanco
- Secondary: Transparente con borde
- Radio: 12px (estándar), 20px (grande)

---

## 🔍 Guías de Solución de Problemas

### Por Categoría

**Flutter:**
- [SETUP.md#problema-1-4](SETUP.md#🛠️-solución-de-problemas-comunes)

**Android SDK:**
- [SETUP.md#problema-1-3](SETUP.md#problema-1-cmdline-tools-component-is-missing)

**Firebase:**
- [SETUP.md#problema-8](SETUP.md#problema-8-execution-failed-for-task-appprocessdebugoogleservices)

**Clima/Ubicación:**
- [WEATHER_API_SETUP.md](WEATHER_API_SETUP.md)
- [SETUP.md - Permisos](SETUP.md)

**Dispositivo:**
- [SETUP.md#problema-7](SETUP.md#problema-7-dispositivo-no-detectado)

---

## 📊 Dependencias del Proyecto

### Core
```yaml
flutter: 3.35.7
dart: 3.9.2
```

### Firebase
```yaml
firebase_core: ^4.2.0
firebase_auth: ^6.1.1
cloud_firestore: ^6.0.3
firebase_storage: ^13.0.3
```

### Estado
```yaml
provider: ^6.1.5+1
```

### Ubicación y Clima
```yaml
geolocator: ^13.0.2
permission_handler: ^11.3.1
http: ^1.2.2
```

### UI/UX
```yaml
image_picker: ^1.2.0
google_sign_in: ^7.2.0
```

---

## 🚀 Comandos de Referencia Rápida

### Desarrollo
```powershell
flutter run                    # Ejecutar en debug
flutter run -d [device]        # Ejecutar en dispositivo específico
flutter logs                   # Ver logs
```

### Compilación
```powershell
flutter build apk              # APK de release
flutter build apk --debug      # APK de debug
flutter build appbundle        # Android App Bundle (Play Store)
```

### Mantenimiento
```powershell
flutter clean                  # Limpiar proyecto
flutter pub get                # Actualizar dependencias
flutter pub upgrade            # Actualizar a últimas versiones
flutter doctor                 # Verificar instalación
```

### Git
```powershell
git status                     # Ver estado
git add .                      # Agregar cambios
git commit -m "mensaje"        # Commit
git push                       # Subir cambios
```

---

## 🎓 Recursos de Aprendizaje

### Flutter
- **Documentación Oficial:** https://docs.flutter.dev
- **Flutter Codelabs:** https://docs.flutter.dev/codelabs
- **Widget Catalog:** https://docs.flutter.dev/ui/widgets

### Firebase
- **Firebase para Flutter:** https://firebase.google.com/docs/flutter/setup
- **FlutterFire:** https://firebase.flutter.dev

### Dart
- **Dart Language Tour:** https://dart.dev/guides/language/language-tour
- **Effective Dart:** https://dart.dev/guides/language/effective-dart

---

## 📞 Soporte y Contacto

### Problemas Técnicos
1. Consulta la documentación relevante
2. Busca en [SETUP.md - Solución de Problemas](SETUP.md#🛠️-solución-de-problemas-comunes)
3. Revisa [INSTALLATION_CHECKLIST.md](INSTALLATION_CHECKLIST.md)

### Contribuir
Lee [CONTRIBUTING.md](CONTRIBUTING.md) para:
- Reportar bugs
- Proponer nuevas características
- Enviar Pull Requests

---

## 📋 Checklist de Documentación

Para nuevos desarrolladores:

- [ ] He leído [README.md](README.md)
- [ ] He completado [SETUP.md](SETUP.md) o [QUICK_START.md](QUICK_START.md)
- [ ] He verificado mi instalación con [INSTALLATION_CHECKLIST.md](INSTALLATION_CHECKLIST.md)
- [ ] He revisado [CONTRIBUTING.md](CONTRIBUTING.md)
- [ ] Entiendo la estructura del proyecto
- [ ] Conozco los comandos básicos de Flutter
- [ ] Sé cómo solicitar ayuda

---

## 🎯 Mapas de Navegación

### Para Usuarios Nuevos
```
1. README.md (Entender el proyecto)
   ↓
2. SETUP.md (Configurar desde cero)
   ↓
3. INSTALLATION_CHECKLIST.md (Verificar)
   ↓
4. ¡Empezar a desarrollar!
```

### Para Usuarios con Experiencia
```
1. README.md (Overview rápido)
   ↓
2. QUICK_START.md (Configuración rápida)
   ↓
3. ¡Empezar a desarrollar!
```

### Para Contribuidores
```
1. README.md (Entender el proyecto)
   ↓
2. CONTRIBUTING.md (Guías de contribución)
   ↓
3. DOCS_INDEX.md (Navegar documentación)
   ↓
4. Hacer fork y contribuir
```

---

**Última actualización:** Noviembre 2025  
**Versión del proyecto:** 1.0.0  
**Mantenido por:** Equipo NicotineFree

