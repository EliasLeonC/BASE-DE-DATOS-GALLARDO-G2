**Sucursal**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                    |
|-------------|--------------|--------|-----|-----|------|--------|------------------------|---------------|--------------------------------|
| NoSucursal  | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                    | -             | ID único de la sucursal        |
| Nombre      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                      | -             | Nombre de la sucursal          |
| Ubicacion   | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                      | -             | Dirección o ubicación general  |
