import json


with open("../ut_merged_list.json") as file:
    data = json.load(file)
    print(data[0])

