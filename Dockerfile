FROM python:3

WORKDIR /usr/src/app

COPY poetry.lock pyproject.toml /usr/src/app/

RUN apt-get -y update

RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi

COPY . .

EXPOSE 5000

CMD ["python", "./app.py"]