# Práctica 04 — Base de datos `db_test_7b`

## Documentos generados

- [Diagrama de relaciones](https://rodolfo-hh.github.io/Practica_BDN_240836/Practica04/relaciones-respaldo6.html)
- [Diccionario de datos](https://rodolfo-hh.github.io/Practica_BDN_240836/Practica04/diccionario_datos_respaldo6.html)


Documentación generada a partir de `backups/Respaldo-05.sql` (MySQL 8.0.44). Los nombres de diccionarios y diagramas conservan `respaldo6` para no romper enlaces existentes; su contenido corresponde al respaldo 5.

## Contenido

- `diccionario_datos_respaldo6.csv`, `.md` y `.html`: 25 tablas, 207 columnas, llaves, nulabilidad, defaults, índices, restricciones, vistas y triggers.
- `relaciones_respaldo6.mmd` y `relaciones-respaldo6.html`: diagrama entidad-relación sin dependencias externas.
- `index.html`: índice de los documentos.
- `resumen_respaldo5.md`: resumen de la práctica.

## Visor de casos

Abre `index.html` y selecciona el diccionario HTML o el modelo ER. En la sección “Vistas de práctica (Caso 1 a Caso 5)”, pulsa un botón para ver la definición SQL y los resultados incrustados. Los datos provienen de los `INSERT` de `tb_logs` del respaldo y las filas están reconstruidas según los filtros y expresiones de las vistas; el visor funciona localmente, sin MySQL ni red.

## Inventario

El respaldo contiene 25 tablas, 39 llaves foráneas, 31 vistas únicas, 72 triggers y no contiene procedimientos ni funciones. Los cinco casos tienen resultados verificables: 64, 22, 14, 23 y 17 filas respectivamente.
