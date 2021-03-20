# ETL Project Technical Report

The goal of this project was to clean and combine data from three different sources to create a new database with an intuitive structure for querying information. The three sources included CSV files from free sources like Kaggle, and detailed: 

- Olympic athlete information, 
- Olympic events and medal winners dating back to 1960, and 
- Data detailing country population and demographics

With this information, 

Questions arose like:
    
- Does a pattern emerge to show where most Olympic athletes come from? 
- Is it mostly first world countries or no pattern emerges?
- Does a country’s general income level affect their representation at Olympic events?
    

## EXTRACT

Our data sources were Olympic historical data from [Kaggle](https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results)

and population data from 1960-2019 and income and region classifications from [World bank](https://data.worldbank.org/indicator/SP.POP.TOTL).

For all 3 CSVs, Pandas is used to read the CSV into the DataFrame.

Also attached is an image of the ERD in the Resources folder.

## TRANSFORM

Delete any columns and only show a general view of an athlete's profile. So the only columns that were kept were Name, Sex, Age, Height, Weight, the country they represented, their sport, the year of the Olympic Games the athletes participated in, and their medal status.

Part of the data cleaning also included deleting duplicate columns: we left in the Event column and deleted the Sport column since both columns showed the events the athletes participated in, and the Team column was deleted in favor of NOC, which stands for the National Olympic Committee’s 3-letter country code.

Creating the income group table required removing unnecessary columns from the income_groups.csv file so that only current countries were represented. This is connected to the athlete event table by the NOC code and country code. A limitation of the data is that we will only have income data on countries currently considered countries, not any former countries that have since dissolved.

Create a dataframe to represent all unique Olympic Games, with the very first year of the modern Olympic Games 1896 as the index, and then we filtered only the unique sporting events

The population table draws from the population_.csv file and required only showing data for years in which there were olympic games. We also had to transpose the data to move the years from columns to a row for each country.


## LOAD

Pandas is used again to load dataframes into a SQL database.

#### Why PostgreSQL?

We decided to a use a relational database because our data had a lot of overlapping information like Olympic Games, Sporting Events, Athlete Info, and Team Info. By using a relational database, we minimized the amount of duplicate information stored in order to save space.
We first created a schema that can be find in the schema.sql file. Then, we used SQLAlchemy to connect to a local PostgreSQL database called olympics_db and uploaded our DataFrames to pre-made tables.

![image](https://user-images.githubusercontent.com/68552052/111728630-4232b700-883b-11eb-84b2-4eaa22fd16c0.png)



```python

```
