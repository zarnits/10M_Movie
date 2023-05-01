library(dplyr)
# genre_audi <- read.csv("../movie_data/genre_audi.csv", header=T)
genre_audi <- read.csv("../movie_data/genre_audi_group.csv", header=T)
str(genre_audi)
View(genre_audi)

## 주제 : 장르별로 관객수 차이가 있는가?(1~202위까지) ##
# 있다면 무엇과 차이가 있는가 #

# 장르별 영화수와 평균 관객수 조회 #
library(moonBook)
moonBook::densityplot(audi~genre, data=genre_audi)
barplot(audi~genre, data=genre_audi)

# '사극', '액션', '코미디', '판타지', '드라마', 'SF', '애니메이션', '어드벤처', '범죄', '가족',
# '전쟁', '스릴러', '뮤지컬'

## 조건 확인 ##
shapiro.test(genre_audi$audi[genre_audi$genre=="사극"])        # p-value = 0.001059
shapiro.test(genre_audi$audi[genre_audi$genre=="액션"])        # p-value = 3.658e-10
shapiro.test(genre_audi$audi[genre_audi$genre=="코미디"])      # p-value = 4.107e-05
shapiro.test(genre_audi$audi[genre_audi$genre=="판타지"])      # p-value = 0.0007708
shapiro.test(genre_audi$audi[genre_audi$genre=="드라마"])      # p-value = 6.137e-08
shapiro.test(genre_audi$audi[genre_audi$genre=="SF"])          # p-value = 0.000572
shapiro.test(genre_audi$audi[genre_audi$genre=="애니메이션"])  # p-value = 2.73e-05
shapiro.test(genre_audi$audi[genre_audi$genre=="어드벤처"])    # p-value = 0.07139
shapiro.test(genre_audi$audi[genre_audi$genre=="범죄"])        # p-value = 0.0001646
shapiro.test(genre_audi$audi[genre_audi$genre=="가족"])        # p-value = 0.02499
shapiro.test(genre_audi$audi[genre_audi$genre=="전쟁"])        # p-value = 0.5434
shapiro.test(genre_audi$audi[genre_audi$genre=="스릴러"])      # p-value = 0.004131
shapiro.test(genre_audi$audi[genre_audi$genre=="뮤지컬"])      # p-value = 0.107
# 정규분포 : 전쟁, 뮤지컬

genre_audi <- genre_audi[!(genre_audi$genre == "서부극(웨스턴)"), ]
genre_audi <- genre_audi[!(genre_audi$genre == "다큐멘터리"), ]
genre_audi <- genre_audi[!(genre_audi$genre == "기타" ), ]
genre_audi <- genre_audi[!(genre_audi$genre == "공포(호러)" ), ]
genre_audi <- genre_audi[!(genre_audi$genre == "뮤지컬" ), ]

his<-genre_audi[genre_audi$genre=="사극",]
act<-genre_audi[genre_audi$genre=="액션",]
comic<-genre_audi[genre_audi$genre=="코미디",]
fant<-genre_audi[genre_audi$genre=="판타지",]
drama<-genre_audi[genre_audi$genre=="드라마",]
sf<-genre_audi[genre_audi$genre=="SF",]
ani<-genre_audi[genre_audi$genre=="애니메이션",]
ss<-genre_audi[genre_audi$genre=="범죄",]
family<-genre_audi[genre_audi$genre=="가족",]
war<-genre_audi[genre_audi$genre=="전쟁",]

# 1) Q-Q plot 그리기
qqnorm(his$audi)
qqline(his$audi)
# 2) 히스토그램 그리기
hist(his$audi, prob=TRUE)
hisrange<-seq(min(his$audi),max(his$audi),length=max(max(his$audi)-min(his$audi),100))
ND<-dnorm(hisrange,mean=mean(his$audi),sd=sd(his$audi))
lines(hisrange, ND, lwd=2)
# 3) Shapiro-Wilk test 시행하기
shapiro.test(his$audi)

# 정규분포라 가정하고 .. #
## 등분산 테스트 ##
bartlett.test(audi~genre, data=genre_audi) # p-value = 0.0786 -> 등분산O
## welch's anova ##
oneway.test(audi~genre, data=genre_audi, var.equal=F) # p-value = 0.1198 -> 차이존재X
## 사후검정 ##
library(nparcomp)
result <- mctp(audi~genre, data=genre_audi)
result
summary(result)
plot(result)

# 정규분포가 아니므로 .. #
## kruskal 검증 ## 
library(pgirmess)
kruskal.test(audi~genre, data=genre_audi) # p-value = 0.7405 -> 차이가 없다.

## 사후분석
install.packages("dunn.test")
library(dunn.test)
dunn.test(genre_audi$audi, genre_audi$genre, method = 'bonferroni')

## 사후검정 ##
kruskalmc(genre_audi$audi, genre_audi$genre)
#                           obs.dif critical.dif stat.signif
#SF-가족                 20.4511278    179.00034       FALSE
#SF-드라마               25.2265725     85.40441       FALSE
#SF-멜로/로맨스         104.9298246    161.33340       FALSE
#SF-뮤지컬               53.5131579    228.76589       FALSE
#SF-미스터리             38.8631579    207.03599       FALSE
#SF-범죄                 41.8313397    116.58989       FALSE
#SF-사극                 27.6203008    136.06119       FALSE
#SF-스릴러               32.8421053    122.28051       FALSE
#SF-애니메이션           77.3995215    149.00414       FALSE
#SF-액션                 23.5313397     81.89005       FALSE
#SF-어드벤처             21.4060150     94.07153       FALSE
#SF-전쟁                 40.1368421    207.03599       FALSE
#SF-코미디               24.9298246    103.55447       FALSE
#SF-판타지               24.7196796    114.97347       FALSE
#가족-드라마             45.6777003    171.36711       FALSE
#가족-멜로/로맨스       125.3809524    219.31995       FALSE
#가족-뮤지컬             73.9642857    272.77574       FALSE
#가족-미스터리           59.3142857    254.82676       FALSE
#가족-범죄               62.2824675    188.85438       FALSE
#가족-사극               48.0714286    201.45824       FALSE
#가족-스릴러             53.2932331    192.41959       FALSE
#가족-애니메이션         97.8506494    210.41627       FALSE
#가족-액션               43.9824675    169.64302       FALSE
#가족-어드벤처           41.8571429    175.84717       FALSE
#가족-전쟁               19.6857143    254.82676       FALSE
#가족-코미디             45.3809524    181.09749       FALSE
#가족-판타지             45.1708075    187.86078       FALSE
#드라마-멜로/로맨스      79.7032520    152.82026       FALSE
#드라마-뮤지컬           28.2865854    222.84389       FALSE
#드라마-미스터리         13.6365854    200.47311       FALSE
#드라마-범죄             16.6047672    104.49291       FALSE
#드라마-사극              2.3937282    125.84996       FALSE
#드라마-스릴러            7.6155327    110.80654       FALSE
#드라마-애니메이션       52.1729490    139.74190       FALSE
#드라마-액션              1.6952328     63.49445       FALSE
#드라마-어드벤처          3.8205575     78.58128       FALSE
#드라마-전쟁             65.3634146    200.47311       FALSE
#드라마-코미디            0.2967480     89.71673       FALSE
#드라마-판타지            0.5068929    102.68623       FALSE
#멜로/로맨스-뮤지컬      51.4166667    261.52237       FALSE
#멜로/로맨스-미스터리    66.0666667    242.74270       FALSE
#멜로/로맨스-범죄        63.0984848    172.20140       FALSE
#멜로/로맨스-사극        77.3095238    185.93753       FALSE
#멜로/로맨스-스릴러      72.0877193    176.10407       FALSE
#멜로/로맨스-애니메이션  27.5303030    195.60764       FALSE
#멜로/로맨스-액션        81.3984848    150.88439       FALSE
#멜로/로맨스-어드벤처    83.5238095    157.82766       FALSE
#멜로/로맨스-전쟁       145.0666667    242.74270       FALSE
#멜로/로맨스-코미디      80.0000000    163.65710       FALSE
#멜로/로맨스-판타지      80.2101449    171.11112       FALSE
#뮤지컬-미스터리         14.6500000    291.94072       FALSE
#뮤지컬-범죄             11.6818182    236.55589       FALSE
#뮤지컬-사극             25.8928571    246.73494       FALSE
#뮤지컬-스릴러           20.6710526    239.41180       FALSE
#뮤지컬-애니메이션       23.8863636    254.10178       FALSE
#뮤지컬-액션             29.9818182    221.52080       FALSE
#뮤지컬-어드벤처         32.1071429    226.30717       FALSE
#뮤지컬-전쟁             93.6500000    291.94072       FALSE
#뮤지컬-코미디           28.5833333    230.41053       FALSE
#뮤지컬-판타지           28.7934783    235.76340       FALSE
#미스터리-범죄            2.9681818    215.61251       FALSE
#미스터리-사극           11.2428571    226.73377       FALSE
#미스터리-스릴러          6.0210526    218.74203       FALSE
#미스터리-애니메이션     38.5363636    234.72917       FALSE
#미스터리-액션           15.3318182    199.00134       FALSE
#미스터리-어드벤처       17.4571429    204.31595       FALSE
#미스터리-전쟁           79.0000000    275.24435       FALSE
#미스터리-코미디         13.9333333    208.85181       FALSE
#미스터리-판타지         14.1434783    214.74275       FALSE
#범죄-사극               14.2110390    148.78677       FALSE
#범죄-스릴러              8.9892344    136.29886       FALSE
#범죄-애니메이션         35.5681818    160.70808       FALSE
#범죄-액션               18.3000000    101.64071       FALSE
#범죄-어드벤처           20.4253247    111.68844       FALSE
#범죄-전쟁               81.9681818    215.61251       FALSE
#범죄-코미디             16.9015152    119.78473       FALSE
#범죄-판타지             17.1116601    129.78348       FALSE
#사극-스릴러              5.2218045    153.28674       FALSE
#사극-애니메이션         49.7792208    175.34689       FALSE
#사극-액션                4.0889610    123.49202       FALSE
#사극-어드벤처            6.2142857    131.88538       FALSE
#사극-전쟁               67.7571429    226.73377       FALSE
#사극-코미디              2.6904762    138.80860       FALSE
#사극-판타지              2.9006211    147.52355       FALSE
#스릴러-애니메이션       44.5574163    164.88301       FALSE
#스릴러-액션              9.3107656    108.12102       FALSE
#스릴러-어드벤처         11.4360902    117.61644       FALSE
#스릴러-전쟁             72.9789474    218.74203       FALSE
#스릴러-코미디            7.9122807    125.33037       FALSE
#스릴러-판타지            8.1224256    134.91876       FALSE
#애니메이션-액션         53.8681818    137.62218       FALSE
#애니메이션-어드벤처     55.9935065    145.20102       FALSE
#애니메이션-전쟁        117.5363636    234.72917       FALSE
#애니메이션-코미디       52.4696970    151.51703       FALSE
#애니메이션-판타지       52.6798419    159.53928       FALSE
#액션-어드벤처            2.1253247     74.74680       FALSE
#액션-전쟁               63.6681818    199.00134       FALSE
#액션-코미디              1.3984848     86.37800       FALSE
#액션-판타지              1.1883399     99.78241       FALSE
#어드벤처-전쟁           61.5428571    204.31595       FALSE
#어드벤처-코미디          3.5238095     98.00322       FALSE
#어드벤처-판타지          3.3136646    110.00001       FALSE
#전쟁-코미디             65.0666667    208.85181       FALSE
#전쟁-판타지             64.8565217    214.74275       FALSE
#코미디-판타지            0.2101449    118.21200       FALSE

ggplot(genre_audi, aes(x=genre, y=audi, col=genre)) + geom_boxplot()

#------------------------------------------------------------------------------#
library(dplyr)
genre_audi <- read.csv("../movie_data/genre2.csv", header=T)
str(genre_audi)
View(genre_audi)

## 주제 : 장르별로 관객수 차이가 있는가?(1~58위까지) ##
## 있다면 무엇과 차이가 있는가
## 귀무가설 : 장르마다 차이가 없다.
## 대립가설 : 장르마다 차이가 있다.

out <- aov(audi~genre, data=genre_audi_2) # Residuals :잔차
shapiro.test(resid(out)) # p-value = 0.0002043

## 조건 확인 ##
shapiro.test(genre_audi$audi[genre_audi$genre=="사극"])        # p-value = 0.6592
shapiro.test(genre_audi$audi[genre_audi$genre=="액션"])        # p-value = 0.0005149
shapiro.test(genre_audi$audi[genre_audi$genre=="코미디"])      # p-value = 0.0469
shapiro.test(genre_audi$audi[genre_audi$genre=="판타지"])      # p-value = 0.9733
shapiro.test(genre_audi$audi[genre_audi$genre=="드라마"])      # p-value = 0.1957
shapiro.test(genre_audi$audi[genre_audi$genre=="SF"])          # p-value = 0.1619
shapiro.test(genre_audi$audi[genre_audi$genre=="애니메이션"])  # 
shapiro.test(genre_audi$audi[genre_audi$genre=="어드벤처"])    # p-value = 0.07139
shapiro.test(genre_audi$audi[genre_audi$genre=="범죄"])        # p-value = 0.1535
shapiro.test(genre_audi$audi[genre_audi$genre=="가족"])        # p-value = 0.4544
shapiro.test(genre_audi$audi[genre_audi$genre=="스릴러"])      # p-value = 0.4938

genre_audi_2 <- genre_audi[!(genre_audi$genre == "뮤지컬" ), ]
genre_audi_2 <- genre_audi_2[!(genre_audi_2$genre == "전쟁" ), ]
genre_audi_2 <- genre_audi_2[!(genre_audi_2$genre == "애니메이션" ), ]

# 정규분포라 가정이므로 .. #
## 등분산 테스트 ##
bartlett.test(audi~genre, data=genre_audi_2) # p-value = 0.5594 -> 등분산O

## welch's anova ##
oneway.test(audi~genre, data=genre_audi_2, var.equal=F) # p-value = 0.4887 -> 차이없다..

## 사후검정 ##
library(nparcomp)
result <- mctp(audi~genre, data=genre_audi_2)
result
summary(result)

out <- aov(audi~genre, data=genre_audi_2)
summary(out) 
TukeyHSD(out)

r <- table(genre_audi_2$genre)
r
plot(result)

ggplot(genre_audi, aes(x=genre, y=audi, col=genre)) + geom_boxplot()

# 정규분포가 아니면 .. #
## kruskal 검증 ## 
library(pgirmess)
kruskal.test(audi~genre, data=genre_audi_2) # p-value = 0.436 -> 차이가 없다.

## 사후검정 ##
kruskalmc(genre_audi_2$audi, genre_audi_2$genre)
