# Usa una imagen oficial de Node.js como base
FROM node:18-alpine

# Crea y establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos package.json y pnpm-lock.yaml (si existe)
COPY package.json pnpm-lock.yaml ./

# Instala pnpm
RUN npm install -g pnpm

# Instala las dependencias del proyecto usando pnpm
RUN pnpm install

# Copia el resto de los archivos del proyecto al contenedor
COPY . .

# Establece las variables de entorno necesarias
ENV NODE_ENV=production

# Expone el puerto en el que corre la aplicación
EXPOSE 3000

# Comando para ejecutar la aplicación en producción
CMD ["pnpm", "dev"]
