FROM python:3.7

WORKDIR /code
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

ADD ./modules ./modules
ADD ./loader .
CMD python main.py