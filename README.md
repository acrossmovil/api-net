# api-net

Proyecto de ejemplo para construir una API RESTful con .NET 8 y SQL Server utilizando arquitectura limpia. Desde la raíz del proyecto, ejecuta el script para configurar la solución y los proyectos base:

chmod +x setup-api-net.sh
./setup-api-net.sh

Esto creará la solución y los proyectos ApiNet.Api, ApiNet.Application, ApiNet.Domain y ApiNet.Infrastructure con sus respectivas referencias configuradas. Luego levanta la base de datos ejecutando:

cd db
docker-compose up -d

Esto iniciará un contenedor de SQL Server en el puerto 1433. Puedes verificar que está corriendo con:

docker ps

Asegúrate de configurar la cadena de conexión en el archivo appsettings.json de la API con los siguientes datos:

"ConnectionStrings": {
  "DefaultConnection": "Server=localhost,1433;Database=ApiDemoDb;User Id=sa;Password=Scuanchies$2025;TrustServerCertificate=True;"
}

Para iniciar la API, navega al proyecto principal y ejecuta:

cd src/ApiNet.Api
dotnet run

La API estará disponible en https://localhost:5001/swagger para su exploración y prueba. La estructura resultante del proyecto es la siguiente:

api-net/
├── db/
│   └── docker-compose.yaml
├── src/
│   ├── ApiNet.Api
│   ├── ApiNet.Application
│   ├── ApiNet.Domain
│   └── ApiNet.Infrastructure
├── setup-api-net.sh
├── ApiNet.sln
└── README.md

Este proyecto requiere .NET 8 SDK, Docker y Docker Compose, y opcionalmente herramientas como Postman o Azure Data Studio para probar y administrar la base de datos.
