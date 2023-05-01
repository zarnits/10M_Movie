income_movie<-read.table("../income_movie.csv",header = T, row.names = 1, sep = ",", fileEncoding = "UTF-8")
View(income_movie)

names(income_movie)
# Rename the columns to remove periods
colnames(income_movie) <- c("연도", "문화여가지출률", "오락문화비", "국내총생산", "가계총처분가능소득", "국민처분가능소득", "x1인당영화관람횟수", "연간총관객수")


cor(x,income_movie$연간총관객수)

cor_income<-cor(income_movie)

if (!requireNamespace("corrplot", quietly = TRUE)) {
  install.packages("corrplot")
}
library(corrplot)
col<-colorRampPalette(c("#BB4444","#EE9988","#FFFFFF","#77AADD","#4477AA"))

corrplot(cor_income, diag = FALSE, col = col(200), type = "lower", 
          method = "color", tl.col = "black", 
         addCoef.col = "black")

#order = "hclust",
#### anova test ####
aov.income<-aov(연간총관객수~.,data=income_movie)
bartlett.test(연간총관객수~.,data=income_movie)

income_movie

### 연도, 1인당 제거 corr
income_movie_notper <- income_movie[, !(names(income_movie) %in% c("x1인당영화관람횟수", "연도"))] 
cor_income_notper<-cor(income_movie_notper)
corrplot(cor_income_notper, diag = FALSE, col = col(200), type = "lower", 
         method = "color", tl.col = "black", tl.srt = 45, addCoef.col = "black")

#### 다항 회귀 #####

fit_income <- lm(연간총관객수~.,data=income_movie)
summary(fit_income)

par(mfrow=c(2,2))
plot(fit_income)

ncvTest(fit_income)

model_income <- regsubsets(연간총관객수 ~ ., data = income_movie)
par(mfrow = c(1, 1))
plot(model_income, scale="adjr2")

#### 계시 ####
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}
if (!requireNamespace("heatmaply", quietly = TRUE)) {
  install.packages("heatmaply")
}



library(tidyverse)
summary(income_movie$연간총관객수)
ggplot(income_movie, aes(x = 연도, y = 연간총관객수)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "Annual Total Audience over Time",
       x = "Year",
       y = "Annual Total Audience")
cor_matrix <- cor(income_movie[, -1]) # Exclude 연도 since it's just an identifier
cor_matrix["연간.총관객수", ]
library(heatmaply)
heatmaply(cor_matrix, dendrogram = "none", colors = viridis::viridis(256, option = "D"))

#그리 뭐... 쓸만하진 않네.  

# Load required libraries
library(tidyverse)

# Choose a degree for the polynomial regression (e.g., 2 for a quadratic fit)
degree <- 2

# Fit a polynomial regression model using the lm() function with all independent variables except 연도
model <- lm(연간총관객수 ~ poly(문화여가지출률, degree, raw = TRUE) + 
                    poly(오락문화비, degree, raw = TRUE) + 
                    poly(국내총생산, degree, raw = TRUE) + 
                    poly(가계총처분가능소득, degree, raw = TRUE) + 
                    poly(국민처분가능소득, degree, raw = TRUE) + 
                    poly(x1인당영화관람횟수, degree, raw = TRUE),
                  data = income_movie)

# Print the model summary
summary(model)

## 컬럼 좀 정리
model_income <- regsubsets(연간총관객수 ~ ., data = income_movie)

par(mfrow = c(1, 1))
plot(model_income, scale="adjr2")


reduce_income<-income_movie[,c("연간총관객수","x1인당영화관람횟수","문화여가지출률","국내총생산","가계총처분가능소득")]

fit2_income <- lm(연간총관객수~.,data=reduce_income)
summary(fit2_income)

plot(fit2_income, scale="adjr2")

library(leaps)
model_income <- regsubsets(연간총관객수 ~ ., data = reduce_income)
plot(model_income, scale="adjr2")

## 더 줄이자 
reduce_income<-income_movie[,c("연간총관객수","x1인당영화관람횟수","국내총생산")]
model_income <- regsubsets(연간총관객수 ~ ., data = reduce_income)
plot(model_income, scale="adjr2")


##인당만 날려보자. 
reduce_income<-income_movie[,c("문화여가지출률", "오락문화비", "국내총생산", "가계총처분가능소득", "국민처분가능소득", "연간총관객수")]

names(reduce_income)

fit_income <- lm(연간총관객수~.,data=reduce_income)
summary(fit_income)

vif(fit_income)

par(mfrow=c(2,2))
plot(fit_income)

ncvTest(fit_income)
spreadLevelPlot(fit_income)

degree<-2
model_income <- lm(연간총관객수 ~ poly(문화여가지출률, degree, raw = TRUE) + 
                    poly(오락문화비, degree, raw = TRUE) + 
                    poly(국내총생산, degree, raw = TRUE) + 
                    poly(가계총처분가능소득, degree, raw = TRUE) + 
                    poly(국민처분가능소득, degree, raw = TRUE),
                  data = income_movie)

# Print the model summary
summary(model_income)

