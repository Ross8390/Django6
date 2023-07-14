FROM python:3.11

COPY ./requirements.txt /src/requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r /src/requirements.txt

COPY . /src

ENV MY_ENV=.envs
WORKDIR src

EXPOSE 6060

CMD ["gunicorn", "-b", "0.0.0.0:6060", "stocks_products.wsgi:application"]