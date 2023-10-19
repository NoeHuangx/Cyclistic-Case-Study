#Cyclistic Case Study

#install required packages
install.packages("tidyverse")
install.packages("readr")
install.packages("skimr")
install.packages("lubridate")
install.packages("scales")
library(tidyverse)
library(readr)
library(skimr)
library(dplyr)
library(lubridate)
library(ggplot2)
library(janitor)

#set working directory
getwd()
setwd("C:/Users/noeh0/Desktop/Google Analytics/Cyclistic_data/CSV")

#import csv file
jan23 <- read.csv("202301_tripdata.csv")
feb23 <- read.csv("202302_tripdata.csv")
mar23 <- read.csv("202303_tripdata.csv")
apr23 <- read.csv("202304_tripdata.csv")
may23 <- read.csv("202305_tripdata.csv")
jun23 <- read.csv("202306_tripdata.csv")
jul23 <- read.csv("202307_tripdata.csv")

#combine all data into one df
bike_rides <- bind_rows(jan23, feb23, mar23, apr23,
                        may23, jun23, jul23)

#explore data
colnames(bike_rides)
dim(bike_rides)
str(bike_rides)
glimpse(bike_rides)

#expolore meta data and summary of the data 
skim_without_charts(bike_rides)

#change stated_at and ended_at data type to POSIXct as it was orginally chr
bike_rides$started_at  <- lubridate::ymd_hms(bike_rides$started_at)
bike_rides$ended_at  <- lubridate::ymd_hms(bike_rides$ended_at)

#to check if there are duplicates
get_dupes(bike_rides) 

#calculate the day of week of the ride start day
bike_rides$day_of_week  <- weekdays(bike_rides$started_at)

#calcualte the ride length
bike_rides$rides_length  <- difftime(bike_rides$ended_at,
                                     bike_rides$started_at, units = "mins")

#filtered out the data needed for analysis and rides_length >0
#as ride length are zero or negative value
trimmed_df  <- bike_rides %>%
  filter(rides_length > 0) %>%
  select(ride_id, rideable_type, started_at, ended_at,
         member_casual, day_of_week, rides_length)

dim(trimmed_df)

#extract the start hour from started_at column 
trimmed_df$start_hour  <- lubridate::hour(trimmed_df$started_at)

#extract the start month from started_at column 
trimmed_df$start_month <- months(trimmed_df$started_at)

skim_without_charts(trimmed_df)
dim(trimmed_df)
glimpse(trimmed_df)

#for the day_of_week and start_month to show in the preferred order
custom_weekday  <- c("Sunday", "Monday", "Tuesday",
                     "Wednesday", "Thursday", "Friday", "Saturday")

custom_month  <- c("January", "February", "March", "April", "May",
                   "June", "July")

trimmed_df$day_of_week <- factor(trimmed_df$day_of_week,
                                 levels = custom_weekday)

trimmed_df$start_month  <- factor(trimmed_df$start_month,
                                  levels = custom_month)

#calculate percentage of members and percentage of casual from the data set
percent_of_member  <- (sum(trimmed_df$member_casual == "member")/
  length(trimmed_df$member_casual)) * 100

percent_of_casual  <- 100 - percent_of_member

#create pie chart for member and casual percentage 
x  <- c(percent_of_member, percent_of_casual)
labels  <- c("percentage of members: 63.29%", "percentage of casual: 36.71%")

p1 <- pie(x, labels)

#creat plot for rides number taken by the day of week 
g1  <- ggplot(data = trimmed_df) +
  geom_bar(mapping = aes(x = day_of_week, fill = rideable_type)) +
  facet_wrap(~member_casual) +
  theme(axis.text.x = element_text(angle = 20)) +
  labs(title = "Casual Vs. Member: Number of Rides Taken By Day of Week",
       subtitle = "Date from Jan 2023 to July 2023",
       x = "Day of Week",
       y = "Number of Rides Taken") +
  scale_y_continuous(label = scales::comma)
print(g1)

#plot for rides number by months 
g3  <- ggplot(data = trimmed_df) +
  geom_bar(mapping = aes(x = start_month, fill = rideable_type)) +
  facet_wrap(~member_casual) +
  scale_y_continuous(label = scales::comma) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title = "Casual Vs. Member: Number of Rides Taken By Months",
       subtitle = "Date from Jan 2023 to July 2023",
       x = "Month",
       y = "Number of Rides Taken")
print(g3)

#plot for rides number taken by hours
g2  <- trimmed_df %>%
  group_by(member_casual) %>%
  count(start_hour) %>%
  ggplot(aes(x = start_hour, y = n,
             group = member_casual, color = member_casual)) +
  geom_point() + geom_line() +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Member: Number of Rides Taken By Hours",
       subtitle = "Date from Jan 2023 to July 2023",
       x = "Rides Started Hours",
       y = "Number of Rides Taken")
print(g2)
