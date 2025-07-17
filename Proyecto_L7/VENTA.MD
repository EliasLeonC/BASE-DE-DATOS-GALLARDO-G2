| Campo       | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a         | Descripción                   |
| ----------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | -------------------- | ----------------------------- |
| id\_venta   | INT          | –      | ✅  | ❌  | ❌    | ✅     | > 0                   | –                    | Identificador de la venta     |
| fecha       | DATE         | –      | ❌  | ❌  | ❌    | ❌     | –                     | –                    | Fecha de la transacción       |
| id\_cliente | INT          | –      | ❌  | ✅  | ❌    | ❌     | –                     | Cliente(id\_cliente) | Cliente que realizó la compra |
| total       | DECIMAL      | (12,2) | ❌  | ❌  | ❌    | ❌     | ≥ 0                   | –                    | Monto total calculado         |
