# Acorn Middle Project - 10M_Movie
### 천만 영화를 찍고 싶다면 
### 지향해야 할 사항과 지양해야할 사항 분석<br/><br/>

## 목차
1. [팀원 소개](#팀원-소개)
2. [사용 언어](#사용-언어)
2. [자료 사이트](#자료-사이트)
3. [자료 수집 기간](#자료-수집-기간)
4. [폴더 구성](#폴더-구성)
5. [비교할 요소](#비교할-요소)
6. [분석 결과](#분석-결과)
7. [자료별 구성요소 출처](#자료별-구성요소-출처)
<br/><br/>

## 팀원 소개
🐵[정승빈](https://github.com/zarnits) : 데이터 분석, 시각화, THE BOSS  
🐰[고은경](https://github.com/eunkk01) : 데이터 수집, 데이터 전처리, 정규화  
🐶[엄진성](https://github.com/thumbs-js) : 데이터 수집, 데이터 전처리, 발표  
🐭[김도현](https://github.com/kimdohyun0001) : 데이터 수집, 데이터 전처리  
🐯[김호탁](https://github.com/katohmik) : 데이터 수집, 데이터 상관분석, 시각화  
🦝[유영익](https://github.com/yuuuuyoung) : 데이터 분석, 시각화, PPT  <br/><br/>

## 사용 언어 
<a href="https://www.python.org/" target="_blank"><img src="https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white"/></a>
<a href="https://www.r-project.org/" target="_blank"><img src="https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white"/></a>
<a href="https://jupyter.org/" target="_blank"><img src="https://img.shields.io/badge/Jupyter-F37626?style=flat&logo=jupyter&logoColor=white"/></a>
<br/><br/>

## 자료 사이트
[![kobis](https://www.kobis.or.kr/kobis/web/comm/images/comm/logo_comm.png)](https://www.kobis.or.kr/kobis/business/main/main.do) &#9;    
[![기상청](https://data.kma.go.kr/resources/images/common/logo_top1.png)](https://data.kma.go.kr/cmmn/main.do) 
<br/><br/>

## 자료 수집 기간
#### kobis 2004.01.01 - 2023.04.06
#### 공휴일 2004.01.01 - 2023.04.06
#### 날씨 2003.12.01 - 2022.12.31
#### GNI 2003 - 2022
#### 문화지출 2006 - 2022
<br/>

## 폴더 구성
[analysis](https://github.com/zarnits/10M_Movie/tree/master/analysis) : 분석에 쓰인 jupyter notebook과 R 파일들  
[code](https://github.com/zarnits/10M_Movie/tree/master/codes) : 크롤링 및 전처리 등에 쓰인 코드를 보관  
[legacy](https://github.com/zarnits/10M_Movie/tree/master/legacy) : 실습시간에 만든 자료들  
[meetings](https://github.com/zarnits/10M_Movie/tree/master/meetings) : 회의록  </br></br>
[movie_DB](https://github.com/zarnits/10M_Movie/tree/master/movie_DB) : 수집한 자료들 
> [indiviudal_movie](https://github.com/zarnits/10M_Movie/tree/master/movie_DB/individual_movie) : 1 ~ 200위 영화들의 정보들을 모아놓은 폴더.  
> [individual_trend](https://github.com/zarnits/10M_Movie/tree/master/movie_DB/individual_trend) : 1 ~ 58위 영화들의 일자별 여러 추이를 모아놓은 폴더.  
> [macro_envirment](https://github.com/zarnits/10M_Movie/tree/master/movie_DB/macro_envirment) : 영화계의 거시환경적 요소들을 모아놓은 폴더.   
> [other_data](https://github.com/zarnits/10M_Movie/tree/master/movie_DB/other_data) : 그 외 주제에 대한 데이터를 모아두는 곳.    
> [raw_data](https://github.com/zarnits/10M_Movie/tree/master/movie_DB/raw_data) : 전처리하기 전의 데이터를 따로 보관하는 곳.  
> [ppt](https://github.com/zarnits/10M_Movie/tree/master/ppt) : ppt 및 자료들을 보관.<br/>
> [wx](https://github.com/zarnits/10M_Movie/tree/master/wx) : 윈도우 프레임활용 DB 조회


<br/><br/>

## 비교할 요소

### 개별 영화 별 일별 관객수 추이
- 총관람객수
- 상영 기간
- 같이 개봉한 영화의 영향

### 장르
- 장르별 영화 분포 
- 장르별 누적 관객수
- 장르+국적

### 시리즈
- MCU, 해리포터, 미션 임파서블, 트랜스포머 등등

### 특별관
- 일반(필름,디지털,2D), 특별관(3D,4D,IMAX 등)

### 상영등급
- 상영등급에 따른 영향

### 감독
- 천만 영화의 감독


### 그 외의 요소
- 날씨
- 티켓 가격
- 국민 총 소득
- 요일

<br/><br/>

## 분석 결과

#### 개별 영화 별 일별 관객수 추이
- 천만 영화는 서로 유사한 패턴을 보였다. 개봉일에 높게 시작해서 잠시 감소했다가 주말에 최고치를 찍고 감소하다가 다시 주말에 높은 모습을 보이지만, 최고점은 주를 거듭하면서 낮아지는 모습을 보인다. 이 모습은 대조군에서도 관찰이 되지만, 순위가 점차 낮아지면서 점점 주말과 주중 관객수 차이가 적어지는 모습을 보인다. 
예외적인 사례로 알라딘과 겨울왕국 1이 있다. 둘 모두 첫 주가 높지 않지만, 고점들이 장기간 서로 비슷한 지점에 있다. 

#### 총관람객수
- 천만 영화와 강한 상관관계를 보였다. 
이상치로 0이 나왔던 스파이더맨: 홈 커밍의 경우, 영화 상영기간이 길어지면서 주말에 높고 주중에 낮은 패턴과 유리되었기 때문. --상충?

#### 상영 기간
- 유의미한 관련이 없었다. 

#### 개봉일
- 큰 차이가 없었다. 


#### 같이 개봉한 영화의 영향
- 해적: 바다로 간 산적, 명량 그룹과 <br/>
1987, 신과함께-죄와 벌처럼 유의미한 영향이 있다. 
- 해적과 1987모두 초반에 흥행몰이에 실패하면서 해적이 860만, 1987이 720만에 그쳤다. <br/>
해적의 총 관객수와 패턴을 고려해볼 때, 명량이 없었다면 최소 900만에서 높으면 천만도 달성할 수 있었을 것으로 예상된다. 
<br/><br/>
다만, 알라딘-기생충-엔드게임 시기에서 보이다시피 천만 영화와 상영기간이 겹치더라도 천만 달성은 가능하다. 


### 장르

#### 장르별 영화 분포
- 천만 영화 기준 장르 자체는 다양했다. 다만, 드라마 액션 어드밴쳐 sf가 집단을 가리지않고 높은 점유율을 보였다. 
다만, 천만영화에는 있지만, 대조군에는 없는 장르들이 여럿 있었다. 그리고 이러한 장르는 천만영화에서도 몇 편 없는 대중성이 약한 장르였다.  <br/>
대표적으로 애니메이션이 있는데, 겨울왕국의 천만 다음으로나오는 영화는 23년 5월 2일 기준 스즈메의 문단속이고,<br/>
그 이전까지는 500만의 쿵푸팬더2로 총 관객수가 반토막나는 모습을 볼 수 있다. 

#### 장르별 누적 관객수
- 장르별 차이를 그래프에서 보이는 것 같았지만, 검정결과 유의미한 차이를 발견하지 못했다. 

#### 장르+국적
- sf와 애니메이션은 미국, 드라마는 한국처럼 특정 장르의 국가적 편중을 볼 수 있었다. 


#### 시리즈
- MCU, 해리포터, 미션 임파서블, 트랜스포머를 대표 시리즈로 선정 비교하였다. 
- 롱런하는 시리즈물은 고정 관객층 위주로 돌아가는 모습을 보이는데, 이는 팬덤의 영향으로 보인다.<br/>
시리즈 영화들은 각 편 별 총 관객수에서 대체로 큰 차이를 보이지 않는다.<br/>
이러한 모습은 MCU의 스파이더맨 시리즈에서도 찾아볼 수 있었다.<br/>
- 해리포터는 전형적인 시리즈의 모습을 따라가다가, 최종편에서만 눈에띄는 상승을 보였다. 
- 트랜스포머는 3편까지 전형적인 시리즈의 모습을 하다가 그 이후로 급격하게 하락한다. <br/>
- MCU를 보면, 어밴져스와 아이언맨은 편을 거듭할 수록 상승하는 모습을 보인다. 
특히 어밴져스는 2편 이후 계속 천만 돌파에 성공했다.<br/>
윈터솔져는 단일 주인공체제지만, 시빌 워는 캡틴 아메리카와 아이언 맨의 복수 주인공 체제라서 그런지 둘 사이 큰 관객 수 차이를 보인다. 


#### 특별관
- 일반(필름,디지털,2D), 특별관(3D,4D,IMAX 등) 
- 아바타1,2와 트랜스포머3만 특별관 관람 비중이 50%가 넘지만, 천만에 성공한 것은 아바타가 유이하다. 트랜스포머3는 770만을 달성했다.<br/>
그 다음으로 높은 특별관 상영 비중을 보인 영화로 겨울왕국(특별관 23%)와 어벤져스 2(특별관 18%)이 있었다. 
이를 통해 아바타가 매우 독보적인 영화라는 것을 다시금 확인했다. <br/>
그리고 겨울왕국이 10305051명으로 천만을 갓 넘은 영화라는 것을 고려한다면, <br/>
특별관의 영향이 전무하다고 보기는 어렵지만, 결정타나 흥행공신이 되었다고도 보기 어려울 모습을 보였다. 


#### 상영등급
- 상영등급에 따른 영향
- 청소년 시청불가 등급의 최고 등수는 내부자로 62위 700만에 그쳤다. <br/>
그리고 전체 관람가도 천만 영화인 겨울왕국1, 2와 알라딘 이후 109위 미녀와 야수에서 다시 등장한다.<br/>
그 외의 15세와 12세 관람가는 비슷한 분포를 보인다.<br/><br/>
다만, 각 등급별과 청불 비청불 간 두 번의 차이 검정에서 표본수 부족으로 추측되는 문제로 유의미한 결과를 얻지 못했다.     


#### 감독
- 천만 영화 전 후로 유의미한 차이가 있으나, 그 차이가 천만을 쉽게 달성한다거나 흥행을 보장하지는 않는 모습을 보인다. 

### 그 외의 요소

#### 날씨
- 강수량과 양의 상관관계가 있으나 유의미한 관계는 없었다. 
- 기온과는 꽤 밀접한 관련이 있었다. 평균기온이 높아질 수록 타일 수가 많아지고 동시에 색도 짙어졌다. 
- 이와 반대로 평균 기온 10도 내외에서는 다른 기온대에 비해서 상단 타일 수 자체에서 큰 차이를 보였다. 
- 영하권을 살펴보면, 영하권인 날 자체가 다른 기온 대에 비해 확연히 줄지만, <br/>
평균 기온 10도 범위내에 비하면 높은 관객 동원력을 확인해볼 수 있었다. 

#### 티켓 가격
- 추세 변환, 가격 변경일 전 후 2주간 총 한 달간의 평균 등을 비교해보았다. 
- 9000원 이전까지는 티켓 가격이 상승하더라도 관람객 수가 느는 모습을 볼 수 있었지만, <br/>
그 이후로는 급락 이후 회복하는 패턴을 보이고, 코로나 이후 쉽사리 회복하지 못하는 모습을 보인다. <br/>
특히 9000원 시기 천만 영화가 가장 많았으나, 만원으로 인상한 이후, 천만 영화의 등장 간격이 늘어난 것을 볼 수 있었다. 
- 유의미한 지점은 8000원 인상 이후 부근으로 해운대, 아바타가 관객 회복을 도왔다면, <br/>
13000원 시기에 접어들어서는 모두 차기작인 작품만이 천 만을 달성할 수 있었다.  
- 만원을 넘어서 13000원 시대에 접어들면서 지불 의향 가격과 실제 표 가격 차이가 급격히 줄어들면서 <br/>
입소문을 타거나 대박난 전작이 있는 등 소비자 후생이 보장된 영화가 아니라면 천만 영화는 고사하고 흥행 자체가 힘든 모습을 보인다. 

#### 국민 총 소득
- 문화여가지출과 오락 문화비에서 유의미한 관계 및 인과를 확인하였다. 다만, 같이 비교한 거시 경제 지표(국내총생산, 가계총처분가능소득, 국민처분가능소득 등)이 상호 연관성이 강하기 때문에 분산팽창계수에서 6000을 넘어 변수간 높은 상관관계를 확인할 수 있었다. <br/>
- 연간 총 관객수와 문화여가지출률 둘과 문화여가지출률과 거시 경제 지표들 사이에서 높은 상관계수를 보이지만, 정작 연간 총 관객수와 거시 경제 지표들 사이에서는 관계성이 없는 모습을 보였다. 

#### 요일
- 주말과 주중, 그리고 주중에서도 월화와 수목금끼리 큰 차이를 보였다. 
우선 주말과 주중에서 관객수는 주말이 높았으며, 그 중에서도 토요일의 관객수가 요일 중에서 가장 높았다. <br/>

- 주중은 금수목화월순으로 높았지만, 수목금과 월화는 주말과 주중만큼은 아니지만 차이를 보였다. 
그중에서 금요일의 관객수는 주말과 주중의 중간쯤되는 수치를 보였으며, 수목과 월화는 각각 비슷한 수치를 보였다. <br/>

- 이들을 각기 살펴보면, 금요일은 주된 개봉일도 아니고 주말과 같은 가격을 받으면서도 높은 관객수를 보이는 것이 인상적이다.<br/>
수요일과 목요일은 비슷한 와중 수요일이 약간 더 높은 수치를 보였지만, 큰 차이가 없는 것은 개봉일 효과로 보이며, <br/>
수요일이 조금 더 높은 것은 영화시장이 더 성장한 이후 개봉일이 목요일에서 수요일로 앞당겨진 결과라고 사료된다. <br/>
화요일날 개봉한 영화가 없는 것은 아니나 수요일만큼 흥행에 성공하지 못했기 때문에 수목과 여전히 큰 차이를 보이는 것이라고 추측된다. 


<br/><br/>

## 자료별 구성요소 출처
<details>
<summary>펼치기</summary>

#### 개별 영화 DB 파일의 컬럼
##### indiviudal_movie
- 영화정보 크롤링
- 역대 박스오피스 순위 : https://www.kobis.or.kr/kobis/business/stat/boxs/findFormerBoxOfficeList.do <br/>
영화, 개봉일, 장르, 영상등급, 제작국가, 스크린타입, 감독,   
주연, 전체관객수, 상영시작일, 상영종료일, 상영기간, 천만달성기간
<hr/>

#### individual_trend 폴더 내 파일의 컬럼

날짜, 스크린수, 스크린점유율, 상영횟수, 상영점유율, 좌석수, 좌석점유율, 좌석판매율,  
매출액, 매출액증감(전일대비), 관객수, 관객수증감(전일대비), 누적매출액, 누적관객수, 순위, 가격
<hr/>

#### daily_macro
날짜
- API출처 : https://www.data.go.kr/data/15012690/openapi.do



날씨 데이터 수집
- 기온데이터 https://data.kma.go.kr/stcs/grnd/grndTaList.do?pgmNo=70
- 강수량 데이터 https://data.kma.go.kr/stcs/grnd/grndRnList.do?pgmNo=69 

GNI(국민총소득)
- kosis(국가통계포털) : https://kosis.kr/statHtml/statHtml.do?orgId=301&tblId=DT_200Y001&vw_cd=MT_ZTITLE&list_id=Q_301009_001_001&scrId=&seqNo=&lang_mode=ko&obj_var_id=&itm_id=&conn_path=MT_ZTITLE&path=%252FstatisticsList%252FstatisticsListIndex.do

문화 여가 지출율
- https://www.index.go.kr/unify/idx-info.do?idxCd=4249

평일
- https://kosis.kr/statHtml/statHtml.do?orgId=113&tblId=DT_113_STBL_1028400&vw_cd=&list_id=00000038&scrId=&seqNo=&lang_mode=ko&obj_var_id=&itm_id=&conn_path=R1&path=

주말
- https://kosis.kr/statHtml/statHtml.do?orgId=113&tblId=DT_113_STBL_1028400&vw_cd=&list_id=00000038&scrId=&seqNo=&lang_mode=ko&obj_var_id=&itm_id=&conn_path=R1&path=

총관객수및 매출액
- https://www.kobis.or.kr/kobis/business/stat/them/findDailyTotalList.do

극장표 가격들 기사
- https://entertain.naver.com/read?oid=001&aid=0002755960
- https://n.news.naver.com/mnews/article/112/0002397568?sid=103
- https://n.news.naver.com/mnews/article/020/0002950777?sid=101
- https://n.news.naver.com/mnews/article/422/0000312700?sid=101
- https://n.news.naver.com/mnews/article/032/0003037995?sid=103


주요지표(연간지표)
- https://kosis.kr/statHtml/statHtml.do?orgId=301&tblId=DT_200Y001&vw_cd=MT_ZTITLE&list_id=Q_301009_001_001&scrId=&seqNo=&lang_mode=ko&obj_var_id=&itm_id=&conn_path=MT_ZTITLE&path=%252FstatisticsList%252FstatisticsListIndex.do

문화여가 지출율 그래프
- https://www.index.go.kr/unify/idx-info.do?idxCd=4249

지난 1년 동안 여가생활을 위한 한 달 평균 지출 금액
- https://kosis.kr/statHtml/statHtml.do?orgId=113&tblId=DT_113_STBL_1028400&vw_cd=&list_id=00000038&scrId=&seqNo=&lang_mode=ko&obj_var_id=&itm_id=&conn_path=R1&path=

전체개봉편수, 전체상영편수, 전체매출액, 전체관객수, 요일, 공휴일, 가격, 평균기온, 최저기온, 최고기온, 강수량
<details/>

thanks for reading. 
