from tqdm.notebook import tqdm
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.alert import Alert

# FULLXPATH
url = 'https://www.kobis.or.kr/kobis/business/stat/boxs/findFormerBoxOfficeList.do'
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))

# 페이지 로딩 기다려주는 함수. timeout 10일시 가끔 다음으로 넘어가져 100으로 확대.
# Xpath 아닐경우 변환 필요.
def wait_for_element(element_xpath, timeout=100):
    try:
        element = WebDriverWait(driver, timeout).until(
            EC.presence_of_element_located((By.XPATH, element_xpath))
        )
        return element
    except Exception as e:
        print(f"Error: {e}")
        return None

# 가져올 범위 설정 max=200
# 2003,4 년 이전의 영화는 없을수 있으니 확인이 필요하다.
rank_range=56

try:

    for i in range(rank_range):
        driver.get(url) # 역대 박스오피스 순위 페이지 접근.
        movie_element = driver.find_element(By.ID, 'tr_{}'.format(i))  # 영화순위 1줄 id접근가능 tr_0 ~tr_200. tr : table_row?

        if movie_element:
            # 줄별로 접근해서 영화별정보담긴 페이지 띄우는 하이퍼링크있는곳 클래스로 접근.
            movie_element.find_element(By.CLASS_NAME, 'ellip').click()
            info_xpath = '/html/body/div[2]/div[1]/div[2]/ul/li[2]/a' #로딩기다려주는 함수 이용위해 xpath
            info_element = wait_for_element(info_xpath)  # 통계정보 기다리기

            if info_element:
                info_element.click()  # 통계정보 탭 누르기 ------------fullXPATH로 변경. 기존 xpath는 이용사 창마다 달라진다.
                exel_xpath = '/html/body/div[2]/div[2]/div/div[2]/div[3]/div/div/div/div/a'
                exel_element = wait_for_element(exel_xpath)  # 엑셀 저장 누르기위해 통계정보창 로딩 기다리기

                if exel_element:
                    exel_element.click()  # 엑셀 누르기
                    # Handle the '확인' alert
                    # 데이터양이 많아 시간이 걸릴수있다는 안내창 팝업으로 뜬다. 자동으로 수락.
                    da = Alert(driver)
                    da.accept()

except Exception as e:
    print(f"Error: {e}")