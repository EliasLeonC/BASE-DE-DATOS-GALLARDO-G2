
#Vehiculo

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a           | Descripción                        |
|---------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------------|------------------------------------|
| NoVehiculo    | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                       | -                       | ID único del vehículo              |
| Placa         | NCHAR        | 6      | ❌  | ❌  | ❌   | ✅     | Formato tipo "ABC123"                     | -                       | Placa del vehículo                 |
| Marca         | NCHAR        | 15     | ❌  | ❌  | ❌   | ❌     | Solo letras                               | -                       | Marca del vehículo                 |
| Modelo        | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                                         | -                       | Modelo del vehículo                |
| Año           | INT          | -      | ❌  | ❌  | ❌   | ❌     | CHECK (Año BETWEEN 1980 AND 2050)         | -                       | Año del vehículo                   |
| NumClientes   | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                       | Cliente(NumClientes)     | Cliente propietario del vehículo   |
| NumSucursal   | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                       | Sucursal(NoSucursal)     | Sucursal asignada al vehículo     |
