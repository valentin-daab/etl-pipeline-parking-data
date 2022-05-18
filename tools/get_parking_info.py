import requests


def handle_url(url):
    response = requests.get(url=url)
    return response.json()