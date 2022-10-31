FROM python:3.8

RUN mkdir /app
WORKDIR /app
COPY . .
ENV ENVIRONMENT=DEV
ENV HOST=localhost
ENV PORT=8000
ENV REDIS_HOST=localhost
ENV REDIS_PORT=6379
ENV REDIS_DB=0
EXPOSE 8000
RUN pip install -r requirements.txt
CMD ["python", "hello.py"]
