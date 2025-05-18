# 📱 CryptoChallenge



Aplicación Flutter para rastrear criptomonedas en tiempo real utilizando la API de TradingView y el patrón BLoC para el manejo de estado.

---

## 🚀 Funcionalidades

- Visualización de precios actualizados de criptomonedas.
- Cambio entre diferentes monedas o criptos.
- Soporte para modo offline.
- Efectos de carga con shimmer.
- Almacenamiento local de configuraciones del usuario.
- Pull to refresh para actualizar datos manualmente.

---

## 📦 Dependencias

Estas son las principales librerías utilizadas en este proyecto Flutter:

| Paquete | Versión | Descripción |
|--------|---------|-------------|
| `flutter_bloc` | ^9.1.1 | Manejo de estado usando el patrón BLoC (Business Logic Component), promoviendo una arquitectura más limpia y escalable. |
| `equatable` | ^2.0.7 | Permite comparar objetos por valor, facilitando el uso de estados y eventos en BLoC. |
| `http` | ^1.4.0 | Cliente HTTP para realizar solicitudes a APIs REST. |
| `intl` | ^0.20.2 | Soporte para internacionalización (fechas, monedas, idiomas, etc). |
| `connectivity_plus` | ^6.1.4 | Detecta el estado de conexión del dispositivo (Wi-Fi, datos móviles, sin conexión). |
| `shared_preferences` | ^2.5.3 | Permite guardar datos simples de forma persistente en el dispositivo. |
| `pull_to_refresh` | ^2.0.0 | Añade funcionalidad de "arrastrar para refrescar" en listas. |
| `shimmer` | ^3.0.0 | Agrega efectos de carga tipo "skeleton" para mejorar la experiencia de usuario mientras se carga el contenido. |

---

## 🧪 Dependencias de desarrollo

Estas librerías se utilizan exclusivamente durante el desarrollo y para realizar pruebas:

| Paquete | Versión | Descripción |
|--------|---------|-------------|
| `flutter_test` | SDK | Framework de pruebas integrado de Flutter. |
| `bloc_test` | ^10.0.0 | Facilita las pruebas unitarias de blocs y cubits. |
| `mockito` | ^5.4.6 | Librería para crear objetos simulados (mocks) en pruebas. |
| `build_runner` | ^2.4.15 | Herramienta de generación de código, usada junto a `mockito` y otros generadores. |

---

## 🗺️ Roadmap de Desarrollo

Este es el plan de trabajo estimado para el desarrollo de la aplicación de seguimiento de criptomonedas:

---

### 1. 🧠 Planificación y Diseño (Día 1-2)
**Por qué:** Sentar las bases antes de codificar evita rework.

- Definir alcance: lista de criptomonedas, precios en tiempo real, alertas.
- Diseñar arquitectura: patrón BLoC para el estado, repositorio para acceder a los datos.
- Elegir API: CoinGecko (gratis, buena documentación).
- Crear mockups de UI: pantalla principal con listado + pantalla de detalle.

---

### 2. ⚙️ Configuración Inicial (Día 3)
**Por qué:** Un entorno preparado acelera el desarrollo.

- Crear proyecto Flutter: `flutter create CryptoChallenge`.
- Configurar estructura de carpetas (`blocs`, `models`, `repositories`, etc.).
- Añadir dependencias en `pubspec.yaml` (`http`, `flutter_bloc`, `equatable`, etc.).

---

### 3. 🔧 Implementación Básica (Día 4-6)
**Por qué:** Construir un MVP funcional lo antes posible.

- Crear modelos de datos: `CryptoCoin`, `CryptoResponse`.
- Servicio API: función `fetchCryptoData()` básica.
- BLoC inicial: evento `FetchCryptoData` → estados `Loading`, `Loaded`, `Error`.
- UI básica: `ListView` con datos mockeados.

---

### 4. 🌐 Integración API Real (Día 7-8)
**Por qué:** Conectar la app con datos reales.

- Adaptar modelos a la respuesta real de CoinGecko.
- Manejo de errores: timeouts, respuestas incorrectas, etc.
- UI de carga y errores.
- Soporte de pull-to-refresh para actualizar manualmente los datos.

---

### 5. 🧩 Mejoras de Estado (Día 9-10)
**Por qué:** Optimizar la gestión del estado de la app.

- Añadir BLoC para detalles de cada moneda.
- Persistencia simple: guardar últimas monedas vistas.
- WebSockets para actualizaciones en tiempo real (top 10 monedas).

---

### 6. 🎨 UI Avanzada (Día 11-13)
**Por qué:** Mejorar la experiencia del usuario.

- Pantalla de detalle con gráfico histórico.
- Búsqueda y filtrado en la lista principal.
- Cambio de tema (modo claro/oscuro).
- Animaciones básicas entre pantallas.

---

### 7. 🔔 Alertas y Notificaciones (Día 14-15)
**Por qué:** Añadir funcionalidades clave para el usuario.

- Servicio de notificaciones locales.
- Lógica para alertas de precios personalizados.
- Tareas en segundo plano para verificaciones periódicas.
- Configuración de permisos en `AndroidManifest.xml`.

---

### 8. 🐞 Depuración y Optimización (Día 16-17)
**Por qué:** Garantizar estabilidad y buen rendimiento.

- Testing unitario: modelos y servicios.
- Testing de widgets: componentes críticos.
- Profiling: rendimiento con grandes volúmenes de datos.
- Optimización de llamadas a la API.

---

### 9. 🚀 Preparación para Release (Día 18-20)
**Por qué:** Publicar una app lista para producción.

- Internacionalización (i18n): soporte multilenguaje.
- Pantalla de bienvenida (splash) e ícono personalizado.
- Integración con Firebase Analytics (opcional).
- Compilación para Android (`.aab`).

---
