# Usar una imagen base de Python
FROM python:3.8-slim

# Establecer el directorio de trabajo en el contenedor
WORKDIR /App

# Copiar el archivo de dependencias primero para aprovechar la caché de Docker
COPY App/requirements.txt .

# Instalar las dependencias
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copiar el resto del código fuente del proyecto al contenedor
COPY App/ .

# Expone el puerto 8880
EXPOSE 8880

# Comando para ejecutar la aplicación usando gunicorn en el puerto 8880 con recarga automática
CMD ["gunicorn", "--bind", "0.0.0.0:8880", "--reload", "--log-level=debug", "app:app"]
