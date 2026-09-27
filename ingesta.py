import os
import csv
import boto3
import mysql.connector

host = os.getenv("DB_HOST", "mysql_ingesta")
port = int(os.getenv("DB_PORT", "3306"))
user = os.getenv("DB_USER", "root")
password = os.getenv("DB_PASSWORD", "utec")
database = os.getenv("DB_NAME", "tienda")
tabla = os.getenv("DB_TABLE", "clientes")

ficheroUpload = tabla + ".csv"
nombreBucket = os.getenv("BUCKET", "lsanchez-output-02")

conexion = mysql.connector.connect(
    host=host, port=port, user=user, password=password, database=database
)
cursor = conexion.cursor()
cursor.execute(f"SELECT * FROM `{tabla}`")
columnas = [c[0] for c in cursor.description]
registros = cursor.fetchall()
cursor.close()
conexion.close()

with open(ficheroUpload, "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(columnas)
    writer.writerows(registros)

print(f"{len(registros)} registros leidos de {database}.{tabla} -> {ficheroUpload}")

s3 = boto3.client("s3")
s3.upload_file(ficheroUpload, nombreBucket, ficheroUpload)

print(f"Archivo subido a s3://{nombreBucket}/{ficheroUpload}")
print("Ingesta completada")
