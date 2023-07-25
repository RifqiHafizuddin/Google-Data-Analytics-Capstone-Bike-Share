Google Data Analytics Capstone: Case Study 1
================
2023-07-24

# Introduction

In this case study, we will perform data analysis for a fictional
bike-share company in order to help them attract more riders. Along the
way, we will perform numerous real-world tasks of a junior data analyst
by following the steps of the data analysis process: **Ask, Prepare,
Process, Analyze, Share,** and **Act**.

## Scenario

You are a junior data analyst working in the marketing analyst team at
Cyclistic, a bike-share company in Chicago. The director of marketing
believes the company’s future success depends on maximizing the number
of annual memberships. Therefore, your team wants to understand how
casual riders and annual members use Cyclistic bikes differently. From
these insights, your team will design a new marketing strategy to
convert casual riders into annual members. But first, Cyclistic
executives must approve your recommendations, so they must be backed up
with compelling data insights and professional data visualizations.

## Characters and Teams

● **Cyclistic**: A bike-share program that features more than 5,800
bicycles and 600 docking stations. Cyclistic sets itself apart by also
offering reclining bikes, hand tricycles, and cargo bikes, making
bike-share more inclusive to people with disabilities and riders who
can’t use a standard two-wheeled bike. The majority of riders opt for
traditional bikes; about 8% of riders use the assistive options.
Cyclistic users are more likely to ride for leisure, but about 30% use
them to commute to work each day.

● **Lily Moreno**: The director of marketing and your manager. Moreno is
responsible for the development of campaigns and initiatives to promote
the bike-share program. These may include email, social media, and other
channels.

● **Cyclistic marketing analytics team**: A team of data analysts who
are responsible for collecting, analyzing, and reporting data that helps
guide Cyclistic marketing strategy. You joined this team six months ago
and have been busy learning about Cyclistic’s mission and business goals
— as well as how you, as a junior data analyst, can help Cyclistic
achieve them.

● **Cyclistic executive team**: The notoriously detail-oriented
executive team will decide whether to approve the recommended marketing
program.

# Ask

● Three questions will guide the future marketing program: 1. How do
annual members and casual riders use Cyclistic bikes differently? 2. Why
would casual riders buy Cyclistic annual memberships? 3. How can
Cyclistic use digital media to influence casual riders to become
members?

Moreno has assigned you the **first question** to answer: How do annual
members and casual riders use Cyclistic bikes differently?

## Guiding Questions:

**● What is the problem you are trying to solve?**

Understanding how casual riders and annual members use Cyclistic bikes
differently to maximize the number of annual memberships.

**● How can your insights drive business decisions?**

It can help design a new marketing strategy to convert casual riders
into annual members.

## Key tasks

**● Identify the business task**

**● Consider key stakeholders**

## Deliverable

**● A clear statement of the business task**

# Prepare

we will use Cyclistic’s historical trip data to analyze and identify
trends. You can download the data from this
[link](https://divvy-tripdata.s3.amazonaws.com/index.html) For the
purposes of this case study, the datasets are appropriate and will
enable you to answer the business questions. The data has been made
available by Motivate International Inc. under
[this](https://ride.divvybikes.com/data-license-agreement) license.)

## Guiding questions

**• Where is your data located?**

The data is located in the link above

**• How is the data organized?**

The data is organized by month

**• Are there issues with bias or credibility in this data? Does your
data ROCCC?**

No, there aren’t any issues with bias or credibility in this data
because it is primary data that is collected by divvybikes. Yes, the
data ROCC’s (reliable, organized, comprehensive, current and cited)

**• How are you addressing licensing, privacy, security, and
accessibility?**

The data is public and riders’ personally identifiable information is
prohibited from being used, as stated by the license above.

**• How did you verify the data’s integrity?**

The data integrity is verified by using RStudio to check the overall
accuracy, completeness, and consistency of data.

**• How does it help you answer your question?**

The data will give us insights to how members and casual riders differ.

**• Are there any problems with the data?**

Yes, there are some problems with the data, missing values and duplicate
rows.

## Key tasks:

**1. Download data and store it appropriately**

**2. Identify how it’s organised**

**3. Sort and filter the data.**

**4. Determine the credibility of the data.**

## Deliverable

**● A description of all data sources used**

# Process

The 12 csv files will be combined and new columns will be added for
further analysis.

## Guiding questions

- **What tools are you choosing and why?**

Rstudio, because it can be used to clean, analyze, and visualize data.

**● Have you ensured your data’s integrity?**

Yes, The data accuracy, completeness, and consistency is ensured.

**● What steps have you taken to ensure that your data is clean?**

The data is cleaned by removing missing values and duplicate rows.

**● How can you verify that your data is clean and ready to analyze?**

Checking for missing values and duplicate rows from the data and making
sure each column has the right class.

**● Have you documented your cleaning process so you can review and
share those results?**

Yes, the cleaning process has been documented in this file

## Key tasks

**1. Check the data for errors.**

**2. Choose your tools.**

**3. Transform the data so you can work with it effectively.**

**4. Document the cleaning process.**

## Deliverable

**● Documentation of any cleaning or manipulation of data**

## Code

### Import data and install packages

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 4.1.3

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.2 --
    ## v ggplot2 3.4.2      v purrr   1.0.1 
    ## v tibble  3.1.8      v dplyr   1.0.10
    ## v tidyr   1.3.0      v stringr 1.5.0 
    ## v readr   2.1.3      v forcats 0.5.2

    ## Warning: package 'ggplot2' was built under R version 4.1.3

    ## Warning: package 'tibble' was built under R version 4.1.3

    ## Warning: package 'tidyr' was built under R version 4.1.3

    ## Warning: package 'readr' was built under R version 4.1.3

    ## Warning: package 'purrr' was built under R version 4.1.3

    ## Warning: package 'dplyr' was built under R version 4.1.3

    ## Warning: package 'stringr' was built under R version 4.1.3

    ## Warning: package 'forcats' was built under R version 4.1.3

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(janitor)
```

    ## Warning: package 'janitor' was built under R version 4.1.3

    ## 
    ## Attaching package: 'janitor'
    ## 
    ## The following objects are masked from 'package:stats':
    ## 
    ##     chisq.test, fisher.test

``` r
library(lubridate)
```

    ## Warning: package 'lubridate' was built under R version 4.1.3

    ## Loading required package: timechange

    ## Warning: package 'timechange' was built under R version 4.1.3

    ## 
    ## Attaching package: 'lubridate'
    ## 
    ## The following objects are masked from 'package:base':
    ## 
    ##     date, intersect, setdiff, union

``` r
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
```

After importing the dataset, we will combine the dataset using the
rbind() function.

``` r
bikeshare_df <- rbind(jul_22,aug_22,sep_22,oct_22,nov_22,dec_22,jan_23,feb_23,mar_23,apr_23,may_23,jun_23)
str(bikeshare_df)
```

    ## 'data.frame':    5779444 obs. of  13 variables:
    ##  $ ride_id           : chr  "954144C2F67B1932" "292E027607D218B6" "57765852588AD6E0" "B5B6BE44314590E6" ...
    ##  $ rideable_type     : chr  "classic_bike" "classic_bike" "classic_bike" "classic_bike" ...
    ##  $ started_at        : chr  "2022-07-05 08:12:47" "2022-07-26 12:53:38" "2022-07-03 13:58:49" "2022-07-31 17:44:21" ...
    ##  $ ended_at          : chr  "2022-07-05 08:24:32" "2022-07-26 12:55:31" "2022-07-03 14:06:32" "2022-07-31 18:42:50" ...
    ##  $ start_station_name: chr  "Ashland Ave & Blackhawk St" "Buckingham Fountain (Temp)" "Buckingham Fountain (Temp)" "Buckingham Fountain (Temp)" ...
    ##  $ start_station_id  : chr  "13224" "15541" "15541" "15541" ...
    ##  $ end_station_name  : chr  "Kingsbury St & Kinzie St" "Michigan Ave & 8th St" "Michigan Ave & 8th St" "Woodlawn Ave & 55th St" ...
    ##  $ end_station_id    : chr  "KA1503000043" "623" "623" "TA1307000164" ...
    ##  $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...
    ##  $ start_lng         : num  -87.7 -87.6 -87.6 -87.6 -87.6 ...
    ##  $ end_lat           : num  41.9 41.9 41.9 41.8 41.9 ...
    ##  $ end_lng           : num  -87.6 -87.6 -87.6 -87.6 -87.7 ...
    ##  $ member_casual     : chr  "member" "casual" "casual" "casual" ...

After checking the data, we can see that the variable class for column
“started_at” and “ended_at” is character so we will change it to
POSIXlt. This will make converting times easier. We will also add The
“day_of_week” and “month” columns, then sorting them for analysis
purposes.

``` r
bikeshare_df$started_at<-as.POSIXlt(bikeshare_df$started_at)
bikeshare_df$ended_at<-as.POSIXlt(bikeshare_df$ended_at)
str(bikeshare_df)
```

    ## 'data.frame':    5779444 obs. of  13 variables:
    ##  $ ride_id           : chr  "954144C2F67B1932" "292E027607D218B6" "57765852588AD6E0" "B5B6BE44314590E6" ...
    ##  $ rideable_type     : chr  "classic_bike" "classic_bike" "classic_bike" "classic_bike" ...
    ##  $ started_at        : POSIXlt, format: "2022-07-05 08:12:47" "2022-07-26 12:53:38" ...
    ##  $ ended_at          : POSIXlt, format: "2022-07-05 08:24:32" "2022-07-26 12:55:31" ...
    ##  $ start_station_name: chr  "Ashland Ave & Blackhawk St" "Buckingham Fountain (Temp)" "Buckingham Fountain (Temp)" "Buckingham Fountain (Temp)" ...
    ##  $ start_station_id  : chr  "13224" "15541" "15541" "15541" ...
    ##  $ end_station_name  : chr  "Kingsbury St & Kinzie St" "Michigan Ave & 8th St" "Michigan Ave & 8th St" "Woodlawn Ave & 55th St" ...
    ##  $ end_station_id    : chr  "KA1503000043" "623" "623" "TA1307000164" ...
    ##  $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...
    ##  $ start_lng         : num  -87.7 -87.6 -87.6 -87.6 -87.6 ...
    ##  $ end_lat           : num  41.9 41.9 41.9 41.8 41.9 ...
    ##  $ end_lng           : num  -87.6 -87.6 -87.6 -87.6 -87.7 ...
    ##  $ member_casual     : chr  "member" "casual" "casual" "casual" ...

``` r
bikeshare_df2 <- bikeshare_df %>%
  add_column(ride_length= difftime(.$ended_at, .$started_at, units = "mins") , .before =  "start_station_name") %>%
  add_column(day_of_week = weekdays(bikeshare_df$started_at), .after = "ride_length") %>% 
  add_column(month = months(bikeshare_df$started_at), .after = "day_of_week")
bikeshare_df2$day_of_week <- ordered(bikeshare_df2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
bikeshare_df2$month <- ordered(bikeshare_df2$month, levels=c("July", "August", "September", "October", "November", "December", "January", "Feebruary", "March", "April", "May", "June"))

str(bikeshare_df2)
```

    ## 'data.frame':    5779444 obs. of  16 variables:
    ##  $ ride_id           : chr  "954144C2F67B1932" "292E027607D218B6" "57765852588AD6E0" "B5B6BE44314590E6" ...
    ##  $ rideable_type     : chr  "classic_bike" "classic_bike" "classic_bike" "classic_bike" ...
    ##  $ started_at        : POSIXlt, format: "2022-07-05 08:12:47" "2022-07-26 12:53:38" ...
    ##  $ ended_at          : POSIXlt, format: "2022-07-05 08:24:32" "2022-07-26 12:55:31" ...
    ##  $ ride_length       : 'difftime' num  11.75 1.88333333333333 7.71666666666667 58.4833333333333 ...
    ##   ..- attr(*, "units")= chr "mins"
    ##  $ day_of_week       : Ord.factor w/ 7 levels "Sunday"<"Monday"<..: 3 3 1 1 4 6 2 5 1 1 ...
    ##  $ month             : Ord.factor w/ 12 levels "July"<"August"<..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ start_station_name: chr  "Ashland Ave & Blackhawk St" "Buckingham Fountain (Temp)" "Buckingham Fountain (Temp)" "Buckingham Fountain (Temp)" ...
    ##  $ start_station_id  : chr  "13224" "15541" "15541" "15541" ...
    ##  $ end_station_name  : chr  "Kingsbury St & Kinzie St" "Michigan Ave & 8th St" "Michigan Ave & 8th St" "Woodlawn Ave & 55th St" ...
    ##  $ end_station_id    : chr  "KA1503000043" "623" "623" "TA1307000164" ...
    ##  $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...
    ##  $ start_lng         : num  -87.7 -87.6 -87.6 -87.6 -87.6 ...
    ##  $ end_lat           : num  41.9 41.9 41.9 41.8 41.9 ...
    ##  $ end_lng           : num  -87.6 -87.6 -87.6 -87.6 -87.7 ...
    ##  $ member_casual     : chr  "member" "casual" "casual" "casual" ...

### Data Cleaning

The next step is to clean the data. We will use the clean-names()
function so all column names are unique and consist only of the \_
character, numbers, and letters. We will then remove Na values, Null
values, duplicates, and filter out trips with ride length less than 0.

``` r
bikeshare_df2 <- bikeshare_df2 %>%
  clean_names() %>%
  drop_na() %>%
  filter(.$ride_length > 0) %>%
  distinct()

bikeshare_df2 <- bikeshare_df2[!(bikeshare_df2$start_station_name=="" | bikeshare_df2$start_station_id=="" | bikeshare_df2$end_station_name=="" | bikeshare_df2$end_station_id==""),]
```

# Analyze

## Guiding Questions

**● How should you organize your data to perform analysis on it?**

Making sure the data is cleaned and properly formatted

**● Has your data been properly formatted?**

Yes, it has been properly formatted

**● What surprises did you discover in the data?**

There are many observations that contain missing values and invalid
data.

**● How will these insights help answer your business questions?**

The insights will help drive business decisions.

## Key tasks

**1. Aggregate your data so it’s useful and accessible.**

**2. Organize and format your data.**

**3. Perform calculations.**

**4. Identify trends and relationships.**

## Deliverable

**● A summary of your analysis**

## Code

``` r
#Ride length average between customer types
aggregate(bikeshare_df2$ride_length ~ bikeshare_df2$member_casual, FUN = mean)
```

    ##   bikeshare_df2$member_casual bikeshare_df2$ride_length
    ## 1                      casual             22.59441 mins
    ## 2                      member             12.17686 mins

``` r
#Ride length average between bike types
aggregate(bikeshare_df2$ride_length ~ bikeshare_df2$rideable_type, FUN = mean)
```

    ##   bikeshare_df2$rideable_type bikeshare_df2$ride_length
    ## 1                classic_bike             16.78353 mins
    ## 2                 docked_bike             49.81023 mins
    ## 3               electric_bike             12.70131 mins

``` r
#bike types

bikeshare_df2 %>%
  group_by(member_casual, rideable_type) %>%
  summarise(ride_total = n(), average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, rideable_type)
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.

    ## # A tibble: 5 x 4
    ## # Groups:   member_casual [2]
    ##   member_casual rideable_type ride_total average_ride_length
    ##   <chr>         <chr>              <int> <drtn>             
    ## 1 casual        classic_bike      786438 24.26903 mins      
    ## 2 casual        docked_bike       136703 49.81023 mins      
    ## 3 casual        electric_bike     719567 15.59372 mins      
    ## 4 member        classic_bike     1615777 13.14015 mins      
    ## 5 member        electric_bike    1000713 10.62152 mins

``` r
#Ride length by month

bikeshare_df2 %>%
  group_by(member_casual, month) %>%
  summarise(ride_total = n(), average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, month)
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.

    ## # A tibble: 22 x 4
    ## # Groups:   member_casual [2]
    ##    member_casual month     ride_total average_ride_length
    ##    <chr>         <ord>          <int> <drtn>             
    ##  1 casual        July          311649 25.09502 mins      
    ##  2 casual        August        270074 23.28570 mins      
    ##  3 casual        September     220905 21.80479 mins      
    ##  4 casual        October       151312 20.46945 mins      
    ##  5 casual        November       73533 17.24673 mins      
    ##  6 casual        December       31502 14.84185 mins      
    ##  7 casual        January        29618 14.88039 mins      
    ##  8 casual        March          46786 16.72132 mins      
    ##  9 casual        April         110526 22.62311 mins      
    ## 10 casual        May           177025 24.52642 mins      
    ## # ... with 12 more rows

``` r
#ride length by day

bikeshare_df2 %>%
  group_by(member_casual, day_of_week) %>%
  summarise(ride_total = n(), average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, day_of_week)
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.

    ## # A tibble: 14 x 4
    ## # Groups:   member_casual [2]
    ##    member_casual day_of_week ride_total average_ride_length
    ##    <chr>         <ord>            <int> <drtn>             
    ##  1 casual        Sunday          259185 25.84817 mins      
    ##  2 casual        Monday          184203 22.66457 mins      
    ##  3 casual        Tuesday         185060 20.12818 mins      
    ##  4 casual        Wednesday       201518 19.48960 mins      
    ##  5 casual        Thursday        217111 19.75612 mins      
    ##  6 casual        Friday          251606 21.77503 mins      
    ##  7 casual        Saturday        344025 25.64131 mins      
    ##  8 member        Sunday          279407 13.48190 mins      
    ##  9 member        Monday          357061 11.61077 mins      
    ## 10 member        Tuesday         409642 11.62919 mins      
    ## 11 member        Wednesday       429205 11.67692 mins      
    ## 12 member        Thursday        424084 11.69829 mins      
    ## 13 member        Friday          381979 12.02688 mins      
    ## 14 member        Saturday        335112 13.77831 mins

``` r
#start stations
bikeshare_df2 %>%
  group_by(member_casual, start_station_name) %>%
  summarise(ride_total = n(), average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, start_station_name) %>%
  arrange(desc(ride_total))
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.

    ## # A tibble: 3,046 x 4
    ## # Groups:   member_casual [2]
    ##    member_casual start_station_name                 ride_total average_ride_le~1
    ##    <chr>         <chr>                                   <int> <drtn>           
    ##  1 casual        Streeter Dr & Grand Ave                 49243 35.187564 mins   
    ##  2 casual        DuSable Lake Shore Dr & Monroe St       28709 36.088565 mins   
    ##  3 member        Kingsbury St & Kinzie St                22412  8.875235 mins   
    ##  4 casual        Michigan Ave & Oak St                   22176 35.907370 mins   
    ##  5 casual        Millennium Park                         21625 38.505604 mins   
    ##  6 member        Clark St & Elm St                       20725 11.538852 mins   
    ##  7 casual        DuSable Lake Shore Dr & North Blvd      20198 28.337774 mins   
    ##  8 member        Clinton St & Washington Blvd            19774 10.737286 mins   
    ##  9 member        Wells St & Concord Ln                   18881 11.138013 mins   
    ## 10 member        Loomis St & Lexington St                18596  8.881304 mins   
    ## # ... with 3,036 more rows, and abbreviated variable name
    ## #   1: average_ride_length

``` r
bikeshare_df2 %>%
  group_by(member_casual, end_station_name) %>%
  summarise(ride_total = n(), average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, end_station_name) %>%
  arrange(desc(ride_total))
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.

    ## # A tibble: 3,070 x 4
    ## # Groups:   member_casual [2]
    ##    member_casual end_station_name                   ride_total average_ride_le~1
    ##    <chr>         <chr>                                   <int> <drtn>           
    ##  1 casual        Streeter Dr & Grand Ave                 52705 36.609925 mins   
    ##  2 casual        DuSable Lake Shore Dr & Monroe St       26699 36.412276 mins   
    ##  3 casual        Michigan Ave & Oak St                   23703 36.012659 mins   
    ##  4 casual        Millennium Park                         23603 36.225851 mins   
    ##  5 casual        DuSable Lake Shore Dr & North Blvd      23028 30.099354 mins   
    ##  6 member        Kingsbury St & Kinzie St                22340  8.504461 mins   
    ##  7 member        Clark St & Elm St                       20880 10.818159 mins   
    ##  8 member        Clinton St & Washington Blvd            20627  8.797006 mins   
    ##  9 member        Wells St & Concord Ln                   19782 11.132707 mins   
    ## 10 member        Loomis St & Lexington St                18907  9.511625 mins   
    ## # ... with 3,060 more rows, and abbreviated variable name
    ## #   1: average_ride_length

# Share

## Guiding questions

**● Were you able to answer the question of how annual members and
casual riders use Cyclistic bikes differently?**

Yes

**● What story does your data tell?**

The data tells the difference of members and casual riders’ behaviors.

**● How do your findings relate to your original question?**

My findings shows how differently members use Cyclistic bikes, which
relates to the original question.

**● Who is your audience? What is the best way to communicate with
them?**

My audience will be the Cyclistic executive team.

**● Can data visualization help you share your findings?**

Yes, by visualizing the data, we will be able to communicate our
findings to our audience.

**● Is your presentation accessible to your audience?**

The presentation will be accessible at [This
link](https://github.com/RifqiHafizuddin/Google-Data-Analytics-Capstone-Bike-Share)

## Key tasks

**1. Determine the best way to share your findings.**

**2. Create effective data visualizations.**

**3. Present your findings.**

**4. Ensure your work is accessible.**

## Deliverable

**● Supporting visualizations and key findings**

## Visualization

Visualizations can be accessed [Here](https://github.com/RifqiHafizuddin/Google-Data-Analytics-Capstone-Bike-Share/tree/main/Visualizations)

``` r
#member vs casual customers

bikeshare_df2 %>%
  group_by(member_casual) %>%
  summarise(user_total = n()) %>%
  arrange(member_casual) %>%
  ggplot(aes(x=member_casual, y=user_total, fill = member_casual)) +
  geom_col() +
  geom_text(aes(label = user_total), position = position_dodge(0.9), vjust = 0) +
  labs(title = "Members vs Casual")
```

![](case_study_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

``` r
#Weekly number of rides by riders
bikeshare_df2 %>%
  group_by(member_casual, day_of_week) %>%
  summarise(ride_total = n()) %>%
  arrange(member_casual, day_of_week) %>%
  ggplot(aes(x = day_of_week, y = ride_total, fill = member_casual)) +
  geom_col(position = "dodge") +
  geom_text(aes(label = ride_total), position = position_dodge(0.9), vjust = 0, size = 3) +
  labs(title = "Weekly number of rides by riders")
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.

![](case_study_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->

``` r
#monthly number of rides by riders
bikeshare_df2 %>%
  group_by(member_casual, month) %>%
  summarise(ride_total = n()) %>%
  arrange(member_casual, month) %>%
  ggplot(aes(x = month, y = ride_total, fill = member_casual)) +
  geom_col(position = "dodge") +
  geom_text(aes(label = ride_total), position = position_dodge(0.9), vjust = 0, size = 3) +
  labs(title = "Monthly Number of Rides by Riders")
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.

![](case_study_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

``` r
#Weekly average ride length by riders
bikeshare_df2 %>%
  group_by(member_casual, day_of_week) %>%
  summarise(average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, day_of_week) %>%
  ggplot(aes(x = day_of_week, y = average_ride_length, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Weekly average ride length by riders")
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.
    ## Don't know how to automatically pick scale for object of type <difftime>.
    ## Defaulting to continuous.

![](case_study_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

``` r
bikeshare_df2 %>%
  group_by(member_casual, month) %>%
  summarise(average_ride_length = mean(ride_length)) %>%
  arrange(member_casual, month) %>%
  ggplot(aes(x = month, y = average_ride_length, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "monthly average ride length by riders")
```

    ## `summarise()` has grouped output by 'member_casual'. You can override using the
    ## `.groups` argument.
    ## Don't know how to automatically pick scale for object of type <difftime>.
    ## Defaulting to continuous.

![](case_study_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

## Summary

- Casual riders rode the bike longer (22.59 mins) than members (12.17
  mins).

- The average ride length of the docked bike (49.81 mins) is longer than
  electric bike (12.7 mins) and classic bike (16.78 mins).

- The most popular start and end station for the casual riders is
  Streeter Dr & Grand Ave, while the members start and end their rides
  at Kingsbury St & Kinzie St.

- There are more members (2616490) than casual riders (1642708) in the
  last 12 months

- On average, casual riders ride the bike more on weekends, while
  members ride the bike more on weekdays.

- Both members and casual riders ride the bike more near summer and ride
  it less near winter.

- The average ride length of casual riders are longer than members.

# Act

## Guiding questions

**● What is your final conclusion based on your analysis?**

Based on my analysis, we can see that on average, casual riders ride the
bike longer than members, so converting casual rider into annual members
is possible.

**● How could your team and business apply your insights?**

To emphasize on the casual riders’ longer ride time, we could develop a
marketing campaign that focuses on the benefits of being a member while
riding the bike longer.

**● What next steps would you or your stakeholders take based on your
findings?**

The next steps we would take is to apply our insights and if possible,
use additional data to expand on our findings.

**● Is there additional data you could use to expand on your findings?**

Yes, additional data such as user demographics, financial data, past
user purchases (annual vs single pass), and climate data.

## Key tasks

**1. Create your portfolio.**

**2. Add your case study.**

**3. Practice presenting your case study to a friend or family member.**

## Deliverable

**● Your top three recommendations based on your analysis.**

1.  Marketing campaign that targets casual users who have high average
    ride times and buys many single passes.

2.  Promote the campaign at popular start stations for casual riders
    such as Streeter Dr & Grand Ave, DuSable Lake Shore Dr & Monroe St,
    or Michigan Ave & Oak St.

3.  Give discounts for annual passes at less popular months to increase
    members.
