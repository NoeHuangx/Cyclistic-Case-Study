# Cyclistic-Case-Study
Cyclistic Rides-Data Analysis Using R 

<img width="206" alt="image" src="https://github.com/NoeHuangx/Cyclistic-Case-Study/assets/148400128/6f679f72-b651-489a-af04-0a586200ff64">

This analysis is an optional Capstone project from the [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics) on Coursera. 

### Background: 
Cyclistic was launched in 2016 and quickly became a successful bike-sharing company in Chicago. It features more than 5,800 bicycles with over 600 docking stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system at any time. Cyclistic sets itself apart by offering flexibility in its pricing plans: single-ride passes, full-day passes, and annual membership. Customers who purchase single-ride passes or full-day passes are referred to as **Casual Riders**, and those who purchase annual memberships are **Cyclistic Members**. 

Cyclistic's finance analysts have concluded that annual memberships are much more profitable than casual riders. So, the company team believes that maximizing the number of annual memberships will be key to future growth. The director of marketing has set a clear goal of designing marketing strategies aimed at converting casual riders into annual members. The team wants to use historical bike trip data to identify trends. 

### Business Task: 
Analyze how annual members and causal rides use Cyclistic bikes differently, so the team can come up with marketing strategies to convert casual rides to members. 

### Key Stakeholders: 
* **Lily Moreno**: Cyclistic's Director of Marketing who is responsible for the development of campaigns and initiatives to promote the bike-share program. 
* **Cyclistic Executive Team**: The detail-oriented executive team will decide whether to approve the recommended marketing program. 

### Data:
* **Data source**: [Public data](https://divvy-tripdata.s3.amazonaws.com/index.html) from Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).
* **Data Range Used**: Janurary 2023 to July 2023

### Preparation: 
Downloaded the data needed from the link above and stored them in a local folder named "Cyclistic_data". Each CSV file is stored with a file name "YYYYMM_tripdata.csv" format. 

### Processing and Cleaning: 
All the processing and cleaning are done with R, including analyzing and visualization. View code [here](https://github.com/NoeHuangx/Cyclistic-Case-Study/blob/main/main.R). 

### Analyzing and Viz: 

After cleaning the data, the final data set has roughly around 3.2 million rides data. Visualization is developed mainly using **ggplot2** package in R to differentiate between the trends between Cyclistic members and casual riders' rides taken.

#### Total Rides: 
![plot (4)](https://github.com/NoeHuangx/Cyclistic-Case-Study/assets/148400128/530bbf21-9632-4bc6-bcf0-29bc0deac7fa)
* Among the 3.2 million rides, around 63% of the rides were by members during the January to July 2023 period.

### Monthly Distribution of the Number of Rides Taken: 
![plot](https://github.com/NoeHuangx/Cyclistic-Case-Study/assets/148400128/9f8f58c6-4c51-40ac-a515-e2b483dcd3f3)
* The rides taken by both casual riders and members significantly increase in April compared to the first three months of 2023, then the number slowly increase over the timespan of May and June, and peak in July.
* The number of rides taken is lowest during the winter months and increases starting from spring and peak in summer.
* During the peak season, electric bikes are a more popular choice among casual rides. 

#### Weekly Distribution of the Number of Rides Taken: 
![num_rides_by_weekday](https://github.com/NoeHuangx/Cyclistic-Case-Study/assets/148400128/69742812-c85b-42c0-91fa-1c3e1aaab55b)
* The rides taken by casual riders peak during the weekends, while those taken by members are higher during the weekdays.
* Electric bikes are most commonly used among casual riders compared to other types of bikes on a weekly basis.
* Electric and classic bikes are equally common with members.

#### Daily Distribution of the Number of Rides Taken: 
![plot (3)](https://github.com/NoeHuangx/Cyclistic-Case-Study/assets/148400128/f0fb8cf2-876f-4883-810c-df70af904304)
* The number of rides taken by members is higher during the commute rush hours, while those taken by casual riders peak in the evening of the day around 5 p.m.
* Before 5 a.m. and after 8 p.m. have the least number of rides for both members and casual riders. 

#### Conclusion and Recommendation: 
* A common trend among casual riders suggested that casual riders are most likely using the bikes for leisure, while members mainly use them for commute.
* When casual riders purchase the single-ride or full-day pass during the weekdays, Cyclistic can offer discounts to purchase annual memberships and can focus on how much annual memberships would help with zero emissions and how much money and time they can save by commuting with bikes offered by Cyclistic.
* Cyclistic can also create campaigns during slower months or Earth month (April). The campaigns allow the bike riders to compete on the amount of time period they use the bikes, which will promote the increased amount of bike use. 
