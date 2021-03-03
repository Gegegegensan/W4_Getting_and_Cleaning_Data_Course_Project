# CodeBook




```
train <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\train\\X_train.txt")
```

```
test <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\test\\X_test.txt")
```

```
train_label <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\train\\y_train.txt")
```

```
test_label <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\test\\y_test.txt")
```

```
activity_labels <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\activity_labels.txt")
```

```
subject_train <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\train\\subject_train.txt")
```

subject_test <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\test\\subject_test.txt")
```


```
merged_data <- rbind(train, test)
```


```
mean <- matrix(data=NA, nrow=1, ncol=ncol(merged_data))
```



### Create a blank matrix to store standard deviation
```
std <- matrix(data=NA, nrow=1, ncol=ncol(merged_data))
```



```
labeled_train <- cbind(train_label, train)
```


```
labeled_test <- cbind(test_label, test)
```

```
features <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\features.txt")
features <- features[,2]
features <- append("activity_labels", features)
```


```
all_dataset <- rbind(labeled_train, labeled_test)
```


```
subject_data <- rbind(subject_train, subject_test)
all_dataset <- cbind(subject_data, all_dataset)
```

### Replace the numbers on subject_data with 
```
features <- append("subject", features)
colnames(all_dataset) <- features
```

```
consolidated_all_dataset <- aggregate(all_dataset, by=list(all_dataset[, 1], all_dataset[, 2]), FUN=mean, na.rm=TRUE)
consolidated_all_dataset <- consolidated_all_dataset[, c(-3, -4)]
colnames(consolidated_all_dataset) <- features
```

