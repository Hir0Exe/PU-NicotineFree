# 🚭 NicotineFree - Tu Compañero para Dejar de Fumar

**NicotineFree** es una aplicación móvil desarrollada en Flutter que ayuda a las personas a dejar de fumar mediante gamificación, seguimiento de progreso y recompensas motivadoras.

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

```bash
# En el directorio del proyecto
flutterfire configure
```

Esto generará automáticamente:
- `lib/firebase_options.dart`
- `android/app/google-services.json`

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
├── main.dart                 # Punto de entrada
├── firebase_options.dart     # Configuración Firebase
│
├── models/                   # Modelos de datos
│   ├── user_model.dart
│   ├── progress_model.dart
│   ├── challenge_model.dart
│   └── reward_model.dart
│
├── services/                 # Servicios y lógica de negocio
│   ├── auth_service.dart
│   ├── progress_service.dart
│   └── rewards_service.dart
│
├── providers/                # Gestión de estado
│   └── auth_provider.dart
│
└── screens/                  # Pantallas de la app
    ├── auth/
    ├── home/
    ├── challenges/
    ├── rewards/
    └── notifications/
```

---

## 🎯 Funcionalidades Planificadas

### Versión 1.0 (MVP)
- [x] Sistema de autenticación
- [ ] Seguimiento de días sin fumar
- [ ] Cálculo de dinero ahorrado
- [ ] Seguimiento de mejoras en salud
- [ ] Sistema básico de puntos

### Versión 2.0
- [ ] Sistema de retos completo
- [ ] Ranking y competencia
- [ ] Premios canjeables
- [ ] Notificaciones push
- [ ] Mensajes motivacionales

### Versión 3.0
- [ ] Chat con especialistas
- [ ] Comunidad de apoyo
- [ ] Personalización de metas
- [ ] Análisis avanzado de progreso

---

## 🛠️ Tecnologías Utilizadas

- **Flutter 3.9.2+** - Framework
- **Dart 3.9.2+** - Lenguaje
- **Firebase Authentication** - Autenticación
- **Cloud Firestore** - Base de datos
- **Firebase Cloud Messaging** - Notificaciones
- **Provider** - Gestión de estado

---

## 📝 Configuración del Package Name

**Android:** `com.hir0exe.nicotine_free`

Asegúrate de que coincida en:
- `android/app/build.gradle.kts`
- `android/app/google-services.json`
- Estructura de carpetas en `android/app/src/main/kotlin/`

---

## 🤝 Contribuir

Este es un proyecto universitario. Las contribuciones son bienvenidas:

1. Fork el repositorio
2. Crea tu rama (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'Agrega nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT.

---

## 👨‍💻 Autor

**Desarrollado como proyecto universitario**

- GitHub: [@Hir0Exe](https://github.com/Hir0Exe)
- Proyecto: [PU-NicotineFree](https://github.com/Hir0Exe/PU-NicotineFree)

---

## 🚀 ¡Comienza Ahora!

```bash
# 1. Clona el proyecto
git clone https://github.com/Hir0Exe/PU-NicotineFree.git
cd PU-NicotineFree

# 2. Instala dependencias
flutter pub get

# 3. Configura Firebase
flutterfire configure

# 4. Ejecuta
flutter run
```

**¡Tu camino hacia una vida libre de nicotina comienza hoy! 🚭✨**
