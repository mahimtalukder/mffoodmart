from datetime import datetime, timedelta
import time
from airflow import DAG
from airflow.operators.python import PythonOperator

from subprocess import check_output



default_args = {
    'owner': 'clickSpikes',
    'retries': 5,
    'retry_delay': timedelta(minutes=5)
}

def scrap():
    scrap_mess = check_output(['npm', 'start'])
    print (scrap_mess)

def upload_to_database():
    db_push_message = check_output(['npm', 'run','dev'])
    print (db_push_message)


with DAG(
    dag_id = "mffoodmart_scrap_v1",
    default_args = default_args,
    description = "Scraping task of mffoodmart.com",
    start_date = datetime(2022, 9, 16, 1),
    schedule_interval = "@daily"
) as dag:
    mffoodmart_scrap = PythonOperator(
        task_id='mffoodmart_scrap',
        python_callable=scrap
    )

    mffoodmart_upload = PythonOperator(
        task_id='mffoodmart_upload',
        python_callable=upload_to_database
    )

    mffoodmart_scrap >> mffoodmart_upload
