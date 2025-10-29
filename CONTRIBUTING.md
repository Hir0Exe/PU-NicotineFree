# 🤝 Guía de Contribución - NicotineFree

¡Gracias por tu interés en contribuir a NicotineFree! Este es un proyecto universitario, pero toda contribución es bienvenida.

---

## 📋 Cómo Contribuir

### 1. Fork y Clonar

```bash
# Fork el repositorio en GitHub (botón Fork)
# Luego clona tu fork
git clone https://github.com/TU_USUARIO/PU-NicotineFree.git
cd PU-NicotineFree
```

### 2. Crear una Rama

```bash
# Crear rama para tu feature o bugfix
git checkout -b feature/nombre-descriptivo
# o
git checkout -b fix/descripcion-del-bug
```

**Convención de nombres:**
- `feature/` - Nueva funcionalidad
- `fix/` - Corrección de bug
- `docs/` - Documentación
- `refactor/` - Refactorización
- `style/` - Cambios de estilo/formato
- `test/` - Tests

### 3. Hacer Cambios

- Sigue las convenciones de código de Flutter/Dart
- Comenta código complejo
- Mantén los commits pequeños y enfocados

### 4. Commit

```bash
git add .
git commit -m "feat: descripción clara del cambio"
```

**Convención de commits (Conventional Commits):**
```
feat: Nueva funcionalidad
fix: Corrección de bug
docs: Cambios en documentación
style: Formato, punto y coma, etc (sin cambios de código)
refactor: Refactorización de código
test: Agregar o modificar tests
chore: Tareas de mantenimiento
```

**Ejemplos:**
```bash
git commit -m "feat: agregar contador de días sin fumar"
git commit -m "fix: corregir cálculo de dinero ahorrado"
git commit -m "docs: actualizar README con nueva feature"
```

### 5. Push y Pull Request

```bash
# Push a tu fork
git push origin feature/nombre-descriptivo
```

Luego:
1. Ve a GitHub → tu fork
2. Clic en **"New Pull Request"**
3. Describe tus cambios claramente
4. Espera revisión

---

## 🎨 Guías de Estilo

### Dart/Flutter

Seguimos las [guías oficiales de Dart](https://dart.dev/guides/language/effective-dart):

```dart
// ✅ BIEN: nombres descriptivos, camelCase
class UserProgressService {
  Future<void> calculateDaysSmokeFree() async { }
}

// ❌ MAL: nombres cortos, inconsistentes
class UPS {
  void calc() { }
}
```

### Estructura de Archivos

```
lib/
├── models/          # Modelos de datos
├── services/        # Lógica de negocio
├── providers/       # Gestión de estado
├── screens/         # Pantallas UI
├── widgets/         # Widgets reutilizables
└── utils/           # Utilidades generales
```

### Comentarios

```dart
// Comentarios en español (proyecto universitario en español)

/// Calcula los días transcurridos desde que el usuario dejó de fumar.
/// 
/// Retorna 0 si [quitDate] es null o en el futuro.
int calculateDaysSinceQuit(DateTime? quitDate) {
  if (quitDate == null) return 0;
  return DateTime.now().difference(quitDate).inDays;
}
```

---

## 🐛 Reportar Bugs

### Antes de Reportar

1. **Busca si ya existe** el issue
2. **Verifica que sea un bug** (no una configuración incorrecta)
3. **Reproduce el bug** en modo debug

### Crear Issue

Incluye:

**Título descriptivo:**
```
❌ "No funciona"
✅ "Error al calcular dinero ahorrado con precio decimal"
```

**Descripción completa:**
```markdown
## Descripción
Al ingresar un precio con decimales (ej: 12.5), el cálculo de dinero ahorrado es incorrecto.

## Pasos para Reproducir
1. Registrar usuario
2. Establecer precio por paquete: 12.5
3. Establecer cigarrillos por día: 10
4. Ver pantalla de inicio

## Resultado Esperado
Dinero ahorrado = días * (10/20) * 12.5

## Resultado Actual
Dinero ahorrado muestra 0 o NaN

## Screenshots
[Adjuntar captura]

## Entorno
- Dispositivo: Xiaomi Redmi Note 10
- Android: 11
- Flutter: 3.9.2
```

---

## 💡 Sugerir Features

### Template de Feature Request

```markdown
## Feature Sugerida
Agregar gráfico de progreso semanal

## Problema que Resuelve
Los usuarios quieren visualizar su progreso de forma gráfica

## Solución Propuesta
Implementar un gráfico de líneas usando fl_chart que muestre:
- Cigarrillos evitados por día
- Dinero ahorrado acumulado

## Alternativas Consideradas
- Usar tabla en lugar de gráfico (menos visual)
- Gráfico de barras (menos fluido)

## Screenshots/Mockups
[Adjuntar diseño si tienes]
```

---

## ✅ Checklist de Pull Request

Antes de enviar tu PR, verifica:

### Código
- [ ] El código compila sin errores
- [ ] No hay warnings del linter
- [ ] Funciona en Android (emulador y físico)
- [ ] No rompe funcionalidades existentes

### Formato
- [ ] Código formateado (`flutter format .`)
- [ ] Imports organizados
- [ ] No hay código comentado innecesario
- [ ] No hay `print()` de debug (usa `debugPrint()`)

### Documentación
- [ ] Comentarios en código complejo
- [ ] README actualizado si es necesario
- [ ] CHANGELOG actualizado (para cambios significativos)

### Commits
- [ ] Commits descriptivos
- [ ] Historial limpio (squash si es necesario)

---

## 🧪 Testing

Aunque el proyecto no tiene tests unitarios aún, se recomienda:

### Testing Manual
```bash
# Prueba en modo debug
flutter run

# Prueba en modo release
flutter run --release
```

### Áreas Críticas a Probar
- ✅ Registro de usuario
- ✅ Login/Logout
- ✅ Cálculo de días sin fumar
- ✅ Cálculo de dinero ahorrado
- ✅ Navegación entre pantallas

---

## 📝 Notas Adicionales

### Firebase y Seguridad

- **NO compartas** tus credenciales de Firebase
- **NO hagas commit** de `google-services.json`
- **NO expongas** API keys en el código

### Branches

- `master` - Código estable en producción
- `develop` - Desarrollo activo (si aplica)
- `feature/*` - Nuevas funcionalidades
- `fix/*` - Correcciones

### Code Review

Los PRs serán revisados por:
- ✅ Funcionalidad correcta
- ✅ Calidad del código
- ✅ Consistencia con el proyecto
- ✅ Documentación adecuada

---

## 🎓 Recursos

### Documentación Oficial
- [Flutter Docs](https://docs.flutter.dev/)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)

### Tutoriales Recomendados
- [Flutter Codelabs](https://docs.flutter.dev/codelabs)
- [Provider Package](https://pub.dev/packages/provider)
- [Firebase Authentication](https://firebase.google.com/docs/auth/flutter/start)

---

## 👥 Comunidad

- **Dudas técnicas:** Abre un issue con la etiqueta `question`
- **Propuestas:** Usa las Discussions de GitHub
- **Bugs urgentes:** Etiqueta como `bug` y `priority: high`

---

## 📄 Licencia

Al contribuir, aceptas que tus contribuciones se licencien bajo la misma licencia MIT del proyecto.

---

## 🙏 Agradecimientos

¡Gracias por ayudar a hacer de NicotineFree una mejor herramienta para ayudar a las personas a dejar de fumar! 🚭✨

**Tu contribución hace la diferencia.** 💪

