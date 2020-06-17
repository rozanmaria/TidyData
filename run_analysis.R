library(dplyr)

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#1
X_tot <- rbind(X_train, X_test)
Y_tot <- rbind(Y_train, Y_test)
Sub_tot <- rbind(Sub_train, Sub_test)
final_table <- cbind(X_tot,Y_tot,Sub_tot)

#2
variable_names <- read.table("./UCI HAR Dataset/features.txt")
sel_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_tot <- X_tot[,sel_var[,1]]

#3
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(Y_tot) <- 'Activity'
Y_tot$activity_label <- factor(Y_tot$Activity, labels = activity_labels[,2])
act_lab <- Y_tot[,2]

#4
colnames(X_tot) <- variable_names[sel_var[,1],2]

#5
colnames(Sub_tot) <- 'Subject'
tot <- cbind(X_tot,act_lab,Sub_tot)
tot_mean <- tot %>% group_by(act_lab, Subject) %>% summarize_each(funs(mean))
write.table(tot_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
