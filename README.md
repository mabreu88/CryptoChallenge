# cryptochallenge

Proyecto para trackear precio de criptomoendas en tiempo real, planificado a futuro agregar billetera con dinero fake y poder simular tradding

Flujo de dependencias:
views/ → widgets/ → blocs/ → repositories/ → services/
       ↘ providers/ ↗        ↘ models/ ↗

┌───────────────────────────────────────────────────────────────┐
│                     Inicio de la Aplicación                   │
└───────────────┬────────────────────────────────┬──────────────┘
                │                                │
                ▼                                ▼
┌───────────────────────────────┐  ┌───────────────────────────────┐
│        Pantalla Principal     │  │    Servicio en Segundo Plano  │
│                               │  │                               │
│  ┌──────────────┐             │  │  Verifica conexión internet   │
│  │  Cargando... │             │  │  cada 30 minutos              │
│  └──────┬───────┘             │  │                               │
│         │                     │  └──────────────┬────────────────┘
│         ▼                     │                │
│  ┌───────────────┐  Sí ┌────────────┐          │
│  │ ¿Datos OK?    ├────>│ Mostrar    │          │
│  └───────┬───────┘     │ Lista      │          │
│          │ No          └─────┬──────┘          │
│          ▼                   │                 │
│  ┌───────────────┐           │                 │
│  │ Mostrar Error │           │                 │
│  └───────────────┘           ▼                 │
│                               ┌────────────────┴─────┐
│                               │  Actualización       │
│                               │  en Tiempo Real      │
│                               └──────────┬───────────┘
│                                          │
▼                                          ▼
┌───────────────────────────────────────────────────────────────┐
│                      Pantalla de Detalle                      │
│                                                               │
│  ┌─────────────────┐        ┌─────────────────┐               │
│  │ Datos Básicos   │        │ Gráfico Hist.   │               │
│  └────────┬────────┘        └────────┬────────┘               │
│           │                          │                        │
│           └──────────┬───────────────┘                        │
│                      │                                        │
│                      ▼                                        │
│               ┌───────────────┐                               │
│               │ Configurar    │                               │
│               │ Alerta Precio │                               │
│               └──────┬────────┘                               │
│                      │                                        │
│                      ▼                                        │
│               ┌───────────────┐                               │
│               │ Notificación  │                               │
│               │ Programada    │                               │
│               └───────────────┘                               │
└───────────────────────────────────────────────────────────────┘