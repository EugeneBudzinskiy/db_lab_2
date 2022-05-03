from matplotlib import pyplot as plt
from modules.classes import LoggerEngine
from modules.config import *

from modules.functions import create_connection
from modules.functions import execute_query


def get_sql_query():
    query = f'''
        SELECT region_name AS region, year, AVG(score_200) AS avg_score FROM
            (SELECT student_id, region_name, year FROM 
                (SELECT student_id, reg_location_id, year FROM {TABLE_NAME}) AS t1
                LEFT JOIN (SELECT location_id, region_name FROM {LOCATIONS_TABLE_NAME}) AS t2
                ON t1.reg_location_id = t2.location_id) AS t3
            LEFT JOIN (SELECT student_id, score_200 FROM {TESTS_TABLE_NAME} 
                          WHERE name = 'Українська мова і література' AND 
                                status = 'Зараховано') AS t4
            ON t3.student_id = t4.student_id GROUP BY region, year ORDER BY region;
    '''
    return query


def save_bar(filepath: str, labels: list, a_values: list, b_values: list, title: str = 'Title',
             a_label: str = 'A values', b_label: str = 'B values', y_label: str = 'y label',
             vertical_labels: bool = False, size_inches: tuple = None, bar_width: float = .4):
    x = [x for x in range(len(labels))]
    fig, ax = plt.subplots()
    if size_inches is not None:
        fig.set_size_inches(*size_inches)

    ax.bar([x - bar_width / 2 for x in x], a_values, bar_width, label=a_label)
    ax.bar([x + bar_width / 2 for x in x], b_values, bar_width, label=b_label)

    ax.set_ylabel(y_label)
    ax.set_title(title)
    ax.set_xticks(x)
    rotation = 'vertical' if vertical_labels else 'horizontal'
    ax.set_xticklabels(labels, rotation=rotation)
    ax.legend()

    fig.tight_layout()
    plt.savefig(filepath)


def convert_result(result: list, cutout_word: str, a_key, b_key):
    res_dict = dict()
    for el in result:
        region, year, score = el
        region = region.replace(cutout_word, '').strip()
        if region not in res_dict:
            res_dict[region] = dict()
        res_dict[region][year] = score

    labels = list(res_dict.keys())
    a_values, b_values = list(), list()

    for el in labels:
        a_values.append(res_dict[el][a_key])
        b_values.append(res_dict[el][b_key])

    return labels, a_values, b_values


def main():
    logger_engine = LoggerEngine()
    connection = create_connection()

    # Get result data (based on query)
    a_key, b_key = 2019, 2020
    title = 'Comparisons average score of Ukrainian Language test'
    y_label = 'Average score'

    with connection as conn:
        res = execute_query(connection=conn, sql_query=get_sql_query())

    # Save bar plot of results
    labels, a_values, b_values = \
        convert_result(result=res, cutout_word='область', a_key=a_key, b_key=b_key)
    save_bar(filepath=RESULT_PLOT_PATH, labels=labels, a_values=a_values, b_values=b_values, title=title,
             a_label=str(a_key), b_label=str(b_key),  y_label=y_label, vertical_labels=True, size_inches=(12, 6))
    logger_engine.print_info('Bar plot is saved!')


if __name__ == '__main__':
    main()
