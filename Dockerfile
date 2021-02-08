FROM python:3.8-alpine

WORKDIR /app

COPY /app/requirements.txt .

RUN pip install -r /app/requirements.txt

ENV PORT 9000

COPY app .

CMD gunicorn -b :$PORT main:app
