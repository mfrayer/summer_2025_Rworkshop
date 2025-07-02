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


flowering_time <- read.table("~/1b_postdoc/summer_2025_Rworkshop/flowering_data.txt",header=TRUE)
germination <- read.csv("~/1b_postdoc/summer_2025_Rworkshop/germination_data.csv")


unique(flowering_time$Population)
nrow(flowering_time)

is.na(flowering_time)
flowering_time_clean <- na.omit(flowering_time)

germination_clean <- germination[!(germination$Name==""), ]

germination_summary <- germination_clean %>% group_by(Population,Germinated,GA_treated) %>% tally() 

germination_summary$n[germination_summary=="Yes"]



################################################################################
######  Day 2 
################################################################################

flowering_time_clean$Date_of_planting <- mdy("March 21, 2023")
flowering_time_clean$Date_first_flower2 <- mdy(flowering_time_clean$Date_of_first_flower)

flowering_time_clean$flowering_time <- flowering_time_clean$Date_first_flower2 - flowering_time_clean$Date_of_planting

mean(flowering_time_clean$flowering_time)

ggplot(flowering_time_clean, aes(Population,flowering_time)) + geom_boxplot()

flowering_time_clean$Date_of_planting[flowering_time_clean$Population=="OD" | flowering_time_clean$Population=="ODG"] <- mdy("April 26, 2023")

flowering_time_clean$flowering_time <- flowering_time_clean$Date_first_flower2 - flowering_time_clean$Date_of_planting

ggplot(flowering_time_clean, aes(Population,flowering_time)) + geom_boxplot()


plot <- ggplot(flowering_time_clean, aes(Population,as.numeric(flowering_time))) + geom_boxplot()

plot_2 <- plot + geom_hline(yintercept = mean(flowering_time_clean$flowering_time)) + labs(y="Flowering Time (Days)") + theme_classic() + theme(axis.text.x = element_text(angle = 90))


plot_2 + geom_point(data=flowering_time_clean, aes(x=Population,y=flowering_time), shape=6, alpha=0.5)


plot_2 + annotate("text", x="ODG", y=65, label="Total Sample Size = 73")

big_label <- paste("Total Sample Size = ",nrow(flowering_time_clean),sep="")

plot_2 + annotate("text", x="ODG", y=65, label=big_label)

plot_2  + annotate("text", x=c("CM","CMG","OD","ODG","ODW","ODWD","ODWG"), y=65, label=c(21,4,6,10,17,9,2)) + annotate("text", x="ODG", y=70, label=big_label)


ggplot(germination_summary, aes(Germinated,n)) + geom_col(fill="#00008B")

ggplot(germination_summary, aes(Germinated,n,fill=Population)) + geom_col()

ggplot(germination_summary, aes(Germinated,n)) + geom_col()  + facet_wrap(~Population)

ggplot(germination_summary, aes(Germinated,n)) + geom_col()  + facet_grid(GA_treated~Population)

ggplot(germination_summary, aes(Germinated, n, fill=Population)) + geom_col() + facet_wrap(~Population)

ggplot(germination_summary, aes(Germinated, n, fill=GA_treated)) + geom_col() + facet_wrap(~Population) + scale_fill_manual(values = c("black","pink"))

ggplot(germination_summary, aes(GA_treated, n, fill=Germinated)) + geom_col() + facet_wrap(~Population, scales="free_y")


