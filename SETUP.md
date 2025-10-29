# 🚀 Guía de Instalación Completa - NicotineFree

Esta guía te ayudará a configurar el proyecto desde cero en cualquier computador.

---

## 📋 Requisitos Previos

### 1. Flutter SDK
- **Versión mínima:** Flutter 3.9.2
- **Descarga:** https://docs.flutter.dev/get-started/install

**Verificar instalación:**
```bash
flutter --version
flutter doctor
```

### 2. Android Studio
- **Descarga:** https://developer.android.com/studio
- **SDK Platform:** Android 34
- **SDK Build-Tools:** 35.0.0
- **Android Emulator** (opcional, para pruebas)

### 3. Git
- **Descarga:** https://git-scm.com/downloads
- **Verificar:** `git --version`

### 4. Node.js (para Firebase CLI)
- **Descarga:** https://nodejs.org/
- **Verificar:** `node --version`

---

## 🔥 Configuración de Firebase

### Paso 1: Instalar Herramientas

#### Firebase CLI
```bash
npm install -g firebase-tools
firebase login
```

#### FlutterFire CLI
```bash
dart pub global activate flutterfire_cli
```

#### Agregar FlutterFire al PATH (Windows)

**PowerShell (Administrador):**
```powershell
# Agregar permanentemente al PATH del sistema
[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", "Machine") + ";$env:LOCALAPPDATA\Pub\Cache\bin",
    "Machine"
)
```

**O manualmente:**
1. `Win + X` → Sistema → Configuración avanzada del sistema
2. Variables de entorno → Path (Variables del sistema)
3. Nuevo → Agregar: `C:\Users\TU_USUARIO\AppData\Local\Pub\Cache\bin`
4. **Reiniciar terminal y VS Code/Android Studio**

**Verificar:**
```bash
flutterfire --version
```

---

### Paso 2: Crear Proyecto en Firebase Console

1. Ve a https://console.firebase.google.com/
2. Clic en **"Agregar proyecto"**
3. Nombre: `NicotineFree` (o el que prefieras)
4. Acepta los términos y crea el proyecto

---

### Paso 3: Habilitar Servicios

#### Firebase Authentication
1. En Firebase Console → Compilación → Authentication
2. Clic en **"Comenzar"**
3. Habilitar **"Correo electrónico/contraseña"**
4. Guardar

#### Cloud Firestore
1. En Firebase Console → Compilación → Firestore Database
2. Clic en **"Crear base de datos"**
3. Selecciona **"Comenzar en modo de producción"**
4. Ubicación: `us-central1` (o la más cercana)
5. Habilitar

#### Reglas de Firestore (Seguridad básica)
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Usuarios: solo lectura/escritura de sus propios datos
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Retos: lectura para usuarios autenticados
    match /challenges/{challengeId} {
      allow read: if request.auth != null;
      allow write: if false; // Solo administradores
    }
    
    // Recompensas: lectura para usuarios autenticados
    match /rewards/{rewardId} {
      allow read: if request.auth != null;
      allow write: if false; // Solo administradores
    }
  }
}
```

---

### Paso 4: Registrar App Android

1. En Firebase Console → Configuración del proyecto (⚙️)
2. Selecciona **Android** (ícono del robot)
3. Completa:
   - **Package name:** `com.hir0exe.nicotine_free`
   - **Nickname (opcional):** NicotineFree Android
4. Clic en **"Registrar app"**
5. **Descarga `google-services.json`**
6. Guárdalo en: `android/app/google-services.json`

---

## 📦 Instalación del Proyecto

### 1. Clonar Repositorio

```bash
git clone https://github.com/Hir0Exe/PU-NicotineFree.git
cd PU-NicotineFree
```

### 2. Instalar Dependencias

```bash
flutter pub get
```

### 3. Configurar Firebase

#### Opción A: Usar FlutterFire Configure (Recomendado)

```bash
flutterfire configure
```

**Selecciona:**
- Proyecto: El que creaste en Firebase
- Plataformas: `android` (usa espaciador para marcar)
- Application ID: Confirma `com.hir0exe.nicotine_free`

**Esto genera automáticamente:**
- ✅ `lib/firebase_options.dart`
- ✅ `android/app/google-services.json` (si no existe)

#### Opción B: Configurar Manualmente

Si `flutterfire configure` no funciona:

1. **Copiar el archivo descargado:**
   ```bash
   # Copia el google-services.json descargado a:
   android/app/google-services.json
   ```

2. **Crear `lib/firebase_options.dart`:**
   - Copia el archivo `lib/firebase_options.example.dart`
   - Renómbralo a `lib/firebase_options.dart`
   - Reemplaza los valores con los de tu proyecto Firebase

### 4. Verificar Configuración

**Archivos que DEBEN existir:**
- ✅ `android/app/google-services.json`
- ✅ `lib/firebase_options.dart`

**Si faltan, el proyecto NO compilará.**

---

## 🏃 Ejecutar la Aplicación

### En Emulador Android

1. **Iniciar emulador:**
   ```bash
   flutter emulators --launch <emulator_name>
   # O desde Android Studio
   ```

2. **Ejecutar app:**
   ```bash
   flutter run
   ```

### En Dispositivo Físico

1. **Habilitar Depuración USB** en el dispositivo
2. **Conectar por USB**
3. **Verificar conexión:**
   ```bash
   flutter devices
   ```
4. **Ejecutar:**
   ```bash
   flutter run
   ```

---

## 🛠️ Solución de Problemas

### Error: "google-services.json not found"

**Solución:**
```bash
# Verificar que existe
ls android/app/google-services.json

# Si no existe, copia el tuyo desde la descarga de Firebase
```

### Error: "DefaultFirebaseOptions not found"

**Solución:**
```bash
# Ejecutar flutterfire configure
flutterfire configure

# O copiar manualmente
cp lib/firebase_options.example.dart lib/firebase_options.dart
# Luego editar con tus credenciales
```

### Error: "flutterfire: command not found" (Windows)

**Solución:**
```powershell
# Opción 1: Usar ruta completa
C:\Users\TU_USUARIO\AppData\Local\Pub\Cache\bin\flutterfire.bat configure

# Opción 2: Agregar al PATH y reiniciar terminal
$env:Path += ";$env:LOCALAPPDATA\Pub\Cache\bin"
```

### Error de Gradle: "Out of Memory"

**Solución:**
```bash
# Detener daemons de Gradle
cd android
./gradlew --stop

# Limpiar proyecto
cd ..
flutter clean
flutter pub get
flutter run
```

### Errores de Dependencias

**Solución:**
```bash
# Limpiar caché
flutter clean
rm -rf pubspec.lock
flutter pub get

# Reinstalar Flutter (último recurso)
flutter doctor -v
```

---

## 🔒 Seguridad

### Archivos que NO debes compartir:

- ❌ `android/app/google-services.json`
- ❌ `lib/firebase_options.dart`
- ❌ `android/local.properties`
- ❌ API Keys personales

Estos archivos están en `.gitignore` automáticamente.

---

## ✅ Checklist de Instalación

- [ ] Flutter SDK instalado (`flutter doctor`)
- [ ] Android Studio configurado
- [ ] Firebase CLI instalado (`firebase --version`)
- [ ] FlutterFire CLI instalado (`flutterfire --version`)
- [ ] Proyecto Firebase creado
- [ ] Authentication habilitado
- [ ] Firestore creado
- [ ] App Android registrada en Firebase
- [ ] `google-services.json` en `android/app/`
- [ ] `firebase_options.dart` en `lib/`
- [ ] Dependencias instaladas (`flutter pub get`)
- [ ] App ejecutándose (`flutter run`)

---

## 📞 Soporte

Si tienes problemas:

1. **Revisa los errores en terminal**
2. **Ejecuta:** `flutter doctor -v`
3. **Limpia el proyecto:** `flutter clean`
4. **Revisa la documentación oficial:**
   - Flutter: https://docs.flutter.dev/
   - Firebase: https://firebase.google.com/docs/flutter/setup

---

## 🎉 ¡Listo!

Si todos los pasos están completos, deberías ver la pantalla de login de NicotineFree.

**Próximos pasos:**
1. Crear una cuenta de prueba
2. Explorar las funcionalidades
3. Reportar bugs o sugerencias

**¡Bienvenido a NicotineFree! 🚭✨**

