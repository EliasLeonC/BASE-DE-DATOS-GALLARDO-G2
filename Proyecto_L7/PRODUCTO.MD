| Campo         | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a             | Descripción                   |
| ------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------------------ | ----------------------------- |
| id\_producto  | INT          | –      | ✅  | ❌  | ❌    | ✅     | > 0                   | –                        | Identificador de la refacción |
| nombre        | VARCHAR      | 100    | ❌  | ❌  | ❌    | ❌     | Longitud ≥ 3          | –                        | Nombre de la refacción        |
| descripcion   | TEXT         | –      | ❌  | ❌  | ✅    | ❌     | –                     | –                        | Detalle opcional              |
| precio        | DECIMAL      | (10,2) | ❌  | ❌  | ❌    | ❌     | ≥ 0                   | –                        | Precio unitario               |
| stock         | INT          | –      | ❌  | ❌  | ❌    | ❌     | ≥ 0                   | –                        | Cantidad en inventario        |
| id\_tipo      | INT          | –      | ❌  | ✅  | ❌    | ❌     | –                     | TipoVehiculo(id\_tipo)   | Tipo de vehículo asociado     |
| id\_marca     | INT          | –      | ❌  | ✅  | ❌    | ❌     | –                     | Marca(id\_marca)         | Marca de la refacción         |
| id\_proveedor | INT          | –      | ❌  | ✅  | ❌    | ❌     | –                     | Proveedor(id\_proveedor) | Proveedor principal           |
