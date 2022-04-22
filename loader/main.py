from modules.classes import FileArray
from modules.classes import LoggerEngine
from modules.config import *

from modules.functions import create_connection
from modules.functions import execute_query


def get_table_scheme(table_name, columns_list, columns_types_list):
    result_query = f"CREATE TABLE IF NOT EXISTS {table_name} ("
    ln = len(columns_list)
    for i in range(ln):
        result_query += f'{columns_list[i]} {columns_types_list[i]}'
        if i == 0:
            result_query += " PRIMARY KEY"
        if i != ln - 1:
            result_query += ', '
    result_query += ');'
    return result_query


def get_sql_length(table_name: str):
    return f'''SELECT COUNT(*) FROM {table_name};'''


def import_csv(connection, table_name: str, file_array: FileArray, batch_size: int = 10000):
    with connection.cursor() as curs:
        row_count = execute_query(connection, sql_query=get_sql_length(TABLE_NAME))[0][0]
        file, data_len = file_array.get_data_batch(row_count, batch_size=batch_size)
        next(file)

        if data_len == 0:
            return False

        curs.copy_from(file, table=table_name, sep=file_array.delimiter, null=file_array.nan_value)
        return True


def log_row_count(connection, logger_engine: LoggerEngine):
    row_count = execute_query(connection, sql_query=get_sql_length(TABLE_NAME))[0][0]
    logger_engine.print_info(f'Rows already loaded: {row_count}')


def main():
    file_array = FileArray(
        cols_name=["OUTID", "Birth", "SEXTYPENAME", "REGNAME", "AREANAME", "TERNAME", "REGTYPENAME", "TerTypeName",
                   "ClassProfileNAME", "ClassLangName", "EONAME", "EOTYPENAME", "EORegName", "EOAreaName",
                   "EOTerName", "EOParent",

                   "UkrTest", "UkrTestStatus", "UkrBall100", "UkrBall12", "UkrBall", "UkrAdaptScale", "UkrPTName",
                   "UkrPTRegName", "UkrPTAreaName", "UkrPTTerName",

                   "histTest", "HistLang", "histTestStatus", "histBall100", "histBall12", "histBall", "histPTName",
                   "histPTRegName", "histPTAreaName", "histPTTerName",

                   "mathTest", "mathLang", "mathTestStatus", "mathBall100", "mathBall12", "mathBall", "mathPTName",
                   "mathPTRegName", "mathPTAreaName", "mathPTTerName",

                   "physTest", "physLang", "physTestStatus", "physBall100", "physBall12", "physBall", "physPTName",
                   "physPTRegName", "physPTAreaName", "physPTTerName",

                   "chemTest", "chemLang", "chemTestStatus", "chemBall100", "chemBall12", "chemBall", "chemPTName",
                   "chemPTRegName", "chemPTAreaName", "chemPTTerName",

                   "bioTest", "bioLang", "bioTestStatus", "bioBall100", "bioBall12", "bioBall", "bioPTName",
                   "bioPTRegName", "bioPTAreaName", "bioPTTerName",

                   "geoTest", "geoLang", "geoTestStatus", "geoBall100", "geoBall12", "geoBall", "geoPTName",
                   "geoPTRegName", "geoPTAreaName", "geoPTTerName",

                   "engTest", "engTestStatus", "engBall100", "engBall12", "engDPALevel", "engBall", "engPTName",
                   "engPTRegName", "engPTAreaName", "engPTTerName",

                   "fraTest", "fraTestStatus", "fraBall100", "fraBall12", "fraDPALevel", "fraBall", "fraPTName",
                   "fraPTRegName", "fraPTAreaName", "fraPTTerName",

                   "deuTest", "deuTestStatus", "deuBall100", "deuBall12", "deuDPALevel", "deuBall", "deuPTName",
                   "deuPTRegName", "deuPTAreaName", "deuPTTerName",

                   "spaTest", "spaTestStatus", "spaBall100", "spaBall12", "spaDPALevel", "spaBall", "spaPTName",
                   "spaPTRegName", "spaPTAreaName", "spaPTTerName"],
        cols_type=["CHAR(64)", "INTEGER", "CHAR(100)", "CHAR(256)", "CHAR(256)", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)", "CHAR(256)", "CHAR(256)", "CHAR(256)", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(100)", "REAL", "REAL", "REAL", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(256)", "CHAR(100)", "REAL", "REAL", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(256)", "CHAR(100)", "REAL", "REAL", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(256)", "CHAR(100)", "REAL", "REAL", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(256)", "CHAR(100)", "REAL", "REAL", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(256)", "CHAR(100)", "REAL", "REAL", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(256)", "CHAR(100)", "REAL", "REAL", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(100)", "REAL", "REAL", "CHAR(100)", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(100)", "REAL", "REAL", "CHAR(100)", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(100)", "REAL", "REAL", "CHAR(100)", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)",

                   "CHAR(256)", "CHAR(100)", "REAL", "REAL", "CHAR(100)", "REAL", "CHAR(256)", "CHAR(256)", "CHAR(256)",
                   "CHAR(256)"],
        added_cols_name=['year'],
        added_cols_type=['INTEGER'],
        delimiter=';',
        decimal='.',
        nan_value='null'
    )

    file_array.add_file(
        filepath='data/ZNO_2019.csv',
        cols_to_use=["OUTID", "Birth", "SEXTYPENAME", "REGNAME", "AREANAME", "TERNAME", "REGTYPENAME", "TerTypeName",
                     "ClassProfileNAME", "ClassLangName", "EONAME", "EOTYPENAME", "EORegName", "EOAreaName",
                     "EOTerName", "EOParent",

                     "UkrTest", "UkrTestStatus", "UkrBall100", "UkrBall12", "UkrBall", "UkrAdaptScale", "UkrPTName",
                     "UkrPTRegName", "UkrPTAreaName", "UkrPTTerName",

                     "histTest", "HistLang", "histTestStatus", "histBall100", "histBall12", "histBall", "histPTName",
                     "histPTRegName", "histPTAreaName", "histPTTerName",

                     "mathTest", "mathLang", "mathTestStatus", "mathBall100", "mathBall12", "mathBall", "mathPTName",
                     "mathPTRegName", "mathPTAreaName", "mathPTTerName",

                     "physTest", "physLang", "physTestStatus", "physBall100", "physBall12", "physBall", "physPTName",
                     "physPTRegName", "physPTAreaName", "physPTTerName",

                     "chemTest", "chemLang", "chemTestStatus", "chemBall100", "chemBall12", "chemBall", "chemPTName",
                     "chemPTRegName", "chemPTAreaName", "chemPTTerName",

                     "bioTest", "bioLang", "bioTestStatus", "bioBall100", "bioBall12", "bioBall", "bioPTName",
                     "bioPTRegName", "bioPTAreaName", "bioPTTerName",

                     "geoTest", "geoLang", "geoTestStatus", "geoBall100", "geoBall12", "geoBall", "geoPTName",
                     "geoPTRegName", "geoPTAreaName", "geoPTTerName",

                     "engTest", "engTestStatus", "engBall100", "engBall12", "engDPALevel", "engBall", "engPTName",
                     "engPTRegName", "engPTAreaName", "engPTTerName",

                     "fraTest", "fraTestStatus", "fraBall100", "fraBall12", "fraDPALevel", "fraBall", "fraPTName",
                     "fraPTRegName", "fraPTAreaName", "fraPTTerName",

                     "deuTest", "deuTestStatus", "deuBall100", "deuBall12", "deuDPALevel", "deuBall", "deuPTName",
                     "deuPTRegName", "deuPTAreaName", "deuPTTerName",

                     "spaTest", "spaTestStatus", "spaBall100", "spaBall12", "spaDPALevel", "spaBall", "spaPTName",
                     "spaPTRegName", "spaPTAreaName", "spaPTTerName"],
        delimiter=';',
        decimal=',',
        encoding='windows-1251',
        nan_value='null',
        value_to_add=[2019]
    )

    file_array.add_file(
        filepath='data/ZNO_2020.csv',
        cols_to_use=["OUTID", "Birth", "SEXTYPENAME", "REGNAME", "AREANAME", "TERNAME", "REGTYPENAME", "TerTypeName",
                     "ClassProfileNAME", "ClassLangName", "EONAME", "EOTYPENAME", "EORegName", "EOAreaName",
                     "EOTerName", "EOParent",

                     "UkrTest", "UkrTestStatus", "UkrBall100", "UkrBall12", "UkrBall", "UkrAdaptScale", "UkrPTName",
                     "UkrPTRegName", "UkrPTAreaName", "UkrPTTerName",

                     "histTest", "HistLang", "histTestStatus", "histBall100", "histBall12", "histBall", "histPTName",
                     "histPTRegName", "histPTAreaName", "histPTTerName",

                     "mathTest", "mathLang", "mathTestStatus", "mathBall100", "mathBall12", "mathBall", "mathPTName",
                     "mathPTRegName", "mathPTAreaName", "mathPTTerName",

                     "physTest", "physLang", "physTestStatus", "physBall100", "physBall12", "physBall", "physPTName",
                     "physPTRegName", "physPTAreaName", "physPTTerName",

                     "chemTest", "chemLang", "chemTestStatus", "chemBall100", "chemBall12", "chemBall", "chemPTName",
                     "chemPTRegName", "chemPTAreaName", "chemPTTerName",

                     "bioTest", "bioLang", "bioTestStatus", "bioBall100", "bioBall12", "bioBall", "bioPTName",
                     "bioPTRegName", "bioPTAreaName", "bioPTTerName",

                     "geoTest", "geoLang", "geoTestStatus", "geoBall100", "geoBall12", "geoBall", "geoPTName",
                     "geoPTRegName", "geoPTAreaName", "geoPTTerName",

                     "engTest", "engTestStatus", "engBall100", "engBall12", "engDPALevel", "engBall", "engPTName",
                     "engPTRegName", "engPTAreaName", "engPTTerName",

                     "fraTest", "fraTestStatus", "fraBall100", "fraBall12", "fraDPALevel", "fraBall", "fraPTName",
                     "fraPTRegName", "fraPTAreaName", "fraPTTerName",

                     "deuTest", "deuTestStatus", "deuBall100", "deuBall12", "deuDPALevel", "deuBall", "deuPTName",
                     "deuPTRegName", "deuPTAreaName", "deuPTTerName",

                     "spaTest", "spaTestStatus", "spaBall100", "spaBall12", "spaDPALevel", "spaBall", "spaPTName",
                     "spaPTRegName", "spaPTAreaName", "spaPTTerName"],
        delimiter=';',
        decimal=',',
        encoding='windows-1251',
        nan_value='null',
        value_to_add=[2020]
    )

    logger_engine = LoggerEngine()
    connection = create_connection()

    # Try to create table (if not exist)
    with connection as conn:
        sql_for_scheme = get_table_scheme(TABLE_NAME,
                                          columns_list=file_array.get_cols_names(),
                                          columns_types_list=file_array.get_cols_types())
        execute_query(connection=conn, sql_query=sql_for_scheme)

    # Continues upload the file
    flag = True
    while flag:
        with connection as conn:
            log_row_count(connection=conn, logger_engine=logger_engine)
            flag = import_csv(conn, table_name=TABLE_NAME, file_array=file_array, batch_size=10000)

    else:
        logger_engine.print_info('File fully loaded!')

    connection.close()


if __name__ == '__main__':
    main()
