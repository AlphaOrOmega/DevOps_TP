FROM python:3.9-slim
COPY . /seed
WORKDIR /seed
RUN apt-get update && apt-get install apache2-utils
CMD ["python3", "make-data.py"]
RUN ./generate-votes.sh