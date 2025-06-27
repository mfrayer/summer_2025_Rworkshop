3+5 #addition 

print("Hello World!")

total <- 3+5+12 

subtotal1 <- 5 
subtotal2 <- 2
total <- subtotal1 + subtotal2

typeof(total)


subtotal1 <- "5" 
subtotal2 <- 2
total <- subtotal1 + subtotal2

subtotal1 <- as.numeric(subtotal1)

a_variable <- "guttatus"
a_vector <- c("nasutus","decorus",a_variable)
a_vector <- c(a_vector,"tilingii")
length(a_vector)  
class(a_vector)  

another_vector <- c(1,2,3,4)
another_vector <- 1:4
another_vector <- seq(from=5,to=100,by=5)

a_matrix <- matrix(cbind(a_vector,another_vector),ncol=2)

a_dataframe <- as.data.frame(cbind(a_vector,another_vector))
colnames(a_dataframe) <- c("species","index")

nrow(a_dataframe)
ncol(a_dataframe)

str(a_dataframe)

a_dataframe$index <- as.numeric(a_dataframe$index)
mean(a_dataframe$index) 

#####################################
##### Real Data 
#####################################


flowering_time <- read.table("1b_postdoc/summer_2025_Rworkshop/flowering_data.txt",header=TRUE)
germination <- read.csv("1b_postdoc/summer_2025_Rworkshop/germination_data.csv")


unique(flowering_time$Population)
nrow(flowering_time)

is.na(flowering_time)
flowering_time_clean <- na.omit(flowering_time)

germination_clean <- germination[!(germination$Name==""), ]

germination_summary <- germination_clean %>% group_by(Population,Germinated,GA_treated) %>% tally() 

germination_summary$n[germination_summary=="Yes"]

