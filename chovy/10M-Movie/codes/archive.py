def search_movie(movie):
    url = 'https://www.kobis.or.kr/kobis/business/main/main.do'
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
    driver.get(url)

    def wait_for_element(element_xpath, timeout=30):
        try:
            element = WebDriverWait(driver, timeout).until(
                EC.presence_of_element_located((By.XPATH, element_xpath))
            )
            return element
        except Exception as e:
            print(f"Error: {e}")
            return None

    try:
        driver.find_element(By.ID, "inp_solrSearch").send_keys(f"{movie}")
        driver.find_element(By.XPATH, "//*[@id='searchMainTopMovie']/fieldset/button/span").click()

        wait_for_element("/html/body/div[1]/div[2]/div[2]/div[4]/table/tbody")
        # 만약 페이지 수가 2 이상이라면 감독이름을 입력받아 검색
        if len(driver.find_elements(By.XPATH, "/html/body/div[1]/div[2]/div[2]/div[4]/form/div/a[1]")) > 0:
            director = input("찾고자 하는 영화의 감독 이름을 입력: ")
            director_search = driver.find_element(By.XPATH,
                                                  '/html/body/div[1]/div[2]/div[2]/div[3]/form/div[1]/div[2]/div/input')
            director_search.send_keys(f"{director}")
            driver.find_element(By.XPATH, "/html/body/div[1]/div[2]/div[2]/div[3]/form/div[1]/div[5]/button[1]").click()

            # 다시 한 검색 결과에서 해당 영화를 클릭
            element = wait_for_element(f'//a[@title="{movie}"]')
            element.click()

            element = driver.find_element(By.XPATH, "/html/body/div[3]/div[1]/div[2]/ul/li[2]/a")
            element.click()

            text = wait_for_element('/html/body/div[3]/div[2]/div/div[2]/div[1]/table/tbody/tr[2]/td[4]').text

            pattern = r'([\d,]+)\s*\('
            result = re.search(pattern, text)

            if result:
                number_with_commas = result.group(1)
                number = int(number_with_commas.replace(',', ''))
            else:
                print("No match found")
            print(f"{movie}의 총 관람객 수는 {number}.")

        # 만약 페이지가 하나 뿐이라면,
        else:
            element = wait_for_element(f'//a[@title="{movie}"]')
            element.click()

            element = driver.find_element(By.XPATH, "/html/body/div[3]/div[1]/div[2]/ul/li[2]/a")
            element.click()

            text = wait_for_element('/html/body/div[3]/div[2]/div/div[2]/div[1]/table/tbody/tr[2]/td[4]').text

            pattern = r'([\d,]+)\s*\('
            result = re.search(pattern, text)

            if result:
                number_with_commas = result.group(1)
                number = int(number_with_commas.replace(',', ''))
            else:
                print("No match found")
            print(f"{movie}의 총 관람객 수는 {number}.")

    except Exception as e:
        print(f"Error: {e}")

    finally:
        driver.quit()

