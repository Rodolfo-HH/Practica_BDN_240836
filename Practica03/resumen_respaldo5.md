# Inventario estructural de Respaldo-06.sql

## 1. Base de datos
- Motor y version del servidor: MySQL 8.0.44 (mysqldump 10.13, Distrib 8.0.44, Win64), segun la cabecera del volcado.
- Base de datos: `db_test_7b`.
- Codificacion de conexion declarada: `SET NAMES utf8`. Las tablas definen su juego de caracteres y collation individualmente, listados en la seccion de tablas y en las definiciones.

## 2. Tablas
| Tabla | Columnas | Motor | Juego de caracteres / collation | Filas aproximadas |
|---|---:|---|---|---|
| `tb_buyer_orders` | 8 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_carts` | 5 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_logs` | 7 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_order_cancellations` | 8 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_orders` | 8 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_payment_transaction` | 11 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_payments` | 9 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_people` | 12 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_products` | 9 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_products_users_providers` | 7 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_refunds` | 11 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_returns` | 10 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_shipments` | 12 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_user_addresses` | 12 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tb_users` | 8 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tbc_categories` | 7 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tbc_payment_methods_types` | 6 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tbd_address_components` | 8 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tbd_cancellation_items` | 7 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tbd_carts_items` | 5 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tbd_order_items` | 9 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tbd_product_categories` | 5 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tbd_return_items` | 7 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tbd_user_payment_methods` | 11 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |
| `tbd_users_wishlist_products` | 5 | InnoDB | utf8mb4 / utf8mb4_0900_ai_ci | No deducible del esquema |

## 3. Llaves primarias
| Tabla | Columna(s) | Tipo | AUTO_INCREMENT |
|---|---|---|---|
| `tb_buyer_orders` | `ID` | Simple | Si: ID |
| `tb_carts` | `ID` | Simple | Si: ID |
| `tb_logs` | `ID` | Simple | Si: ID |
| `tb_order_cancellations` | `ID` | Simple | Si: ID |
| `tb_orders` | `ID` | Simple | Si: ID |
| `tb_payment_transaction` | `ID` | Simple | Si: ID |
| `tb_payments` | `ID` | Simple | Si: ID |
| `tb_people` | `person_ID` | Simple | Si: person_ID |
| `tb_products` | `ID` | Simple | Si: ID |
| `tb_products_users_providers` | `user_ID`, `product_ID` | Compuesta | No |
| `tb_refunds` | `ID` | Simple | Si: ID |
| `tb_returns` | `ID` | Simple | Si: ID |
| `tb_shipments` | `ID` | Simple | Si: ID |
| `tb_user_addresses` | `ID` | Simple | Si: ID |
| `tb_users` | `ID` | Simple | Si: ID |
| `tbc_categories` | `ID` | Simple | Si: ID |
| `tbc_payment_methods_types` | `ID` | Simple | Si: ID |
| `tbd_address_components` | `ID` | Simple | Si: ID |
| `tbd_cancellation_items` | `cancellation_ID`, `product_ID` | Compuesta | No |
| `tbd_carts_items` | `cart_ID`, `provider_ID`, `product_ID` | Compuesta | No |
| `tbd_order_items` | `ID` | Simple | Si: ID |
| `tbd_product_categories` | `product_Id`, `category_Id` | Compuesta | No |
| `tbd_return_items` | `return_ID`, `product_ID` | Compuesta | No |
| `tbd_user_payment_methods` | `ID` | Simple | Si: ID |
| `tbd_users_wishlist_products` | `user_ID`, `product_ID` | Compuesta | No |

## 4-5. Llaves foraneas
- `tb_buyer_orders.seller_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_carts.user_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_order_cancellations.payment_ID` -> `tb_payments.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_order_cancellations.requested_by_user_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_orders.user_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_payment_transaction.payment_ID` -> `tb_payments.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_payments.payment_method_type_ID` -> `tbc_payment_methods_types.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_payments.user_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_payments.user_payment_method_ID` -> `tbd_user_payment_methods.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_people.user_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_products_users_providers.product_ID` -> `tb_products.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_products_users_providers.user_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_refunds.cancellation_ID` -> `tb_order_cancellations.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_refunds.payment_ID` -> `tb_payments.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_refunds.return_ID` -> `tb_returns.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_returns.payment_ID` -> `tb_payments.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_returns.product_ID` -> `tb_products.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_returns.user_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_shipments.payment_ID` -> `tb_payments.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tb_user_addresses.user_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- **AUTORREFERENCIAL** `tbc_categories.sup_id_category` -> `tbc_categories.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito). Representa una jerarquia dentro de la tabla.
- `tbd_address_components.address_ID` -> `tb_user_addresses.ID`; ON DELETE RESTRICT; ON UPDATE RESTRICT (implicito).
- **AUTORREFERENCIAL** `tbd_address_components.address_ID` -> `tbd_address_components.address_ID`; `tbd_address_components.address_sup_ID` -> `tbd_address_components.ID`; ON DELETE RESTRICT; ON UPDATE RESTRICT (implicito). Representa una jerarquia dentro de la tabla.
- `tbd_cancellation_items.cancellation_ID` -> `tb_order_cancellations.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_cancellation_items.product_ID` -> `tb_products.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_carts_items.cart_ID` -> `tb_carts.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_carts_items.provider_ID` -> `tb_products_users_providers.user_ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_carts_items.product_ID` -> `tb_products_users_providers.product_ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_order_items.seller_order_ID` -> `tb_buyer_orders.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_order_items.product_ID` -> `tb_products_users_providers.product_ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_order_items.provider_ID` -> `tb_products_users_providers.user_ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_product_categories.category_Id` -> `tbc_categories.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_product_categories.product_Id` -> `tb_products.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_return_items.product_ID` -> `tb_products.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_return_items.return_ID` -> `tb_returns.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_user_payment_methods.user_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_user_payment_methods.payment_method_type_ID` -> `tbc_payment_methods_types.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_users_wishlist_products.product_ID` -> `tb_products.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).
- `tbd_users_wishlist_products.user_ID` -> `tb_users.ID`; ON DELETE RESTRICT (implicito); ON UPDATE RESTRICT (implicito).

## 6. Indices, UNIQUE, CHECK, valores por defecto y columnas generadas
### `tb_buyer_orders`
- `PRIMARY KEY (`ID`)`
- `KEY `seller_ID` (`seller_ID`)`
- `CONSTRAINT `tb_buyer_orders_ibfk_1` FOREIGN KEY (`seller_ID`) REFERENCES `tb_users` (`ID`)`
- `CONSTRAINT `tb_buyer_orders_chk_1` CHECK ((`subtotal` >= 0))`
- `CONSTRAINT `tb_buyer_orders_chk_2` CHECK ((`shipping_cost` >= 0))`
- Columna/valor especial: ``subtotal` decimal(12,2) NOT NULL DEFAULT '0.00'`
- Columna/valor especial: ``shipping_cost` decimal(12,2) NOT NULL DEFAULT '0.00'`
- Columna/valor especial: ``fulfillment_status` enum('Pending','Accepted','Preparing','Sent','Delivered','Canceled','Returned') NOT NULL DEFAULT 'Pending'`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_carts`
- `PRIMARY KEY (`ID`)`
- `UNIQUE KEY `uk_cart_user` (`user_ID`)`
- `CONSTRAINT `tb_carts_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)`
- Columna/valor especial: ``status` bit(1) DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_logs`
- `PRIMARY KEY (`ID`)`
- Columna/valor especial: ``table_operation` enum('Create','READ','Update','Delete') DEFAULT NULL`
- Columna/valor especial: ``operation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``operation_status` bit(1) DEFAULT b'1'`
### `tb_order_cancellations`
- `PRIMARY KEY (`ID`)`
- `KEY `fk_order_cancellations_payment` (`payment_ID`)`
- `KEY `fk_order_cancellations_user` (`requested_by_user_ID`)`
- `CONSTRAINT `fk_order_cancellations_payment` FOREIGN KEY (`payment_ID`) REFERENCES `tb_payments` (`ID`)`
- `CONSTRAINT `fk_order_cancellations_user` FOREIGN KEY (`requested_by_user_ID`) REFERENCES `tb_users` (`ID`)`
- Columna/valor especial: ``cancellation_status` enum('Pending','Approved','Rejected','Completed') NOT NULL DEFAULT 'Pending'`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_orders`
- `PRIMARY KEY (`ID`)`
- `UNIQUE KEY `uk_order_number` (`order_number`)`
- `KEY `fk_orders_user` (`user_ID`)`
- `CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)`
- Columna/valor especial: ``total_amount` decimal(10,2) NOT NULL DEFAULT '0.00'`
- Columna/valor especial: ``order_status` enum('Pending','Processing','Completed','Cancelled','Refunded') NOT NULL DEFAULT 'Pending'`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_payment_transaction`
- `PRIMARY KEY (`ID`)`
- `KEY `fk_payment_transaction` (`payment_ID`)`
- `CONSTRAINT `fk_payment_transaction` FOREIGN KEY (`payment_ID`) REFERENCES `tb_payments` (`ID`)`
- Columna/valor especial: ``transaction_type` enum('Charge','Refund','Authorization','Void') NOT NULL DEFAULT 'Charge'`
- Columna/valor especial: ``amount` decimal(10,2) NOT NULL DEFAULT '0.00'`
- Columna/valor especial: ``currency` varchar(3) NOT NULL DEFAULT 'MXN'`
- Columna/valor especial: ``gateway_transaction_id` varchar(255) DEFAULT NULL`
- Columna/valor especial: ``operation_status` enum('Pending','Completed','Failed','Cancelled') NOT NULL DEFAULT 'Pending'`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_payments`
- `PRIMARY KEY (`ID`)`
- `KEY `fk_payments_user` (`user_ID`)`
- `KEY `fk_payments_method_type` (`payment_method_type_ID`)`
- `KEY `fk_payments_user_method` (`user_payment_method_ID`)`
- `CONSTRAINT `fk_payments_method_type` FOREIGN KEY (`payment_method_type_ID`) REFERENCES `tbc_payment_methods_types` (`ID`)`
- `CONSTRAINT `fk_payments_user` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)`
- `CONSTRAINT `fk_payments_user_method` FOREIGN KEY (`user_payment_method_ID`) REFERENCES `tbd_user_payment_methods` (`ID`)`
- Columna/valor especial: ``user_payment_method_ID` bigint unsigned DEFAULT NULL`
- Columna/valor especial: ``total_amount` decimal(10,2) NOT NULL DEFAULT '0.00'`
- Columna/valor especial: ``currency` varchar(3) NOT NULL DEFAULT 'MXN'`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_people`
- `PRIMARY KEY (`person_ID`)`
- `UNIQUE KEY `user_ID` (`user_ID`)`
- `CONSTRAINT `fk_people_users` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)`
- Columna/valor especial: ``user_ID` int unsigned DEFAULT NULL`
- Columna/valor especial: ``courtesy_title` varchar(20) DEFAULT NULL`
- Columna/valor especial: ``family_names` varchar(150) DEFAULT NULL`
- Columna/valor especial: ``birth_date` date DEFAULT NULL`
- Columna/valor especial: ``gender` enum('Hombre','Mujer','Prefiero no decirlo') NOT NULL DEFAULT 'Prefiero no decirlo'`
- Columna/valor especial: ``country_code` char(2) DEFAULT NULL`
- Columna/valor especial: ``phone` varchar(25) DEFAULT NULL`
- Columna/valor especial: ``status` bit(1) DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_products`
- `PRIMARY KEY (`ID`)`
- `UNIQUE KEY `SKU` (`SKU`)`
- Columna/valor especial: ``current_price` decimal(10,2) NOT NULL DEFAULT '0.00'`
- Columna/valor especial: ``current_stock` int unsigned NOT NULL DEFAULT '0'`
- Columna/valor especial: ``status` bit(1) DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_products_users_providers`
- `PRIMARY KEY (`user_ID`,`product_ID`)`
- `KEY `fk_products2` (`product_ID`)`
- `CONSTRAINT `fk_products2` FOREIGN KEY (`product_ID`) REFERENCES `tb_products` (`ID`)`
- `CONSTRAINT `fk_user1` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)`
- Columna/valor especial: ``type_ownership` enum('Owner','Reseller','Distributor') DEFAULT NULL`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_refunds`
- `PRIMARY KEY (`ID`)`
- `KEY `fk_refunds_payment` (`payment_ID`)`
- `KEY `fk_refunds_cancellation` (`cancellation_ID`)`
- `KEY `fk_refunds_return` (`return_ID`)`
- `CONSTRAINT `fk_refunds_cancellation` FOREIGN KEY (`cancellation_ID`) REFERENCES `tb_order_cancellations` (`ID`)`
- `CONSTRAINT `fk_refunds_payment` FOREIGN KEY (`payment_ID`) REFERENCES `tb_payments` (`ID`)`
- `CONSTRAINT `fk_refunds_return` FOREIGN KEY (`return_ID`) REFERENCES `tb_returns` (`ID`)`
- Columna/valor especial: ``cancellation_ID` int unsigned DEFAULT NULL`
- Columna/valor especial: ``return_ID` int unsigned DEFAULT NULL`
- Columna/valor especial: ``refund_amount` decimal(10,2) NOT NULL DEFAULT '0.00'`
- Columna/valor especial: ``refund_status` enum('Pending','Processing','Completed','Failed') NOT NULL DEFAULT 'Pending'`
- Columna/valor especial: ``gateway_refund_id` varchar(255) DEFAULT NULL`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_returns`
- `PRIMARY KEY (`ID`)`
- `KEY `fk_returns_payment` (`payment_ID`)`
- `KEY `fk_returns_product` (`product_ID`)`
- `KEY `fk_returns_user` (`user_ID`)`
- `CONSTRAINT `fk_returns_payment` FOREIGN KEY (`payment_ID`) REFERENCES `tb_payments` (`ID`)`
- `CONSTRAINT `fk_returns_product` FOREIGN KEY (`product_ID`) REFERENCES `tb_products` (`ID`)`
- `CONSTRAINT `fk_returns_user` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)`
- Columna/valor especial: ``quantity` int unsigned NOT NULL DEFAULT '1'`
- Columna/valor especial: ``return_status` enum('Requested','Received','Inspected','Accepted','Rejected') NOT NULL DEFAULT 'Requested'`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_shipments`
- `PRIMARY KEY (`ID`)`
- `KEY `fk_shipments_payment` (`payment_ID`)`
- `CONSTRAINT `fk_shipments_payment` FOREIGN KEY (`payment_ID`) REFERENCES `tb_payments` (`ID`)`
- Columna/valor especial: ``shipping_company` varchar(100) NOT NULL DEFAULT 'E-commerce Logistics'`
- Columna/valor especial: ``tracking_number` varchar(100) DEFAULT NULL`
- Columna/valor especial: ``shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00'`
- Columna/valor especial: ``shipping_status` enum('Pending','Preparing','Shipped','In_Transit','Delivered','Failed') NOT NULL DEFAULT 'Pending'`
- Columna/valor especial: ``shipped_date` datetime DEFAULT NULL`
- Columna/valor especial: ``estimated_delivery_date` datetime DEFAULT NULL`
- Columna/valor especial: ``actual_delivery_date` datetime DEFAULT NULL`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_user_addresses`
- `PRIMARY KEY (`ID`)`
- `KEY `idx_user_addresses` (`user_ID`)`
- `CONSTRAINT `fk_addresses_users` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)`
- `CONSTRAINT `chk_coordinates` CHECK ((((`latitude` is null) and (`longitude` is null)) or ((`latitude` is not null) and (`longitude` is not null))))`
- `CONSTRAINT `chk_latitude` CHECK ((`latitude` between -(90) and 90))`
- `CONSTRAINT `chk_longitude` CHECK ((`longitude` between -(180) and 180))`
- Columna/valor especial: ``recipient_name` varchar(150) DEFAULT NULL`
- Columna/valor especial: ``recipient_phone` varchar(25) DEFAULT NULL`
- Columna/valor especial: ``delivery_instructions` varchar(500) DEFAULT NULL`
- Columna/valor especial: ``latitude` decimal(10,7) DEFAULT NULL`
- Columna/valor especial: ``longitude` decimal(10,7) DEFAULT NULL`
- Columna/valor especial: ``is_default` tinyint(1) NOT NULL DEFAULT '0'`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tb_users`
- `PRIMARY KEY (`ID`)`
- `UNIQUE KEY `email` (`email`)`
- `UNIQUE KEY `nick` (`nick`)`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime DEFAULT NULL`
- Columna/valor especial: ``last_login` datetime DEFAULT NULL`
- Columna/valor especial: ``status` bit(1) DEFAULT b'1'`
### `tbc_categories`
- `PRIMARY KEY (`ID`)`
- `UNIQUE KEY `name` (`name`)`
- `KEY `fk_superior_category` (`sup_id_category`)`
- `CONSTRAINT `fk_superior_category` FOREIGN KEY (`sup_id_category`) REFERENCES `tbc_categories` (`ID`)`
- Columna/valor especial: ``sup_id_category` int unsigned DEFAULT NULL`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tbc_payment_methods_types`
- `PRIMARY KEY (`ID`)`
- `UNIQUE KEY `code_UNIQUE` (`code`)`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tbd_address_components`
- `PRIMARY KEY (`ID`)`
- `UNIQUE KEY `uk_address_component` (`address_ID`,`ID`)`
- `KEY `idx_address_parent` (`address_ID`,`address_sup_ID`)`
- `CONSTRAINT `fk_component_address` FOREIGN KEY (`address_ID`) REFERENCES `tb_user_addresses` (`ID`) ON DELETE RESTRICT`
- `CONSTRAINT `fk_component_parent` FOREIGN KEY (`address_ID`, `address_sup_ID`) REFERENCES `tbd_address_components` (`address_ID`, `ID`) ON DELETE RESTRICT`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``address_sup_ID` bigint unsigned DEFAULT NULL`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tbd_cancellation_items`
- `PRIMARY KEY (`cancellation_ID`,`product_ID`)`
- `KEY `fk_cancellation_items_product` (`product_ID`)`
- `CONSTRAINT `fk_cancellation_items_cancellation` FOREIGN KEY (`cancellation_ID`) REFERENCES `tb_order_cancellations` (`ID`)`
- `CONSTRAINT `fk_cancellation_items_product` FOREIGN KEY (`product_ID`) REFERENCES `tb_products` (`ID`)`
- Columna/valor especial: ``quantity` int unsigned NOT NULL DEFAULT '1'`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tbd_carts_items`
- `PRIMARY KEY (`cart_ID`,`provider_ID`,`product_ID`)`
- `KEY `provider_ID` (`provider_ID`)`
- `KEY `product_ID` (`product_ID`)`
- `CONSTRAINT `tbd_carts_items_ibfk_1` FOREIGN KEY (`cart_ID`) REFERENCES `tb_carts` (`ID`)`
- `CONSTRAINT `tbd_carts_items_ibfk_2` FOREIGN KEY (`provider_ID`) REFERENCES `tb_products_users_providers` (`user_ID`)`
- `CONSTRAINT `tbd_carts_items_ibfk_3` FOREIGN KEY (`product_ID`) REFERENCES `tb_products_users_providers` (`product_ID`)`
- `CONSTRAINT `chk_cart_quantity` CHECK ((`quantity` > 0))`
- Columna/valor especial: ``quantity` int unsigned NOT NULL DEFAULT '1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
### `tbd_order_items`
- `PRIMARY KEY (`ID`)`
- `KEY `seller_order_ID` (`seller_order_ID`)`
- `KEY `product_ID` (`product_ID`)`
- `KEY `provider_ID` (`provider_ID`)`
- `CONSTRAINT `tbd_order_items_ibfk_1` FOREIGN KEY (`seller_order_ID`) REFERENCES `tb_buyer_orders` (`ID`)`
- `CONSTRAINT `tbd_order_items_ibfk_2` FOREIGN KEY (`product_ID`) REFERENCES `tb_products_users_providers` (`product_ID`)`
- `CONSTRAINT `tbd_order_items_ibfk_3` FOREIGN KEY (`provider_ID`) REFERENCES `tb_products_users_providers` (`user_ID`)`
- `CONSTRAINT `tbd_order_items_chk_1` CHECK ((`quantity` > 0))`
- `CONSTRAINT `tbd_order_items_chk_2` CHECK ((`unit_price` >= 0))`
- Columna/valor especial: ``subtotal` decimal(12,2) GENERATED ALWAYS AS ((`quantity` * `unit_price`)) STORED`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
### `tbd_product_categories`
- `PRIMARY KEY (`product_Id`,`category_Id`)`
- `KEY `fk_pc_category` (`category_Id`)`
- `CONSTRAINT `fk_pc_category` FOREIGN KEY (`category_Id`) REFERENCES `tbc_categories` (`ID`)`
- `CONSTRAINT `fk_pc_product` FOREIGN KEY (`product_Id`) REFERENCES `tb_products` (`ID`)`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP`
### `tbd_return_items`
- `PRIMARY KEY (`return_ID`,`product_ID`)`
- `KEY `fk_return_items_product` (`product_ID`)`
- `CONSTRAINT `fk_return_items_product` FOREIGN KEY (`product_ID`) REFERENCES `tb_products` (`ID`)`
- `CONSTRAINT `fk_return_items_return` FOREIGN KEY (`return_ID`) REFERENCES `tb_returns` (`ID`)`
- Columna/valor especial: ``quantity` int unsigned NOT NULL DEFAULT '1'`
- Columna/valor especial: ``item_condition` enum('New','Opened','Defective','Damaged') NOT NULL DEFAULT 'Opened'`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tbd_user_payment_methods`
- `PRIMARY KEY (`ID`)`
- `UNIQUE KEY `uk_provider_method` (`provider`,`provider_method_ref`)`
- `KEY `user_ID` (`user_ID`)`
- `KEY `payment_method_type_ID` (`payment_method_type_ID`)`
- `CONSTRAINT `tbd_user_payment_methods_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)`
- `CONSTRAINT `tbd_user_payment_methods_ibfk_2` FOREIGN KEY (`payment_method_type_ID`) REFERENCES `tbc_payment_methods_types` (`ID`)`
- Columna/valor especial: ``label` varchar(100) DEFAULT NULL`
- Columna/valor especial: ``last_four` char(4) DEFAULT NULL`
- Columna/valor especial: ``is_default` tinyint(1) NOT NULL DEFAULT '0'`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP`
### `tbd_users_wishlist_products`
- `PRIMARY KEY (`user_ID`,`product_ID`)`
- `KEY `fk_products3` (`product_ID`)`
- `CONSTRAINT `fk_products3` FOREIGN KEY (`product_ID`) REFERENCES `tb_products` (`ID`)`
- `CONSTRAINT `fk_user2` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)`
- Columna/valor especial: ``status` bit(1) NOT NULL DEFAULT b'1'`
- Columna/valor especial: ``creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP`
- Columna/valor especial: ``last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP`

## 7. Vistas
### `vw_total_products_by_category`
- Lee de: `tbc_categories`, `tbd_product_categories`, `tb_products`.
```sql
CREATE VIEW `vw_total_products_by_category` AS with recursive `category_tree` as (select `c`.`ID` AS `ID`,`c`.`name` AS `name`,`c`.`sup_id_category` AS `sup_id_category`,`c`.`status` AS `status`,cast(`c`.`name` as char(1000) charset utf8mb4) AS `category_path`,1 AS `category_level` from `tbc_categories` `c` where (`c`.`sup_id_category` is null) union all select `c`.`ID` AS `ID`,`c`.`name` AS `name`,`c`.`sup_id_category` AS `sup_id_category`,`c`.`status` AS `status`,concat(`ct`.`category_path`,' → ',`c`.`name`) AS `category_path`,(`ct`.`category_level` + 1) AS `category_level` from (`tbc_categories` `c` join `category_tree` `ct` on((`c`.`sup_id_category` = `ct`.`ID`)))), `category_totals` as (select `ct`.`ID` AS `category_ID`,`ct`.`category_path` AS `category_path`,`ct`.`category_level` AS `category_level`,count(distinct `pc`.`product_Id`) AS `total_products`,count(distinct (case when (`p`.`status` = 0x01) then `p`.`ID` end)) AS `total_active_products`,count(distinct (case when (`p`.`status` = 0x00) then `p`.`ID` end)) AS `total_inactive_products` from ((`category_tree` `ct` left join `tbd_product_categories` `pc` on(((`pc`.`category_Id` = `ct`.`ID`) and (`pc`.`status` = 0x01)))) left join `tb_products` `p` on((`p`.`ID` = `pc`.`product_Id`))) group by `ct`.`ID`,`ct`.`category_path`,`ct`.`category_level`), `uncategorized` as (select count(0) AS `total_uncategorized_products`,sum((case when (`p`.`status` = 0x01) then 1 else 0 end)) AS `total_active_products`,sum((case when (`p`.`status` = 0x00) then 1 else 0 end)) AS `total_inactive_products` from `tb_products` `p` where exists(select 1 from `tbd_product_categories` `pc` where ((`pc`.`product_Id` = `p`.`ID`) and (`pc`.`status` = 0x01))) is false) select `category_totals`.`category_ID` AS `category_ID`,`category_totals`.`category_path` AS `category_path`,`category_totals`.`category_level` AS `category_level`,`category_totals`.`total_products` AS `total_products`,`category_totals`.`total_active_products` AS `total_active_products`,`category_totals`.`total_inactive_products` AS `total_inactive_products`,0 AS `total_uncategorized_products` from `category_totals` union all select NULL AS `category_ID`,'Sin categoría' AS `category_path`,0 AS `category_level`,`uncategorized`.`total_uncategorized_products` AS `total_products`,`uncategorized`.`total_active_products` AS `total_active_products`,`uncategorized`.`total_inactive_products` AS `total_inactive_products`,`uncategorized`.`total_uncategorized_products` AS `total_uncategorized_products` from `uncategorized`
```
### `vw_trazabilidad_address_components`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_address_components` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_address_components')
```
### `vw_trazabilidad_buyer_orders`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_buyer_orders` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_buyer_orders')
```
### `vw_trazabilidad_cancellation_items`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_cancellation_items` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_cancellation_items')
```
### `vw_trazabilidad_cancellations`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_cancellations` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_cancellations')
```
### `vw_trazabilidad_cart_items`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_cart_items` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_cart_items')
```
### `vw_trazabilidad_carts`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_carts` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_carts')
```
### `vw_trazabilidad_categorias_productos`
- Lee de: `tbc_categories`, `tbd_product_categories`, `tb_products`.
```sql
CREATE VIEW `vw_trazabilidad_categorias_productos` AS with recursive `category_tree` as (select `c`.`ID` AS `ID`,`c`.`name` AS `name`,`c`.`sup_id_category` AS `sup_id_category`,`c`.`status` AS `status`,cast(`c`.`name` as char(1000) charset utf8mb4) AS `category_path`,1 AS `category_level` from `tbc_categories` `c` where (`c`.`sup_id_category` is null) union all select `c`.`ID` AS `ID`,`c`.`name` AS `name`,`c`.`sup_id_category` AS `sup_id_category`,`c`.`status` AS `status`,concat(`ct`.`category_path`,' → ',`c`.`name`) AS `category_path`,(`ct`.`category_level` + 1) AS `category_level` from (`tbc_categories` `c` join `category_tree` `ct` on((`c`.`sup_id_category` = `ct`.`ID`)))) select `ct`.`ID` AS `category_id`,`ct`.`name` AS `category_name`,`ct`.`category_path` AS `category_path`,`ct`.`category_level` AS `category_level`,(case when (`ct`.`status` = 0x01) then 'Activa' when (`ct`.`status` = 0x00) then 'Inactiva' else 'Desconocido' end) AS `category_status`,`p`.`ID` AS `product_id`,`p`.`SKU` AS `product_sku`,`p`.`name` AS `product_name`,`p`.`current_price` AS `product_price`,`p`.`current_stock` AS `product_stock`,(case when (`p`.`status` = 0x01) then 'Activo' when (`p`.`status` = 0x00) then 'Inactivo' else 'Desconocido' end) AS `product_status`,`p`.`creation_date` AS `product_creation_date`,`p`.`last_update` AS `product_last_update`,(case when (`pc`.`status` = 0x01) then 'Vinculado' when (`pc`.`status` = 0x00) then 'Desvinculado' else 'Sin relación' end) AS `relation_status`,`pc`.`creation_date` AS `relation_creation_date`,`pc`.`last_update` AS `relation_last_update`,(case when (`pc`.`product_Id` is null) then 'Producto sin categoría asignada' when ((`ct`.`status` = 0x00) and (`p`.`status` = 0x01)) then 'Producto activo en categoría inactiva' when ((`ct`.`status` = 0x01) and (`p`.`status` = 0x00)) then 'Producto inactivo en categoría activa' when (`pc`.`status` = 0x00) then 'Relación desvinculada (histórica)' else 'OK - Producto y categoría activos' end) AS `trazabilidad_estado` from ((`category_tree` `ct` join `tbd_product_categories` `pc` on((`pc`.`category_Id` = `ct`.`ID`))) join `tb_products` `p` on((`p`.`ID` = `pc`.`product_Id`))) order by `ct`.`category_path`,`p`.`name`
```
### `vw_trazabilidad_categories`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_categories` AS select `tb_logs`.`ID` AS `log_id`,cast(substring_index(substring_index(`tb_logs`.`operation_description`,'ID=',-(1)),',',1) as unsigned) AS `category_id`,`tb_logs`.`table_operation` AS `operation`,`tb_logs`.`db_user` AS `db_user`,substring_index(`tb_logs`.`db_user`,'@',1) AS `username`,'support' AS `role`,`tb_logs`.`operation_description` AS `description`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `operation_status` from `tb_logs` where (`tb_logs`.`table_name` = 'tbc_categories') order by `tb_logs`.`ID`
```
### `vw_trazabilidad_order_cancellations`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_order_cancellations` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_order_cancellations')
```
### `vw_trazabilidad_order_items`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_order_items` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_order_items')
```
### `vw_trazabilidad_orders`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_orders` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_orders')
```
### `vw_trazabilidad_payment_method_types`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_payment_method_types` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbc_payment_method_types')
```
### `vw_trazabilidad_payment_transaction`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_payment_transaction` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_payment_transaction')
```
### `vw_trazabilidad_payments`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_payments` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_payments')
```
### `vw_trazabilidad_people`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_people` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_people')
```
### `vw_trazabilidad_productos`
- Lee de: `tb_products`, `tb_logs`, `role_edges`.
```sql
CREATE VIEW `vw_trazabilidad_productos` AS select `p`.`ID` AS `id`,`p`.`name` AS `name`,`p`.`description` AS `description`,`b`.`db_user` AS `inserted_by`,coalesce(group_concat(distinct `re`.`FROM_USER` order by `re`.`FROM_USER` ASC separator ', '),'Sin rol') AS `roles`,`b`.`operation_description` AS `operation_description`,`b`.`operation_date` AS `operation_date` from ((`tb_products` `p` join `tb_logs` `b` on((`b`.`operation_description` like concat('%ID=',`p`.`ID`,',%')))) left join `mysql`.`role_edges` `re` on((`re`.`TO_USER` = substring_index(`b`.`db_user`,'@',1)))) where ((`b`.`table_operation` = 'Create') and (`b`.`table_name` = 'tb_products')) group by `p`.`ID`,`p`.`name`,`p`.`description`,`b`.`db_user`,`b`.`operation_description`,`b`.`operation_date`
```
### `vw_trazabilidad_products_users_providers`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_products_users_providers` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_products_users_providers')
```
### `vw_trazabilidad_refunds`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_refunds` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_refunds')
```
### `vw_trazabilidad_return_items`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_return_items` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_return_items')
```
### `vw_trazabilidad_returns`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_returns` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_returns')
```
### `vw_trazabilidad_shipments`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_shipments` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_shipments')
```
### `vw_trazabilidad_user_addresses`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_user_addresses` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tb_user_addresses')
```
### `vw_trazabilidad_user_payment_methods`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_user_payment_methods` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_user_payment_methods')
```
### `vw_trazabilidad_users_wishlist_products`
- Lee de: `tb_logs`.
```sql
CREATE VIEW `vw_trazabilidad_users_wishlist_products` AS select `tb_logs`.`ID` AS `log_ID`,`tb_logs`.`table_name` AS `table_name`,`tb_logs`.`table_operation` AS `operacion`,`tb_logs`.`db_user` AS `usuario_bd`,`tb_logs`.`operation_description` AS `detalle`,`tb_logs`.`operation_date` AS `operation_date`,`tb_logs`.`operation_status` AS `estado_operacion` from `tb_logs` where (`tb_logs`.`table_name` = 'tbd_users_wishlist_products')
```
### `vw_trazabilidad_usuarios`
- Lee de: `tb_users`, `tb_logs`, `role_edges`.
```sql
CREATE VIEW `vw_trazabilidad_usuarios` AS select `u`.`nick` AS `nick`,`u`.`email` AS `email`,`b`.`db_user` AS `inserted_by`,group_concat(distinct `re`.`FROM_USER` order by `re`.`FROM_USER` ASC separator ', ') AS `roles`,`b`.`operation_description` AS `operation_description`,`b`.`operation_date` AS `operation_date` from ((`tb_users` `u` join `tb_logs` `b` on(((`b`.`operation_description` like concat('%',`u`.`nick`,'%')) and (`b`.`operation_description` like concat('%',`u`.`email`,'%'))))) left join `mysql`.`role_edges` `re` on((`re`.`TO_USER` = substring_index(`b`.`db_user`,'@',1)))) where ((`b`.`table_operation` = 'Create') and (`b`.`table_name` = 'tb_users')) group by `u`.`nick`,`u`.`email`,`b`.`db_user`,`b`.`operation_description`,`b`.`operation_date` order by `b`.`operation_date`
```

## 8. Triggers
### `trg_buyer_orders_after_insert`
- Tabla: `tb_buyer_orders`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_buyer_orders_after_insert` AFTER INSERT ON `tb_buyer_orders` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_stat) 
    VALUES ('tb_buyer_orders', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - creó la orden de compra ID: ', NEW.ID), b'1');
END
```
### `trg_buyer_orders_after_update`
- Tabla: `tb_buyer_orders`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_buyer_orders_after_update` AFTER UPDATE ON `tb_buyer_orders` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_stat) 
    VALUES ('tb_buyer_orders', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó la orden de compra ID: ', NEW.ID), b'1');
END
```
### `trg_buyer_orders_after_delete`
- Tabla: `tb_buyer_orders`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_buyer_orders_after_delete` AFTER DELETE ON `tb_buyer_orders` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_stat) 
    VALUES ('tb_buyer_orders', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó la orden de compra ID: ', OLD.ID), b'1');
END
```
### `trg_carts_after_insert`
- Tabla: `tb_carts`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_carts_after_insert` AFTER INSERT ON `tb_carts` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (table_name, record_id, table_operation, db_user, operation_description, operation_status)
    VALUES (
        'tb_carts', NEW.ID, 'Create', usuario_real,
        CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - creó el carrito ID=', NEW.ID, ' para user_ID=', NEW.user_ID),
        b'1'
    );
END
```
### `trg_carts_after_update`
- Tabla: `tb_carts`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_carts_after_update` AFTER UPDATE ON `tb_carts` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (table_name, record_id, table_operation, db_user, operation_description, operation_status)
    VALUES (
        'tb_carts', NEW.ID, 'Update', usuario_real,
        CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó el carrito ID=', NEW.ID, ', status=', NEW.status),
        b'1'
    );
END
```
### `trg_carts_after_delete`
- Tabla: `tb_carts`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_carts_after_delete` AFTER DELETE ON `tb_carts` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (table_name, record_id, table_operation, db_user, operation_description, operation_status)
    VALUES (
        'tb_carts', OLD.ID, 'Delete', usuario_real,
        CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó el carrito ID=', OLD.ID),
        b'1'
    );
END
```
### `trg_tb_ord_canc_after_insert`
- Tabla: `tb_order_cancellations`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_tb_ord_canc_after_insert` AFTER INSERT ON `tb_order_cancellations` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_order_cancellations', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - creó la cancelación ID: ', NEW.ID), b'1');
END
```
### `trg_tb_ord_canc_after_update`
- Tabla: `tb_order_cancellations`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_tb_ord_canc_after_update` AFTER UPDATE ON `tb_order_cancellations` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_order_cancellations', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó la cancelación ID: ', NEW.ID), b'1');
END
```
### `trg_tb_ord_canc_after_delete`
- Tabla: `tb_order_cancellations`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_tb_ord_canc_after_delete` AFTER DELETE ON `tb_order_cancellations` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_order_cancellations', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó la cancelación ID: ', OLD.ID), b'1');
END
```
### `trg_orders_after_insert`
- Tabla: `tb_orders`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_orders_after_insert` AFTER INSERT ON `tb_orders` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
    AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_orders',
        'Create',
        usuario_real,
        CONCAT(
            SUBSTRING_INDEX(usuario_real, '@', 1),
            ': ', rol_usuario,
            ' - creó la orden ID: ', NEW.ID
        ),
        b'1'
    );
END
```
### `trg_orders_after_update`
- Tabla: `tb_orders`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_orders_after_update` AFTER UPDATE ON `tb_orders` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
    AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_orders',
        'Update',
        usuario_real,
        CONCAT(
            SUBSTRING_INDEX(usuario_real, '@', 1),
            ': ', rol_usuario,
            ' - actualizó la orden ID: ', NEW.ID
        ),
        b'1'
    );
END
```
### `trg_orders_after_delete`
- Tabla: `tb_orders`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_orders_after_delete` AFTER DELETE ON `tb_orders` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
    AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_orders',
        'Delete',
        usuario_real,
        CONCAT(
            SUBSTRING_INDEX(usuario_real, '@', 1),
            ': ', rol_usuario,
            ' - eliminó la orden ID: ', OLD.ID
        ),
        b'1'
    );
END
```
### `trg_tb_pay_trans_after_insert`
- Tabla: `tb_payment_transaction`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_tb_pay_trans_after_insert` AFTER INSERT ON `tb_payment_transaction` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_payment_transaction', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - creó la transacción ID: ', NEW.ID), b'1');
END
```
### `trg_tb_pay_trans_after_update`
- Tabla: `tb_payment_transaction`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_tb_pay_trans_after_update` AFTER UPDATE ON `tb_payment_transaction` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_payment_transaction', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó la transacción ID: ', NEW.ID), b'1');
END
```
### `trg_tb_pay_trans_after_delete`
- Tabla: `tb_payment_transaction`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_tb_pay_trans_after_delete` AFTER DELETE ON `tb_payment_transaction` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_payment_transaction', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó la transacción ID: ', OLD.ID), b'1');
END
```
### `trg_tb_payments_after_insert`
- Tabla: `tb_payments`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_tb_payments_after_insert` AFTER INSERT ON `tb_payments` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_payments', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - creó el pago ID: ', NEW.ID), b'1');
END
```
### `trg_tb_payments_after_update`
- Tabla: `tb_payments`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_tb_payments_after_update` AFTER UPDATE ON `tb_payments` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_payments', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó el pago ID: ', NEW.ID), b'1');
END
```
### `trg_tb_payments_after_delete`
- Tabla: `tb_payments`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_tb_payments_after_delete` AFTER DELETE ON `tb_payments` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_payments', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó el pago ID: ', OLD.ID), b'1');
END
```
### `trg_people_after_insert`
- Tabla: `tb_people`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_people_after_insert` AFTER INSERT ON `tb_people` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_people', 'Create', usuario_real, CONCAT('El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1), ' (', rol_usuario, ') ha creado la persona. person_ID=', NEW.person_ID), b'1');
END
```
### `trg_people_after_update`
- Tabla: `tb_people`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_people_after_update` AFTER UPDATE ON `tb_people` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_people', 'Update', usuario_real, CONCAT('El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1), ' (', rol_usuario, ') ha actualizado la persona. person_ID=', NEW.person_ID), b'1');
END
```
### `trg_people_after_delete`
- Tabla: `tb_people`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_people_after_delete` AFTER DELETE ON `tb_people` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name, table_operation, db_user, operation_description, operation_status
    ) VALUES (
        'tb_people',
        'Delete',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha eliminado la persona. person_ID=', OLD.person_ID,
            ', user_ID=', COALESCE(OLD.user_ID, 'NULL'),
            ', family_names=', COALESCE(OLD.family_names, 'NULL'),
            ', status=', CAST(OLD.status AS UNSIGNED)
        ),
        b'1'
    );
END
```
### `trg_products_after_insert`
- Tabla: `tb_products`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_products_after_insert` AFTER INSERT ON `tb_products` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER
    INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_products',
        'Create',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha creado el producto. ID=', NEW.ID,
            ', SKU=', NEW.SKU,
            ', nombre=', NEW.name,
            ', precio=', NEW.current_price,
            ', stock=', NEW.current_stock
        ),
        b'1'
    );
END
```
### `trg_products_after_update`
- Tabla: `tb_products`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_products_after_update` AFTER UPDATE ON `tb_products` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER
    INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_products',
        'Update',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha actualizado el producto. ID=', NEW.ID,
            ', Cambios: ',
            CONCAT_WS(' | ',
                IF(NOT (OLD.SKU <=> NEW.SKU),
                   CONCAT('SKU: ', OLD.SKU, ' -> ', NEW.SKU), NULL),
                IF(NOT (OLD.name <=> NEW.name),
                   CONCAT('Nombre: ', OLD.name, ' -> ', NEW.name), NULL),
                IF(NOT (OLD.description <=> NEW.description),
                   'Descripción modificada', NULL),
                IF(NOT (OLD.current_price <=> NEW.current_price),
                   CONCAT('Precio: ', OLD.current_price,
                          ' -> ', NEW.current_price), NULL),
                IF(NOT (OLD.current_stock <=> NEW.current_stock),
                   CONCAT('Stock: ', OLD.current_stock,
                          ' -> ', NEW.current_stock), NULL),
                IF(NOT (OLD.status <=> NEW.status),
                   CONCAT('Status: ', CAST(OLD.status AS UNSIGNED),
                          ' -> ', CAST(NEW.status AS UNSIGNED)), NULL)
            )
        ),
        b'1'
    );
END
```
### `trg_products_after_delete`
- Tabla: `tb_products`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_products_after_delete` AFTER DELETE ON `tb_products` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER
    INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_products',
        'Delete',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha eliminado el producto. ID=', OLD.ID,
            ', SKU=', OLD.SKU,
            ', nombre=', OLD.name,
            ', precio=', OLD.current_price,
            ', stock=', OLD.current_stock
        ),
        b'1'
    );
END
```
### `trg_products_users_providers_after_insert`
- Tabla: `tb_products_users_providers`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_products_users_providers_after_insert` AFTER INSERT ON `tb_products_users_providers` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_products_users_providers', 'Create', usuario_real, CONCAT('El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1), ' (', rol_usuario, ') creó relación user_ID=', NEW.user_ID, ', product_ID=', NEW.product_ID), b'1');
END
```
### `trg_products_users_providers_after_update`
- Tabla: `tb_products_users_providers`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_products_users_providers_after_update` AFTER UPDATE ON `tb_products_users_providers` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_products_users_providers', 'Update', usuario_real, CONCAT('El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1), ' (', rol_usuario, ') actualizó relación user_ID=', NEW.user_ID, ', product_ID=', NEW.product_ID), b'1');
END
```
### `trg_products_users_providers_after_delete`
- Tabla: `tb_products_users_providers`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_products_users_providers_after_delete` AFTER DELETE ON `tb_products_users_providers` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name, table_operation, db_user, operation_description, operation_status
    ) VALUES (
        'tb_products_users_providers',
        'Delete',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha eliminado la relación proveedor-producto. user_ID=', OLD.user_ID,
            ', product_ID=', OLD.product_ID,
            ', type_ownership=', COALESCE(OLD.type_ownership, 'NULL')
        ),
        b'1'
    );
END
```
### `trg_tb_refunds_after_insert`
- Tabla: `tb_refunds`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_tb_refunds_after_insert` AFTER INSERT ON `tb_refunds` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_refunds', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - creó el reembolso ID: ', NEW.ID), b'1');
END
```
### `trg_tb_refunds_after_update`
- Tabla: `tb_refunds`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_tb_refunds_after_update` AFTER UPDATE ON `tb_refunds` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_refunds', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó el reembolso ID: ', NEW.ID), b'1');
END
```
### `trg_tb_refunds_after_delete`
- Tabla: `tb_refunds`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_tb_refunds_after_delete` AFTER DELETE ON `tb_refunds` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_refunds', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó el reembolso ID: ', OLD.ID), b'1');
END
```
### `trg_tb_returns_after_insert`
- Tabla: `tb_returns`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_tb_returns_after_insert` AFTER INSERT ON `tb_returns` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_returns', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - creó la devolución ID: ', NEW.ID), b'1');
END
```
### `trg_tb_returns_after_update`
- Tabla: `tb_returns`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_tb_returns_after_update` AFTER UPDATE ON `tb_returns` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_returns', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó la devolución ID: ', NEW.ID), b'1');
END
```
### `trg_tb_returns_after_delete`
- Tabla: `tb_returns`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_tb_returns_after_delete` AFTER DELETE ON `tb_returns` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_returns', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó la devolución ID: ', OLD.ID), b'1');
END
```
### `trg_tb_shipments_after_insert`
- Tabla: `tb_shipments`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_tb_shipments_after_insert` AFTER INSERT ON `tb_shipments` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_shipments', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - creó el envío ID: ', NEW.ID), b'1');
END
```
### `trg_tb_shipments_after_update`
- Tabla: `tb_shipments`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_tb_shipments_after_update` AFTER UPDATE ON `tb_shipments` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_shipments', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó el envío ID: ', NEW.ID), b'1');
END
```
### `trg_tb_shipments_after_delete`
- Tabla: `tb_shipments`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_tb_shipments_after_delete` AFTER DELETE ON `tb_shipments` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_shipments', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó el envío ID: ', OLD.ID), b'1');
END
```
### `trg_user_addresses_after_insert`
- Tabla: `tb_user_addresses`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_user_addresses_after_insert` AFTER INSERT ON `tb_user_addresses` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_user_addresses', 'Create', usuario_real, CONCAT('El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1), ' (', rol_usuario, ') creó dirección ID=', NEW.ID), b'1');
END
```
### `trg_user_addresses_after_update`
- Tabla: `tb_user_addresses`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_user_addresses_after_update` AFTER UPDATE ON `tb_user_addresses` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tb_user_addresses', 'Update', usuario_real, CONCAT('El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1), ' (', rol_usuario, ') actualizó dirección ID=', NEW.ID), b'1');
END
```
### `trg_user_addresses_after_delete`
- Tabla: `tb_user_addresses`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_user_addresses_after_delete` AFTER DELETE ON `tb_user_addresses` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name, table_operation, db_user, operation_description, operation_status
    ) VALUES (
        'tb_user_addresses',
        'Delete',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha eliminado la dirección. ID=', OLD.ID,
            ', user_ID=', OLD.user_ID,
            ', recipient_name=', COALESCE(OLD.recipient_name, 'NULL'),
            ', status=', CAST(OLD.status AS UNSIGNED)
        ),
        b'1'
    );
END
```
### `trg_users_after_insert`
- Tabla: `tb_users`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_users_after_insert` AFTER INSERT ON `tb_users` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER
    INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_users',
        'Create',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha creado el usuario. ID=', NEW.ID,
            ', email=', NEW.email,
            ', nick=', NEW.nick,
            ', creation_date=', NEW.creation_date,
            ', status=', CAST(NEW.status AS UNSIGNED)
        ),
        b'1'
    );
END
```
### `trg_users_after_update`
- Tabla: `tb_users`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_users_after_update` AFTER UPDATE ON `tb_users` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER
    INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_users',
        'Update',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha actualizado el usuario. ID=', NEW.ID,
            ', email=', NEW.email,
            ', nick=', NEW.nick,
            ', Cambios: ',
            CONCAT_WS(' | ',
                IF(NOT (OLD.email <=> NEW.email),
                   CONCAT('email: ', OLD.email, ' -> ', NEW.email), NULL),
                IF(NOT (OLD.nick <=> NEW.nick),
                   CONCAT('nick: ', OLD.nick, ' -> ', NEW.nick), NULL),
                IF(NOT (OLD.password <=> NEW.password),
                   'password modificado', NULL),
                IF(NOT (OLD.status <=> NEW.status),
                   CONCAT('status: ', CAST(OLD.status AS UNSIGNED),
                          ' -> ', CAST(NEW.status AS UNSIGNED)), NULL),
                IF(NOT (OLD.last_login <=> NEW.last_login),
                   CONCAT('last_login: ', IFNULL(OLD.last_login,'NULL'),
                          ' -> ', IFNULL(NEW.last_login,'NULL')), NULL)
            )
        ),
        b'1'
    );
END
```
### `trg_users_after_delete`
- Tabla: `tb_users`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_users_after_delete` AFTER DELETE ON `tb_users` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER
    INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_users',
        'Delete',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha eliminado el usuario. ID=', OLD.ID,
            ', email=', OLD.email,
            ', nick=', OLD.nick,
            ', creation_date=', OLD.creation_date,
            ', last_update=', IFNULL(OLD.last_update,'NULL'),
            ', last_login=', IFNULL(OLD.last_login,'NULL'),
            ', status=', CAST(OLD.status AS UNSIGNED)
        ),
        b'1'
    );
END
```
### `trg_categories_after_insert`
- Tabla: `tbc_categories`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_categories_after_insert` AFTER INSERT ON `tbc_categories` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER
    INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tbc_categories',
        'Create',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha creado la categoría. ID=', NEW.ID,
            ', nombre=', NEW.name,
            ', descripción=', COALESCE(NEW.description, 'NULL'),
            ', categoría superior=', COALESCE(NEW.sup_id_category, 'NULL'),
            ', estado=', NEW.status + 0
        ),
        b'1'
    );
END
```
### `trg_categories_after_update`
- Tabla: `tbc_categories`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_categories_after_update` AFTER UPDATE ON `tbc_categories` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);
    DECLARE cambios TEXT DEFAULT '';

    SET usuario_real = USER();

    SELECT FROM_USER
    INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    IF NOT (OLD.name <=> NEW.name) THEN
        SET cambios = CONCAT(cambios, 'nombre: [', COALESCE(OLD.name,'NULL'), '] -> [', COALESCE(NEW.name,'NULL'), ']; ');
    END IF;

    IF NOT (OLD.description <=> NEW.description) THEN
        SET cambios = CONCAT(cambios, 'descripción: [', COALESCE(OLD.description,'NULL'), '] -> [', COALESCE(NEW.description,'NULL'), ']; ');
    END IF;

    IF NOT (OLD.sup_id_category <=> NEW.sup_id_category) THEN
        SET cambios = CONCAT(cambios, 'categoría superior: [', COALESCE(OLD.sup_id_category,'NULL'), '] -> [', COALESCE(NEW.sup_id_category,'NULL'), ']; ');
    END IF;

    IF NOT (OLD.status <=> NEW.status) THEN
        SET cambios = CONCAT(cambios, 'estado: [', OLD.status + 0, '] -> [', NEW.status + 0, ']; ');
    END IF;

    IF cambios <> '' THEN
        INSERT INTO tb_logs (
            table_name,
            table_operation,
            db_user,
            operation_description,
            operation_status
        )
        VALUES (
            'tbc_categories',
            'Update',
            usuario_real,
            CONCAT(
                'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
                ' (', rol_usuario, ')',
                ' ha actualizado la categoría. ID=', NEW.ID,
                ', Cambios: ', cambios
            ),
            b'1'
        );
    END IF;
END
```
### `trg_categories_after_delete`
- Tabla: `tbc_categories`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_categories_after_delete` AFTER DELETE ON `tbc_categories` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER
    INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    )
    VALUES (
        'tbc_categories',
        'Delete',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha eliminado la categoría. ID=', OLD.ID,
            ', nombre=', OLD.name,
            ', descripción=', COALESCE(OLD.description, 'NULL'),
            ', categoría superior=', COALESCE(OLD.sup_id_category, 'NULL'),
            ', estado=', OLD.status + 0
        ),
        b'1'
    );
END
```
### `trg_tbc_pmt_after_insert`
- Tabla: `tbc_payment_methods_types`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_tbc_pmt_after_insert` AFTER INSERT ON `tbc_payment_methods_types` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbc_payment_methods_types', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - creó el tipo de pago ID: ', NEW.ID), b'1');
END
```
### `trg_tbc_pmt_after_update`
- Tabla: `tbc_payment_methods_types`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_tbc_pmt_after_update` AFTER UPDATE ON `tbc_payment_methods_types` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbc_payment_methods_types', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó el tipo de pago ID: ', NEW.ID), b'1');
END
```
### `trg_tbc_pmt_after_delete`
- Tabla: `tbc_payment_methods_types`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_tbc_pmt_after_delete` AFTER DELETE ON `tbc_payment_methods_types` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbc_payment_methods_types', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó el tipo de pago ID: ', OLD.ID), b'1');
END
```
### `trg_address_components_after_insert`
- Tabla: `tbd_address_components`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_address_components_after_insert` AFTER INSERT ON `tbd_address_components` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbd_address_components', 'Create', usuario_real, CONCAT('El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1), ' (', rol_usuario, ') creó componente ID=', NEW.ID), b'1');
END
```
### `trg_address_components_after_update`
- Tabla: `tbd_address_components`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_address_components_after_update` AFTER UPDATE ON `tbd_address_components` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbd_address_components', 'Update', usuario_real, CONCAT('El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1), ' (', rol_usuario, ') actualizó componente ID=', NEW.ID), b'1');
END
```
### `trg_address_components_after_delete`
- Tabla: `tbd_address_components`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_address_components_after_delete` AFTER DELETE ON `tbd_address_components` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name, table_operation, db_user, operation_description, operation_status
    ) VALUES (
        'tbd_address_components',
        'Delete',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha eliminado el componente de dirección. ID=', OLD.ID,
            ', address_ID=', OLD.address_ID,
            ', address_sup_ID=', COALESCE(OLD.address_sup_ID, 'NULL')
        ),
        b'1'
    );
END
```
### `trg_tbd_canc_items_after_insert`
- Tabla: `tbd_cancellation_items`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_tbd_canc_items_after_insert` AFTER INSERT ON `tbd_cancellation_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbd_cancellation_items', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - agregó producto ID: ', NEW.product_ID, ' a la cancelación ID: ', NEW.cancellation_ID), b'1');
END
```
### `trg_tbd_canc_items_after_update`
- Tabla: `tbd_cancellation_items`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_tbd_canc_items_after_update` AFTER UPDATE ON `tbd_cancellation_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbd_cancellation_items', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó producto ID: ', NEW.product_ID, ' de la cancelación ID: ', NEW.cancellation_ID), b'1');
END
```
### `trg_tbd_canc_items_after_delete`
- Tabla: `tbd_cancellation_items`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_tbd_canc_items_after_delete` AFTER DELETE ON `tbd_cancellation_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbd_cancellation_items', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó producto ID: ', OLD.product_ID, ' de la cancelación ID: ', OLD.cancellation_ID), b'1');
END
```
### `trg_carts_items_after_insert`
- Tabla: `tbd_carts_items`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_carts_items_after_insert` AFTER INSERT ON `tbd_carts_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_stat) 
    VALUES ('tbd_carts_items', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - agregó el producto ID: ', NEW.product_ID, ' al carrito ID: ', NEW.cart_ID), b'1');
END
```
### `trg_carts_items_after_update`
- Tabla: `tbd_carts_items`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_carts_items_after_update` AFTER UPDATE ON `tbd_carts_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_stat) 
    VALUES ('tbd_carts_items', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó el producto ID: ', NEW.product_ID, ' en el carrito ID: ', NEW.cart_ID), b'1');
END
```
### `trg_carts_items_after_delete`
- Tabla: `tbd_carts_items`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_carts_items_after_delete` AFTER DELETE ON `tbd_carts_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_stat) 
    VALUES ('tbd_carts_items', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó el producto ID: ', OLD.product_ID, ' del carrito ID: ', OLD.cart_ID), b'1');
END
```
### `trg_order_items_after_insert`
- Tabla: `tbd_order_items`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_order_items_after_insert` AFTER INSERT ON `tbd_order_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_stat) 
    VALUES ('tbd_order_items', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - añadió el item ID: ', NEW.ID, ' a la orden: ', NEW.seller_order_ID), b'1');
END
```
### `trg_order_items_after_update`
- Tabla: `tbd_order_items`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_order_items_after_update` AFTER UPDATE ON `tbd_order_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_stat) 
    VALUES ('tbd_order_items', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - modificó el item ID: ', NEW.ID, ' de la orden: ', NEW.seller_order_ID), b'1');
END
```
### `trg_order_items_after_delete`
- Tabla: `tbd_order_items`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_order_items_after_delete` AFTER DELETE ON `tbd_order_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_stat) 
    VALUES ('tbd_order_items', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó el item ID: ', OLD.ID, ' de la orden: ', OLD.seller_order_ID), b'1');
END
```
### `trg_product_categories_after_insert`
- Tabla: `tbd_product_categories`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_product_categories_after_insert` AFTER INSERT ON `tbd_product_categories` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    ) VALUES (
        'tbd_product_categories',
        'Create',
        USER(),
        CONCAT('El usuario ', USER(), ' ha creado la relación producto-categoría. product_Id=', NEW.product_Id,
               ', category_Id=', NEW.category_Id,
               ', status=', NEW.status,
               ', creation_date=', NEW.creation_date,
               ', last_update=', NEW.last_update),
        b'1'
    );
END
```
### `trg_product_categories_after_update`
- Tabla: `tbd_product_categories`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_product_categories_after_update` AFTER UPDATE ON `tbd_product_categories` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    ) VALUES (
        'tbd_product_categories',
        'Update',
        USER(),
        CONCAT('El usuario ', USER(), ' ha actualizado la relación producto-categoría. product_Id=', OLD.product_Id,
               ', category_Id=', OLD.category_Id,
               ' [status: ', OLD.status, ' -> ', NEW.status, ']',
               ' [last_update: ', OLD.last_update, ' -> ', NEW.last_update, ']'),
        b'1'
    );
END
```
### `trg_product_categories_after_delete`
- Tabla: `tbd_product_categories`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_product_categories_after_delete` AFTER DELETE ON `tbd_product_categories` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_status
    ) VALUES (
        'tbd_product_categories',
        'Delete',
        USER(),
        CONCAT('El usuario ', USER(), ' ha eliminado la relación producto-categoría. product_Id=', OLD.product_Id,
               ', category_Id=', OLD.category_Id,
               ', status=', OLD.status,
               ', creation_date=', OLD.creation_date,
               ', last_update=', OLD.last_update),
        b'1'
    );
END
```
### `trg_tbd_ret_items_after_insert`
- Tabla: `tbd_return_items`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_tbd_ret_items_after_insert` AFTER INSERT ON `tbd_return_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbd_return_items', 'Create', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - agregó producto ID: ', NEW.product_ID, ' a la devolución ID: ', NEW.return_ID), b'1');
END
```
### `trg_tbd_ret_items_after_update`
- Tabla: `tbd_return_items`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_tbd_ret_items_after_update` AFTER UPDATE ON `tbd_return_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbd_return_items', 'Update', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó producto ID: ', NEW.product_ID, ' de la devolución ID: ', NEW.return_ID), b'1');
END
```
### `trg_tbd_ret_items_after_delete`
- Tabla: `tbd_return_items`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_tbd_ret_items_after_delete` AFTER DELETE ON `tbd_return_items` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbd_return_items', 'Delete', usuario_real, CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó producto ID: ', OLD.product_ID, ' de la devolución ID: ', OLD.return_ID), b'1');
END
```
### `trg_user_payment_methods_after_insert`
- Tabla: `tbd_user_payment_methods`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_user_payment_methods_after_insert` AFTER INSERT ON `tbd_user_payment_methods` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbd_user_payment_methods', 'Create', usuario_real, CONCAT('El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1), ' (', rol_usuario, ') creó método de pago ID=', NEW.ID), b'1');
END
```
### `trg_user_payment_methods_after_update`
- Tabla: `tbd_user_payment_methods`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_user_payment_methods_after_update` AFTER UPDATE ON `tbd_user_payment_methods` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50); DECLARE usuario_real VARCHAR(255);
    SET usuario_real = USER();
    SELECT FROM_USER INTO rol_usuario FROM mysql.role_edges WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1) AND TO_HOST = '%' LIMIT 1;
    IF rol_usuario IS NULL THEN SET rol_usuario = 'Sin rol'; END IF;
    INSERT INTO tb_logs (table_name, table_operation, db_user, operation_description, operation_status) 
    VALUES ('tbd_user_payment_methods', 'Update', usuario_real, CONCAT('El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1), ' (', rol_usuario, ') actualizó método de pago ID=', NEW.ID), b'1');
END
```
### `trg_user_payment_methods_after_delete`
- Tabla: `tbd_user_payment_methods`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_user_payment_methods_after_delete` AFTER DELETE ON `tbd_user_payment_methods` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (
        table_name, table_operation, db_user, operation_description, operation_status
    ) VALUES (
        'tbd_user_payment_methods',
        'Delete',
        usuario_real,
        CONCAT(
            'El usuario: ', SUBSTRING_INDEX(usuario_real, '@', 1),
            ' (', rol_usuario, ')',
            ' ha eliminado el método de pago. ID=', OLD.ID,
            ', user_ID=', OLD.user_ID,
            ', payment_method_type_ID=', OLD.payment_method_type_ID,
            ', label=', COALESCE(OLD.label, 'NULL')
        ),
        b'1'
    );
END
```
### `trg_wishlist_after_insert`
- Tabla: `tbd_users_wishlist_products`; evento: INSERT; momento: AFTER.
```sql
TRIGGER `trg_wishlist_after_insert` AFTER INSERT ON `tbd_users_wishlist_products` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (table_name, record_id, table_operation, db_user, operation_description, operation_status)
    VALUES (
        'tbd_users_wishlist_products', NEW.product_ID, 'Create', usuario_real,
        CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - agregó a favoritos (user_ID=', NEW.user_ID, ', product_ID=', NEW.product_ID, ')'),
        b'1'
    );
END
```
### `trg_wishlist_after_update`
- Tabla: `tbd_users_wishlist_products`; evento: UPDATE; momento: AFTER.
```sql
TRIGGER `trg_wishlist_after_update` AFTER UPDATE ON `tbd_users_wishlist_products` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (table_name, record_id, table_operation, db_user, operation_description, operation_status)
    VALUES (
        'tbd_users_wishlist_products', NEW.product_ID, 'Update', usuario_real,
        CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - actualizó favoritos (user_ID=', NEW.user_ID, ', product_ID=', NEW.product_ID, ', status=', NEW.status, ')'),
        b'1'
    );
END
```
### `trg_wishlist_after_delete`
- Tabla: `tbd_users_wishlist_products`; evento: DELETE; momento: AFTER.
```sql
TRIGGER `trg_wishlist_after_delete` AFTER DELETE ON `tbd_users_wishlist_products` FOR EACH ROW BEGIN
    DECLARE rol_usuario VARCHAR(50);
    DECLARE usuario_real VARCHAR(255);

    SET usuario_real = USER();

    SELECT FROM_USER INTO rol_usuario
    FROM mysql.role_edges
    WHERE TO_USER = SUBSTRING_INDEX(usuario_real, '@', 1)
      AND TO_HOST = '%'
    LIMIT 1;

    IF rol_usuario IS NULL THEN
        SET rol_usuario = 'Sin rol';
    END IF;

    INSERT INTO tb_logs (table_name, record_id, table_operation, db_user, operation_description, operation_status)
    VALUES (
        'tbd_users_wishlist_products', OLD.product_ID, 'Delete', usuario_real,
        CONCAT(SUBSTRING_INDEX(usuario_real, '@', 1), ': ', rol_usuario, ' - eliminó de favoritos (user_ID=', OLD.user_ID, ', product_ID=', OLD.product_ID, ')'),
        b'1'
    );
END
```

## 9. Procedimientos, funciones y eventos programados
- Procedimientos: ninguno definido en el respaldo.
- Funciones: ninguno definido en el respaldo.
- Eventos: ninguno definido en el respaldo.

## 10. Inconsistencias y observaciones
- Se ignoran los datos INSERT. El volcado no aporta estadisticas de cardinalidad, asi que no es posible deducir filas aproximadas por tabla a partir del esquema.
- Las acciones de FK ausentes en la declaracion se anotan como RESTRICT implicito (comportamiento efectivo predeterminado de MySQL, equivalente a NO ACTION en InnoDB).
- Las FKs autorreferenciales describen jerarquias entre filas de una misma tabla; revisar sus columnas y reglas en la seccion 4-5.
- Se listan todas las definiciones estructurales presentes en el volcado; no se infiere significado de negocio que el SQL no exprese.

## Conteos
| Elemento | Total |
|---|---:|
| Tablas | 25 |
| Vistas | 26 |
| Triggers | 72 |
| Llaves foraneas | 39 |
| Llaves autorreferenciales | 2 |
