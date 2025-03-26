FROM postgres:16
COPY .env /app/.env
COPY init.sql /docker-entrypoint-initdb.d/
EXPOSE 5432
WORKDIR /app
CMD export $(cat /app/.env | xargs) && docker-entrypoint.sh postgres

#FROM postgres:16
#COPY init.sql /docker-entrypoint-initdb.d/
#EXPOSE 5432

