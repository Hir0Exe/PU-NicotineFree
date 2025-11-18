# ⚡ Guía Rápida - NicotineFree

## 🚀 Configuración en 5 Minutos

### ✅ Pre-requisitos

Asegúrate de tener instalado:
- ✅ Flutter 3.35.7+
- ✅ Android SDK (API 30+)
- ✅ Git
- ✅ Dispositivo Android conectado o emulador

**¿No tienes esto?** → Sigue la [Guía Completa (SETUP.md)](./SETUP.md)

---

## 📥 Paso 1: Obtener el Proyecto

```powershell
# Clonar repositorio
git clone [URL_DEL_REPO] nicotine_free
cd nicotine_free
```

---

## 🧹 Paso 2: Limpiar y Preparar

```powershell
# Limpiar archivos antiguos
flutter clean

# Obtener dependencias
flutter pub get
```

---

## 🔍 Paso 3: Verificar Configuración

```powershell
# Ver si Flutter está OK
flutter doctor

# Ver dispositivos conectados
flutter devices
```

**Debe mostrar tu dispositivo Android.**

---

## ▶️ Paso 4: Ejecutar

```powershell
# Ejecutar la app
flutter run
```

**¡Listo!** La app se instalará y abrirá en tu dispositivo.

---

## 🆘 ¿Problemas?

### Error: "Android SDK not found"
```powershell
# Configurar ruta del SDK
$env:ANDROID_HOME = "D:\Android\sdk"
flutter doctor
```

### Error: "No devices found"
```powershell
# Reiniciar ADB
adb kill-server
adb start-server
flutter devices
```

### Error: "Gradle build failed"
```powershell
# Limpiar y reintentar
cd android
.\gradlew clean
cd ..
flutter clean
flutter run
```

---

## 📱 Comandos Útiles

```powershell
# Hot reload (actualizar sin reiniciar)
# Presiona 'r' en la terminal

# Hot restart (reiniciar app)
# Presiona 'R' en la terminal

# Detener app
# Presiona 'q' en la terminal

# Ver logs
flutter logs

# Compilar APK
flutter build apk
```

---

## 🎯 Estructura del Proyecto

```
nicotine_free/
├── lib/
│   ├── main.dart              ← Punto de entrada
│   ├── firebase_options.dart  ← Config de Firebase
│   ├── models/                ← Modelos de datos
│   ├── screens/               ← Pantallas de la app
│   ├── services/              ← Servicios (Firebase, API)
│   ├── widgets/               ← Widgets reutilizables
│   └── providers/             ← Estado global (Provider)
├── android/                   ← Configuración Android
│   └── app/
│       └── google-services.json
└── pubspec.yaml               ← Dependencias
```

---

## ✨ Funcionalidades Principales

### 1. Avatares Personalizables 👤
- Haz clic en el avatar circular
- Selecciona entre: Anciano 👴, Joven 👦, Señor 👨
- Se guarda automáticamente en Firebase

### 2. Clima en Tiempo Real 🌤️
- Muestra temperatura y estado del clima
- Usa tu ubicación GPS
- Sin límites de peticiones (Open-Meteo API)

### 3. Seguimiento de Progreso 📊
- Días sin fumar
- Dinero ahorrado
- Cigarrillos evitados
- Mejoras en salud

---

## 🔐 Firebase (Ya Configurado)

El proyecto incluye:
- ✅ Authentication (Email/Password)
- ✅ Cloud Firestore (Base de datos)
- ✅ Firebase Storage (Imágenes)

**Proyecto:** `pu-nicotinefree`

---

## 📦 Dependencias Principales

```yaml
dependencies:
  flutter_sdk: 3.35.7
  dart: 3.9.2
  
  # Firebase
  firebase_core: ^4.2.0
  firebase_auth: ^6.1.1
  cloud_firestore: ^6.0.3
  
  # Estado
  provider: ^6.1.5+1
  
  # Ubicación y Clima
  geolocator: ^13.0.2
  permission_handler: ^11.3.1
  http: ^1.2.2
  
  # UI
  image_picker: ^1.2.0
```

---

## 🎨 Tema de Colores

```dart
Primary: Color(0xFF0080FF)  // Azul
Secondary: Color(0xFF00D4AA) // Verde agua
Success: Color(0xFF4CAF50)   // Verde
Warning: Color(0xFFFF9800)   // Naranja
```

---

## 📞 Soporte Rápido

**Documentación completa:** [SETUP.md](./SETUP.md)

**Problemas comunes:**
- Gradle: Ver [SETUP.md#problema-2](./SETUP.md#problema-2-gradle-version-x-xx-is-required)
- Firebase: Ver [SETUP.md#configuración-de-firebase](./SETUP.md#🔥-configuración-de-firebase)
- Dispositivo: Ver [SETUP.md#problema-7](./SETUP.md#problema-7-dispositivo-no-detectado)

---

**Tiempo estimado:** 5-10 minutos ⏱️  
**Nivel:** Principiante → Intermedio 📘  
**Última actualización:** Noviembre 2025 📅

