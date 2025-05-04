#Installing packages 
install.packages("caret") 
install.packages(c("ggplot2", "lattice", "plyr", "reshape2", "e1071"))
install.packages("caret")

#Loading the data
library(caret)
data(GermanCredit)
german_data=GermanCredit
View(german_data)
head(german_data)
table(german_data$Class)
str(german_data)
library(ggplot2)
ggplot(german_data, aes(x=Amount, fill=Class))+ geom_density(alpha=0.5)+ labs(title="Default Risk Density by Loan Amount",x="Loan Amount(DM)", y = "No. of Loans")  

#Splitting into training and testing datatsets 
set.seed(123)
train_idx=createDataPartition(german_data$Class,
 p = 0.8, list = FALSE)
train_data=german_data[train_idx, ]
test_data=german_data[-train_idx, ]


#Cross_validation
ctrl=trainControl(method="cv",number=10,classProbs=TRUE)
#Train logistic regression 
logit_model=train(Class~., data=train_data, method= "glm", family="binomial",trControl= ctrl)
summary(logit_model)
#Random Forest 
rf_model = train(Class~.,data = train_data, method="rf",ntree=100, trControl = ctrl, tuneLength =3 )
rf_model
#predict on test data
logit_pred=predict(logit_model, test_data, type="prob")[, "Bad"] #prob of bad class
logit_pred
rf_pred=predict(rf_model, test_data, type="prob")[, "Bad"]
rf_pred
#ROC AUC Analysis 
library(pROC)
#logistic regression ROC
logit_roc =roc(test_data$Class,logit_pred, levels=c("Good","Bad"))
plot(logit_roc, col="blue", main="ROC Curves")
auc(logit_roc)
#rf regression ROC 
rf_roc=roc(test_data$Class, rf_pred, levels = c("Good","Bad"))
lines(rf_roc,col="red")
legend("bottomright",legend=c("Logit","RF"),col=c("blue","red"),lwd=2)
auc(rf_roc)
#THE MORE THE AUC THE BETTER THE MODEL

varImp(rf_model)
plot(varImp(rf_model), top = 10 , main= " Top 10 Important Features")

saveRDS(rf_model, "rf_model.rds")
write.csv(data.frame(Model=c("Logistic Regression", "Random Forest"), AUC=c(auc(logit_roc),auc(rf_roc))),"model_performance.csv")








































































































































