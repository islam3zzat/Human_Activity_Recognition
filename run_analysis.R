#rm(list = ls())      #cleaning the environment from any previouse work, if you don't have important work going on uncomment

require(fImport)    
#require(data.table)  
#require(plyr)



##################  PATHS  #######################
subjec_train_path <- 'train/subject_train.txt'
subjec_test_path <- 'test/subject_test.txt'

train_set_path <- 'train/X_train.txt'
test_set_path <- 'test/X_test.txt'

train_labels_path <- 'train/y_train.txt'
test_labels_path <- 'test/y_test.txt'

activity_path <- 'activity_labels.txt'
features_path <- 'features.txt'
#######################################################################

features <- read.table(features_path)[,2]   #getting the features 
indeces <- grep('.*-mean[^F]()|.*-std()',features)  #getting the features of interest ps: didn't include meanFrequency() because its a different mesurement from the mean


###########  getting the feature names more readable ##################

features <- gsub('[()]',replacement = '',x = features)
features <- gsub('[-]',replacement = ' ',x = features)
features <- gsub('mean',replacement = 'Mean',x = features)
features <- gsub('std',replacement = 'STD',x = features)
features <- gsub(' ',replacement = '_',x = features)

#######################################################################
  
activities <- read.table(activity_path)
activities <- as.character(activities[,2])



get_subject <- function(path){    #getting subjects who performed the activity
  return (read.table(path))
}

get_set <- function(path){    # getting the sets
  print('this may take seviral minutes please wait')
  set <- read.table(path)
  names(set) <- features
  set <- set[,indeces]
  print('Done')
  return (set)
}


get_labels <- function(path){   #getting labels
  num_lbls <- read.lines(path)  
  num_lbls_fac <- factor(num_lbls)        # converting the lable character vector to a facctor
  #setattr(num_lbls_fac,'levels',activities)  
  levels(num_lbls_fac) <- activities    # changing the laels levels to the coresponding activity
  lables <- as.data.frame(num_lbls_fac)

  return (lables)
}


################### collecting dataset variabls ###############################


train_subject <- get_subject(subjec_train_path)
names(train_subject) <- 'Subject_No'
train_set <- get_set(train_set_path)
train_labels <- get_labels(train_labels_path)
names(train_labels) <- 'activity'

test_subject <- get_subject(subjec_test_path)
names(test_subject) <- 'Subject_No'
test_set <- get_set(test_set_path)
test_labels <- get_labels(test_labels_path)
names(test_labels) <- 'activity'


#####################  Collecting the dataset ###################################

train_dataset <- cbind(train_subject,train_labels,train_set)
test_dataset  <- cbind(test_subject ,test_labels ,test_set )
data_set      <- rbind(train_dataset,test_dataset)


#####################   constructing the tidy_dataset   #########################


getUniqe <- function(data,subject,actv){      # subsetting over the subject and the activity
  return(data[data$Subject_No == subject & data$activity == actv,])
}

#the number of rows willbe the same as the number of subjects times the number of activities
num_rows <- length(unique(data_set$Subject_No))*length(activities)  


#the number of columns will be the same as the number of columns in the dataset
num_cols <- dim(data_set)[2]  


#constructing a metrix with the expectid dimention
m <- matrix(nrow = num_rows,ncol = num_cols)   


tidy_dataset <- as.data.frame(m)        
names(tidy_dataset) <- paste('Average_Of',names(data_set),sep='_')


n <- 1   # we'll start building the tidy dataset from row number 1


#looping over the subjects and activities and susetting over them
for(S in unique(data_set$Subject_No)){
  for(A in activities){
    tmp <- colMeans(getUniqe(data_set,S,A)[3:num_cols])   #getting the column means starting from the third column to the end
    col1 <- S    # the first column will be the subject
    col2 <- A    # the second column will be the activity
    tidy_dataset[n,1] <- S  # plugging the first column
    tidy_dataset[n,2] <- A  # plugging the second column
    tidy_dataset[n,3:num_cols ]  <- tmp  # plugging the columns means
    n = n+1   # the next row
  }
}


dir.create('analyse_results')
write.table(data_set, "analyse_results/dataset.txt")                   # getting the data set file
write.table(tidy_dataset, "analyse_results/tidy_dataset.txt")          # getting the tidy data set file
