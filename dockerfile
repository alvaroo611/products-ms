FROM node:21-alpine3.19

WORKDIR /usr/src/app  

COPY package.json ./
COPY package-lock.json ./  



RUN npm install


COPY . .

ENV DATABASE_URL="file:./dev.db"

# Generar el cliente Prisma
RUN npx prisma generate

# Ejecutar las migraciones
RUN npx prisma migrate dev



EXPOSE 3001
