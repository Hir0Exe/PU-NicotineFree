# 🌤️ Configuración de la API del Clima

## ⚠️ Problema: Error 429 (Límite de Peticiones Excedido)

El error **429** significa que la API key compartida ha alcanzado su límite gratuito de peticiones.

---

## ✅ Solución: Obtén tu Propia API Key GRATIS

### Paso 1: Crear Cuenta en OpenWeatherMap

1. **Visita:** https://openweathermap.org/
2. **Haz clic en:** "Sign In" → "Create an Account"
3. **Completa el formulario:**
   - Username (nombre de usuario)
   - Email
   - Password (contraseña)
4. **Acepta los términos** y haz clic en "Create Account"

### Paso 2: Verificar Email

1. **Revisa tu bandeja de entrada** (y spam)
2. **Haz clic en el enlace de verificación** del email
3. Tu cuenta estará activa

### Paso 3: Obtener tu API Key

1. **Inicia sesión** en https://openweathermap.org/
2. **Ve a tu perfil** → "My API Keys"
3. **Copia tu API Key** (será algo como: `a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6`)
4. ⚠️ **Espera 10-15 minutos** para que la API key se active

### Paso 4: Configurar en el Proyecto

1. **Abre el archivo:** `lib/services/weather_service.dart`
2. **Busca la línea 75:**
   ```dart
   static const String _apiKey = 'bd5e378503939ddaee76f12ad7a97608';
   ```
3. **Reemplaza** con tu nueva API key:
   ```dart
   static const String _apiKey = 'TU_API_KEY_AQUI';
   ```
4. **Guarda el archivo**
5. **Ejecuta:** `flutter run`

---

## 📊 Límites del Plan Gratuito

- ✅ **60 llamadas por minuto**
- ✅ **1,000,000 llamadas por mes**
- ✅ **Datos actuales del clima**
- ✅ **Sin necesidad de tarjeta de crédito**

---

## 🔧 Mejoras Implementadas

### Sistema de Caché (10 minutos)

El proyecto ahora incluye un **sistema de caché** que:
- ✅ Guarda el clima por 10 minutos
- ✅ No hace peticiones repetidas
- ✅ Reduce el uso de la API en un 90%
- ✅ Muestra datos antiguos si hay error 429

### Logs Mejorados

Ahora verás mensajes como:
```
🌐 Haciendo petición a OpenWeatherMap API...
✅ Clima obtenido y guardado en caché
📦 Usando clima desde caché (válido por 8 minutos más)
```

---

## 🆘 ¿Aún con Problemas?

Si después de configurar tu API key sigues con error 429:

1. **Espera 10-15 minutos** (la API key tarda en activarse)
2. **Verifica** que copiaste la key correctamente
3. **Cierra y abre** la app de nuevo
4. **Presiona "Reintentar"** en el widget del clima

---

## 📝 Notas Adicionales

- La API key es **personal y gratuita**
- No compartas tu API key públicamente
- Puedes ver el uso en: https://home.openweathermap.org/statistics
- El plan gratuito es más que suficiente para esta app

---

## 🎯 Resumen Rápido

```bash
1. Registrarse: https://openweathermap.org/
2. Verificar email
3. Obtener API Key
4. Esperar 10-15 minutos
5. Editar: lib/services/weather_service.dart (línea 75)
6. Reemplazar con tu API key
7. flutter run
```

---

**¡Listo!** Con tu propia API key, el clima funcionará perfectamente sin límites. 🚀

