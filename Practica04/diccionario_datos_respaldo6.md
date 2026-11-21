# Diccionario de datos — Respaldo-05.sql

Base `db_test_7b` · MySQL 8.0.44. Columnas y restricciones extraídas del DDL; triggers y vistas desde sus definiciones.

## Tablas

Una fila por columna. Los valores predeterminados y acciones referenciales se transcriben del respaldo.

### `tb_buyer_orders`

Filas incluidas en los INSERT del respaldo: **8**.

PK: `ID`
Índices: seller_ID(seller_ID)
CHECK: tb_buyer_orders_chk_1: `(`subtotal` >= 0)`; tb_buyer_orders_chk_2: `(`shipping_cost` >= 0)`

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| seller_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | tb_buyer_orders_ibfk_1: tb_buyer_orders.seller_ID → tb_users.ID | Identificador relacionado con seller. |
| subtotal | decimal(12,2) | NOT NULL | '0.00' | No | No | Dato de subtotal; el respaldo no incluye una descripción funcional adicional. |
| shipping_cost | decimal(12,2) | NOT NULL | '0.00' | No | No | Dato de shipping cost; el respaldo no incluye una descripción funcional adicional. |
| fulfillment_status | enum('Pending','Accepted','Preparing','Sent','Delivered','Canceled','Returned') | NOT NULL | 'Pending' | No | No | Dato de fulfillment status; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NULL permitido | NULL | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_carts`

Filas incluidas en los INSERT del respaldo: **5**.

PK: `ID`
Índices: uk_cart_user(user_ID) UNIQUE

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| user_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | tb_carts_ibfk_1: tb_carts.user_ID → tb_users.ID | Identificador relacionado con user. |
| status | bit(1) | NULL permitido | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NULL permitido | NULL | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_logs`

Filas incluidas en los INSERT del respaldo: **53413**.

PK: `ID`

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| table_name | varchar(80) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de table name; el respaldo no incluye una descripción funcional adicional. |
| table_operation | enum('Create','READ','Update','Delete') | NULL permitido | NULL | No | No | Dato de table operation; el respaldo no incluye una descripción funcional adicional. |
| db_user | varchar(80) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de db user; el respaldo no incluye una descripción funcional adicional. |
| operation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de operation date; el respaldo no incluye una descripción funcional adicional. |
| operation_description | text | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de operation description; el respaldo no incluye una descripción funcional adicional. |
| operation_status | bit(1) | NULL permitido | b'1' | No | No | Dato de operation status; el respaldo no incluye una descripción funcional adicional. |

### `tb_order_cancellations`

Filas incluidas en los INSERT del respaldo: **2**.

PK: `ID`
Índices: fk_order_cancellations_payment(payment_ID); fk_order_cancellations_user(requested_by_user_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| payment_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_order_cancellations_payment: tb_order_cancellations.payment_ID → tb_payments.ID | Identificador relacionado con payment. |
| requested_by_user_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_order_cancellations_user: tb_order_cancellations.requested_by_user_ID → tb_users.ID | Identificador relacionado con requested by user. |
| reason | text | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de reason; el respaldo no incluye una descripción funcional adicional. |
| cancellation_status | enum('Pending','Approved','Rejected','Completed') | NOT NULL | 'Pending' | No | No | Dato de cancellation status; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_orders`

Filas incluidas en los INSERT del respaldo: **4**.

PK: `ID`
Índices: uk_order_number(order_number) UNIQUE; fk_orders_user(user_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| user_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_orders_user: tb_orders.user_ID → tb_users.ID | Identificador relacionado con user. |
| order_number | varchar(50) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de order number; el respaldo no incluye una descripción funcional adicional. |
| total_amount | decimal(10,2) | NOT NULL | '0.00' | No | No | Dato de total amount; el respaldo no incluye una descripción funcional adicional. |
| order_status | enum('Pending','Processing','Completed','Cancelled','Refunded') | NOT NULL | 'Pending' | No | No | Dato de order status; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_payment_transaction`

Filas incluidas en los INSERT del respaldo: **15**.

PK: `ID`
Índices: fk_payment_transaction(payment_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| payment_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_payment_transaction: tb_payment_transaction.payment_ID → tb_payments.ID | Identificador relacionado con payment. |
| transaction_type | enum('Charge','Refund','Authorization','Void') | NOT NULL | 'Charge' | No | No | Dato de transaction type; el respaldo no incluye una descripción funcional adicional. |
| amount | decimal(10,2) | NOT NULL | '0.00' | No | No | Dato de amount; el respaldo no incluye una descripción funcional adicional. |
| currency | varchar(3) | NOT NULL | 'MXN' | No | No | Dato de currency; el respaldo no incluye una descripción funcional adicional. |
| gateway_transaction_id | varchar(255) | NULL permitido | NULL | No | No | Identificador relacionado con gateway transaction id. |
| gateway_response | text | NULL permitido | NULL | No | No | Dato de gateway response; el respaldo no incluye una descripción funcional adicional. |
| operation_status | enum('Pending','Completed','Failed','Cancelled') | NOT NULL | 'Pending' | No | No | Dato de operation status; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_payments`

Filas incluidas en los INSERT del respaldo: **9**.

PK: `ID`
Índices: fk_payments_user(user_ID); fk_payments_method_type(payment_method_type_ID); fk_payments_user_method(user_payment_method_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| user_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_payments_user: tb_payments.user_ID → tb_users.ID | Identificador relacionado con user. |
| payment_method_type_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_payments_method_type: tb_payments.payment_method_type_ID → tbc_payment_methods_types.ID | Identificador relacionado con payment method type. |
| user_payment_method_ID | bigint unsigned | NULL permitido | NULL | No | fk_payments_user_method: tb_payments.user_payment_method_ID → tbd_user_payment_methods.ID | Identificador relacionado con user payment method. |
| total_amount | decimal(10,2) | NOT NULL | '0.00' | No | No | Dato de total amount; el respaldo no incluye una descripción funcional adicional. |
| currency | varchar(3) | NOT NULL | 'MXN' | No | No | Dato de currency; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_people`

Filas incluidas en los INSERT del respaldo: **20000**.

PK: `person_ID`
Índices: user_ID(user_ID) UNIQUE

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| person_ID | bigint unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Identificador relacionado con person. Se incrementa automáticamente. |
| user_ID | int unsigned | NULL permitido | NULL | No | fk_people_users: tb_people.user_ID → tb_users.ID | Identificador relacionado con user. |
| courtesy_title | varchar(20) | NULL permitido | NULL | No | No | Dato de courtesy title; el respaldo no incluye una descripción funcional adicional. |
| given_names | varchar(150) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de given names; el respaldo no incluye una descripción funcional adicional. |
| family_names | varchar(150) | NULL permitido | NULL | No | No | Dato de family names; el respaldo no incluye una descripción funcional adicional. |
| birth_date | date | NULL permitido | NULL | No | No | Dato de birth date; el respaldo no incluye una descripción funcional adicional. |
| gender | enum('Hombre','Mujer','Prefiero no decirlo') | NOT NULL | 'Prefiero no decirlo' | No | No | Dato de gender; el respaldo no incluye una descripción funcional adicional. |
| country_code | char(2) | NULL permitido | NULL | No | No | Dato de country code; el respaldo no incluye una descripción funcional adicional. |
| phone | varchar(25) | NULL permitido | NULL | No | No | Dato de phone; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NULL permitido | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NULL permitido | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NULL permitido | NULL | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_products`

Filas incluidas en los INSERT del respaldo: **5019**.

PK: `ID`
Índices: SKU(SKU) UNIQUE

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| SKU | varchar(50) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de SKU; el respaldo no incluye una descripción funcional adicional. |
| name | varchar(250) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de name; el respaldo no incluye una descripción funcional adicional. |
| description | text | NULL permitido | NULL | No | No | Dato de description; el respaldo no incluye una descripción funcional adicional. |
| current_price | decimal(10,2) | NOT NULL | '0.00' | No | No | Dato de current price; el respaldo no incluye una descripción funcional adicional. |
| current_stock | int unsigned | NOT NULL | '0' | No | No | Dato de current stock; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NULL permitido | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_products_users_providers`

Filas incluidas en los INSERT del respaldo: **15**.

PK: `user_ID, product_ID`
Índices: fk_products2(product_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| user_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_user1: tb_products_users_providers.user_ID → tb_users.ID | Identificador relacionado con user. |
| product_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_products2: tb_products_users_providers.product_ID → tb_products.ID | Identificador relacionado con product. |
| type_ownership | enum('Owner','Reseller','Distributor') | NULL permitido | NULL | No | No | Dato de type ownership; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| available_date | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de available date; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_refunds`

Filas incluidas en los INSERT del respaldo: **2**.

PK: `ID`
Índices: fk_refunds_payment(payment_ID); fk_refunds_cancellation(cancellation_ID); fk_refunds_return(return_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| payment_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_refunds_payment: tb_refunds.payment_ID → tb_payments.ID | Identificador relacionado con payment. |
| cancellation_ID | int unsigned | NULL permitido | NULL | No | fk_refunds_cancellation: tb_refunds.cancellation_ID → tb_order_cancellations.ID | Identificador relacionado con cancellation. |
| return_ID | int unsigned | NULL permitido | NULL | No | fk_refunds_return: tb_refunds.return_ID → tb_returns.ID | Identificador relacionado con return. |
| refund_amount | decimal(10,2) | NOT NULL | '0.00' | No | No | Dato de refund amount; el respaldo no incluye una descripción funcional adicional. |
| refund_reason | text | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de refund reason; el respaldo no incluye una descripción funcional adicional. |
| refund_status | enum('Pending','Processing','Completed','Failed') | NOT NULL | 'Pending' | No | No | Dato de refund status; el respaldo no incluye una descripción funcional adicional. |
| gateway_refund_id | varchar(255) | NULL permitido | NULL | No | No | Identificador relacionado con gateway refund id. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_returns`

Filas incluidas en los INSERT del respaldo: **1**.

PK: `ID`
Índices: fk_returns_payment(payment_ID); fk_returns_product(product_ID); fk_returns_user(user_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| payment_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_returns_payment: tb_returns.payment_ID → tb_payments.ID | Identificador relacionado con payment. |
| product_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_returns_product: tb_returns.product_ID → tb_products.ID | Identificador relacionado con product. |
| user_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_returns_user: tb_returns.user_ID → tb_users.ID | Identificador relacionado con user. |
| quantity | int unsigned | NOT NULL | '1' | No | No | Dato de quantity; el respaldo no incluye una descripción funcional adicional. |
| return_reason | text | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de return reason; el respaldo no incluye una descripción funcional adicional. |
| return_status | enum('Requested','Received','Inspected','Accepted','Rejected') | NOT NULL | 'Requested' | No | No | Dato de return status; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_shipments`

Filas incluidas en los INSERT del respaldo: **4**.

PK: `ID`
Índices: fk_shipments_payment(payment_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| payment_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_shipments_payment: tb_shipments.payment_ID → tb_payments.ID | Identificador relacionado con payment. |
| shipping_company | varchar(100) | NOT NULL | 'E-commerce Logistics' | No | No | Dato de shipping company; el respaldo no incluye una descripción funcional adicional. |
| tracking_number | varchar(100) | NULL permitido | NULL | No | No | Dato de tracking number; el respaldo no incluye una descripción funcional adicional. |
| shipping_cost | decimal(10,2) | NOT NULL | '0.00' | No | No | Dato de shipping cost; el respaldo no incluye una descripción funcional adicional. |
| shipping_status | enum('Pending','Preparing','Shipped','In_Transit','Delivered','Failed') | NOT NULL | 'Pending' | No | No | Dato de shipping status; el respaldo no incluye una descripción funcional adicional. |
| shipped_date | datetime | NULL permitido | NULL | No | No | Dato de shipped date; el respaldo no incluye una descripción funcional adicional. |
| estimated_delivery_date | datetime | NULL permitido | NULL | No | No | Dato de estimated delivery date; el respaldo no incluye una descripción funcional adicional. |
| actual_delivery_date | datetime | NULL permitido | NULL | No | No | Dato de actual delivery date; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_user_addresses`

Filas incluidas en los INSERT del respaldo: **4**.

PK: `ID`
Índices: idx_user_addresses(user_ID)
CHECK: chk_coordinates: `(((`latitude` is null) and (`longitude` is null)) or ((`latitude` is not null) and (`longitude` is not null)))`; chk_latitude: `(`latitude` between -(90) and 90)`; chk_longitude: `(`longitude` between -(180) and 180)`

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | bigint unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| user_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_addresses_users: tb_user_addresses.user_ID → tb_users.ID | Identificador relacionado con user. |
| address_label | varchar(100) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de address label; el respaldo no incluye una descripción funcional adicional. |
| recipient_name | varchar(150) | NULL permitido | NULL | No | No | Dato de recipient name; el respaldo no incluye una descripción funcional adicional. |
| recipient_phone | varchar(25) | NULL permitido | NULL | No | No | Dato de recipient phone; el respaldo no incluye una descripción funcional adicional. |
| delivery_instructions | varchar(500) | NULL permitido | NULL | No | No | Dato de delivery instructions; el respaldo no incluye una descripción funcional adicional. |
| latitude | decimal(10,7) | NULL permitido | NULL | No | No | Dato de latitude; el respaldo no incluye una descripción funcional adicional. |
| longitude | decimal(10,7) | NULL permitido | NULL | No | No | Dato de longitude; el respaldo no incluye una descripción funcional adicional. |
| is_default | tinyint(1) | NOT NULL | '0' | No | No | Dato de is default; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NULL permitido | NULL | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tb_users`

Filas incluidas en los INSERT del respaldo: **20012**.

PK: `ID`
Índices: email(email) UNIQUE; nick(nick) UNIQUE

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| email | varchar(100) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de email; el respaldo no incluye una descripción funcional adicional. |
| nick | varchar(50) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de nick; el respaldo no incluye una descripción funcional adicional. |
| password | varchar(255) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de password; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NULL permitido | NULL | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |
| last_login | datetime | NULL permitido | NULL | No | No | Dato de last login; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NULL permitido | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |

### `tbc_categories`

Filas incluidas en los INSERT del respaldo: **100**.

PK: `ID`
Índices: name(name) UNIQUE; fk_superior_category(sup_id_category)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| name | varchar(120) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de name; el respaldo no incluye una descripción funcional adicional. |
| description | text | NULL permitido | NULL | No | No | Dato de description; el respaldo no incluye una descripción funcional adicional. |
| sup_id_category | int unsigned | NULL permitido | NULL | No | fk_superior_category: tbc_categories.sup_id_category → tbc_categories.ID | Dato de sup id category; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tbc_payment_methods_types`

Filas incluidas en los INSERT del respaldo: **6**.

PK: `ID`
Índices: code_UNIQUE(code) UNIQUE

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| code | varchar(30) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de code; el respaldo no incluye una descripción funcional adicional. |
| description | text | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de description; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NULL permitido | NULL | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tbd_address_components`

Filas incluidas en los INSERT del respaldo: **23**.

PK: `ID`
Índices: uk_address_component(address_ID, ID) UNIQUE; idx_address_parent(address_ID, address_sup_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | bigint unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| address_ID | bigint unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_component_address: tbd_address_components.address_ID → tb_user_addresses.ID; fk_component_parent: tbd_address_components.address_ID,address_sup_ID → tbd_address_components.address_ID,ID | Identificador relacionado con address. |
| value | varchar(255) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de value; el respaldo no incluye una descripción funcional adicional. |
| component_type | varchar(50) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de component type; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| address_sup_ID | bigint unsigned | NULL permitido | NULL | No | fk_component_parent: tbd_address_components.address_ID,address_sup_ID → tbd_address_components.address_ID,ID | Identificador relacionado con address sup. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NULL permitido | NULL | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tbd_cancellation_items`

Filas incluidas en los INSERT del respaldo: **1**.

PK: `cancellation_ID, product_ID`
Índices: fk_cancellation_items_product(product_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| cancellation_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_cancellation_items_cancellation: tbd_cancellation_items.cancellation_ID → tb_order_cancellations.ID | Identificador relacionado con cancellation. |
| product_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_cancellation_items_product: tbd_cancellation_items.product_ID → tb_products.ID | Identificador relacionado con product. |
| quantity | int unsigned | NOT NULL | '1' | No | No | Dato de quantity; el respaldo no incluye una descripción funcional adicional. |
| cancellation_reason | text | NULL permitido | NULL | No | No | Dato de cancellation reason; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tbd_carts_items`

Filas incluidas en los INSERT del respaldo: **22**.

PK: `cart_ID, provider_ID, product_ID`
Índices: provider_ID(provider_ID); product_ID(product_ID)
CHECK: chk_cart_quantity: `(`quantity` > 0)`

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| cart_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | tbd_carts_items_ibfk_1: tbd_carts_items.cart_ID → tb_carts.ID | Identificador relacionado con cart. |
| provider_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | tbd_carts_items_ibfk_2: tbd_carts_items.provider_ID → tb_products_users_providers.user_ID | Identificador relacionado con provider. |
| product_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | tbd_carts_items_ibfk_3: tbd_carts_items.product_ID → tb_products_users_providers.product_ID | Identificador relacionado con product. |
| quantity | int unsigned | NOT NULL | '1' | No | No | Dato de quantity; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |

### `tbd_order_items`

Filas incluidas en los INSERT del respaldo: **0**.

PK: `ID`
Índices: seller_order_ID(seller_order_ID); product_ID(product_ID); provider_ID(provider_ID)
CHECK: tbd_order_items_chk_1: `(`quantity` > 0)`; tbd_order_items_chk_2: `(`unit_price` >= 0)`

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| seller_order_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | tbd_order_items_ibfk_1: tbd_order_items.seller_order_ID → tb_buyer_orders.ID | Identificador relacionado con seller order. |
| product_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | tbd_order_items_ibfk_2: tbd_order_items.product_ID → tb_products_users_providers.product_ID | Identificador relacionado con product. |
| provider_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | tbd_order_items_ibfk_3: tbd_order_items.provider_ID → tb_products_users_providers.user_ID | Identificador relacionado con provider. |
| product_name | varchar(255) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de product name; el respaldo no incluye una descripción funcional adicional. |
| quantity | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de quantity; el respaldo no incluye una descripción funcional adicional. |
| unit_price | decimal(12,2) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de unit price; el respaldo no incluye una descripción funcional adicional. |
| subtotal | decimal(12,2) | NULL permitido | NULL | No | No | Dato de subtotal; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |

### `tbd_product_categories`

Filas incluidas en los INSERT del respaldo: **13904**.

PK: `product_Id, category_Id`
Índices: fk_pc_category(category_Id)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| product_Id | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_pc_product: tbd_product_categories.product_Id → tb_products.ID | Identificador relacionado con product Id. |
| category_Id | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_pc_category: tbd_product_categories.category_Id → tbc_categories.ID | Identificador relacionado con category Id. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tbd_return_items`

Filas incluidas en los INSERT del respaldo: **1**.

PK: `return_ID, product_ID`
Índices: fk_return_items_product(product_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| return_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_return_items_return: tbd_return_items.return_ID → tb_returns.ID | Identificador relacionado con return. |
| product_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_return_items_product: tbd_return_items.product_ID → tb_products.ID | Identificador relacionado con product. |
| quantity | int unsigned | NOT NULL | '1' | No | No | Dato de quantity; el respaldo no incluye una descripción funcional adicional. |
| item_condition | enum('New','Opened','Defective','Damaged') | NOT NULL | 'Opened' | No | No | Dato de item condition; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tbd_user_payment_methods`

Filas incluidas en los INSERT del respaldo: **4**.

PK: `ID`
Índices: uk_provider_method(provider, provider_method_ref) UNIQUE; user_ID(user_ID); payment_method_type_ID(payment_method_type_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| ID | bigint unsigned | NOT NULL | Sin valor predeterminado explícito | Sí | No | Dato de ID; el respaldo no incluye una descripción funcional adicional. Se incrementa automáticamente. |
| user_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | tbd_user_payment_methods_ibfk_1: tbd_user_payment_methods.user_ID → tb_users.ID | Identificador relacionado con user. |
| payment_method_type_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | tbd_user_payment_methods_ibfk_2: tbd_user_payment_methods.payment_method_type_ID → tbc_payment_methods_types.ID | Identificador relacionado con payment method type. |
| provider | varchar(60) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de provider; el respaldo no incluye una descripción funcional adicional. |
| provider_method_ref | varchar(255) | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de provider method ref; el respaldo no incluye una descripción funcional adicional. |
| label | varchar(100) | NULL permitido | NULL | No | No | Dato de label; el respaldo no incluye una descripción funcional adicional. |
| last_four | char(4) | NULL permitido | NULL | No | No | Dato de last four; el respaldo no incluye una descripción funcional adicional. |
| is_default | tinyint(1) | NOT NULL | '0' | No | No | Dato de is default; el respaldo no incluye una descripción funcional adicional. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NULL permitido | NULL | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

### `tbd_users_wishlist_products`

Filas incluidas en los INSERT del respaldo: **0**.

PK: `user_ID, product_ID`
Índices: fk_products3(product_ID)

| Columna | Tipo | Nulabilidad | Default | Auto_increment | FK / acciones | Descripción |
|---|---|---|---|---|---|---|
| user_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_user2: tbd_users_wishlist_products.user_ID → tb_users.ID | Identificador relacionado con user. |
| product_ID | int unsigned | NOT NULL | Sin valor predeterminado explícito | No | fk_products3: tbd_users_wishlist_products.product_ID → tb_products.ID | Identificador relacionado con product. |
| status | bit(1) | NOT NULL | b'1' | No | No | Dato de status; el respaldo no incluye una descripción funcional adicional. |
| creation_date | datetime | NOT NULL | CURRENT_TIMESTAMP | No | No | Dato de creation date; el respaldo no incluye una descripción funcional adicional. |
| last_update | datetime | NOT NULL | Sin valor predeterminado explícito | No | No | Dato de last update; el respaldo no incluye una descripción funcional adicional. |

## Vistas

| Vista | Propósito | Tablas fuente |
|---|---|---|
| `vw_practica04_caso_1` | Vista de práctica caso 1: compra exitosa. | `tb_logs` |
| `vw_practica04_caso_2` | Vista de práctica caso 2: pago, reclamación y reenvío. | `tb_logs` |
| `vw_practica04_caso_3` | Vista de práctica caso 3: cancelación parcial y reembolso. | `tb_logs` |
| `vw_practica04_caso_4` | Vista de práctica caso 4: compra y entrega por proveedor. | `tb_logs` |
| `vw_practica04_caso_5` | Vista de práctica caso 5: compra fallida por inventario. | `tb_logs` |
| `vw_total_products_by_category` | Vista guardada definida en el respaldo. | `tbc_categories`, `tbd_product_categories`, `tb_products` |
| `vw_trazabilidad_address_components` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_buyer_orders` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_cancellation_items` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_cancellations` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_cart_items` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_carts` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_categorias_productos` | Vista guardada definida en el respaldo. | `tbc_categories`, `tbd_product_categories`, `tb_products` |
| `vw_trazabilidad_categories` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_order_cancellations` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_order_items` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_orders` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_payment_method_types` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_payment_transaction` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_payments` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_people` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_productos` | Vista guardada definida en el respaldo. | `tb_products`, `tb_logs` |
| `vw_trazabilidad_products_users_providers` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_refunds` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_return_items` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_returns` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_shipments` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_user_addresses` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_user_payment_methods` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_users_wishlist_products` | Vista guardada definida en el respaldo. | `tb_logs` |
| `vw_trazabilidad_usuarios` | Vista guardada definida en el respaldo. | `tb_users`, `tb_logs` |

### Definiciones SQL de las vistas

#### `vw_practica04_caso_1`

```sql
CREATE VIEW `vw_practica04_caso_1` AS
select 'Caso 1 - Compra exitosa' AS `caso`,(case when (`tb_logs`.`table_name` = 'tb_carts') then 'Fase 1 - Registro del carrito' when (`tb_logs`.`table_name` = 'tbd_carts_items') then 'Fase 2 - Productos del carrito' when (`tb_logs`.`table_name` = 'tb_buyer_orders') then 'Fase 3 - Registro de la compra' when (`tb_logs`.`table_name` = 'tbd_order_items') then 'Fase 4 - Productos de la compra' end) AS `fase`,(case when (`tb_logs`.`table_name` in ('tb_carts','tbd_carts_items')) then 'Carrito' else 'Compra' end) AS `registro`,substring_index(`tb_logs`.`db_user`,'@',1) AS `usuario_ejecutor`,`tb_logs`.`db_user` AS `conexion_db`,`tb_logs`.`operation_date` AS `fecha_evento`,`tb_logs`.`table_name` AS `tabla_modificada`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`operation_description` AS `detalle_evento`,(case when (`tb_logs`.`operation_status` = 0x01) then 'Evento registrado' else 'Evento no registrado' end) AS `resultado` from `tb_logs` where (`tb_logs`.`table_name` in ('tb_carts','tbd_carts_items','tb_buyer_orders','tbd_order_items'));
```

#### `vw_practica04_caso_2`

```sql
CREATE VIEW `vw_practica04_caso_2` AS
select 'Caso 2' AS `caso`,'Compra con detalles en el �ltimo pago, reclamaci�n y reenv�o' AS `nombre_caso`,(case when (`tb_logs`.`table_name` in ('tb_orders','tb_buyer_orders','tb_order_details')) then 'Compra' when (`tb_logs`.`table_name` in ('tb_payments','tb_payment_transaction')) then 'Procesamiento de pagos' when (`tb_logs`.`table_name` = 'tb_shipments') then 'Env�o y reenv�o' when (`tb_logs`.`table_name` in ('tb_returns','tbd_return_items')) then 'Reclamaci�n y devoluci�n' when (`tb_logs`.`table_name` = 'tb_carts') then 'Cierre del carrito' else 'Otra fase' end) AS `fase`,`tb_logs`.`ID` AS `registro`,`tb_logs`.`db_user` AS `usuario_ejecutor`,database() AS `conexion_db`,`tb_logs`.`operation_date` AS `fecha_evento`,`tb_logs`.`table_name` AS `tabla_modificada`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`operation_description` AS `detalle_evento`,(case when (`tb_logs`.`operation_status` = 0x01) then 'Correcto' else 'Error' end) AS `resultado` from `tb_logs` where (`tb_logs`.`ID` between 53305 and 53326);
```

#### `vw_practica04_caso_3`

```sql
CREATE VIEW `vw_practica04_caso_3` AS
select 'Caso 3' AS `caso`,'Compra exitosa con cancelacion parcial, ajuste y reembolso parcial' AS `nombre_caso`,(case when (`tb_logs`.`table_name` in ('tb_payments','tb_payment_transaction')) then 'Pago y transaccion' when (`tb_logs`.`table_name` in ('tb_orders','tb_buyer_orders')) then 'Gestion de orden' when (`tb_logs`.`table_name` in ('tb_order_cancellations','tbd_cancellation_items')) then 'Cancelacion' when (`tb_logs`.`table_name` = 'tb_refunds') then 'Reembolso' when (`tb_logs`.`table_name` = 'tb_shipments') then 'Envio y entrega' else 'Otro evento' end) AS `fase`,`tb_logs`.`ID` AS `registro`,'Azazel00 (ID 2)' AS `usuario_ejecutor`,`tb_logs`.`db_user` AS `conexion_db`,`tb_logs`.`operation_date` AS `fecha_evento`,`tb_logs`.`table_name` AS `tabla_modificada`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`operation_description` AS `detalle_evento`,(case when (`tb_logs`.`operation_status` = 0x01) then 'Exitoso' else 'Fallido' end) AS `resultado` from `tb_logs` where ((`tb_logs`.`ID` between 53346 and 53359) and (`tb_logs`.`db_user` = 'Rodolfo.Hernandez@localhost'));
```

#### `vw_practica04_caso_4`

```sql
CREATE VIEW `vw_practica04_caso_4` AS
select 'Caso 4' AS `caso`,'Compra exitosa del mismo proveedor con entrega en el punto de recoleccion' AS `nombre_caso`,(case when (`tb_logs`.`table_name` in ('tb_orders','tb_buyer_orders','tbd_order_items')) then 'Gestion de orden' when (`tb_logs`.`table_name` in ('tb_user_addresses','tbd_address_components')) then 'Registro de domicilio' when (`tb_logs`.`table_name` = 'tbd_user_payment_methods') then 'Registro de metodo de pago' when (`tb_logs`.`table_name` in ('tb_payments','tb_payment_transaction')) then 'Pago y transaccion' when (`tb_logs`.`table_name` = 'tb_shipments') then 'Envio y entrega' else 'Otro evento' end) AS `fase`,`tb_logs`.`ID` AS `registro`,'DiegoG (ID 4)' AS `usuario_ejecutor`,`tb_logs`.`db_user` AS `conexion_db`,`tb_logs`.`operation_date` AS `fecha_evento`,`tb_logs`.`table_name` AS `tabla_modificada`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`operation_description` AS `detalle_evento`,(case when (`tb_logs`.`operation_status` = 0x01) then 'Exitoso' else 'Fallido' end) AS `resultado` from `tb_logs` where ((`tb_logs`.`ID` between 53368 and 53390) and (`tb_logs`.`db_user` = 'Rodolfo.Hernandez@localhost'));
```

#### `vw_practica04_caso_5`

```sql
CREATE VIEW `vw_practica04_caso_5` AS
select 5 AS `caso`,'Compra fallida por falta de inventario' AS `nombre_caso`,(case when ((`tb_logs`.`table_name` = 'tb_buyer_orders') and (`tb_logs`.`table_operation` = 'Create')) then 'Creacion de orden del proveedor' when (`tb_logs`.`table_name` = 'tbd_order_items') then 'Registro de productos solicitados' when (`tb_logs`.`table_name` in ('tb_user_addresses','tbd_address_components')) then 'Registro del domicilio de entrega' when (`tb_logs`.`table_name` = 'tbd_user_payment_methods') then 'Registro del cupon de regalo' when (`tb_logs`.`table_name` in ('tb_payments','tb_payment_transaction')) then 'Intento de pago fallido' when (`tb_logs`.`table_name` = 'tb_order_cancellations') then 'Cancelacion por inventario insuficiente' when (`tb_logs`.`table_name` = 'tb_refunds') then 'Reasignacion simulada del cupon' when ((`tb_logs`.`table_name` = 'tb_buyer_orders') and (`tb_logs`.`table_operation` = 'Update')) then 'Cancelacion de orden del proveedor' when (`tb_logs`.`table_name` = 'tb_orders') then 'Cancelacion de orden general' when (`tb_logs`.`table_name` = 'tb_products') then 'Restauracion del inventario' else 'Otra operacion' end) AS `fase`,`tb_logs`.`ID` AS `registro`,`tb_logs`.`db_user` AS `usuario_ejecutor`,'Rodolfo.Hernandez@localhost' AS `conexion_db`,`tb_logs`.`operation_date` AS `fecha_evento`,`tb_logs`.`table_name` AS `tabla_modificada`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`operation_description` AS `detalle_evento`,`tb_logs`.`operation_status` AS `resultado` from `tb_logs` where ((`tb_logs`.`ID` between 53397 and 53413) and (`tb_logs`.`db_user` = 'Rodolfo.Hernandez@localhost'));
```

#### `vw_total_products_by_category`

```sql
CREATE VIEW `vw_total_products_by_category` AS
with recursive `category_tree` as (select `c`.`ID` AS `ID`,`c`.`name` AS `name`,`c`.`sup_id_category` AS `sup_id_category`,`c`.`status` AS `status`,cast(`c`.`name` as char(1000) charset utf8mb4) AS `category_path`,1 AS `category_level` from `tbc_categories` `c` where (`c`.`sup_id_category` is null) union all select `c`.`ID` AS `ID`,`c`.`name` AS `name`,`c`.`sup_id_category` AS `sup_id_category`,`c`.`status` AS `status`,concat(`ct`.`category_path`,' → ',`c`.`name`) AS `category_path`,(`ct`.`category_level` + 1) AS `category_level` from (`tbc_categories` `c` join `category_tree` `ct` on((`c`.`sup_id_category` = `ct`.`ID`)))), `category_totals` as (select `ct`.`ID` AS `category_ID`,`ct`.`category_path` AS `category_path`,`ct`.`category_level` AS `category_level`,count(distinct `pc`.`product_Id`) AS `total_products`,count(distinct (case when (`p`.`status` = 0x01) then `p`.`ID` end)) AS `total_active_products`,count(distinct (case when (`p`.`status` = 0x00) then `p`.`ID` end)) AS `total_inactive_products` from ((`category_tree` `ct` left join `tbd_product_categories` `pc` on(((`pc`.`category_Id` = `ct`.`ID`) and (`pc`.`status` = 0x01)))) left join `tb_products` `p` on((`p`.`ID` = `pc`.`product_Id`))) group by `ct`.`ID`,`ct`.`category_path`,`ct`.`category_level`), `uncategorized` as (select count(0) AS `total_uncategorized_products`,sum((case when (`p`.`status` = 0x01) then 1 else 0 end)) AS `total_active_products`,sum((case when (`p`.`status` = 0x00) then 1 else 0 end)) AS `total_inactive_products` from `tb_products` `p` where exists(select 1 from `tbd_product_categories` `pc` where ((`pc`.`product_Id` = `p`.`ID`) and (`pc`.`status` = 0x01))) is false) select `category_totals`.`category_ID` AS `category_ID`,`category_totals`.`category_path` AS `category_path`,`category_totals`.`category_level` AS `category_level`,`category_totals`.`total_products` AS `total_products`,`category_totals`.`total_active_products` AS `total_active_products`,`category_totals`.`total_inactive_products` AS `total_inactive_products`,0 AS `total_uncategorized_products` from `category_totals` union all select NULL AS `category_ID`,'Sin categoría' AS `category_path`,0 AS `category_level`,`uncategorized`.`total_uncategorized_products` AS `total_products`,`uncategorized`.`total_active_products` AS `total_active_products`,`uncategorized`.`total_inactive_products` AS `total_inactive_products`,`uncategorized`.`total_uncategorized_products` AS `total_uncategorized_products` from `uncategorized`;
```

#### `vw_trazabilidad_address_components`

```sql
CREATE VIEW `vw_trazabilidad_address_components` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_address_components');
```

#### `vw_trazabilidad_buyer_orders`

```sql
CREATE VIEW `vw_trazabilidad_buyer_orders` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_buyer_orders');
```

#### `vw_trazabilidad_cancellation_items`

```sql
CREATE VIEW `vw_trazabilidad_cancellation_items` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_cancellation_items');
```

#### `vw_trazabilidad_cancellations`

```sql
CREATE VIEW `vw_trazabilidad_cancellations` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_cancellations');
```

#### `vw_trazabilidad_cart_items`

```sql
CREATE VIEW `vw_trazabilidad_cart_items` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_cart_items');
```

#### `vw_trazabilidad_carts`

```sql
CREATE VIEW `vw_trazabilidad_carts` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_carts');
```

#### `vw_trazabilidad_categorias_productos`

```sql
CREATE VIEW `vw_trazabilidad_categorias_productos` AS
with recursive `category_tree` as (select `c`.`ID` AS `ID`,`c`.`name` AS `name`,`c`.`sup_id_category` AS `sup_id_category`,`c`.`status` AS `status`,cast(`c`.`name` as char(1000) charset utf8mb4) AS `category_path`,1 AS `category_level` from `tbc_categories` `c` where (`c`.`sup_id_category` is null) union all select `c`.`ID` AS `ID`,`c`.`name` AS `name`,`c`.`sup_id_category` AS `sup_id_category`,`c`.`status` AS `status`,concat(`ct`.`category_path`,' → ',`c`.`name`) AS `category_path`,(`ct`.`category_level` + 1) AS `category_level` from (`tbc_categories` `c` join `category_tree` `ct` on((`c`.`sup_id_category` = `ct`.`ID`)))) select `ct`.`ID` AS `category_id`,`ct`.`name` AS `category_name`,`ct`.`category_path` AS `category_path`,`ct`.`category_level` AS `category_level`,(case when (`ct`.`status` = 0x01) then 'Activa' when (`ct`.`status` = 0x00) then 'Inactiva' else 'Desconocido' end) AS `category_status`,`p`.`ID` AS `product_id`,`p`.`SKU` AS `product_sku`,`p`.`name` AS `product_name`,`p`.`current_price` AS `product_price`,`p`.`current_stock` AS `product_stock`,(case when (`p`.`status` = 0x01) then 'Activo' when (`p`.`status` = 0x00) then 'Inactivo' else 'Desconocido' end) AS `product_status`,`p`.`creation_date` AS `product_creation_date`,`p`.`last_update` AS `product_last_update`,(case when (`pc`.`status` = 0x01) then 'Vinculado' when (`pc`.`status` = 0x00) then 'Desvinculado' else 'Sin relación' end) AS `relation_status`,`pc`.`creation_date` AS `relation_creation_date`,`pc`.`last_update` AS `relation_last_update`,(case when (`pc`.`product_Id` is null) then 'Producto sin categoría asignada' when ((`ct`.`status` = 0x00) and (`p`.`status` = 0x01)) then 'Producto activo en categoría inactiva' when ((`ct`.`status` = 0x01) and (`p`.`status` = 0x00)) then 'Producto inactivo en categoría activa' when (`pc`.`status` = 0x00) then 'Relación desvinculada (histórica)' else 'OK - Producto y categoría activos' end) AS `trazabilidad_estado` from ((`category_tree` `ct` join `tbd_product_categories` `pc` on((`pc`.`category_Id` = `ct`.`ID`))) join `tb_products` `p` on((`p`.`ID` = `pc`.`product_Id`))) order by `ct`.`category_path`,`p`.`name`;
```

#### `vw_trazabilidad_categories`

```sql
CREATE VIEW `vw_trazabilidad_categories` AS
select `tb_logs`.`ID` AS `log_id`,cast(substring_index(substring_index(`tb_logs`.`operation_description`,'ID=',-(1)),',',1) as unsigned) AS `category_id`,`tb_logs`.`table_operation` AS `operation`,`tb_logs`.`db_user` AS `db_user`,substring_index(`tb_logs`.`db_user`,'@',1) AS `username`,'support' AS `role`,`tb_logs`.`operation_description` AS `description`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `operation_status` from `tb_logs` where (`tb_logs`.`table_name` = 'tbc_categories') order by `tb_logs`.`ID`;
```

#### `vw_trazabilidad_order_cancellations`

```sql
CREATE VIEW `vw_trazabilidad_order_cancellations` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_order_cancellations');
```

#### `vw_trazabilidad_order_items`

```sql
CREATE VIEW `vw_trazabilidad_order_items` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_order_items');
```

#### `vw_trazabilidad_orders`

```sql
CREATE VIEW `vw_trazabilidad_orders` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_orders');
```

#### `vw_trazabilidad_payment_method_types`

```sql
CREATE VIEW `vw_trazabilidad_payment_method_types` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbc_payment_method_types');
```

#### `vw_trazabilidad_payment_transaction`

```sql
CREATE VIEW `vw_trazabilidad_payment_transaction` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_payment_transaction');
```

#### `vw_trazabilidad_payments`

```sql
CREATE VIEW `vw_trazabilidad_payments` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_payments');
```

#### `vw_trazabilidad_people`

```sql
CREATE VIEW `vw_trazabilidad_people` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_people');
```

#### `vw_trazabilidad_productos`

```sql
CREATE VIEW `vw_trazabilidad_productos` AS
select `p`.`ID` AS `id`,`p`.`name` AS `name`,`p`.`description` AS `description`,`b`.`db_user` AS `inserted_by`,coalesce(group_concat(distinct `re`.`FROM_USER` order by `re`.`FROM_USER` ASC separator ', '),'Sin rol') AS `roles`,`b`.`operation_description` AS `operation_description`,`b`.`operation_date` AS `operation_date` from ((`tb_products` `p` join `tb_logs` `b` on((`b`.`operation_description` like concat('%ID=',`p`.`ID`,',%')))) left join `mysql`.`role_edges` `re` on((`re`.`TO_USER` = substring_index(`b`.`db_user`,'@',1)))) where ((`b`.`table_operation` = 'Create') and (`b`.`table_name` = 'tb_products')) group by `p`.`ID`,`p`.`name`,`p`.`description`,`b`.`db_user`,`b`.`operation_description`,`b`.`operation_date`;
```

#### `vw_trazabilidad_products_users_providers`

```sql
CREATE VIEW `vw_trazabilidad_products_users_providers` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_products_users_providers');
```

#### `vw_trazabilidad_refunds`

```sql
CREATE VIEW `vw_trazabilidad_refunds` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_refunds');
```

#### `vw_trazabilidad_return_items`

```sql
CREATE VIEW `vw_trazabilidad_return_items` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_return_items');
```

#### `vw_trazabilidad_returns`

```sql
CREATE VIEW `vw_trazabilidad_returns` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_returns');
```

#### `vw_trazabilidad_shipments`

```sql
CREATE VIEW `vw_trazabilidad_shipments` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_shipments');
```

#### `vw_trazabilidad_user_addresses`

```sql
CREATE VIEW `vw_trazabilidad_user_addresses` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_user_addresses');
```

#### `vw_trazabilidad_user_payment_methods`

```sql
CREATE VIEW `vw_trazabilidad_user_payment_methods` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_user_payment_methods');
```

#### `vw_trazabilidad_users_wishlist_products`

```sql
CREATE VIEW `vw_trazabilidad_users_wishlist_products` AS
select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_users_wishlist_products');
```

#### `vw_trazabilidad_usuarios`

```sql
CREATE VIEW `vw_trazabilidad_usuarios` AS
select `u`.`nick` AS `nick`,`u`.`email` AS `email`,`b`.`db_user` AS `inserted_by`,group_concat(distinct `re`.`FROM_USER` order by `re`.`FROM_USER` ASC separator ', ') AS `roles`,`b`.`operation_description` AS `operation_description`,`b`.`operation_date` AS `operation_date` from ((`tb_users` `u` join `tb_logs` `b` on(((`b`.`operation_description` like concat('%',`u`.`nick`,'%')) and (`b`.`operation_description` like concat('%',`u`.`email`,'%'))))) left join `mysql`.`role_edges` `re` on((`re`.`TO_USER` = substring_index(`b`.`db_user`,'@',1)))) where ((`b`.`table_operation` = 'Create') and (`b`.`table_name` = 'tb_users')) group by `u`.`nick`,`u`.`email`,`b`.`db_user`,`b`.`operation_description`,`b`.`operation_date` order by `b`.`operation_date`;
```

## Triggers

| Trigger | Evento | Tabla usada | Propósito |
|---|---|---|---|
| `trg_buyer_orders_after_insert` | AFTER INSERT | `tb_buyer_orders` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_buyer_orders_after_update` | AFTER UPDATE | `tb_buyer_orders` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_buyer_orders_after_delete` | AFTER DELETE | `tb_buyer_orders` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_carts_after_insert` | AFTER INSERT | `tb_carts` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_carts_after_update` | AFTER UPDATE | `tb_carts` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_carts_after_delete` | AFTER DELETE | `tb_carts` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_ord_canc_after_insert` | AFTER INSERT | `tb_order_cancellations` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_ord_canc_after_update` | AFTER UPDATE | `tb_order_cancellations` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_ord_canc_after_delete` | AFTER DELETE | `tb_order_cancellations` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_orders_after_insert` | AFTER INSERT | `tb_orders` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_orders_after_update` | AFTER UPDATE | `tb_orders` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_orders_after_delete` | AFTER DELETE | `tb_orders` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_pay_trans_after_insert` | AFTER INSERT | `tb_payment_transaction` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_pay_trans_after_update` | AFTER UPDATE | `tb_payment_transaction` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_pay_trans_after_delete` | AFTER DELETE | `tb_payment_transaction` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_payments_after_insert` | AFTER INSERT | `tb_payments` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_payments_after_update` | AFTER UPDATE | `tb_payments` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_payments_after_delete` | AFTER DELETE | `tb_payments` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_people_after_insert` | AFTER INSERT | `tb_people` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_people_after_update` | AFTER UPDATE | `tb_people` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_people_after_delete` | AFTER DELETE | `tb_people` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_products_after_insert` | AFTER INSERT | `tb_products` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_products_after_update` | AFTER UPDATE | `tb_products` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_products_after_delete` | AFTER DELETE | `tb_products` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_products_users_providers_after_insert` | AFTER INSERT | `tb_products_users_providers` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_products_users_providers_after_update` | AFTER UPDATE | `tb_products_users_providers` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_products_users_providers_after_delete` | AFTER DELETE | `tb_products_users_providers` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_refunds_after_insert` | AFTER INSERT | `tb_refunds` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_refunds_after_update` | AFTER UPDATE | `tb_refunds` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_refunds_after_delete` | AFTER DELETE | `tb_refunds` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_returns_after_insert` | AFTER INSERT | `tb_returns` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_returns_after_update` | AFTER UPDATE | `tb_returns` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_returns_after_delete` | AFTER DELETE | `tb_returns` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_shipments_after_insert` | AFTER INSERT | `tb_shipments` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_shipments_after_update` | AFTER UPDATE | `tb_shipments` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tb_shipments_after_delete` | AFTER DELETE | `tb_shipments` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_user_addresses_after_insert` | AFTER INSERT | `tb_user_addresses` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_user_addresses_after_update` | AFTER UPDATE | `tb_user_addresses` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_user_addresses_after_delete` | AFTER DELETE | `tb_user_addresses` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_users_after_insert` | AFTER INSERT | `tb_users` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_users_after_update` | AFTER UPDATE | `tb_users` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_users_after_delete` | AFTER DELETE | `tb_users` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_categories_after_insert` | AFTER INSERT | `tbc_categories` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_categories_after_update` | AFTER UPDATE | `tbc_categories` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_categories_after_delete` | AFTER DELETE | `tbc_categories` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tbc_pmt_after_insert` | AFTER INSERT | `tbc_payment_methods_types` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tbc_pmt_after_update` | AFTER UPDATE | `tbc_payment_methods_types` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tbc_pmt_after_delete` | AFTER DELETE | `tbc_payment_methods_types` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_address_components_after_insert` | AFTER INSERT | `tbd_address_components` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_address_components_after_update` | AFTER UPDATE | `tbd_address_components` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_address_components_after_delete` | AFTER DELETE | `tbd_address_components` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tbd_canc_items_after_insert` | AFTER INSERT | `tbd_cancellation_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tbd_canc_items_after_update` | AFTER UPDATE | `tbd_cancellation_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tbd_canc_items_after_delete` | AFTER DELETE | `tbd_cancellation_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_carts_items_after_insert` | AFTER INSERT | `tbd_carts_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_carts_items_after_update` | AFTER UPDATE | `tbd_carts_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_carts_items_after_delete` | AFTER DELETE | `tbd_carts_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_order_items_after_insert` | AFTER INSERT | `tbd_order_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_order_items_after_update` | AFTER UPDATE | `tbd_order_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_order_items_after_delete` | AFTER DELETE | `tbd_order_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_product_categories_after_insert` | AFTER INSERT | `tbd_product_categories` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_product_categories_after_update` | AFTER UPDATE | `tbd_product_categories` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_product_categories_after_delete` | AFTER DELETE | `tbd_product_categories` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tbd_ret_items_after_insert` | AFTER INSERT | `tbd_return_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tbd_ret_items_after_update` | AFTER UPDATE | `tbd_return_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_tbd_ret_items_after_delete` | AFTER DELETE | `tbd_return_items` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_user_payment_methods_after_insert` | AFTER INSERT | `tbd_user_payment_methods` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_user_payment_methods_after_update` | AFTER UPDATE | `tbd_user_payment_methods` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_user_payment_methods_after_delete` | AFTER DELETE | `tbd_user_payment_methods` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_wishlist_after_insert` | AFTER INSERT | `tbd_users_wishlist_products` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_wishlist_after_update` | AFTER UPDATE | `tbd_users_wishlist_products` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |
| `trg_wishlist_after_delete` | AFTER DELETE | `tbd_users_wishlist_products` → `tb_logs` | Registra automáticamente la operación de fila en la bitácora. |

## Rutinas

El respaldo no contiene procedimientos almacenados ni funciones.
