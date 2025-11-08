## TEMA 4: Manejo de datos JSON
Los datos en formato JSON (JavaScript Object Notation) son documentos semi-estructurados que pueden almacenarse en una base de datos relacional como SQL Server. Aunque tradicionalmente SQL Server no tenía un tipo de dato específico “JSON”, desde la versión 2016 ofrece funciones para tratar cadenas con formato JSON (por ejemplo, JSON_VALUE, JSON_QUERY, OPENJSON, ISJSON). 
En este sentido, “manejo de datos JSON” se refiere a:
* almacenar documentos JSON en columnas (por ejemplo tipo NVARCHAR(MAX)),
* extraer valores o estructuras desde esos documentos usando funciones,
* integrar esos datos semi-estructurados con los datos relacionales clásicos.
