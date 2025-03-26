# Crear Base de Datos en Docker

Este proyecto utiliza Docker para gestionar una base de datos PostgreSQL. A continuación, se detallan los pasos para construir la imagen y ejecutar el contenedor.

## Requisitos Previos

- [Docker](https://www.docker.com/) instalado en tu sistema.

## Pasos para Configurar la Base de Datos

1. **Construir la Imagen de Docker**

   Navega al directorio que contiene el `Dockerfile` y ejecuta el siguiente comando:

   ```bash
   docker build -t postgres_powip .
   ```

2. **Crear el contenedor para la imagen "postgres_powip"**

   Hacer referencia al nombre o id de la imagen para levantarlo

   ```bash
      
   ```

## Comandos extras
1. **Log del contendor**

   Asegurate de reemplazar `name_contaier` para el seguimiento del contenedor en especifico.

   ```bash
   docker logs name_container
   ```

2. **Levantar el contenedor ya creado**

   Hacegurate listar los contendedores y eligir

   ```bash
   docker ps -a
   ```

   Asegurate de reemplazar `name_contaier` para levantar el contenedor en especifico.

   ```bash
   docker start name_contaier
   ```

# config-data-base
