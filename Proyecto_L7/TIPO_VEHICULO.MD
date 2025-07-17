| Campo       | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK     | Referencia a | Descripción                       |
| ----------- | ------------ | ------ | -- | -- | ---- | ----- | ------------------------- | ------------ | --------------------------------- |
| id\_tipo    | INT          | –      | ✅  | ❌  | ❌    | ✅     | > 0                       | –            | Identificador de tipo de vehículo |
| descripcion | VARCHAR      | 20     | ❌  | ❌  | ❌    | ✅     | IN('Automotriz','Camión') | –            | Nombre del tipo de vehículo       |
