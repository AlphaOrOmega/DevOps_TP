FROM python:3.9-slim
COPY . /seed
WORKDIR /seed
RUN apt update && apt install apache2-utils -y
RUN ["python3", "make-data.py"]
CMD ./generate-votes.sh