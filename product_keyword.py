import pandas as pd

def read_text_file(file_path):
    with open(file_path, "r") as file:
        content = file.read()
    return content

query = read_text_file("product_keyword.sql")
df = pd.read_gbq(query, project_id='tiki-dwh', dialect='standard')
df.to_csv("product_keyword.csv", encoding='utf-8', index=False)
