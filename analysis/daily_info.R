daily.info<-read.table("C:/csb13/github/chovy/10M-Movie/analysis/daily_info.csv",header = T, row.names = 1, sep = ",", fileEncoding = "UTF-8")

View(daily.info)
str(daily.info)
library(car)
library(dplyr)


##회귀분석
daily.info <- daily.info[, !(names(daily.info) %in% c("최저기온", "최고기온"))]
audi<-lm(전체관객수~.,data=daily.info)
summary(audi)

vif(audi)

par(mfrow=c(2,2))
plot(audi)

model <- regsubsets(전체관객수 ~ ., data = daily.info)

par(mfrow = c(1, 1))
plot(model, scale="adjr2")

##전체 개봉수, 전체 상영수 제거 
daily.info <- daily.info[, !(names(daily.info) %in% c("전체개봉편수", "전체상영편수","전체매출액"))]
audi<-lm(전체관객수~.,data=daily.info)
summary(audi)

vif(audi)

par(mfrow=c(2,2))
plot(audi)

model <- regsubsets(전체관객수 ~ ., data = daily.info)

par(mfrow = c(1, 1))
plot(model, scale="adjr2")

##요일 제거 
daily.info<-daily.info[,-4]
audi<-lm(전체관객수~.,data=daily.info)
summary(audi)

vif(audi)

par(mfrow=c(2,2))
plot(audi)

model <- regsubsets(전체관객수 ~ ., data = daily.info)

par(mfrow = c(1, 1))
plot(model, scale="adjr2")

##요일별로 살펴보기
day.of.week<-daily.info %>% group_by(요일) %>% summarise(max=max(전체관객수),mean=mean(전체관객수)) %>% arrange(desc(mean))
day.of.week

## 기온-전체관람객 hex그래프
library(ggplot2)

ggplot(data=daily.info, mapping=aes(x=평균기온,y=전체관객수))+geom_hex(bins=30)
ggplot(data=daily.info, mapping=aes(x=평균기온,y=전체관객수))+geom_density2d_filled()

### 기온만 따로 빼서 분석 
### 가격만 빼서 그래프로 비교. 
