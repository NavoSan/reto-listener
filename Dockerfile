FROM python:3.8-slim

RUN apt-get update && apt-get install -y git

WORKDIR /app/repo

COPY app/repo/requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY app/ .

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 8880
CMD ["gunicorn", "--bind", "0.0.0.0:8880", "--reload", "--log-level=debug", "app:app"]
