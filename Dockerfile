# syntax=docker/dockerfile:1

ARG NODE_VERSION=22.13.1

# Etapa base con Node (para instalar deps y build)
FROM node:${NODE_VERSION}-alpine AS build
WORKDIR /app

# Copio dependencias primero para aprovechar el caché de Docker
COPY package*.json ./
RUN npm install --legacy-peer-deps

# Copio el resto y compilo Angular a archivos estáticos
COPY . .
RUN npm run build

# Etapa final: Nginx solo para servir la app ya compilada
FROM nginx:alpine

# Reemplazo config por la nuestra para SPA
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copio los archivos compilados desde el build
COPY --from=build /app/dist/angular-conduit/browser /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]