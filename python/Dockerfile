FROM python:3.10.0-alpine3.15

WORKDIR /app

RUN pip install flask

COPY . .

EXPOSE 5000

ENTRYPOINT [ "python", "main.py" ]