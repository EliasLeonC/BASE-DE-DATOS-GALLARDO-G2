| Campo         | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                 |
| ------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ------------ | --------------------------- |
| id\_proveedor | INT          | –      | ✅  | ❌  | ❌    | ✅     | > 0                   | –            | Identificador del proveedor |
| nombre        | VARCHAR      | 100    | ❌  | ❌  | ❌    | ❌     | Longitud ≥ 3          | –            | Razón social del proveedor  |
| telefono      | VARCHAR      | 15     | ❌  | ❌  | ✅    | ❌     | Formato numérico      | –            | Teléfono de contacto        |
| email         | VARCHAR      | 100    | ❌  | ❌  | ✅    | ❌     | LIKE '%*@*%.\_%'      | –            | Correo electrónico          |
| direccion     | VARCHAR      | 200    | ❌  | ❌  | ✅    | ❌     | –                     | –            | Domicilio del proveedor     |
