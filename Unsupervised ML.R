Iris=read.csv("Iris.csv",header=TRUE)
head(Iris)
View(Iris)
iris_data=Iris[,c(-1,-6)]
head(iris_data)
View(iris_data)

set.seed(123)
cluster=kmeans(iris_data,3)
cluster

cluster$cluster
table(Iris$Species,cluster$cluster)

plot(Iris[,c(2,3)],col=cluster$cluster,xlab="Sepal Length",y="Sepal Width")
plot(Iris[,c(4,5)],col=cluster$cluster,xlab="Petal Length",y="Petal Width")
