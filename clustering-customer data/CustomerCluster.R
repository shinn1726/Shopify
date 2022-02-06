library(ggplot2)
library(GGally)
library(DMwR)
#install.packages("Rtools")
#install.packages("https://cran.r-project.org/src/contrib/Archive/DMwR/DMwR_0.4.1.tar.gz", repos = NULL, type="source")




#Set randon number of generator state for repeatable result
set.seed(2180)
cust <- read.csv("C:/Users/Jongwon Shinn/Desktop/5580 Data Mining/Assignment1/CustomerCluste_final.csv")
View(cust)

ggpairs(cust[,which(names(cust)!="CustomerID")], upper = list(continuous = ggally_points),
        lower = list(continuous = "points"), title = "Customers before outlier removal") #Visualise Outliers

boxplot(cust$No_of_prdt)
boxplot(cust$No_of_dictinct_prdt)
boxplot(cust$Baskets)
boxplot(cust$Rev_per_basket)
boxplot(cust$Revenue)

cust.clean <- cust[(cust$CustomerID != 0 & cust$CustomerID!=15195 & cust$CustomerID!=13135 & cust$CustomerID!=17841 & cust$CustomerID!=14911 & cust$CustomerID!=14096 & cust$CustomerID!=12748), ] #Remove Outliers


ggpairs(cust.clean[,which(names(cust)!="CustomerID")], upper = list(continuous = ggally_points),
        lower = list(continuous = "points"), title = "Customers after outlier removal") 

View((cust.clean[-6]))
cust.scale=scale(cust.clean[-6]) #Normalise data
View(cust.scale)





withinSSrange <- function(data,low,high,maxIter) #Elbow method, calculate SSR
{
  withinss = array(0, dim=c(high-low+1));
  for(i in low:high)
  {
      withinss[i-low+1] <- kmeans(data, i, maxIter)$tot.withinss
  }
  withinss
}

plot(withinSSrange(cust.scale,1,50,150)) #Elbow method, calculate SSR

ckm = kmeans(cust.scale,7,150)
ckm$size

cust.realCenters = unscale(ckm$centers, cust.scale) #De normalize the data.
cust.realCenters


clusteredCust = cbind(cust.clean, ckm$cluster)

View(clusteredCust)

plot(clusteredCust[,1:5], col=ckm$cluster)

write.csv(clusteredCust, file = "C:/Users/Jongwon Shinn/Desktop/5580 Data Mining/Assignment1/CustomerCluster_result_final1.csv")
