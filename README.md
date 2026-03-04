# TEAM - Plataforma de Inversión y Gestión de Activos (MVP)

Bienvenido al repositorio de **TEAM**, una plataforma exclusiva y de alto nivel diseñada para inversores. Nuestro objetivo es democratizar la gestión eficiente de capital en activos inmobiliarios de alta rentabilidad y proyectos off-market, proporcionando una experiencia de usuario (UX) premium y automatización financiera.

## 🌟 Visión del Producto (MVP)
TEAM es mucho más que un gestor de propiedades; es un **Dashboard Financiero y Marketplace Inmobiliario**.
El inversor tiene un perfil "pasivo": aporta el capital y la plataforma le permite:
1.  Monitorizar los ingresos, la rentabilidad (ROI) y el retorno de sus activos en tiempo real.
2.  Aprobar grandes gastos de mantenimiento o mejoras de capital (CapEx).
3.  Descubrir e invertir en nuevas oportunidades inmobiliarias (Mercado Off-Market) a través de "Dossiers Interactivos".

## 🛠 Tech Stack
-   **Framework:** Ruby on Rails 7.1
-   **Base de Datos:** PostgreSQL
-   **Frontend:** Vanilla CSS con un sistema de diseño de lujo (Azul Medianoche, Oro Champán, *Playfair Display*, *Inter*).
-   **Despliegue (Production):** Variables de entorno configurables (`RAILS_ENV`, `SECRET_KEY_BASE`, `DATABASE_URL`).

---

## 📈 Plan Integración de CRMs (Enfoque Mercado Español)

Dado el modelo de "Asset Management" de TEAM, la plataforma no administra la propiedad en el día a día. Se integra con las herramientas (CRMs / PMS) que usa la agencia tercerizada (Property Manager) para absorber la data financiera de alquileres vacacionales/flexibles y mostrársela digerida al inversor.

### 1. Arquitectura de Integración Propuesta

Para conectar la plataforma **TEAM** de forma robusta, escalable y mantenible con múltiples CRMs o PMS (Sistemas de Gestión de Propiedades) relevantes para el **mercado español y europeo** (como AvaiBook, Smoobu, Hostify, Kross Booking, o Guesty), estableceremos una arquitectura basada en el patrón **Adapter (Adaptador)**, uso exhaustivo de **Webhooks** en tiempo real y **Background Jobs**.

#### Componentes Clave:
*   **Capa de Abstracción Central (`TeamSync::Core`):** Almacenamos un modelo estandarizado dentro de TEAM (por ejemplo, `TeamSyncReservation`, `TeamSyncProperty`) para asegurar que nuestra lógica de negocio no dependa de cómo está estructurado un CRM particular.
*   **Adaptadores Específicos (`AvaiBookAdapter`, `SmoobuAdapter`):** Clases o Servicios encargados de una sola labor: comunicarse con el API (Interfaz de Programación de Aplicaciones) de su CRM específico y traducir sus *payloads* a nuestro formato central de abstracción. Si mañana se cambia de proveedor, solo se crea un adaptador nuevo sin romper el Dashboard.
*   **Colas de Trabajo (ActiveJob / Solid Queue):** Sincronizaciones masivas nocturnas (ej. cuadrar ingresos contables pasados) ocurren asíncronamente (en segundo plano) para no bloquear la web.
*   **Endpoints de Webhooks:** Rutas habilitadas en TEAM (ej. `/api/webhooks/avaibook`) para que el CRM notifique instantáneamente cuando sucede un evento clave, es decir, un "Webhook" es un mensaje automatizado que el CRM envía a nuestra plataforma en el segundo exacto en que entra una reserva o se cancela.

### 2. Fases del Plan de Acción

#### Fase 1: Autenticación y Sincronización "Unidireccional" (Solo Lectura - MVP)
El objetivo inmediato es poblar el Dashboard de los inversores con información real automatizada desde los CRMs españoles, dejando atrás los datos manuales o dummies.
*   **Paso 1:** Desarrollar el modelo de Credenciales (`IntegrationCredential`) para guardar claves de API o Tokens por cada `Property` o agencia de gestión.
*   **Paso 2:** Crear el Job de sincronización nocturna para traer los **Ingresos (Revenues)** del mes en curso y pasado.
*   **Paso 3:** Sincronizar la **Ocupación** (días reservados vs. días libres) de calendarios externos para alimentar las métricas principales.

#### Fase 2: Escucha en Tiempo Real (Real-Time Webhooks)
Dejar de depender de escaneos nocturnos, volviendo a TEAM en un ecosistema vivo.
*   **Paso 1:** Configuración de Webhooks en la plataforma externa para emitir los siguientes eventos esenciales: `ReservaCreada`, `ReservaCancelada`.
*   **Paso 2:** Implementar seguridad a los Webhooks validando firmas cryptográficas (ej. HMAC) proporcionadas por el CRM para prevenir inyección o manipulación de datos por atacantes externos.

#### Fase 3: Operaciones Bidireccionales Avanzadas (Lectura y Escritura)
El inversor o el asset manager toma acciones directamente desde TEAM que acaban impactando la operativa diaria remota en el CRM.
*   **Paso 1:** Envío de órdenes de trabajo para tickets de mantenimiento (ej: un inversor hace clic en "Aprobar CapEx de €4,500", creándolo automáticamente validado en el sistema del Property Manager).
*   **Paso 2:** Bloqueo de uso personal. Un inversor bloquea fechas vacacionales para sí mismo en su propia unidad desde TEAM, comunicando la indisponibilidad (bloqueo) de inmediato al motor de reservas del CRM externo.

---

### 3. Ejemplo Práctico: Proveedores Europeos / España

Dado nuestro enfoque en el mercado local, evaluaremos proveedores con fuerte presencia en España que ofrezcan integración M2M. **M2M (Machine-to-Machine)** significa que dos servidores, el de TEAM y el del CRM, se autentican y hablan entre sí directamente mediante claves criptográficas en el backend de forma segura, sin necesitar que un usuario humano inicie sesión en la pantalla cada vez que se piden datos.

**Opciones de Integración Recomendadas (Mercado ESP/EU):**
1.  **AvaiBook (Grupo Idealista):** Ampliamente usado en España para alquiler vacacional. Ofrece API completa y sistema de notificaciones/webhooks.
2.  **Smoobu / Hostify:** Muy populares entre gestores europeos debido a sus APIs modernas, fáciles de conectar con arquitecturas Rails, y un enfoque Channel Manager muy potente.
3.  **Guesty:** Aunque es global, tiene fuerte presencia de gestores de alto nivel en las costas españolas y una API de calidad empresarial excelente para un piloto M2M robusto.

---

### 4. Setup de Entornos (Developer)

Para levantar la aplicación en desarrollo:
```bash
bundle install
rails db:create db:migrate db:seed
bin/rails server -p 3000
```
*(Nota: El comando `db:seed` incluye datos dummy y asignación de imágenes de arquitectura generadas específicamente para la estética visual premium de la app).*
