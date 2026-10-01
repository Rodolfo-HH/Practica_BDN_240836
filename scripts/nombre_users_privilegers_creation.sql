USE db_test_7b;

-- ============================================================
-- CREACIÓN DE USUARIOS REMOTOS
-- ============================================================

CREATE USER IF NOT EXISTS 'Rodolfo.Hernandez'@'%' 
IDENTIFIED BY 'Rimuru30';

CREATE USER IF NOT EXISTS 'Marco.Ramirez'@'%' 
IDENTIFIED BY 'qwerely';

CREATE USER IF NOT EXISTS 'user02'@'%' 
IDENTIFIED BY '12345';

CREATE USER IF NOT EXISTS 'user03'@'%' 
IDENTIFIED BY '12345';

CREATE USER IF NOT EXISTS 'user04'@'%' 
IDENTIFIED BY '12345';


-- ============================================================
-- PRIVILEGIOS DIRECTOS
-- ============================================================

-- RODOLFO: SUPER USUARIO
GRANT ALL PRIVILEGES ON *.* 
TO 'Rodolfo.Hernandez'@'%';


-- USER03: SELECT, INSERT, UPDATE Y DELETE
GRANT SELECT, INSERT, UPDATE, DELETE
ON db_test_7b.*
TO 'user03'@'%';


-- ============================================================
-- CREACIÓN DE ROLES
-- ============================================================

CREATE ROLE IF NOT EXISTS 'superadmin';

CREATE ROLE IF NOT EXISTS 'admin';

CREATE ROLE IF NOT EXISTS 'seller01';

CREATE ROLE IF NOT EXISTS 'seller02';

CREATE ROLE IF NOT EXISTS 'buyer';

CREATE ROLE IF NOT EXISTS 'support';

CREATE ROLE IF NOT EXISTS 'common';

CREATE ROLE IF NOT EXISTS 'user_not_registered';


-- ============================================================
-- PRIVILEGIOS DE LOS ROLES
-- ============================================================

-- ============================================================
-- SUPERADMIN
-- ============================================================

GRANT ALL PRIVILEGES ON *.* 
TO 'superadmin';


-- ============================================================
-- ADMIN
-- ============================================================

GRANT ALL PRIVILEGES ON db_test_7b.* 
TO 'admin';


-- ============================================================
-- SUPPORT
-- ============================================================

GRANT SELECT, INSERT, UPDATE 
ON db_test_7b.tb_users 
TO 'support';

GRANT SELECT, INSERT, UPDATE 
ON db_test_7b.tb_products 
TO 'support';


-- ============================================================
-- SELLER
-- ============================================================

GRANT SELECT, INSERT, UPDATE, DELETE 
ON db_test_7b.tb_products 
TO 'seller01';

GRANT SELECT, INSERT, UPDATE, DELETE 
ON db_test_7b.tb_products 
TO 'seller02';


-- ============================================================
-- ASIGNAR ROLES A LOS USUARIOS
-- ============================================================

-- RODOLFO
GRANT 'superadmin' 
TO 'Rodolfo.Hernandez'@'%';


-- MARCO
GRANT 'admin' 
TO 'Marco.Ramirez'@'%';


-- USER02
GRANT 'support' 
TO 'user02'@'%';


-- USER03
GRANT 'seller01' 
TO 'user03'@'%';


-- USER04
GRANT 'seller02' 
TO 'user04'@'%';


-- ============================================================
-- ESTABLECER ROLES PREDETERMINADOS
-- ============================================================

SET DEFAULT ROLE 'superadmin' 
TO 'Rodolfo.Hernandez'@'%';

SET DEFAULT ROLE 'admin' 
TO 'Marco.Ramirez'@'%';

SET DEFAULT ROLE 'support' 
TO 'user02'@'%';

SET DEFAULT ROLE 'seller01' 
TO 'user03'@'%';

SET DEFAULT ROLE 'seller02' 
TO 'user04'@'%';


-- ============================================================
-- APLICAR CAMBIOS
-- ============================================================

FLUSH PRIVILEGES;


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
    'user02',
    'user03',
    'user04'
);


-- ============================================================
-- VERIFICAR PRIVILEGIOS
-- ============================================================

SHOW GRANTS FOR 'Rodolfo.Hernandez'@'%';

SHOW GRANTS FOR 'Marco.Ramirez'@'%';

SHOW GRANTS FOR 'user02'@'%';

SHOW GRANTS FOR 'user03'@'%';

SHOW GRANTS FOR 'user04'@'%';