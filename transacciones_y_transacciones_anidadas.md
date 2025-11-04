# TEMA 3 : Transacciones y Transacciones Anidadas

Una transacción es una unidad lógica de trabajo en la que se agrupan una o varias operaciones de base de datos (como INSERT, UPDATE, DELETE, incluso SELECT en ciertos casos) que deben ejecutarse como un todo. En SQL Server, cualquier modificación de datos puede estar contenida dentro de una transacción explícita o implícita.El objetivo de agruparlas es asegurar que o bien todas las operaciones se efectúan satisfactoriamente, o bien ninguna se aplique  evitando que queden datos en un estado intermedio inconsistente.

<br>

### Propiedades claves ACID
Para que una transacción cumpla su propósito correctamente, debe satisfacer las propiedades conocidas como ACID:
- __Atomicidad:__ La operación es atómica; o se hacen todas las acciones del bloque o ninguna. 
-	__Consistencia:__ La base de datos pasa de un estado válido a otro, respetando todas las reglas de integridad (restricciones, relaciones, índices, etc.). 
- __Aislamiento:__ Las operaciones de una transacción no deben interferir con otras transacciones concurrentes de forma que causen resultados incorrectos. 
-	__Durabilidad:__ Una vez que la transacción se confirma (COMMIT), los cambios persisten incluso en caso de fallos del sistema.

<br>

### Modo de definición en SQL Server
Según la documentación de Microsoft y recursos relacionados, en SQL Server las transacciones pueden darse en distintos modos:
- __Modo Autocommit:__ Es el modo por defecto en SQL Server. Cada instrucción individual DML (INSERT, UPDATE, DELETE) se trata como una transacción completa si no se especifica lo contrario. 
-	__Modo Explícito:__ El desarrollador usa BEGIN TRANSACTION, luego ejecuta varias instrucciones, y finalmente emplea COMMIT o ROLLBACK.
- __Modo Implícito:__ Cuando se habilita este modo (SET IMPLICIT_TRANSACTIONS ON), cada sentencia modifica los datos inicia automáticamente una transacción, que debe finalizarse explícitamente.
