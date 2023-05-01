# Acorn Middle Project - 10M_Movie
### 천만 영화를 찍고 싶다면 
### 지향해야 할 사항과 지양해야할 사항 분석<br/><br/>

## 목차
1. [팀원 소개](#팀원-소개)
2. [사용 언어](#사용-언어)
2. [자료 사이트](자료-사이트)
3. [폴더 구성](#폴더-구성)
4. [비교할 요소](#비교할-요소)
5. [자료별 구성요소 출처](#자료별-구성요소-출처)
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
> [ppt](https://github.com/zarnits/10M_Movie/tree/master/ppt) : ppt 및 자료들을 보관
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
