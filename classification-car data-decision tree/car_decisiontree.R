install.packages('rpart.plot')

carData=read.csv("C:/Users/Jongwon Shinn/Desktop/5580 Data Mining/Assignment2/cardata_model.csv", header = F, fileEncoding = 'UTF-8-BOM')
carDataTest=read.csv("C:/Users/Jongwon Shinn/Desktop/5580 Data Mining/Assignment2/cardata_test.csv", header = F, fileEncoding = 'UTF-8-BOM')
summary(carData)
summary(carDataTest)
x=carData[,1:6]
y=carData[,7]
View(carData)

# Try rpart
library(rpart)

treeCar = rpart(V7~.,data=carData,method="class",control=rpart.control(minsplit=9))
treeCar
predCar=predict(treeCar,newdata=carDataTest,type="class")
head(predCar)


treeCM=table(carDataTest[,7],predCar)
treeCM
sum(diag(treeCM))/sum(treeCM)

library(pROC)
predCarProb=predict(treeCar,newdata=carDataTest,type="prob")
View(predCarProb)

roc(carData[,7],predCarProb[,1], levels=1)
plot(roc(carData[,7],predCarProb[,2]))

library(rpart.plot)
rpart.plot(treeCar, uniform = TRUE)

#Try randomForest
library(randomForest)
rf=randomForest(x,y)
rfp=predict(rf,x)
rfCM=table(rfp,y)
rfCM
sum(diag(rfCM))/sum(rfCM)
rfProb=predict(rf,x,type="prob")
roc(sonarData[,61],rfProb[,2])
plot(roc(sonarData[,61],rfProb[,2]))

rf=randomForest(x,y,nodesize=50)
rfp=predict(rf,x)
rfCM=table(rfp,y)
rfCM
sum(diag(rfCM))/sum(rfCM)
rfProb=predict(rf,x,type="prob")

# sensitivity is the ability to correctly identify a given class
# specificity is the ability to correctly identify those who are in different class(es)
# Here, we are using the second column that means class 'M'

# If we have more than two classes you need to use multiclass.roc
roc(sonarData[,61],rfProb[,2])

plot(roc(sonarData[,61],rfProb[,2]))
# If you have more than two classes, you can run this separately for each class
# plot(roc(sonarData[,61],rfProb[,1]))
# plot(roc(sonarData[,61],rfProb[,2]))
# plot(roc(sonarData[,61],rfProb[,3]))
# plot(roc(sonarData[,61],rfProb[,4]))

rf=randomForest(x,y,nodesize=10)
rfp=predict(rf,x)
rfCM=table(rfp,y)
rfCM
sum(diag(rfCM))/sum(rfCM)
rfProb=predict(rf,x,type="prob")
roc(sonarData[,61],rfProb[,2])
plot(roc(sonarData[,61],rfProb[,2]))



# Use caret package for 10 fold cross validation
library(caret)
control <- trainControl(method="repeatedcv", number=10, repeats=3)
seed <- 7
metric <- "Accuracy"
set.seed(seed)
rf_default <- train(x,y, method="rf", metric=metric, trControl=control)
library(caret)
control <- trainControl(method="repeatedcv", number=10, repeats=3)
rf_default <- train(x,y, method="rf", metric=metric, trControl=control)
print(rf_default)
varImp(rf_default)
ggplot(varImp(rf_default))