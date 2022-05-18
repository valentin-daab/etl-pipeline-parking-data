import csv
import boto3
import datetime

from config.get_url import availability_url
from tools.get_parking_info import handle_url


url = "main_url"

def get_data():

    with open("/tmp/data.csv", "w", encoding="utf-8") as f:
        header = ['name', 'status', 'free_spaces']
        writer = csv.DictWriter(f, fieldnames=header)
        writer.writeheader()

        parkings = handle_url(availability_url()[url])

        for parking in parkings['records']:

            writer.writerow({'name': parking['fields']['nom_parking'],
                             'status': parking['fields']['etat_descriptif'],
                             'free_spaces': parking['fields']['libre']})

    s3_resource = boto3.resource('s3')
    date = datetime.now()
    filename = f'{date.year}/{date.month}/{date.day}/{date.hour}:{date.minute}/data.csv'
    response = s3_resource.Object('parking-data', filename).upload_file("/tmp/data.csv")         

    return response

def lambda_handler(event, context):
    get_data()

if __name__ == "__main__":
    get_data()