
import json
import requests


url1 = "https://data.strasbourg.eu/api/records/1.0/search/?dataset=occupation-parkings-temps-reel&q=&rows=30&facet=etat_descriptif"
url2 = "https://data.strasbourg.eu/api/records/1.0/search/?dataset=parkings&q=&rows=32"

final_parking_dict = {
    "name":[],
    "position":[],
    "status":[],
    "free_spaces":[]
}

def get_data():
    with open("data.json", "w") as f:
        json.dump


