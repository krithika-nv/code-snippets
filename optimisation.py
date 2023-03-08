def function():
    ...
    options = Options()
    options.add_argument("--headless")
    driver = webdriver.Chrome(options=options, executable_path="D:\Projects\performance\chromedriver")
    driver.get(baseUrl)
    driver.implicitly_wait(20)
    print("Actual Title : " + str(baseUrl))
    ...