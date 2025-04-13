FROM python:3.11-slim
WORKDIR /vote
COPY . /vote
EXPOSE 5000
RUN apt-get update && apt-get install curl -y
RUN pip install -r requirements.txt
CMD ["python", "app.py"]