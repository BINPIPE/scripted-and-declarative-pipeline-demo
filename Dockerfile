FROM tiangolo/uwsgi-nginx-flask:python3.8-alpine
MAINTAINER Prasanjit "nixgurus@gmail.com"
RUN apk --update add bash nano
# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
