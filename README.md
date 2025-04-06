 
Proyecto: Gestión de Gastos

Este proyecto define el modelo de base de datos para una aplicación de **gestión de gastos personales**. Permite registrar usuarios, sus gastos, establecer presupuestos, clasificar por categorías y usar distintas monedas.

---

Estructura del Proyecto

/scripts 

     ├── create_database.sql # Crea la base de datos y sus tablas 
     
     ├── seed_data.sql # Inserta datos iniciales: monedas y categorías
     
/README.md


---

Cómo ejecutar los scripts

Requisitos previos:
> - Tener instalado Microsoft SQL Server.
> - Usar SQL Server Management Studio (SSMS) o un cliente similar para ejecutar los scripts.

 1. Crear la base de datos y las tablas

1. Abre `create_database.sql` en SSMS.
2. Ejecuta el script completo presionando F5 o haciendo clic en "Ejecutar".
3. Esto creará:
   - La base de datos `GestionGastos`
   - Las tablas: `Usuarios`, `Categorias`, `Monedas`, `Gastos`, `Presupuestos`
   - Las relaciones entre ellas y los índices.

 2. Insertar datos iniciales

1. Abre `seed_data.sql` en SSMS.
2. Ejecuta el script completo.
3. Esto insertará datos base en las tablas:
   - Monedas: COP, USD, EUR, etc.
   - Categorías: Alimentación, Transporte, Salud, etc.

---

Descripción del Modelo de Datos

`Usuarios`

- Información de las personas que usan el sistema.
- Campos: `Id`, `Nombre`, `Email`, `PasswordHash`, `FechaRegistro`.

`Categorias`

- Define los tipos de gastos posibles.
- Ejemplos: Alimentación, Transporte, Salud, Educación.
- Campos: `Id`, `Nombre`, `Descripcion`.

`Monedas`

- Monedas disponibles para registrar los gastos.
- Ejemplos: COP (Peso colombiano), USD, EUR, JPY.
- Campos: `Id`, `Codigo`, `Nombre`, `Simbolo`.

`Gastos`

- Cada gasto registrado por un usuario.
- Relacionado con `Usuarios`, `Categorias` y `Monedas`.
- Campos: `Id`, `UsuarioId`, `CategoriaId`, `MonedaId`, `Monto`, `Fecha`, `Descripcion`.

`Presupuestos`

- Límites de gasto por categoría definidos por el usuario.
- Incluye período de tiempo y moneda.
- Campos: `Id`, `UsuarioId`, `CategoriaId`, `MonedaId`, `Limite`, `FechaInicio`, `FechaFin`.

---

Requisitos Técnicos

- Microsoft SQL Server 2019 o superior
- SQL Server Management Studio (SSMS)

---

Notas Adicionales

- Las claves foráneas tienen índices para mejorar el rendimiento en las consultas.
- Puedes extender este modelo fácilmente para integrarlo con una aplicación web o móvil.
- Próximos pasos sugeridos:
  - Agregar datos de prueba en `Usuarios` y `Gastos`.
  - Crear procedimientos almacenados y vistas para reportes.
  - Agregar autenticación y seguridad si se usa en producción.

---

¡Gracias por revisar este proyecto! 🙌
