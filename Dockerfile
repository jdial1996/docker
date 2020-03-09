# Specify a base image
FROM python:latest
# Install dependencies
COPY ./requirements.txt ./
RUN pip install -r requirements.txt
ENV FLASK_APP ./app.py
COPY ./ ./
# Default command

EXPOSE 5000
ENTRYPOINT [ "python3" ]
CMD ["app.py"]