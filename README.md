# Angular RealWorld - Docker Deployment

La aplicación se compila a archivos estáticos, que son servidos por Nginx dentro de un contenedor.
El proceso de build y publicación de la imagen está automatizado con GitHub Actions hacia GitHub Container Registry (GHCR).

## Ejecutar con Docker Compose

Asegurarse de tener Docker y Docker Compose instalados.

Comando para levantar la aplicación:
docker compose up -d

Luego acceder a:
http://localhost:8080

## Imagen en GHCR

Imagen disponible públicamente en:
ghcr.io/matecunille/angular-conduit:latest

Para descargar manualmente la imagen:
docker pull ghcr.io/matecunille/angular-conduit:latest

Para ejecutarla directamente:
docker run -p 8080:8080 ghcr.io/matecunille/angular-conduit:latest

## CI/CD

El workflow docker-publish.yml construye y publica automáticamente la imagen en GHCR cada vez que se actualiza la rama main.

- Build de la imagen Docker utilizando el Dockerfile
- Push automático a GHCR

## Archivos clave

| Archivo                              | Descripción                                    |
| ------------------------------------ | ---------------------------------------------- |
| Dockerfile                           | Compila Angular y sirve los archivos con Nginx |
| docker-compose.yml                   | Despliegue en un solo comando                  |
| .github/workflows/docker-publish.yml | Automatiza el build y push a GHCR              |
