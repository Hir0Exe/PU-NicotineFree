# 🚭 NicotineFree - Tu Compañero para Dejar de Fumar

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.9.2+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Una aplicación móvil desarrollada en Flutter que ayuda a las personas a dejar de fumar mediante gamificación, seguimiento de progreso y recompensas motivadoras.**

[Inicio Rápido](QUICK_START.md) • [Instalación Completa](SETUP.md) • [Características](#-características-principales) • [Contribuir](CONTRIBUTING.md)

</div>

---

## 📚 Documentación

| Documento | Descripción | Tiempo Estimado |
|-----------|-------------|-----------------|
| **[⚡ QUICK_START.md](QUICK_START.md)** | Guía rápida para usuarios con experiencia | 5 minutos |
| **[📖 SETUP.md](SETUP.md)** | Guía completa paso a paso desde cero | 30-60 minutos |
| **[🌤️ WEATHER_API_SETUP.md](WEATHER_API_SETUP.md)** | Configuración de la API del clima | 5 minutos |
| **[🤝 CONTRIBUTING.md](CONTRIBUTING.md)** | Guía para contribuir al proyecto | 10 minutos |

---

## 📱 Características Principales

### 🎯 Seguimiento de Progreso
- ✅ **Contador de Días:** Visualiza cuántos días llevas sin fumar
- ✅ **Progreso Semanal:** Mide tu avance semana a semana
- ✅ **Dinero Ahorrado:** Calcula cuánto dinero has ahorrado al no fumar
- ✅ **Cigarrillos Evitados:** Cuenta los cigarrillos que has dejado de consumir

### 💪 Mejoras en tu Salud
- ✅ **Seguimiento de Salud:** Monitorea mejoras físicas
  - Circulación sanguínea mejorada
  - Sentido del olfato recuperado
  - Riesgo cardíaco reducido
- ✅ **Indicadores Visuales:** Ve tu progreso de salud en tiempo real

### 👤 Avatares Personalizables
- ✅ **3 Opciones de Avatar:** Anciano 👴, Joven 👦, Señor 👨
- ✅ **Cambio en Tiempo Real:** Actualización visual instantánea
- ✅ **Sincronización Automática:** Se guarda en Firebase

### 🌤️ Clima en Tiempo Real
- ✅ **Temperatura Actual:** Basada en tu ubicación GPS
- ✅ **Estado del Clima:** 12 condiciones diferentes en español
- ✅ **Sin Límites:** API gratuita e ilimitada (Open-Meteo)
- ✅ **Emojis Visuales:** Representación gráfica del clima

### 🏆 Sistema de Retos y Recompensas
- ✅ **Retos Activos:** Completa desafíos semanales y mensuales
- ✅ **Sistema de Puntos:** Gana puntos por tus logros
- ✅ **Ranking:** Compite con otros usuarios
- ✅ **Insignias:** Desbloquea logros especiales:
  - 🎯 Primera semana
  - ❤️ Corazón fuerte
  - 🏆 Guerrero
  - ⭐ Estrella brillante
  - ⚡ Energía renovada
  - 🥇 Misterio

### 🎁 Premios por Canjear
- ✅ **Mes Premium Gratis:** Acceso a funciones exclusivas
- ✅ **Kit de Bienestar:** Productos para el cuidado personal
- ✅ **Sesión de Coaching:** Hora con especialista certificado
- ✅ **Retiro de Fin de Semana:** Experiencia de bienestar completa

### 🔔 Notificaciones Motivadoras
- ✅ **Mensajes del Día:** Frases motivacionales diarias
- ✅ **Alertas de Logros:** Notificaciones cuando alcanzas hitos
- ✅ **Recordatorios:** Mantente motivado siempre

---

## 📸 Capturas de Pantalla

<div align="center">

| Login | Home | Retos | Recompensas |
|:-----:|:----:|:-----:|:-----------:|
| 🔐 | 🏠 | 🏆 | 🎁 |

*Screenshots próximamente*

</div>

---

## 🚀 Inicio Rápido

### ⚡ Instalación Rápida

   ```bash
# 1. Clonar repositorio
git clone https://github.com/Hir0Exe/PU-NicotineFree.git
cd PU-NicotineFree

# 2. Instalar dependencias
flutter pub get

# 3. Configurar Firebase (Ver SETUP.md para detalles)
flutterfire configure

# 4. Ejecutar
   flutter run
   ```

> **⚠️ Importante:** Necesitas configurar Firebase antes de ejecutar.  
> Ver [SETUP.md](SETUP.md) para instrucciones detalladas.

---

## 🚀 Requisitos Previos

### 1. Flutter SDK
- **Versión requerida:** Flutter 3.9.2 o superior
- **Descarga:** https://docs.flutter.dev/get-started/install

### 2. Android SDK
- Android Studio con SDK Platform 34
- Android SDK Build-Tools 35.0.0

### 3. Firebase
- Cuenta de Firebase
- FlutterFire CLI instalado

---

## 🔥 Configuración de Firebase

### Paso 1: Crear Proyecto en Firebase

1. Ve a [Firebase Console](https://console.firebase.google.com/)
2. Clic en **"Agregar proyecto"**
3. Nombre del proyecto: `nicotine-free` (o el que prefieras)
4. Crea el proyecto

### Paso 2: Configurar Servicios

**Firebase Authentication:**
- Habilita Email/Password
- (Opcional) Google Sign-In

**Firestore Database:**
- Modo: Producción
- Configurar reglas de seguridad

**Firebase Storage (Opcional):**
- Para avatares y contenido multimedia

### Paso 3: Registrar App Android

1. En Firebase Console → Configuración del proyecto (⚙️)
2. Selecciona Android
3. **Package name:** `com.hir0exe.nicotine_free`
4. Descarga `google-services.json`

### Paso 4: Configurar FlutterFire

#### 4.1. Instalar Firebase CLI y FlutterFire CLI

```bash
# Instalar Firebase CLI (si no lo tienes)
npm install -g firebase-tools

# Login en Firebase
firebase login

# Instalar FlutterFire CLI
dart pub global activate flutterfire_cli
```

#### 4.2. Agregar FlutterFire al PATH (Windows)

**Opción A - Temporal (solo sesión actual):**
```powershell
$env:Path += ";$env:LOCALAPPDATA\Pub\Cache\bin"
```

**Opción B - Permanente (recomendado):**
1. Win + X → Sistema → Configuración avanzada del sistema
2. Variables de entorno → Path (Variables del sistema)
3. Nuevo → Agregar: `C:\Users\TU_USUARIO\AppData\Local\Pub\Cache\bin`
4. Reiniciar terminal

**Opción C - Usar ruta completa:**
```powershell
C:\Users\TU_USUARIO\AppData\Local\Pub\Cache\bin\flutterfire.bat configure
```

#### 4.3. Ejecutar FlutterFire Configure

   ```bash
# En el directorio del proyecto
flutterfire configure
```

**Esto te preguntará:**
- Seleccionar proyecto Firebase (o crear uno nuevo)
- Plataformas: Marca `android`
- Application ID: Confirma `com.hir0exe.nicotine_free`

**Se generará automáticamente:**
- ✅ `lib/firebase_options.dart`
- ✅ `android/app/google-services.json`

---

## 📦 Instalación

### 1. Clonar el Repositorio

```bash
git clone https://github.com/Hir0Exe/PU-NicotineFree.git
cd PU-NicotineFree
```

### 2. Instalar Dependencias

   ```bash
   flutter pub get
   ```

### 3. Configurar Firebase

Sigue los pasos de la sección "Configuración de Firebase" arriba.

### 4. Ejecutar la Aplicación

   ```bash
flutter run
```

---

## 📂 Estructura del Proyecto

```
lib/
├── main.dart                    # Punto de entrada
├── firebase_options.dart        # Configuración Firebase (generado)
│
├── models/                      # Modelos de datos
│   └── user_model.dart
│
├── services/                    # Servicios y lógica de negocio
│   └── auth_service.dart
│
├── providers/                   # Gestión de estado (Provider)
│   └── auth_provider.dart
│
└── screens/                     # Pantallas de la app
    ├── auth/                    # Autenticación
    │   ├── login_screen.dart
    │   └── register_screen.dart
    ├── home/                    # Pantalla principal
    │   └── home_screen.dart
    ├── challenges/              # Retos
    │   └── challenges_screen.dart
    ├── rewards/                 # Recompensas
    │   └── rewards_screen.dart
    ├── notifications/           # Alertas
    │   └── notifications_screen.dart
    └── main_screen.dart         # Navegación principal
```

---

## 🎯 Roadmap

### ✅ Versión 0.1.0 (Actual - MVP)
- [x] Sistema de autenticación (Email/Password)
- [x] Pantalla de inicio con estadísticas
- [x] Pantalla de retos con ranking
- [x] Pantalla de recompensas e insignias
- [x] Pantalla de alertas/notificaciones
- [x] Bottom Navigation Bar
- [x] UI completa con gradientes

### 🔜 Versión 0.2.0 (Próxima)
- [ ] Persistencia de datos en Firestore
- [ ] Configuración de fecha de abandono
- [ ] Configuración de cigarrillos/día y precio
- [ ] Sistema de retos funcional
- [ ] Sistema de puntos real
- [ ] Canje de premios

### 🔮 Versión 1.0.0 (Futuro)
- [ ] Notificaciones push
- [ ] Ranking global
- [ ] Gráficos de progreso
- [ ] Recuperación de contraseña
- [ ] Edición de perfil
- [ ] Compartir logros

Ver [CHANGELOG.md](CHANGELOG.md) para historial completo.

---

## 🛠️ Tecnologías

| Tecnología | Versión | Uso |
|------------|---------|-----|
| Flutter | 3.9.2+ | Framework UI |
| Dart | 3.9.2+ | Lenguaje |
| Firebase Authentication | Latest | Autenticación de usuarios |
| Cloud Firestore | Latest | Base de datos NoSQL |
| Provider | ^6.1.2 | Gestión de estado |
| Image Picker | ^1.1.2 | Selección de imágenes |

---

## 📚 Documentación

| Documento | Descripción |
|-----------|-------------|
| [README.md](README.md) | Información general del proyecto |
| [SETUP.md](SETUP.md) | Guía completa de instalación paso a paso |
| [CONTRIBUTING.md](CONTRIBUTING.md) | Guía para contribuir al proyecto |
| [CHANGELOG.md](CHANGELOG.md) | Historial de cambios y versiones |

---

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Este es un proyecto universitario abierto a mejoras.

**Pasos para contribuir:**

1. **Fork** el repositorio
2. **Crea** tu rama de feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** tus cambios (`git commit -m 'feat: add AmazingFeature'`)
4. **Push** a la rama (`git push origin feature/AmazingFeature`)
5. **Abre** un Pull Request

Ver [CONTRIBUTING.md](CONTRIBUTING.md) para más detalles.

---

## 🐛 Reportar Bugs

¿Encontraste un bug? [Abre un issue](https://github.com/Hir0Exe/PU-NicotineFree/issues/new) con:

- 📝 Descripción clara del problema
- 🔄 Pasos para reproducir
- 📱 Información del dispositivo
- 📷 Screenshots (opcional)

---

## 💡 Solicitar Features

¿Tienes una idea? [Compártela aquí](https://github.com/Hir0Exe/PU-NicotineFree/issues/new) 

---

## 📄 Licencia

Este proyecto está bajo la **Licencia MIT**. Ver [LICENSE](LICENSE) para más detalles.

```
MIT License - Copyright (c) 2025 Hir0Exe
```

---

## 👨‍💻 Autor

<div align="center">

**Desarrollado como proyecto universitario**

[![GitHub](https://img.shields.io/badge/GitHub-Hir0Exe-181717?style=for-the-badge&logo=github)](https://github.com/Hir0Exe)  
[![Proyecto](https://img.shields.io/badge/Proyecto-PU--NicotineFree-blue?style=for-the-badge)](https://github.com/Hir0Exe/PU-NicotineFree)

</div>

---

## 🌟 Soporte

Si este proyecto te ayuda, considera darle una ⭐ en GitHub!

---

## 📞 Contacto

- **Issues:** [GitHub Issues](https://github.com/Hir0Exe/PU-NicotineFree/issues)
- **Discussions:** [GitHub Discussions](https://github.com/Hir0Exe/PU-NicotineFree/discussions)

---

## 🙏 Agradecimientos

- Flutter Team por el increíble framework
- Firebase por los servicios backend
- Comunidad Open Source por las librerías utilizadas
- Todos los que contribuyen a mejorar este proyecto

---

<div align="center">

## 🚀 ¡Comienza Tu Viaje Libre de Nicotina Hoy!

```bash
git clone https://github.com/Hir0Exe/PU-NicotineFree.git
cd PU-NicotineFree
flutter pub get
flutterfire configure
flutter run
```

**Tu camino hacia una vida libre de nicotina comienza aquí 🚭✨**

---

Made with ❤️ and Flutter

[⬆️ Volver arriba](#-nicotinefree---tu-compañero-para-dejar-de-fumar)

</div>
