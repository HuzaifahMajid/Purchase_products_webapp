import time
import unittest
from selenium.webdriver.chrome.options import Options

from selenium.webdriver import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
import mysql.connector

from bs4 import BeautifulSoup

import ctypes
import re

options = Options()

#(Headless)
options.headless = True

DRIVER_PATH = '/Users/afaqqamar/Desktop/chromedriver_mac64/chromedriver'
driver = webdriver.Chrome(executable_path=DRIVER_PATH, options=options)


class MyTestCase(unittest.TestCase):

    @classmethod
    def setUp(cls):
        # create a new Firefox session
        cls.driver = driver

    def test_scrape_rmps(self):
        driver = self.driver

    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="PASSWORD",
        database="ru_amazon"
    )

    cursor = mydb.cursor(buffered=True)

    query = ("SELECT course_id, course_name, professor_names, rmp_links, section_number FROM courses")
    cursor.execute(query)

    records = cursor.fetchall()

    prev_p = ""
    prev_l = ""

    try:

        for row in records:

            course_id = row[0]
            course_name = row[1]
            professor_names = row[2]
            rmp_links = row[3]
            section_number = row[4]

            # print(course_name, professor_names, course_groupme_chats)

            if rmp_links is None and professor_names != "No Professor Data":

                professors = professor_names.split(";")

                professors_rmps = []
                professors_ratings = []
                for professor in professors:

                    print(
                        "Course Id: " + course_id + "; Course Name: " + course_name + "; professor: " + professor + "; rmp status: " + str(
                            rmp_links))

                    driver.get("https://www.google.com/")

                    search = course_name.strip() + " " + professor.strip() + " rutgers ratemyprofessors"

                    # print(search)

                    WebDriverWait(driver, 20).until(
                        EC.presence_of_element_located((By.XPATH,
                                                        '/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input'))).send_keys(
                        search)

                    WebDriverWait(driver, 20).until(
                        EC.presence_of_element_located((By.XPATH,
                                                        '/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input'))).send_keys(
                        Keys.RETURN)

                    soup = BeautifulSoup(driver.page_source, 'html.parser')

                    search = soup.find_all('div', class_="yuRUbf")
                    count = 0
                    for h in search:
                        if 'https://www.ratemyprofessors.com/professor?tid=' in h.a.get('href'):
                            # print(h.a.get('href'))
                            driver.get(h.a.get('href'))

                            try:
                                WebDriverWait(driver, 3).until(
                                    EC.presence_of_element_located((By.CSS_SELECTOR,
                                                                    "a[href*='school?sid=825']")))

                                print("confirmed rutgers - " + h.a.get('href'))

                                rating = WebDriverWait(driver, 10).until(
                                    EC.presence_of_element_located((By.CLASS_NAME,
                                                                    'RatingValue__Numerator-qw8sqy-2'))).text + "/5"

                                professors_rmps.append(h.a.get('href'))
                                professors_ratings.append(rating)
                                # prev_p = professor
                                # prev_l = h.a.get('href')
                            except:
                                print("Not rutgers school.")
                                professors_rmps.append('na')
                                professors_ratings.append('--/5')

                        else:
                            print("RMP Link Not Found For Professor: " + professor)
                            professors_rmps.append('na')
                            professors_ratings.append('--/5')

                        count = count + 1
                        if count == 1:
                            break

                print(professors_rmps)
                print(professors_ratings)

                final_link = ""
                final_rating = ""

                for professors_rmp in professors_rmps:
                    final_link = final_link + professors_rmp + ";"
                print(final_link)

                for professors_rating in professors_ratings:
                    final_rating = final_rating + professors_rating + ";"
                print(final_rating)

                if final_link != "":
                    cursor.execute(
                        "UPDATE courses SET rmp_links = %s, professor_rating = %s where course_id = %s and "
                        "course_name = %s and professor_names = %s and section_number = %s",
                        (final_link, final_rating, course_id, course_name, professor_names, section_number))

            elif professor_names == "No Professor Data":
                print("Course Name: " + course_name + "; professor: " + professor_names)

                cursor.execute("UPDATE courses SET rmp_links = %s where course_id = %s and course_name = %s and "
                               "professor_names = %s and section_number = %s", ("npd", course_id, course_name,
                                                                                professor_names, section_number))
                print("No Prof Data...")

            else:
                print("Course Name: " + course_name + "; professor: " + professor_names + "; rmp status: " + str(
                    rmp_links))

                print("Link Already Added, skipped.")

            mydb.commit()
            print("---------------------- CLASS SPLIT ----------------------")

    except Exception as e:
        print(e)
        cursor.close()
        mydb.close()

    # def test_create_group_mes(self):
    #     driver = self.driver

    # mydb = mysql.connector.connect(
    #     host="localhost",
    #     user="root",
    #     password="PASSWORD",
    #     database="ru_amazon"
    # )
    #
    # cursor = mydb.cursor(buffered=True)

    # driver.get("https://web.groupme.com/chats")

    # WebDriverWait(driver, 20).until(
    #     EC.presence_of_element_located((By.XPATH, '//*[@id="signinUserNameInput"]'))).send_keys('7325810185')
    # WebDriverWait(driver, 20).until(
    #     EC.presence_of_element_located((By.XPATH, '//*[@id="signinPasswordInput"]'))).send_keys('Application1$')
    # WebDriverWait(driver, 20).until(
    #     EC.presence_of_element_located((By.XPATH, '//*[@id="signin"]/div/form/button'))).click()
    #
    # result = None
    # while result is None:
    #     try:
    #
    #         query = ("SELECT course_id, course_name, professor_name, groupme_link FROM course_groupme_chats")
    #         cursor.execute(query)
    #
    #         records = cursor.fetchall()
    #
    #
    #
    #         for row in records:
    #             # print(course_id, course_name, professor_name)
    #             course_id = row[0]
    #             course_name = row[1]
    #             professor_name = row[2]
    #             groupme_link = row[3]
    #             print(course_id, course_name, professor_name)
    #
    #             if groupme_link == None:
    #
    #                 a = ActionChains(driver)
    #                 m = WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[3]/aside/div[2]/div[1]/div[2]/div/div/div/button')))
    #                 a.move_to_element(m).perform()
    #
    #
    #                 try:
    #
    #                     WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[3]/aside/div[2]/div[1]/div[2]/div/div/div/button'))).click()
    #                     time.sleep(0.2)
    #
    #                 except:
    #                     driver.find_element(by=By.XPATH, value='//*[@id="tray"]/div[1]/div[2]/div/div/div/button/svg')
    #
    #                 WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="tray"]/div[1]/div[2]/div/div/div/div/button[1]'))).click()
    #                 time.sleep(0.2)
    #                 WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[1]/div/div/div/div[2]/form/div[1]/div/input'))).send_keys(course_name + " - " + professor_name)
    #                 time.sleep(0.2)
    #
    #                 WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[1]/div/div/div/div[2]/form/div[2]/button'))).click()
    #                 time.sleep(0.2)
    #
    #                 # WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[1]/div/div/div/div[3]/button'))).click()
    #                 # time.sleep(0.2)
    #                 #
    #                 # WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[1]/div/div/div/div[1]/button/span'))).click()
    #                 # time.sleep(0.2)
    #
    #                 driver.get("https://web.groupme.com/chats")
    #
    #                 WebDriverWait(driver, 3).until(EC.element_to_be_clickable(
    #                     (By.XPATH, '/html/body/div[3]/aside/div[2]/div[3]/div[1]/div/div/div/div/div[1]/div/button'))).click()
    #                 time.sleep(0.2)
    #
    #
    #                 # Get Link
    #
    #
    #
    #                 # a = ActionChains(driver)
    #                 # m = WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[3]/aside/div[2]/div[3]/div[1]/div/div/div/div/div/div/button/div[2]/div[2]/div[2]')))
    #                 # a.move_to_element(m).perform()
    #                 WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="chats"]/div/div[1]/button[1]/div[2]/div'))).click()
    #                 time.sleep(0.2)
    #
    #                 WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="chats"]/div/div[1]/div/div/div[2]/div[1]/button[7]/span'))).click()
    #                 time.sleep(0.2)
    #
    #                 WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[1]/div/div/div[2]/div[3]/div[3]/div[2]/div[2]/form/button[1]'))).click()
    #                 try:
    #                     # Python3
    #                     import tkinter as tk
    #                 except ImportError:
    #                     # Python2
    #                     import Tkinter as tk
    #
    #                 def getClipboardText():
    #                     root = tk.Tk()
    #                     # keep the window from showing
    #                     root.withdraw()
    #                     return root.clipboard_get()
    #
    #                 print(getClipboardText())
    #
    #                 cursor.execute("UPDATE course_groupme_chats SET groupme_link = %s where course_id = %s and course_name = %s and professor_name = %s", (getClipboardText(), course_id, course_name, professor_name))
    #
    #
    #                 mydb.commit()
    #
    #
    #                 WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[1]/div/div/div[1]/button'))).click()
    #                 time.sleep(0.2)
    #
    #                 WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[3]/main/div[1]/div/div[1]/button[3]'))).click()
    #                 time.sleep(0.2)
    #
    #                 WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div[3]/aside/div[1]/div[1]/button[1]'))).click()
    #                 time.sleep(0.2)
    #
    #                 driver.get("https://web.groupme.com/chats")
    #
    #     except:
    #         print("retrying...")
    #         driver.get("https://web.groupme.com/chats")
    #         pass
    #

    #
    # WebDriverWait(driver, 20).until(EC.presence_of_element_located((By.CLASS_NAME, "subject")))
    #
    # all_li = driver.find_elements(By.CLASS_NAME, "subject")
    #
    #
    # # print(len(all_li))
    #
    # # print(all_li[0].get_attribute('innerHTML').split('<div id="subject.013.')[1].split('.0.courseList">')[0])
    # try:
    #     for course in all_li:
    #
    #         courseIdUncut = course.get_attribute('innerHTML').split('<div id="subject.')[1].split('.courseList">')[0][4:16]
    #         courseId = course.get_attribute('innerHTML').split('<div id="subject.')[1].split('.courseList">')[0][4:14]
    #
    #         print(courseId)
    #
    #         courseName = course.get_attribute('innerHTML').split('courseMetadata.title">')[1].split("</span><span")[0]
    #         courseName = courseName.replace("amp;", '')
    #
    #         print(courseName)
    #
    #         all_section = course.find_elements(By.CLASS_NAME, "sectionData")
    #         instructors = []
    #         for section in all_section:
    #             instructor = section.get_attribute('innerHTML').split('class="instructors">')[1].split("</span><span")[0]
    #             if instructor not in instructors and instructor != "":
    #                 instructors.append(instructor)
    #
    #         print(instructors)
    #         if len(instructors) == 0:
    #             sql = ("INSERT INTO course_groupme_chats (course_id, course_name, professor_name) VALUES (%s, %s, %s)")
    #             cursor.execute(sql, (courseId, courseName, "No Professor Data"))
    #
    #         else:
    #             for instructor in instructors:
    #                 sql = ("INSERT INTO course_groupme_chats (course_id, course_name, professor_name) VALUES (%s, %s, %s)")
    #                 cursor.execute(sql, (courseId, courseName, instructor))
    #
    #         print("----------------")
    #
    #     mydb.commit()
    #
    # except Exception as e:
    #     print(e)
    #     cursor.close()
    #     mydb.close()
    #

    # def test_scrape_website_data(self):
    #     driver = self.driver
    #
    #     mydb = mysql.connector.connect(
    #         host="localhost",
    #         user="root",
    #         password="PASSWORD",
    #         database="ru_amazon"
    #     )
    #
    #     cursor = mydb.cursor()
    #
    #     # Printing the connection object
    #     print(mydb)
    #     driver.get("https://sis.rutgers.edu/soc/#school?code=01&semester=12023&campus=NB&level=U")
    #
    #     WebDriverWait(driver, 20).until(EC.presence_of_element_located((By.CLASS_NAME, "subject")))
    #
    #     all_li = driver.find_elements(By.CLASS_NAME, "subject")
    #
    #
    #     # print(len(all_li))
    #
    #     # print(all_li[0].get_attribute('innerHTML').split('<div id="subject.013.')[1].split('.0.courseList">')[0])
    #     try:
    #         for course in all_li:
    #
    #             # print(course.get_attribute('innerHTML'))
    #
    #             courseIdUncut = course.get_attribute('innerHTML').split('<div id="subject.')[1].split('.courseList">')[0][4:16]
    #             courseId = course.get_attribute('innerHTML').split('<div id="subject.')[1].split('.courseList">')[0][4:14]
    #
    #             print(courseId)
    #
    #
    #             courseName = course.get_attribute('innerHTML').split('.courseMetadata.extendedTitle">')[1].split("</span></div>")[0]
    #             # courseName = courseName.strip()
    #             courseName = courseName.replace("amp;", '')
    #
    #
    #
    #             if(courseName == ""):
    #                 courseName = course.get_attribute('innerHTML').split('.courseMetadata.title">')[1].split("</span><span")[0]
    #                 # courseName = courseName.strip()
    #                 courseName = courseName.replace("amp;", '')
    #
    #             courseName = re.sub(r'( +)', ' ', courseName)
    #
    #
    #             print(courseName)
    #
    #
    #             # all_section = course.find_elements(By.CLASS_NAME, "sectionData")
    #             # instructors = []
    #             # for section in all_section:
    #             #     instructor = section.get_attribute('innerHTML').split('class="instructors">')[1].split("</span><span")[0]
    #             #     if instructor not in instructors and instructor != "":
    #             #         instructors.append(instructor)
    #             #
    #             # print(instructors)
    #
    #             all_section = course.find_elements(By.CLASS_NAME, "sectionData")
    #             for section in all_section:
    #                 status = "Open"
    #                 instructor = section.get_attribute('innerHTML').split('class="instructors">')[1].split("</span><span")[0]
    #                 try:
    #                     section = section.get_attribute('innerHTML').split('sectionData.number.span" class="sectionopen">')[1].split("</span></span><span")[0]
    #                 except:
    #                     section = section.get_attribute('innerHTML').split('sectionData.number.span" class="sectionclosed">')[1].split("</span></span><span ")[0]
    #                     status = "Closed"
    #
    #                 print("Section: " + section + ", Instructor: " + instructor + ", Status: " + status)
    #
    #                 if instructor == "":
    #                     sql = ("INSERT INTO courses (course_id, section_number, course_name, professor_names, status) VALUES (%s, %s, %s, %s, %s)")
    #                     cursor.execute(sql, (courseId, section, courseName, "No Professor Data", status))
    #
    #                 else:
    #                     sql = ("INSERT INTO courses (course_id, section_number, course_name, professor_names, status) VALUES (%s, %s, %s, %s, %s)")
    #                     cursor.execute(sql, (courseId, section, courseName, instructor, status))
    #
    #             print("----------------")
    #
    #         mydb.commit()

    # except Exception as e:
    #     print(e)
    #     cursor.close()
    #     mydb.close()

    def tearDown(self):
        self.driver.quit()
        print("tear down ran succesfully")


if __name__ == '__main__':
    unittest.main()
