import os
import psycopg2


def create_connection():
    connection = psycopg2.connect(
        user=os.environ["PG_USER"],
        password=os.environ["PG_PASSWORD"],
        dbname=os.environ["PG_DB"],
        host=os.environ["PG_HOST"],
        port=os.environ["PG_PORT"]
    )
    return connection


def execute_query(connection, sql_query):
    buff = list()
    with connection.cursor() as curs:
        curs.execute(sql_query)
        if curs.description is not None:
            for row in curs:
                buff.append(tuple(map(lambda x: x.strip() if type(x) is str else x, row)))
    return None if len(buff) == 0 else buff
