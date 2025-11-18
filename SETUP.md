# 🚀 Guía Completa de Configuración - NicotineFree

Esta guía te ayudará a configurar el proyecto **NicotineFree** en cualquier computador desde cero.

---

## 📋 Tabla de Contenidos

1. [Requisitos del Sistema](#requisitos-del-sistema)
2. [Instalación de Flutter](#instalación-de-flutter)
3. [Instalación de Android SDK](#instalación-de-android-sdk)
4. [Instalación de Git](#instalación-de-git)
5. [Configuración del Proyecto](#configuración-del-proyecto)
6. [Configuración de Firebase](#configuración-de-firebase)
7. [Ejecución del Proyecto](#ejecución-del-proyecto)
8. [Solución de Problemas](#solución-de-problemas)

---

## 📌 Requisitos del Sistema

### Windows
- **Sistema Operativo:** Windows 10 o superior (64-bit)
- **Espacio en Disco:** Mínimo 10 GB libres
- **RAM:** Mínimo 8 GB recomendado
- **Procesador:** Intel i5 o equivalente

### Verificar Requisitos
```powershell
# Verificar versión de Windows
winver

# Verificar espacio disponible
Get-PSDrive C | Select-Object Used,Free
```

---

## 🦋 Instalación de Flutter

### Paso 1: Descargar Flutter

**Versión Recomendada:** Flutter 3.35.7 (Stable)

**Enlace Directo:**
```
https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.35.7-stable.zip
```

O desde el sitio oficial:
```
https://docs.flutter.dev/get-started/install/windows
```

### Paso 2: Extraer Flutter

1. **Crea una carpeta** en `C:\` llamada `src`:
```powershell
New-Item -Path "C:\src" -ItemType Directory -Force
```

2. **Extrae el ZIP** en `C:\src\flutter`
   - Debe quedar: `C:\src\flutter\bin\flutter.bat`

### Paso 3: Agregar Flutter al PATH

**Opción A - Usando PowerShell (Recomendado):**
```powershell
# Ejecutar PowerShell como Administrador
[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", "User") + ";C:\src\flutter\bin",
    "User"
)
```

**Opción B - Manualmente:**
1. Presiona `Win + X` → "Sistema"
2. Click en "Configuración avanzada del sistema"
3. Click en "Variables de entorno"
4. En "Variables del usuario", selecciona "Path" → "Editar"
5. Click "Nuevo" y agrega: `C:\src\flutter\bin`
6. Click "Aceptar" en todas las ventanas

### Paso 4: Verificar Instalación

**Cierra y abre una nueva terminal**, luego ejecuta:

```powershell
flutter --version
```

**Salida esperada:**
```
Flutter 3.35.7 • channel stable
```

### Paso 5: Ejecutar Flutter Doctor

```powershell
flutter doctor -v
```

Esto mostrará qué falta instalar. Continúa con los siguientes pasos.

---

## 🤖 Instalación de Android SDK

### Opción 1: Android Studio (Recomendado)

#### Paso 1: Descargar Android Studio

**Versión Recomendada:** Android Studio Ladybug 2024.2.1 o superior

**Enlace Directo:**
```
https://redirector.gvt1.com/edgedl/android/studio/install/2024.2.1.11/android-studio-2024.2.1.11-windows.exe
```

O desde el sitio oficial:
```
https://developer.android.com/studio
```

#### Paso 2: Instalar Android Studio

1. **Ejecuta el instalador** descargado
2. **Selecciona componentes:**
   - ✅ Android SDK
   - ✅ Android SDK Platform
   - ✅ Android Virtual Device
3. **Ubicación recomendada:** `D:\Android` (o `C:\Android`)
4. Click "Next" hasta completar

#### Paso 3: Configurar Android SDK

1. **Abre Android Studio**
2. Click en "More Actions" → "SDK Manager"
3. **Pestaña "SDK Platforms":**
   - ✅ Android 14.0 (API 34) - Recomendado
   - ✅ Android 11.0 (API 30) - Mínimo para el proyecto
4. **Pestaña "SDK Tools":**
   - ✅ Android SDK Build-Tools 36
   - ✅ Android SDK Command-line Tools
   - ✅ Android SDK Platform-Tools
   - ✅ Android Emulator
5. Click "Apply" → "OK"

#### Paso 4: Configurar Variables de Entorno

**Ubicación típica del SDK:** `D:\Android\sdk` o `C:\Users\[TuUsuario]\AppData\Local\Android\Sdk`

```powershell
# Configurar ANDROID_HOME
[Environment]::SetEnvironmentVariable("ANDROID_HOME", "D:\Android\sdk", "User")
[Environment]::SetEnvironmentVariable("ANDROID_SDK_ROOT", "D:\Android\sdk", "User")

# Agregar herramientas al PATH
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
$newPaths = @(
    "D:\Android\sdk\platform-tools",
    "D:\Android\sdk\cmdline-tools\latest\bin",
    "D:\Android\sdk\emulator"
)
[Environment]::SetEnvironmentVariable("Path", "$currentPath;$($newPaths -join ';')", "User")
```

**Reinicia la terminal** y verifica:
```powershell
adb --version
```

### Opción 2: Solo Android SDK (Sin Android Studio)

Si prefieres no instalar Android Studio:

#### Descargar Command Line Tools

**Enlace Directo:**
```
https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip
```

#### Configuración Manual

```powershell
# 1. Crear estructura de carpetas
New-Item -Path "D:\Android\sdk\cmdline-tools\latest" -ItemType Directory -Force

# 2. Extraer el ZIP en D:\Android\sdk\cmdline-tools\latest

# 3. Instalar componentes necesarios
cd D:\Android\sdk\cmdline-tools\latest\bin
.\sdkmanager.bat "platform-tools" "platforms;android-34" "build-tools;36.1.0"

# 4. Aceptar licencias
.\sdkmanager.bat --licenses
```

---

## 🔧 Instalación de Git

### Paso 1: Descargar Git

**Versión Recomendada:** Git 2.47 o superior

**Enlace Directo:**
```
https://github.com/git-for-windows/git/releases/download/v2.47.1.windows.1/Git-2.47.1-64-bit.exe
```

O desde el sitio oficial:
```
https://git-scm.com/download/win
```

### Paso 2: Instalar Git

1. Ejecuta el instalador
2. **Configuraciones recomendadas:**
   - Editor: "Use Visual Studio Code as Git's default editor" (o tu preferencia)
   - PATH: "Git from the command line and also from 3rd-party software"
   - Line endings: "Checkout Windows-style, commit Unix-style line endings"
3. Click "Next" hasta completar

### Paso 3: Verificar Instalación

```powershell
git --version
```

### Paso 4: Configurar Git (Opcional pero Recomendado)

```powershell
git config --global user.name "Tu Nombre"
git config --global user.email "tu.email@example.com"
```

---

## 📦 Configuración del Proyecto

### Paso 1: Clonar el Repositorio

```powershell
# Navegar a la carpeta donde quieres el proyecto
cd D:\Proyectos

# Clonar el repositorio
git clone [URL_DEL_REPOSITORIO] nicotine_free
cd nicotine_free
```

**O si tienes el proyecto en un USB:**
```powershell
# Copiar la carpeta completa a tu computador
Copy-Item -Path "E:\nicotine_free" -Destination "D:\Proyectos\" -Recurse
cd D:\Proyectos\nicotine_free
```

### Paso 2: Limpiar Archivos Antiguos

```powershell
# Limpiar compilaciones anteriores
flutter clean

# Eliminar caché de Gradle (si existe)
Remove-Item -Recurse -Force "$env:USERPROFILE\.gradle\caches" -ErrorAction SilentlyContinue
```

### Paso 3: Instalar Dependencias

```powershell
# Obtener dependencias de Flutter
flutter pub get
```

**Salida esperada:**
```
Resolving dependencies...
Got dependencies!
```

### Paso 4: Verificar Estructura del Proyecto

El proyecto debe tener esta estructura:
```
nicotine_free/
├── android/
│   ├── app/
│   │   ├── google-services.json     ← IMPORTANTE
│   │   └── build.gradle.kts
│   ├── build.gradle.kts
│   └── gradle.properties
├── lib/
│   ├── models/
│   ├── screens/
│   ├── services/
│   ├── widgets/
│   ├── providers/
│   ├── firebase_options.dart        ← IMPORTANTE
│   └── main.dart
├── pubspec.yaml
└── README.md
```

---

## 🔥 Configuración de Firebase

### Paso 1: Instalar Firebase CLI

**Opción A - Usando npm (Recomendado):**

```powershell
# Si no tienes Node.js, descárgalo primero:
# https://nodejs.org/dist/v20.18.1/node-v20.18.1-x64.msi

# Instalar Firebase CLI
npm install -g firebase-tools

# Verificar instalación
firebase --version
```

**Opción B - Instalador Standalone:**
```
https://firebase.tools/bin/win/instant/latest
```

### Paso 2: Instalar FlutterFire CLI

```powershell
dart pub global activate flutterfire_cli
```

**Agregar al PATH:**
```powershell
# La ruta típica es:
$dartPubCache = "$env:USERPROFILE\AppData\Local\Pub\Cache\bin"
[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", "User") + ";$dartPubCache",
    "User"
)
```

### Paso 3: Autenticarse en Firebase

```powershell
firebase login
```

Se abrirá el navegador para iniciar sesión con tu cuenta de Google.

### Paso 4: Verificar Configuración Existente

El proyecto ya incluye:
- ✅ `lib/firebase_options.dart` - Configuración generada
- ✅ `android/app/google-services.json` - Configuración de Android

**IMPORTANTE:** Estos archivos YA están configurados para el proyecto **pu-nicotinefree**.

### Paso 5: Reconfigurar Firebase (Solo si es Necesario)

Si necesitas crear un nuevo proyecto de Firebase:

```powershell
# Configurar Firebase para el proyecto
flutterfire configure

# Selecciona:
# - Proyecto: Crear nuevo o usar existente
# - Plataformas: Android, iOS (si aplica)
# - Package name: com.hir0exe.nicotine_free
```

---

## 📱 Ejecución del Proyecto

### Paso 1: Conectar Dispositivo Android

**Opción A - Dispositivo Físico:**

1. **Habilitar opciones de desarrollador:**
   - Ve a Configuración → Acerca del teléfono
   - Toca 7 veces en "Número de compilación"
2. **Habilitar depuración USB:**
   - Configuración → Sistema → Opciones de desarrollador
   - Activa "Depuración USB"
3. **Conectar con cable USB**
4. **Aceptar** el diálogo de "¿Permitir depuración USB?"

**Verificar conexión:**
```powershell
flutter devices
```

**Salida esperada:**
```
Found 1 device:
  TECNO CG7 (mobile) • 068222518P101074 • android-arm64 • Android 11
```

**Opción B - Emulador:**

```powershell
# Listar emuladores disponibles
flutter emulators

# Crear un emulador (si no existe)
flutter emulators --create

# Iniciar un emulador
flutter emulators --launch Pixel_4_API_34
```

### Paso 2: Ejecutar el Proyecto

```powershell
# Ejecutar en modo debug
flutter run

# O especificar dispositivo
flutter run -d [DEVICE_ID]

# Ejemplo:
flutter run -d 068222518P101074
```

### Paso 3: Esperar la Compilación

La primera vez tomará **5-10 minutos**. Verás:
```
Running Gradle task 'assembleDebug'...
✓ Built build\app\outputs\flutter-apk\app-debug.apk.
Installing build\app\outputs\flutter-apk\app.apk...
```

### Paso 4: Verificar en el Dispositivo

La aplicación **NicotineFree** se abrirá automáticamente.

---

## 🛠️ Solución de Problemas Comunes

### Problema 1: "cmdline-tools component is missing"

**Solución:**
```powershell
# En Android Studio
# Tools → SDK Manager → SDK Tools
# ✅ Android SDK Command-line Tools (latest)
# Click Apply
```

**O por terminal:**
```powershell
cd D:\Android\sdk\cmdline-tools\latest\bin
.\sdkmanager.bat "cmdline-tools;latest"
```

### Problema 2: "Gradle version X.XX is required. Current version is X.XX"

**Solución:**
```powershell
cd android
.\gradlew wrapper --gradle-version=8.13
cd ..
flutter clean
flutter run
```

### Problema 3: "Unable to locate Android SDK"

**Solución:**
```powershell
# Verificar variable ANDROID_HOME
echo $env:ANDROID_HOME

# Si está vacía, configurar:
[Environment]::SetEnvironmentVariable("ANDROID_HOME", "D:\Android\sdk", "User")

# Reiniciar terminal
flutter doctor -v
```

### Problema 4: "Doctor found issues in 1 category"

**Ejecutar diagnóstico detallado:**
```powershell
flutter doctor -v
```

**Soluciones comunes:**
```powershell
# Aceptar licencias de Android
flutter doctor --android-licenses

# Actualizar Flutter
flutter upgrade

# Limpiar caché
flutter clean
flutter pub get
```

### Problema 5: "Error: Out of memory"

**Editar:** `android/gradle.properties`

Agregar o modificar:
```properties
org.gradle.jvmargs=-Xmx2G -XX:MaxMetaspaceSize=1G
```

### Problema 6: "FirebaseException: No AppCheckProvider"

**Esto es NORMAL.** Es solo una advertencia. La app funciona correctamente.

Para eliminarlo (opcional):
```powershell
# Agregar a pubspec.yaml:
# firebase_app_check: ^0.3.0

flutter pub get
```

### Problema 7: Dispositivo No Detectado

**Soluciones:**
```powershell
# 1. Reiniciar ADB
adb kill-server
adb start-server
adb devices

# 2. Verificar drivers USB (Windows)
# Descargar Google USB Driver:
# https://developer.android.com/studio/run/win-usb

# 3. Cambiar modo USB en el teléfono
# Configuración → USB → Transferencia de archivos (MTP)
```

### Problema 8: "Execution failed for task ':app:processDebugGoogleServices'"

**Solución:**
Verificar que existe: `android/app/google-services.json`

Si falta:
```powershell
flutterfire configure
```

---

## 📊 Verificación Final

Antes de ejecutar, verifica que todo esté configurado:

```powershell
# Verificar Flutter
flutter doctor -v

# Verificar dispositivos
flutter devices

# Verificar dependencias
flutter pub get

# Verificar que compile
flutter build apk --debug
```

**Todo OK si ves:**
```
✓ Flutter (Channel stable, 3.35.7)
✓ Android toolchain
✓ Connected device (1 available)
```

---

## 🎯 Comandos Rápidos de Referencia

```powershell
# Limpiar proyecto
flutter clean && flutter pub get

# Ejecutar en dispositivo
flutter run

# Compilar APK de debug
flutter build apk --debug

# Compilar APK de release
flutter build apk --release

# Ver logs en tiempo real
flutter logs

# Detener aplicación
flutter stop

# Actualizar Flutter
flutter upgrade

# Ver información del dispositivo
flutter devices -v

# Verificar estado de Flutter
flutter doctor -v
```

---

## 📝 Notas Adicionales

### Versiones Utilizadas en Este Proyecto

| Componente | Versión |
|------------|---------|
| Flutter | 3.35.7 |
| Dart | 3.9.2 |
| Android SDK | 36.1.0 |
| Gradle | 8.12 |
| JDK | 17.0.12 |
| Firebase Core | 4.2.0 |
| Firebase Auth | 6.1.1 |
| Cloud Firestore | 6.0.3 |

### Puertos Utilizados

- **Flutter DevTools:** 9100
- **Dart Observatory:** 57840
- **Android ADB:** 5037

### Espacio en Disco Requerido

- **Flutter SDK:** ~1.5 GB
- **Android SDK:** ~5 GB
- **Android Studio:** ~3 GB
- **Proyecto + Dependencias:** ~500 MB
- **Total Recomendado:** 10-15 GB libres

---

## 🆘 Soporte

Si encuentras problemas no cubiertos en esta guía:

1. **Revisa los logs:** `flutter logs`
2. **Busca el error específico** en Google o Stack Overflow
3. **Consulta la documentación oficial:**
   - Flutter: https://docs.flutter.dev
   - Firebase: https://firebase.google.com/docs

---

## ✅ Checklist de Configuración

Usa esta lista para verificar que completaste todos los pasos:

- [ ] Windows 10/11 64-bit instalado
- [ ] Mínimo 10 GB de espacio libre
- [ ] Flutter 3.35.7 instalado y en PATH
- [ ] Flutter doctor sin errores críticos
- [ ] Android SDK instalado (API 30+)
- [ ] Variables de entorno configuradas (ANDROID_HOME)
- [ ] Git instalado y configurado
- [ ] Proyecto clonado/copiado
- [ ] `flutter clean` ejecutado
- [ ] `flutter pub get` ejecutado exitosamente
- [ ] Firebase CLI instalado
- [ ] FlutterFire CLI instalado
- [ ] `google-services.json` existe en `android/app/`
- [ ] `firebase_options.dart` existe en `lib/`
- [ ] Dispositivo Android conectado y detectado
- [ ] Depuración USB habilitada
- [ ] `flutter devices` muestra el dispositivo
- [ ] Aplicación ejecutada exitosamente

---

**¡Listo!** Si completaste todos los pasos, el proyecto debería estar funcionando correctamente. 🎉
