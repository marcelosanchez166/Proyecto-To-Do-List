FROM python:latest

# Instalar las dependencias de mysqlclient
# RUN apk add --no-cache pkgconf mariadb-connector-c-dev gcc

WORKDIR /app
COPY requirements.txt requirements.txt
# RUN python3 -m pip install -r requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
# Usar python como ENTRYPOINT
ENTRYPOINT ["python"]
# Pasar el nombre del archivo .py como argumento en el CMD
CMD ["./App_To_Do_List/app.py"]
EXPOSE 5001