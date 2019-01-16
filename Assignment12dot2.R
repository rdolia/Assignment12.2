#Assignment12.2
my_data <- read.delim("community.txt",sep = ",")

#a Find top attributes having highest correlation (select only Numeric)
options(max.print = 99999)
nums <- unlist(lapply(my_data, is.numeric))  
numeric_attributes<- my_data[,nums]
correlation <-as.data.frame(cor(numeric_attributes))

#replacing all values of 1 with 0.
correlation[correlation==1]<-0
correlation1<-as.matrix(correlation)

#a. Visualize the correlation between all variable in a meaningful
#way, clear representation of correlations
install.packages("corrplot")
library(corrplot)
#Positive correlations are displayed in blue and negative correlations in red color
corrplot(correlation1, method = "color")



#. Find out top 3
#reasons for having more crime in a city.

#The column X0.2.2 is ViolentCrimesPerPop which best identifies having more crime.
# Hence we will take the 3 highest correlations for this column and identify the 3 reasons.
violent3<-correlation1[,102]
violent3<-as.matrix(violent3)
sort(violent3,decreasing = TRUE)
#The 3 highest values are 0.73796471  0.63127917  0.57468959 which are for 
#X.0.14,X.0.02,X.0.15.
#Highest reason -      - PctRecImmig5- 0.73796471
#Second highest reason - agePct65up  - 0.63127917
#Third highest reason  - AsianPerCap - 0.57468959
#b. What is the difference between covariance and correlation,
#take an example from this dataset and show the differences if
#any?
#Attached pdf explains the detailed difference. 
#correlation  - refer to above calculated 
#covariance - as below 
cov(correlation1$X0.19,correlation1$X0.02) 
 
