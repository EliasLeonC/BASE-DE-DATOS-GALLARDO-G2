| Campo            | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a           | Descripción                     |
| ---------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ---------------------- | ------------------------------- |
| id\_venta        | INT          | –      | ✅  | ✅  | ❌    | ❌     | > 0                   | Venta(id\_venta)       | Venta asociada                  |
| id\_producto     | INT          | –      | ✅  | ✅  | ❌    | ❌     | > 0                   | Producto(id\_producto) | Refacción vendida               |
| cantidad         | INT          | –      | ❌  | ❌  | ❌    | ❌     | ≥ 1                   | –                      | Cantidad vendida                |
| precio\_unitario | DECIMAL      | (10,2) | ❌  | ❌  | ❌    | ❌     | ≥ 0                   | –                      | Precio por unidad en el momento |
