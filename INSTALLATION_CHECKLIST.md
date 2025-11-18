# ✅ Checklist de Instalación - NicotineFree

Use esta lista para verificar paso a paso que todo está correctamente configurado.

---

## 📋 Pre-Requisitos del Sistema

### Sistema Operativo
- [ ] Windows 10 o superior (64-bit)
- [ ] Mínimo 10 GB de espacio libre en disco
- [ ] Mínimo 8 GB de RAM

**Verificar:**
```powershell
# Ver versión de Windows
winver

# Ver espacio disponible
Get-PSDrive C
```

---

## 🦋 Flutter

### Instalación
- [ ] Flutter SDK 3.35.7 descargado
- [ ] Extraído en `C:\src\flutter` (o ubicación similar)
- [ ] Agregado al PATH del sistema
- [ ] Terminal reiniciada después de agregar al PATH

### Verificación
```powershell
flutter --version
# Debe mostrar: Flutter 3.35.7
```

- [ ] ✅ Comando `flutter --version` funciona
- [ ] ✅ Muestra versión 3.35.7 o superior

### Flutter Doctor
```powershell
flutter doctor -v
```

- [ ] ✅ `[✓] Flutter` sin errores
- [ ] ✅ `[✓] Windows Version` OK
- [ ] ⚠️ `[!] Android toolchain` puede tener advertencias (se arregla después)

---

## 🤖 Android SDK

### Instalación (Opción A: Android Studio)
- [ ] Android Studio descargado e instalado
- [ ] SDK Manager abierto
- [ ] Android SDK Platform instalado (API 30+)
- [ ] Android SDK Build-Tools instalado
- [ ] Android SDK Command-line Tools instalado
- [ ] Android SDK Platform-Tools instalado

**Ubicación típica:** `D:\Android\sdk` o `C:\Users\[Usuario]\AppData\Local\Android\Sdk`

### Variables de Entorno
- [ ] `ANDROID_HOME` configurada
- [ ] `ANDROID_SDK_ROOT` configurada
- [ ] `platform-tools` agregado al PATH
- [ ] Terminal reiniciada

### Verificación
```powershell
echo $env:ANDROID_HOME
# Debe mostrar: D:\Android\sdk (o tu ruta)

adb --version
# Debe mostrar: Android Debug Bridge version X.X.X
```

- [ ] ✅ Variable `ANDROID_HOME` existe y es correcta
- [ ] ✅ Comando `adb` funciona

### Flutter Doctor Android
```powershell
flutter doctor -v
```

- [ ] ✅ `[✓] Android toolchain` sin errores
- [ ] ✅ Licencias aceptadas

**Si hay problemas con licencias:**
```powershell
flutter doctor --android-licenses
# Aceptar todas con 'y'
```

---

## 🔧 Git

### Instalación
- [ ] Git descargado e instalado
- [ ] Git agregado al PATH (automático en instalación)

### Verificación
```powershell
git --version
# Debe mostrar: git version 2.47 o superior
```

- [ ] ✅ Comando `git --version` funciona

### Configuración (Opcional)
```powershell
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
```

- [ ] ✅ Git configurado con nombre y email

---

## 📦 Proyecto NicotineFree

### Obtención del Proyecto
- [ ] Repositorio clonado o carpeta copiada
- [ ] Navegado a la carpeta del proyecto

```powershell
cd D:\Proyectos\nicotine_free
```

### Estructura de Archivos
Verificar que existan estos archivos críticos:

- [ ] `pubspec.yaml`
- [ ] `lib/main.dart`
- [ ] `lib/firebase_options.dart` ⚠️ IMPORTANTE
- [ ] `android/app/google-services.json` ⚠️ IMPORTANTE
- [ ] `android/build.gradle.kts`
- [ ] `android/app/build.gradle.kts`

**Si falta `google-services.json` o `firebase_options.dart`:**
Ver [SETUP.md - Configuración de Firebase](SETUP.md#🔥-configuración-de-firebase)

### Limpieza
```powershell
flutter clean
```

- [ ] ✅ Comando ejecutado sin errores

### Dependencias
```powershell
flutter pub get
```

- [ ] ✅ Comando ejecutado sin errores
- [ ] ✅ Muestra "Got dependencies!"

---

## 🔥 Firebase

### CLI Instalado
- [ ] Firebase CLI instalado (`npm install -g firebase-tools`)
- [ ] FlutterFire CLI instalado (`dart pub global activate flutterfire_cli`)
- [ ] Autenticado en Firebase (`firebase login`)

### Verificación
```powershell
firebase --version
flutterfire --version
```

- [ ] ✅ Ambos comandos funcionan

### Archivos de Configuración
- [ ] `lib/firebase_options.dart` existe y tiene contenido
- [ ] `android/app/google-services.json` existe
- [ ] Proyecto Firebase: `pu-nicotinefree` (verificar en consola)

**Verificar contenido de google-services.json:**
```powershell
cat android/app/google-services.json | Select-String "project_id"
# Debe mostrar: "project_id": "pu-nicotinefree"
```

- [ ] ✅ Archivo tiene `project_id` correcto

---

## 📱 Dispositivo Android

### Preparación del Dispositivo
- [ ] Opciones de desarrollador habilitadas
  - Configuración → Acerca del teléfono → Tocar 7 veces "Número de compilación"
- [ ] Depuración USB habilitada
  - Configuración → Sistema → Opciones de desarrollador → Depuración USB ✅
- [ ] Dispositivo conectado por cable USB
- [ ] Diálogo "¿Permitir depuración USB?" aceptado

### Verificación de Conexión
```powershell
adb devices
```

**Debe mostrar:**
```
List of devices attached
[ID_DISPOSITIVO]    device
```

- [ ] ✅ Dispositivo aparece en la lista
- [ ] ✅ Estado es "device" (no "unauthorized")

### Flutter Devices
```powershell
flutter devices
```

- [ ] ✅ Dispositivo Android aparece en la lista
- [ ] ✅ Muestra nombre y ID del dispositivo

---

## 🚀 Compilación y Ejecución

### Primera Compilación (Test)
```powershell
flutter build apk --debug
```

- [ ] ✅ Compilación completada sin errores
- [ ] ✅ Se generó: `build/app/outputs/flutter-apk/app-debug.apk`

**Tiempo esperado:** 5-10 minutos (primera vez)

### Ejecución en Dispositivo
```powershell
flutter run
```

- [ ] ✅ Aplicación se instala en el dispositivo
- [ ] ✅ Aplicación se abre automáticamente
- [ ] ✅ Pantalla de login visible

---

## ✨ Funcionalidades de la App

### Registro/Login
- [ ] ✅ Puedo crear una nueva cuenta
- [ ] ✅ Puedo iniciar sesión con email/contraseña
- [ ] ✅ Firebase Authentication funciona

### Pantalla Principal
- [ ] ✅ Se muestra el nombre del usuario
- [ ] ✅ Avatar circular visible (top-left)
- [ ] ✅ Contador de días sin fumar visible
- [ ] ✅ Estadísticas de dinero y cigarrillos

### Avatares
- [ ] ✅ Click en avatar abre selector
- [ ] ✅ 3 opciones visibles: Anciano, Joven, Señor
- [ ] ✅ Selección cambia visualmente (borde azul)
- [ ] ✅ Cambio se guarda en Firebase

### Clima
**Primer Uso:**
- [ ] ✅ Solicita permisos de ubicación
- [ ] ✅ Permisos otorgados

**Funcionamiento:**
- [ ] ✅ Widget del clima visible
- [ ] ✅ Muestra temperatura (ej: "25°C")
- [ ] ✅ Muestra estado (ej: "Despejado")
- [ ] ✅ Emoji del clima visible (☀️ ☁️ 🌧️)
- [ ] ✅ Botón de actualizar funciona

---

## 🔍 Verificación Final

### Flutter Doctor Completo
```powershell
flutter doctor -v
```

**Resultado esperado:**
```
[✓] Flutter (Channel stable, 3.35.7)
[✓] Windows Version
[✓] Android toolchain
[✓] Connected device (1 available)
[✓] Network resources
```

- [ ] ✅ Todas las secciones importantes con ✓
- [ ] ⚠️ Es OK si Visual Studio o Android Studio muestran advertencia

### Comandos de Desarrollo
```powershell
# Hot reload funciona
# Presionar 'r' en la terminal mientras la app corre
```

- [ ] ✅ Hot reload (`r`) funciona
- [ ] ✅ Hot restart (`R`) funciona
- [ ] ✅ Logs visibles (`flutter logs`)

### Logs sin Errores Críticos
```powershell
flutter logs
```

Verificar que NO haya:
- [ ] ❌ Errores de Firebase (excepto AppCheck que es opcional)
- [ ] ❌ Errores de ubicación/permisos
- [ ] ❌ Crashes de la aplicación

---

## 📊 Resumen de Verificación

### ✅ Todo Funciona Si...

- [ ] `flutter doctor` sin errores críticos
- [ ] Dispositivo Android detectado
- [ ] `flutter run` ejecuta sin errores
- [ ] App se abre en el dispositivo
- [ ] Puedo registrarme/iniciar sesión
- [ ] Avatares cambian correctamente
- [ ] Clima se muestra con ubicación GPS
- [ ] Todas las pantallas accesibles

---

## 🎯 Puntuación Final

**Cuenta tus checkmarks:**

- **70-80+ checkmarks:** ✅ ¡Perfecto! Todo configurado correctamente
- **50-69 checkmarks:** ⚠️ Funcional, pero revisa advertencias
- **Menos de 50:** ❌ Revisa [SETUP.md](SETUP.md) completamente

---

## 🆘 Si Algo Falló

### Errores Comunes

1. **Flutter doctor con errores:**
   - Ver [SETUP.md - Solución de Problemas](SETUP.md#🛠️-solución-de-problemas-comunes)

2. **Dispositivo no detectado:**
   - Reiniciar ADB: `adb kill-server && adb start-server`
   - Cambiar cable USB
   - Verificar drivers

3. **Error de compilación:**
   - Limpiar: `flutter clean && flutter pub get`
   - Verificar Firebase: `google-services.json` presente

4. **App no inicia:**
   - Ver logs: `flutter logs`
   - Verificar permisos en AndroidManifest.xml

5. **Clima no funciona:**
   - Verificar GPS activo
   - Otorgar permisos de ubicación
   - Ver [WEATHER_API_SETUP.md](WEATHER_API_SETUP.md)

---

## 📞 Soporte

**Documentación completa:** [SETUP.md](SETUP.md)  
**Guía rápida:** [QUICK_START.md](QUICK_START.md)  
**Clima:** [WEATHER_API_SETUP.md](WEATHER_API_SETUP.md)

---

**¡Éxito! 🎉** Si completaste la mayoría de los checks, ¡estás listo para desarrollar!

