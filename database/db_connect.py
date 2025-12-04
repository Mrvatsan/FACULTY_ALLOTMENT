import mysql.connector
from config import Config

def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host=Config.MYSQL_HOST,
            user=Config.MYSQL_USER,
            password=Config.MYSQL_PASSWORD,
            database=Config.MYSQL_DB
        )

        if connection.is_connected():
            print("MySQL Database Connected Successfully")
            return connection

    except mysql.connector.Error as err:
        print("Database Connection Failed:", err)
        return None