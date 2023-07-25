#Process

#Packages and Import Data
library(tidyverse)
library(janitor)
library(lubridate)
library(ggplot2)

jul_22<-read.csv("202207-divvy-tripdata.csv")
aug_22<-read.csv("202208-divvy-tripdata.csv")
sep_22<-read.csv("202209-divvy-publictripdata.csv")
oct_22<-read.csv("202210-divvy-tripdata.csv")
nov_22<-read.csv("202211-divvy-tripdata.csv")
dec_22<-read.csv("202212-divvy-tripdata.csv")
jan_23<-read.csv("202301-divvy-tripdata.csv")
feb_23<-read.csv("202302-divvy-tripdata.csv")
mar_23<-read.csv("202303-divvy-tripdata.csv")
apr_23<-read.csv("202304-divvy-tripdata.csv")
may_23<-read.csv("202305-divvy-tripdata.csv")
jun_23<-read.csv("202306-divvy-tripdata.csv")

#Checking data
str(jul_22)
str(aug_22)
str(sep_22)
str(oct_22)
str(nov_22)
str(dec_22)
str(jan_23)
str(feb_23)
str(mar_23)
str(apr_23)
str(may_23)
str(jun_23)

#Combining all 12 months
bikeshare_df <- rbind(jul_22,aug_22,sep_22,oct_22,nov_22,dec_22,jan_23,feb_23,mar_23,apr_23,may_23,jun_23)
str(bikeshare_df)


bikeshare_df$started_at<-as.POSIXlt(bikeshare_df$started_at)
bikeshare_df$ended_at<-as.POSIXlt(bikeshare_df$ended_at)
str(bikeshare_df)

#Adding columns
bikeshare_df2 <- bikeshare_df %>%
  add_column(ride_length= difftime(.$ended_at, .$started_at, units = "mins") , .before =  "start_station_name") %>%
  add_column(day_of_week = weekdays(bikeshare_df$started_at), .after = "ride_length") %>% 
  add_column(month = months(bikeshare_df$started_at), .after = "day_of_week")
bikeshare_df2$day_of_week <- ordered(bikeshare_df2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
bikeshare_df2$month <- ordered(bikeshare_df2$month, levels=c("July", "August", "September", "October", "November", "December", "January", "Feebruary", "March", "April", "May", "June"))

str(bikeshare_df2)



#cleaning data
bikeshare_df2 <- bikeshare_df2 %>%
  clean_names() %>%
  drop_na() %>%
  filter(.$ride_length > 0) %>%
  distinct()

bikeshare_df2 <- bikeshare_df2[!(bikeshare_df2$start_station_name=="" | bikeshare_df2$start_station_id=="" | bikeshare_df2$end_station_name=="" | bikeshare_df2$end_station_id==""),]

#Analyze
#annual vs casual members

aggregate(bikeshare_df2$ride_length ~ bikeshare_df2$member_casual, FUN = mean)
aggregate(bikeshare_df2$ride_length ~ bikeshare_df2$rideable_type, FUN = mean)

bikeshare_df2 %>%
  group_by(member_casual) %>%
  summarise(user_total = n()) %>%
  arrange(member_casual)

#bike types
bikeshare_df2 %>%
  group_by(member_casual, rideable_type) %>%
  summarise(ride_total = n(), average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, rideable_type)

#ride length by month
bikeshare_df2 %>%
  group_by(member_casual, month) %>%
  summarise(ride_total = n(), average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, month)

#ride length by day
bikeshare_df2 %>%
  group_by(member_casual, day_of_week) %>%
  summarise(ride_total = n(), average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, day_of_week)

#start stations
bikeshare_df2 %>%
  group_by(member_casual, start_station_name) %>%
  summarise(ride_total = n(), average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, start_station_name) %>%
  arrange(desc(ride_total))

#end stations
bikeshare_df2 %>%
  group_by(member_casual, end_station_name) %>%
  summarise(ride_total = n(), average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, end_station_name) %>%
  arrange(desc(ride_total))

#Share
#Visualization

#casual vs member
bikeshare_df2 %>%
  group_by(member_casual) %>%
  summarise(user_total = n()) %>%
  arrange(member_casual) %>%
  ggplot(aes(x=member_casual, y=user_total, fill = member_casual)) +
  geom_col() +
  geom_text(aes(label = user_total), position = position_dodge(0.9), vjust = 0) +
  labs(title = "Members vs Casual")

#Weekly number of rides by riders
bikeshare_df2 %>%
  group_by(member_casual, day_of_week) %>%
  summarise(ride_total = n()) %>%
  arrange(member_casual, day_of_week) %>%
  ggplot(aes(x = day_of_week, y = ride_total, fill = member_casual)) +
  geom_col(position = "dodge") +
  geom_text(aes(label = ride_total), position = position_dodge(0.9), vjust = 0) +
  labs(title = "Weekly number of rides by riders")

#monthly number of rides by riders
bikeshare_df2 %>%
  group_by(member_casual, month) %>%
  summarise(ride_total = n()) %>%
  arrange(member_casual, month) %>%
  ggplot(aes(x = month, y = ride_total, fill = member_casual)) +
  geom_col(position = "dodge") +
  geom_text(aes(label = ride_total), position = position_dodge(0.9), vjust = 0) +
  labs(title = "Monthly Number of Rides by Riders")

#Weekly average ride length by riders
bikeshare_df2 %>%
  group_by(member_casual, day_of_week) %>%
  summarise(average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, day_of_week) %>%
  ggplot(aes(x = day_of_week, y = average_ride_length, fill = member_casual)) +
  geom_col(position = "dodge") +
  geom_text(aes(label = average_ride_length), position = position_dodge(0.9), vjust = 0) +
  labs(title = "Weekly average ride length by riders")


#monthly average ride length by riders
bikeshare_df2 %>%
  group_by(member_casual, month) %>%
  summarise(average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, month) %>%
  ggplot(aes(x = month, y = average_ride_length, fill = member_casual)) +
  geom_col(position = "dodge") +
  geom_text(aes(label = average_ride_length), position = position_dodge(0.9), vjust = 0) +
  labs(title = "monthly average ride length by riders")

