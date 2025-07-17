
**Cliente**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK             | Referencia a | Descripción                |
|-------------|--------------|--------|-----|-----|------|--------|-----------------------------------|---------------|----------------------------|
| NumClientes | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                               | -             | ID único del cliente       |
| Nombre      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3                     | -             | Nombre del cliente         |
| Apellido1   | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3                     | -             | Primer apellido            |
| Apellido2   | NVARCHAR     | 20     | ❌  | ❌  | ✅   | ❌     | -                                 | -             | Segundo apellido           |
| Curp        | NCHAR        | 18     | ❌  | ❌  | ❌   | ✅     | Longitud fija de 18               | -             | CURP del cliente           |
| Telefono    | NCHAR        | 12     | ❌  | ❌  | ❌   | ❌     | Solo números                      | -             | Teléfono del cliente       |
| Calle       | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3                     | -             | Calle del domicilio        |
| Numero      | INT          | -      | ❌  | ❌  | ❌   | ❌     | CHECK (Numero > 0)                | -             | Número exterior            |
| Cuidad      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3                     | -             | Ciudad del cliente         |
