# TEMA 3 : Transacciones y Transacciones Anidadas

Una transacción es una unidad lógica de trabajo en la que se agrupan una o varias operaciones de base de datos (como INSERT, UPDATE, DELETE, incluso SELECT en ciertos casos) que deben ejecutarse como un todo. En SQL Server, cualquier modificación de datos puede estar contenida dentro de una transacción explícita o implícita.El objetivo de agruparlas es asegurar que o bien todas las operaciones se efectúan satisfactoriamente, o bien ninguna se aplique  evitando que queden datos en un estado intermedio inconsistente.

Propiedades claves ACID
Para que una transacción cumpla su propósito correctamente, debe satisfacer las propiedades conocidas como ACID:
- <u>Atomicidad:</u> La operación es atómica; o se hacen todas las acciones del bloque o ninguna. 
-	<u>Consistencia:</u> La base de datos pasa de un estado válido a otro, respetando todas las reglas de integridad (restricciones, relaciones, índices, etc.). 
- <u>Aislamiento:</u> Las operaciones de una transacción no deben interferir con otras transacciones concurrentes de forma que causen resultados incorrectos. 
-	<u>Durabilidad:</u> Una vez que la transacción se confirma (COMMIT), los cambios persisten incluso en caso de fallos del sistema.

