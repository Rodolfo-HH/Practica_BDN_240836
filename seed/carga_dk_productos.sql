USE db_test_7b;

-- ==========================================================
-- CARGA DE PRODUCTOS TECNOLÓGICOS Y GAMING
-- ==========================================================

-- Eliminar la tabla si ya existe
DROP TABLE IF EXISTS tb_products;

-- ==========================================================
-- CREACIÓN DE LA TABLA DE PRODUCTOS
-- ==========================================================

CREATE TABLE tb_products (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    SKU VARCHAR(50) NOT NULL,
    name VARCHAR(250) NOT NULL,
    description TEXT NOT NULL,
    current_price DECIMAL(10,2) NOT NULL,
    current_stock INT NOT NULL,
    status BIT(1) DEFAULT b'1',
    creation_date DATETIME NOT NULL,
    last_update DATETIME DEFAULT NULL,

    PRIMARY KEY (ID),
    UNIQUE KEY uk_products_sku (SKU)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

-- ==========================================================
-- CARGA DEL ARCHIVO CSV
-- ==========================================================

LOAD DATA LOCAL INFILE 'productos_tecnologicos_gaming_5000.csv'
INTO TABLE tb_products
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    ID,
    SKU,
    name,
    description,
    current_price,
    current_stock,
    status,
    creation_date,
    last_update
);

-- ==========================================================
-- VERIFICACIÓN DE LA CARGA
-- ==========================================================

SELECT COUNT(*) AS total_productos
FROM tb_products;

