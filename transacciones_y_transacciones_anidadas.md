# TEMA 3 : Transacciones y Transacciones Anidadas

Una transacción es una unidad lógica de trabajo en la que se agrupan una o varias operaciones de base de datos (como INSERT, UPDATE, DELETE, incluso SELECT en ciertos casos) que deben ejecutarse como un todo. En SQL Server, cualquier modificación de datos puede estar contenida dentro de una transacción explícita o implícita.El objetivo de agruparlas es asegurar que o bien todas las operaciones se efectúan satisfactoriamente, o bien ninguna se aplique  evitando que queden datos en un estado intermedio inconsistente.
