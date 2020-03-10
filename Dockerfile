# Specify a base image
FROM python:3-alpine
# Install dependencies
COPY ./requirements.txt ./

RUN set -e; \
	apk add --no-cache --virtual .build-deps \
		gcc \
		libc-dev \
		linux-headers \
	; \
	pip install -r requirements.txt; \
	apk del .build-deps



# RUN pip install -r requirements.txt
ENV FLASK_APP ./app.py
COPY ./ ./
# Default command

EXPOSE 5000
ENTRYPOINT [ "python3" ]
CMD ["app.py"]

