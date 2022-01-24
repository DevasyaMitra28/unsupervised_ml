Iris=read.csv("Iris.csv",header=TRUE)
head(Iris)
View(Iris)
Data=Iris[,c(-1,-6)]
head(Data)
View(Data)

set.seed(123)

k.max <- 15
data <- Data
wss <- sapply(1:k.max, 
              function(k){kmeans(data, k, nstart=50,iter.max = 15 )$tot.withinss})
wss
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")
#There will be three clusters.

set.seed(123)
cluster=kmeans(data,3)
cluster

cluster$cluster
table(Iris$Species,cluster$cluster)

centroids=cluster$centers
centroids

par(mfrow=c(1,2))

plot(Iris[,c(2,3)],col=cluster$cluster,xlab="Sepal Length",y="Sepal Width")
points(x=centroids[,1],y=centroids[,2],col="blue",pch=2)
legend(x=2,y=5.8,legend=paste(c("Iris-setosa","Iris-versicolor","Iris-virginica","Centroids")),col=c("red","black","green","blue"),pch=c(14,14,14,14),bty="n",ncol=1,cex=0.7,pt.cex=0.7,xpd=TRUE)
title(main="Clusters 1")

plot(Iris[,c(4,5)],col=cluster$cluster,xlab="Petal Length",y="Petal Width")
points(x=centroids[,3],y=centroids[,4],col="blue",pch=2)
legend(x=-2.5,y=3.9,legend=paste(c("Iris-setosa","Iris-versicolor","Iris-virginica","Centroids")),col=c("red","black","green","blue"),pch=c(14,14,14,14),bty="n",ncol=1,cex=0.7,pt.cex=0.7,xpd=TRUE)
title(main="Clusters 2")

