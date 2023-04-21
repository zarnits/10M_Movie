directory <- "../../movie_DB/individual_trend/"
file_name <- "1987.csv"
full_path <- paste0(directory, file_name)

total<-read.table("../../movie_DB/macro_envirment/audience1_preprocess1.csv",header = T, row.names = 1, sep = ",", fileEncoding = "UTF-8")
total$날짜 <- as.Date(total$날짜, format="%Y-%m-%d %H:%M:%S")
head(total)

movie_1987 <- read.table(full_path, header = TRUE, row.names = 1, sep = ",", fileEncoding = "UTF-8")
movie_1987$날짜 <- as.Date(movie_1987$날짜, format="%Y-%m-%d")
movie_1987<-merge(movie_1987,total,by="날짜",all.x=T)
str(movie_1987)
View(movie_1987)


movie_spiderman_home_coming <- read.table("../../movie_DB/individual_trend/스파이더맨- 홈 커밍.csv", header = TRUE, row.names = 1, sep = ",", fileEncoding = "UTF-8")
movie_spiderman_home_coming$날짜 <- as.Date(movie_spiderman_home_coming$날짜, format="%Y-%m-%d")
movie_spiderman_home_coming<-merge(movie_spiderman_home_coming,total,by="날짜",all.x=T)
View(movie_spiderman_home_coming)

cor(movie_1987$관객수,movie_1987$전체관객수, method="pearson")
cor.test(movie_1987$관객수,movie_1987$전체관객수, method="pearson")

cor(movie_spiderman_home_coming$관객수,movie_spiderman_home_coming$전체관객수, method="pearson")
cor.test(movie_spiderman_home_coming$관객수,movie_spiderman_home_coming$전체관객수, method="pearson")

spierman<-read.csv("spierman_homecoming.csv",sep = ",",header = T, fileEncoding = "UTF-8")

attach(spierman)
cor(관객수,전체관객수,method="pearson")
cor.test(관객수,전체관객수,method="pearson")
reg<-lm(관객수~전체관객수)
summary(reg)

par(mfrow=c(2,2))
plot(reg)
var.test(관객수,전체관객수)
t.test(관객수,전체관객수, var.equal=F)
detach(spirman)
