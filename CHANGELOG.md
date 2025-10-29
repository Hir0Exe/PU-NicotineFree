# 📝 Changelog - NicotineFree

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

---

## [0.1.0] - 2025-10-29

### 🎉 Versión Inicial - MVP

#### ✅ Agregado

**Autenticación:**
- Sistema de registro con email y contraseña
- Sistema de login con email y contraseña
- Logout funcional
- Validación de formularios
- Gestión de estado con Provider

**Pantalla de Inicio (Home):**
- Visualización de nombre de usuario
- Contador de días sin fumar
- Contador de cigarrillos evitados
- Cálculo de dinero ahorrado
- Checklist de mejoras en salud:
  - Circulación sanguínea mejorada
  - Sentido del olfato recuperado
  - Riesgo cardíaco reducido
- Botón de logout
- Gradiente visual atractivo

**Pantalla de Retos (Challenges):**
- Visualización de ranking personal
- Sistema de puntos
- Retos activos con progreso
- Nuevos retos disponibles
- Categorías: Salud, Mente, Social
- UI con cards y gradientes

**Pantalla de Recompensas (Rewards):**
- Contador de puntos disponibles
- Progreso a próximo premio
- Insignias desbloqueables:
  - 🎯 Primera semana
  - ❤️ Corazón fuerte
  - 🏆 Guerrero
  - ⭐ Estrella brillante
  - ⚡ Energía renovada
  - 🎁 Misterio
- Premios canjeables:
  - Mes premium gratis
  - Kit de bienestar
  - Sesión de coaching
  - Retiro de fin de semana
- Estados: Desbloqueada/Bloqueada

**Pantalla de Alertas (Notifications):**
- Mensaje del día motivacional
- Lista de notificaciones:
  - Logros alcanzados
  - Retos completados
  - Nuevas insignias
- Timestamps relativos ("Hace 2 horas")

**Navegación:**
- Bottom Navigation Bar con 4 tabs:
  - 🏠 Inicio
  - 🏆 Retos
  - 🎁 Premios
  - 🔔 Alertas
- Iconos activos/inactivos
- Transiciones fluidas

**UI/UX:**
- Diseño moderno con gradientes (morado → rosa)
- Colores consistentes: Azul (#0080FF) como primario
- Tipografía clara y legible
- Espaciado consistente
- Responsive design
- Sin errores de overflow

**Firebase Integration:**
- Firebase Authentication configurado
- Cloud Firestore configurado
- Modelo de datos `UserModel`
- Servicio `AuthService`
- Provider `AuthProvider`

**Configuración del Proyecto:**
- Package name: `com.hir0exe.nicotine_free`
- Nombre de app: NicotineFree
- Estructura de carpetas organizada
- Dependencias optimizadas
- Gradle configurado (2GB JVM)

#### 🐛 Corregido
- Overflow errors en pantalla de Retos
- Overflow errors en pantalla de Recompensas
- Overflow errors en pantalla de Alertas
- Espaciado en cards de insignias
- Textos truncados con ellipsis
- GridView childAspectRatio optimizado
- Padding ajustado en componentes

#### 📚 Documentación
- README.md completo con:
  - Descripción del proyecto
  - Características
  - Instalación paso a paso
  - Configuración de Firebase detallada
  - Estructura del proyecto
  - Roadmap de features
- SETUP.md con guía completa de instalación
- CONTRIBUTING.md con guías de contribución
- Archivos de ejemplo:
  - `google-services.example.json`
  - `firebase_options.example.dart`
- .gitignore configurado para seguridad

#### 🔒 Seguridad
- Archivos sensibles en .gitignore:
  - `google-services.json`
  - `firebase_options.dart`
  - `local.properties`
- Validación de inputs en formularios
- Reglas de Firestore básicas

---

## [Próximas Versiones]

### 🔮 [0.2.0] - Planificado

#### Funcionalidades Planeadas
- [ ] Persistencia de datos de usuario en Firestore
- [ ] Configuración real de fecha de abandono
- [ ] Configuración de cigarrillos por día
- [ ] Configuración de precio por paquete
- [ ] Sistema de retos funcional con Firestore
- [ ] Sistema de puntos real
- [ ] Ranking global de usuarios
- [ ] Notificaciones push reales

### 🔮 [0.3.0] - Planificado
- [ ] Recuperación de contraseña
- [ ] Edición de perfil
- [ ] Avatar personalizable
- [ ] Gráficos de progreso
- [ ] Historial de logros
- [ ] Compartir logros en redes sociales

### 🔮 [1.0.0] - Futuro
- [ ] Versión completa de producción
- [ ] Tests unitarios y de integración
- [ ] Soporte para iOS
- [ ] Versión web
- [ ] Internacionalización (i18n)
- [ ] Modo oscuro
- [ ] Comunidad de usuarios
- [ ] Chat con especialistas

---

## 📊 Estadísticas de la Versión Actual

**Líneas de código:** ~2,500+
**Archivos Dart:** 15+
**Pantallas:** 6 (Login, Register, Home, Challenges, Rewards, Notifications)
**Modelos:** 1 (UserModel)
**Servicios:** 1 (AuthService)
**Providers:** 1 (AuthProvider)

---

## 🏷️ Versionado

Este proyecto usa [Semantic Versioning](https://semver.org/lang/es/):

- **MAJOR** (1.x.x): Cambios incompatibles en la API
- **MINOR** (x.1.x): Nueva funcionalidad compatible hacia atrás
- **PATCH** (x.x.1): Correcciones de bugs

**Versión actual:** 0.1.0 (MVP - Minimum Viable Product)

---

## 🔗 Enlaces

- **Repositorio:** https://github.com/Hir0Exe/PU-NicotineFree
- **Issues:** https://github.com/Hir0Exe/PU-NicotineFree/issues
- **Autor:** [@Hir0Exe](https://github.com/Hir0Exe)

---

_Última actualización: 29 de octubre, 2025_

