FROM postgres:16

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=root
ENV POSTGRES_DB=powip

COPY backup.sql /docker-entrypoint-initdb.d/backup.sql

EXPOSE 5432

#FROM postgres:16
#COPY init.sql /docker-entrypoint-initdb.d/
#EXPOSE 5432

