from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import pandas as pd
from datetime import datetime
import os
import sys
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.service import Service


# Define Chrome options
options = Options()
options.add_argument("--disable-blink-features=AutomationControlled")
# Add any other options as needed

# Set Chrome WebDriver service
service = Service(ChromeDriverManager().install())

# Initialize Chrome WebDriver with options
driver = webdriver.Chrome(service=service, options=options)

# Preparing script before we convert it to executable
application_path = os.path.dirname(sys.executable)

# get date in format MMDDYYYY
now = datetime.now()
month_day_year = now.strftime("%m%d%Y")


# create an instance of the Options class
options = Options()

# set the headless option
options.add_argument('--headless')
options.add_argument('--disable-gpu')



# initialize the WebDriver with the Options object
driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()), options=options)



website = 'https://www.thesun.co.uk/sport/football/'
driver.get(website)

# Find all containers
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
final_path = os.path.join(application_path, file_name)
df_headlines.to_csv(final_path)

driver.quit()
