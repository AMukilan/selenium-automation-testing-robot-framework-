from selenium import webdriver
from selenium.webdriver.common.by import By
class NopCommerceLibrary:
    def _init_(self):
        self.driver = None

    def open_browser(self, url):
        self.driver = webdriver.Chrome()
        self.driver.get(url)

    def close_browser(self):
        if self.driver:
            self.driver.quit()

    def login(self, username, password):
        self.driver.find_element(By.ID, 'Email').send_keys(username)
        self.driver.find_element(By.ID, 'Password').send_keys(password)
        self.driver.find_element(By.XPATH, "//button[contains(text(), 'Log in')]").click()

    def verify_login(self):
        assert "Dashboard" in self.driver.title

    def _del_(self):
        self.close_browser()
