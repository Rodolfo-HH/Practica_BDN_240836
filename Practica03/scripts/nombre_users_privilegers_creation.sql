USE db_test_7b;

-- ============================================================
-- CREACIÓN DE USUARIOS REMOTOS
-- ============================================================

CREATE USER IF NOT EXISTS 'Rodolfo.Hernandez'@'%' 
IDENTIFIED BY '240836';

CREATE USER IF NOT EXISTS 'Marco.Ramirez'@'%' 
IDENTIFIED BY 'Qwerely';

CREATE USER IF NOT EXISTS 'Victor.Hernandez'@'%' 
IDENTIFIED BY '240852';

CREATE USER IF NOT EXISTS 'Diego.Garrido'@'%' 
IDENTIFIED BY '240709';

CREATE USER IF NOT EXISTS 'Oliver.Sanchez'@'%' 
IDENTIFIED BY '240615';


-- ============================================================
-- CREACIÓN DE ROLES
-- ============================================================

CREATE ROLE IF NOT EXISTS 'superadmin';
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'seller';
CREATE ROLE IF NOT EXISTS 'buyer';
CREATE ROLE IF NOT EXISTS 'support';
CREATE ROLE IF NOT EXISTS 'common';
CREATE ROLE IF NOT EXISTS 'user_not_registered';


-- ============================================================
-- PRIVILEGIOS DE LOS ROLES
-- ============================================================

-- SUPERADMIN: todos los privilegios sobre todo el servidor
GRANT ALL PRIVILEGES ON *.* 
TO 'superadmin';

-- ADMIN: todos los privilegios sobre la base db_test_7b
GRANT ALL PRIVILEGES ON db_test_7b.* 
TO 'admin';

-- SUPPORT: SELECT, INSERT, UPDATE sobre tb_users, tb_products, tb_categories, tbd_products_categories
GRANT SELECT, INSERT, UPDATE 
ON db_test_7b.tb_users 
TO 'support';

GRANT SELECT, INSERT, UPDATE 
ON db_test_7b.tb_products 
TO 'support';

GRANT SELECT, INSERT, UPDATE 
ON db_test_7b.tbc_categories 
TO 'support';


-- SELLER: CRUD sobre tb_products
GRANT SELECT, INSERT, UPDATE, DELETE 
ON db_test_7b.tb_products 
TO 'seller';

-- BUYER: solo lectura sobre tb_products
GRANT SELECT 
ON db_test_7b.tb_products 
TO 'buyer';

-- COMMON: solo lectura sobre tb_products
GRANT SELECT 
ON db_test_7b.tb_products 
TO 'common';

-- USER_NOT_REGISTERED: solo lectura sobre tb_products (catálogo público)
GRANT SELECT 
ON db_test_7b.tb_products 
TO 'user_not_registered';


-- ============================================================
-- ASIGNACIÓN DE ROLES A LOS USUARIOS
-- ============================================================

-- RODOLFO → SUPERADMIN
GRANT 'superadmin' 
TO 'Rodolfo.Hernandez'@'%';

-- MARCO → ADMIN
GRANT 'admin' 
TO 'Marco.Ramirez'@'%';

-- VICTOR → SUPPORT
GRANT 'support' 
TO 'Victor.Hernandez'@'%';

-- DIEGO → SELLER
GRANT 'seller' 
TO 'Diego.Garrido'@'%';

-- OLIVER → SELLER
GRANT 'seller' 
TO 'Oliver.Sanchez'@'%';


-- ============================================================
-- ESTABLECER ROLES PREDETERMINADOS
-- ============================================================

SET DEFAULT ROLE 'superadmin' 
TO 'Rodolfo.Hernandez'@'%';

SET DEFAULT ROLE 'admin' 
TO 'Marco.Ramirez'@'%';

SET DEFAULT ROLE 'support' 
TO 'Victor.Hernandez'@'%';

SET DEFAULT ROLE 'seller' 
TO 'Diego.Garrido'@'%';

SET DEFAULT ROLE 'seller' 
TO 'Oliver.Sanchez'@'%';


-- ============================================================
-- VERIFICACIÓN
-- ============================================================

SELECT 
    User, 
    Host
FROM mysql.user
WHERE User IN (
    'Rodolfo.Hernandez',
    'Marco.Ramirez',
    'Victor.Hernandez',
    'Diego.Garrido',
    'Oliver.Sanchez'
);

SHOW GRANTS FOR 'Rodolfo.Hernandez'@'%';
SHOW GRANTS FOR 'Marco.Ramirez'@'%';
SHOW GRANTS FOR 'Victor.Hernandez'@'%';
SHOW GRANTS FOR 'Diego.Garrido'@'%';
SHOW GRANTS FOR 'Oliver.Sanchez'@'%';