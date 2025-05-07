#!/bin/bash

# Nombre base del proyecto
SOLUTION_NAME="ApiNet"
BASE_DIR="$(pwd)"
SRC_DIR="$BASE_DIR/src"

echo "🔧 Creando solución y proyectos en: $BASE_DIR"

# Crear archivo de solución
dotnet new sln -n $SOLUTION_NAME

# Crear carpeta src y proyectos
mkdir -p "$SRC_DIR"
cd "$SRC_DIR"

dotnet new webapi -n ${SOLUTION_NAME}.Api
dotnet new classlib -n ${SOLUTION_NAME}.Application
dotnet new classlib -n ${SOLUTION_NAME}.Domain
dotnet new classlib -n ${SOLUTION_NAME}.Infrastructure

# Volver al directorio raíz
cd "$BASE_DIR"

# Agregar proyectos a la solución
dotnet sln add src/${SOLUTION_NAME}.Api
dotnet sln add src/${SOLUTION_NAME}.Application
dotnet sln add src/${SOLUTION_NAME}.Domain
dotnet sln add src/${SOLUTION_NAME}.Infrastructure

# Referencias entre proyectos
dotnet add src/${SOLUTION_NAME}.Api reference src/${SOLUTION_NAME}.Application
dotnet add src/${SOLUTION_NAME}.Application reference src/${SOLUTION_NAME}.Domain
dotnet add src/${SOLUTION_NAME}.Application reference src/${SOLUTION_NAME}.Infrastructure
dotnet add src/${SOLUTION_NAME}.Infrastructure reference src/${SOLUTION_NAME}.Domain

# Crear README.md
cat << 'EOF' > README.md
# api-net

Proyecto de ejemplo para construir una API REST en .NET 8 con conexión a SQL Server utilizando arquitectura limpia y buenas prácticas profesionales.

Este proyecto incluye:

- Arquitectura en capas (API, Application, Domain, Infrastructure)
- Conexión a SQL Server mediante Entity Framework Core
- Contenedor Docker para base de datos SQL Server
- Swagger para documentación de endpoints

## 🚀 Instalación de la Base de Datos SQL Server

Para levantar la base de datos SQL Server localmente utilizando Docker Compose, ejecuta los siguientes comandos desde la raíz del proyecto:

```bash
cd db
docker-compose up -d
