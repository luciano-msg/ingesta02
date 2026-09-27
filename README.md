# ingesta02 — Ingesta de MySQL a S3 (Pull)

Lee todos los registros de una tabla MySQL, los guarda en un CSV y sube ese CSV a un bucket S3.

## Ejecución

```bash
docker network create red_ingesta

docker run -d --name mysql_ingesta --network red_ingesta \
  -e MYSQL_ROOT_PASSWORD=utec \
  -v /home/ubuntu/ingesta02/init.sql:/docker-entrypoint-initdb.d/init.sql \
  mysql:8.0

docker build -t ingesta02 .

docker run --rm --network red_ingesta \
  -v /home/ubuntu/.aws/credentials:/root/.aws/credentials \
  ingesta02
```

## Variables de entorno (opcionales)

| Variable | Default |
|---|---|
| `DB_HOST` | `mysql_ingesta` |
| `DB_PORT` | `3306` |
| `DB_USER` | `root` |
| `DB_PASSWORD` | `utec` |
| `DB_NAME` | `tienda` |
| `DB_TABLE` | `clientes` |
| `BUCKET` | `lsanchez-output-02` |

Ejemplo: `docker run --rm --network red_ingesta -e BUCKET=otro-bucket -v ... ingesta02`
