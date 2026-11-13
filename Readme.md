# Practicas de la Asignatura de Base de Datos en la Nube
## Ingenieria en Tecnologias de la Informacion e Inovacion Digital
### Docente: M.T.I Marco A. Ramirez Hernandez

## Descripción general

Esta práctica desarrolla y documenta la estructura de una base de datos relacional para una plataforma de comercio electrónico. El esquema contempla cuentas de usuario, perfiles y direcciones; productos y categorías; carritos y pedidos; pagos, devoluciones y envíos; y un registro de auditoría para dejar constancia de operaciones relevantes.

La base identificada en el respaldo es `db_test_7b`, exportada desde MySQL 8.0.44. Este documento describe el esquema de `backups/Respaldo-06.sql`; no usa los registros `INSERT` para afirmar cuántos datos reales hay almacenados.

## Objetivos principales

- Organizar la información de una tienda en tablas relacionadas y con responsabilidades claras.
- Representar el recorrido de compra: catálogo, carrito, pedido, pago, envío y posibles cancelaciones, devoluciones o reembolsos.
- Mantener la integridad de las conexiones mediante llaves primarias, llaves foráneas, restricciones y valores permitidos.
- Registrar automáticamente operaciones de alta, modificación y eliminación mediante triggers.
- Facilitar la consulta de información mediante vistas y documentación legible del esquema.

## Estructura de la base de datos

El respaldo contiene **25 tablas**. Se agrupan aquí por su función aparente; las interpretaciones basadas en los nombres se entienden como orientación y pueden confirmarse con las reglas de negocio del proyecto.

| Grupo | Tablas principales | Función dentro del modelo |
|---|---|---|
| **Usuarios** | `tb_users`, `tb_people`, `tb_user_addresses`, `tbd_address_components`, `tbd_user_payment_methods`, `tbd_users_wishlist_products` | Cuentas, datos personales, direcciones, medios de pago guardados y productos favoritos. `tb_people.user_ID` permite asociar el perfil personal con una cuenta. |
| **Catálogos** | `tb_products`, `tbc_categories`, `tbc_payment_methods_types`, `tb_products_users_providers`, `tbd_product_categories` | Productos, categorías y tipos de medio de pago. Las tablas puente conectan productos con quienes los ofrecen y con sus categorías. |
| **Carritos** | `tb_carts`, `tbd_carts_items` | Carritos asociados a cuentas y sus líneas de productos. |
| **Pedidos y atención** | `tb_orders`, `tb_buyer_orders`, `tbd_order_items`, `tb_order_cancellations`, `tbd_cancellation_items`, `tb_returns`, `tbd_return_items` | Pedidos generales y por vendedor, sus productos, solicitudes de cancelación y detalles de devoluciones. |
| **Pagos** | `tb_payments`, `tb_payment_transaction`, `tb_refunds` | Pagos, transacciones asociadas y reembolsos. Los pagos también se enlazan con cuentas y tipos o medios de pago. |
| **Envíos** | `tb_shipments`, `tb_user_addresses`, `tbd_address_components` | Información de envíos y direcciones. Las tablas de dirección aparecen también en el grupo de usuarios porque sirven a más de un proceso. |
| **Bitácora y auditoría** | `tb_logs` | Registra operaciones ejecutadas sobre distintas tablas, el usuario de base de datos, fecha, descripción y estado. |

Las relaciones se expresan mediante **39 llaves foráneas**. Dos son autorreferenciales: una permite que una categoría apunte a otra categoría superior; la otra permite que un componente de dirección apunte a un componente superior de la misma dirección. El respaldo no determina por sí solo las reglas completas del negocio para esas jerarquías.

## Auditoría y vistas

El esquema incluye **72 triggers**. Se ejecutan después de inserciones, modificaciones o eliminaciones en 24 tablas, y escriben una entrada en `tb_logs`. Para describir la operación, los triggers consultan el usuario de la sesión y buscan su rol en `mysql.role_edges`; si no encuentran uno, usan el texto `Sin rol`. En varias modificaciones comparan los valores anteriores y nuevos para registrar cambios.

También se definen **26 vistas**, es decir, consultas guardadas que presentan información derivada de una o varias tablas sin volver a escribir la consulta completa. Incluyen vistas de resumen de catálogo y vistas de trazabilidad que consultan la bitácora. La lista de cada vista, sus fuentes y sus columnas está en el diccionario HTML y en el inventario.

## Resultados obtenidos

| Requisito | Resultado documentado |
|---|---|
| Modelo relacional del comercio electrónico | 25 tablas, organizadas en usuarios, catálogos, carritos, pedidos, pagos, envíos y auditoría. |
| Identificación de conexiones entre datos | 39 llaves foráneas, incluidas 2 relaciones autorreferenciales. |
| Automatización de auditoría | 72 triggers de inserción, actualización y eliminación que escriben en `tb_logs`. |
| Consultas reutilizables | 26 vistas declaradas en el respaldo. |
| Documentación por columna | 207 columnas descritas en los diccionarios Markdown, CSV y HTML. |
| Diagrama entidad-relación | Diagrama Mermaid y versión HTML autocontenida con SVG integrado para uso sin internet. |
| Rutinas adicionales | No se encontraron procedimientos almacenados, funciones ni eventos programados en el respaldo. |
| Cantidad real de filas | No determinada por el esquema; este README no estima registros. |

## Documentos generados

- [Índice de documentos](index.html)
- [Inventario del esquema](resumen_respaldo5.md) — nombre histórico; su contenido corresponde a Respaldo-06.
- [Diagrama de relaciones en HTML](relaciones-respaldo6.html)
- [Fuente Mermaid del diagrama](relaciones_respaldo6.mmd)
- [Diccionario de datos en HTML](diccionario_datos_respaldo6.html)
- [Diccionario de datos en Markdown](diccionario_datos_respaldo6.md)
- [Diccionario de datos en CSV](diccionario_datos_respaldo6.csv)
- [Respaldo SQL de origen](backups/Respaldo-06.sql)
