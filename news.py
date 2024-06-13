from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
import pandas as pd
from datetime import datetime
import os
import sys
from selenium.common.exceptions import NoSuchElementException

# Preparing script before we convert it to executable
working_directory = os.path.abspath(os.curdir)

# get date in format MMDDYYYY
now = datetime.now()
month_day_year = now.strftime("%m%d%Y")

web = 'https://www.thesun.co.uk/sport/football/'
path = 'C:/Users/anura/Downloads/chromedriver-win64/chromedriver-win64/chromedriver.exe'  # introduce path here

#"C:\Users\anura\Downloads\chromedriver-win64\chromedriver-win64\chromedriver.exe"

# Define Chrome options
options = Options()
options.add_argument("--disable-blink-features=AutomationControlled")

driver_service = Service(executable_path=path)
driver = webdriver.Chrome(service=driver_service, options=options)
driver.get(web)

containers = driver.find_elements(by='xpath', value='//div[@class="teaser__copy-container"]')

Titles = []
Subtitles = []
Descriptions = []
Links = []

for container in containers:
    try:
        title = container.find_element(by='xpath', value='./a/span').text
    except NoSuchElementException:
        title = 'N/A'
    try:
        subtitle = container.find_element(by='xpath', value='./a/h3').text
    except NoSuchElementException:
        subtitle = 'N/A'
    try:
        description = container.find_element(by='xpath', value='./a/p').text
    except NoSuchElementException:
        description = 'N/A'
    try:
        link = container.find_element(by='xpath', value='./a').get_attribute('href')
    except NoSuchElementException:
        link = 'N/A'

    Titles.append(title)
    Subtitles.append(subtitle)
    Descriptions.append(description)
    Links.append(link)

# Create a DataFrame and save to CSV
my_dict = {'title': Titles, 'subtitle': Subtitles, 'description': Descriptions, 'link': Links}
df_headlines = pd.DataFrame(my_dict)
file_name = f'football_headlines_{month_day_year}.csv'
output_path = os.path.join(working_directory, file_name)
df_headlines.to_csv(output_path, index=False)

driver.quit()