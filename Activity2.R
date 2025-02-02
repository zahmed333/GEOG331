#GEOG331 Activity 2
# Z.A. 01/31/2022

# set working directory to my noaa data folder

# make a vector for practice
heights <- c(20, 30, 40, 50)

heights^2

#Question 2 vectors

#Numeric
die <- c(1.1, 2.2, 3.3, 4.4, 5.5, 6.6)

#Integer
int <- c(-1L, 2L, 4L, 3L, -5L)

#Character
text <- c("Hello", "Professor", "Loranty,", "I am", "Zul")

#Factor Data
eyes <- c("Brown", "Black", "Hazel", "Green", "Blue")



#reads the data from file
datW <- read.csv("Z:/data/noaa_weather/2011124.csv",
                 stringsAsFactors = T)

#get more information about the dataframe
str(datW)

#specify a column with a proper date format
datW$dateF <- as.Date(datW$DATE, "%Y-%m-%d")

datW$year <- as.numeric(format(datW$dateF,"%Y"))

unique(datW$NAME)

#look at the mean maximum temperature for Aberdeen
mean(datW$TMAX[datW$NAME == "ABERDEEN, WA US"])

#with na.rm argument set to true to ignore NA
mean(datW$TMAX[datW$NAME == "ABERDEEN, WA US"], na.rm=TRUE)

#calculate the average daily temperature
datW$TAVE <- datW$TMIN + ((datW$TMAX-datW$TMIN)/2)

datW$siteN <- as.numeric(datW$NAME)

#make a histogram for the first site in our levels
#main= is the title name argument.
#Here you want to paste the actual name of the factor not the numeric index
#since that will be more meaningful. 
hist(datW$TAVE[datW$siteN == 1],
     freq=FALSE, 
     main = paste(levels(datW$NAME)[1]),
     xlab = "Average daily temperature (degrees C)", 
     ylab="Relative frequency",
     col="grey50",
     border="white")

par(mfrow=c(2,2))

#make a histogram for the first site in our levels, Aberdeen
#main= is the title name argument.
#Here you want to paste the actual name of the factor not the numeric index
#since that will be more meaningful. 
hist(datW$TAVE[datW$siteN == 1],
     freq=FALSE, 
     main = paste(levels(datW$NAME)[1]),
     xlab = "Average daily temperature (degrees C)", 
     ylab="Relative frequency",
     col="grey50",
     border="white")
#add mean line with red (tomato3) color
#and thickness of 3
abline(v = mean(datW$TAVE[datW$siteN == 1],na.rm=TRUE), 
       col = "tomato3",
       lwd = 3)
#add standard deviation line below the mean with red (tomato3) color
#and thickness of 3
abline(v = mean(datW$TAVE[datW$siteN == 1],na.rm=TRUE) - sd(datW$TAVE[datW$siteN == 1],na.rm=TRUE), 
       col = "tomato3", 
       lty = 3,
       lwd = 3)
#add standard deviation line above the mean with red (tomato3) color
#and thickness of 3
abline(v = mean(datW$TAVE[datW$siteN == 1],na.rm=TRUE) + sd(datW$TAVE[datW$siteN == 1],na.rm=TRUE), 
       col = "tomato3", 
       lty = 3,
       lwd = 3)

#Livermore
hist(datW$TAVE[datW$siteN == 2],
     freq=FALSE, 
     main = paste(levels(datW$NAME)[2]),
     xlab = "Average daily temperature (degrees C)", 
     ylab="Relative frequency",
     col="black",
     border="white")

abline(v = mean(datW$TAVE[datW$siteN == 2],na.rm=TRUE), 
       col = "tomato3",
       lwd = 3)

abline(v = mean(datW$TAVE[datW$siteN == 2],na.rm=TRUE) - sd(datW$TAVE[datW$siteN == 2],na.rm=TRUE), 
       col = "tomato3", 
       lty = 3,
       lwd = 3)

abline(v = mean(datW$TAVE[datW$siteN == 2],na.rm=TRUE) + sd(datW$TAVE[datW$siteN == 2],na.rm=TRUE), 
       col = "tomato3", 
       lty = 3,
       lwd = 3)

#Mandan Experiment Station
hist(datW$TAVE[datW$siteN == 3],
     freq=FALSE, 
     main = paste(levels(datW$NAME)[3]),
     xlab = "Average daily temperature (degrees C)", 
     ylab="Relative frequency",
     col="blue",
     border="white")

abline(v = mean(datW$TAVE[datW$siteN == 3],na.rm=TRUE), 
       col = "tomato3",
       lwd = 3)

abline(v = mean(datW$TAVE[datW$siteN == 3],na.rm=TRUE) - sd(datW$TAVE[datW$siteN == 3],na.rm=TRUE), 
       col = "tomato3", 
       lty = 3,
       lwd = 3)

abline(v = mean(datW$TAVE[datW$siteN == 3],na.rm=TRUE) + sd(datW$TAVE[datW$siteN == 3],na.rm=TRUE), 
       col = "tomato3", 
       lty = 3,
       lwd = 3)

#Mormon Flat
hist(datW$TAVE[datW$siteN == 4],
     freq=FALSE, 
     main = paste(levels(datW$NAME)[4]),
     xlab = "Average daily temperature (degrees C)", 
     ylab="Relative frequency",
     col="green",
     border="white")

abline(v = mean(datW$TAVE[datW$siteN == 4],na.rm=TRUE), 
       col = "tomato3",
       lwd = 3)

abline(v = mean(datW$TAVE[datW$siteN == 4],na.rm=TRUE) - sd(datW$TAVE[datW$siteN == 4],na.rm=TRUE), 
       col = "tomato3", 
       lty = 3,
       lwd = 3)

abline(v = mean(datW$TAVE[datW$siteN == 4],na.rm=TRUE) + sd(datW$TAVE[datW$siteN == 4],na.rm=TRUE), 
       col = "tomato3", 
       lty = 3,
       lwd = 3)


#Question 7
hist(datW$PRCP[datW$siteN == 1],
     freq=FALSE, 
     main = paste(levels(datW$NAME)[1]),
     xlab = "Average Daily Percipitation", 
     ylab="Relative frequency",
     col="grey50",
     border="white")

#Question 8
annualPRCP <- aggregate(datW$PRCP, by = list(datW$year, datW$NAME), FUN = "sum", na.rm=TRUE)
annualPRCP

hist(annualPRCP$x[annualPRCP$Group.2 == "ABERDEEN, WA US"],
     freq=FALSE, 
     main = paste(levels(datW$NAME)[1]),
     xlab = "Years", 
     ylab="Amount of Annual Percipitation",
     col="grey50",
     border="white")



#Question 9

#get the mean across all sites
#the by function is a list of one or more variables to index over.
#FUN indicates the function we want to use
#if you want to specify any function specific arguments use a comma and add them after the function
#here we want to use the na.rm arguments specific to 
averageTemp <- aggregate(datW$TAVE, by=list(datW$NAME), FUN="mean",na.rm=TRUE)
averageTemp

#change the automatic output of column names to be more meaningful
colnames(averageTemp) <- c("NAME","MAAT")
averageTemp

#Calculates the average annual precipitation per site
averagePRCP <- aggregate(datW$PRCP, by=list(datW$NAME), FUN="mean",na.rm=TRUE)
averagePRCP


#pnorm(value to evaluate at (note this will evaluate for all values and below),mean, standard deviation)
pnorm(0,
      mean(datW$TAVE[datW$siteN == 1],na.rm=TRUE),
      sd(datW$TAVE[datW$siteN == 1],na.rm=TRUE))


#pnrom with 5 gives me all probability (area of the curve) below 5 
pnorm(5,
      mean(datW$TAVE[datW$siteN == 1],na.rm=TRUE),
      sd(datW$TAVE[datW$siteN == 1],na.rm=TRUE))

pnorm(5,
      mean(datW$TAVE[datW$siteN == 1],na.rm=TRUE),
      sd(datW$TAVE[datW$siteN == 1],na.rm=TRUE))- pnorm(0,
                                                        mean(datW$TAVE[datW$siteN == 1],na.rm=TRUE),
                                                        sd(datW$TAVE[datW$siteN == 1],na.rm=TRUE))

1 - pnorm(20,
          mean(datW$TAVE[datW$siteN == 1],na.rm=TRUE),
          sd(datW$TAVE[datW$siteN == 1],na.rm=TRUE))

#pnorm of 20 gives me all probability (area of the curve) below 20 
#subtracting from one leaves me with the area above 20
qnorm(0.95,
      mean(datW$TAVE[datW$siteN == 1],na.rm=TRUE),
      sd(datW$TAVE[datW$siteN == 1],na.rm=TRUE))