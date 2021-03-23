# ETL Project Technical Report

The goal of this project was to Extract data from three different sources, Transform the data by cleaning and combining it, and finally Load it to a new database with an intuitive structure for querying the information. This also helps to greatly reduce the amount of data stored in the database as the CSV files often repeat information. I wanted to explore historic data from the Olympic Games, with the aim of then using it to answer questions such as:

- Does a pattern emerge to show where most Olympic athletes come from? 
- Does a country's economic success correlate to succes in the Olympics?
- Are there any other demographics that affect representation at Olympic events?

## EXTRACT

The data sources included CSV files from [Kaggle](https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results) and [World bank](https://data.worldbank.org/indicator/SP.POP.TOTL) and detailed: 

- Olympic athlete information, 
- Olympic events and medal winners dating back to 1960, and 
- Data detailing country population and demographics

For all three CSVs, Pandas is used to read the CSV into a dataframe where it can be manipulated to fit the new structure.

The ERD of this new structure is shown below.

![image](https://user-images.githubusercontent.com/68552052/111728630-4232b700-883b-11eb-84b2-4eaa22fd16c0.png)

## TRANSFORM

The first step of the transformation process goes into creating the athlete event table. The only columns that were kept were: Name, Age, Sex, Height, Weight, Country, Sport, the years of the Olympic Games they participated in, and their medal status.

Next, columns with duplicate or redundant information were also removed. For example, the "Event" column and "Sport" column both show the events the athletes participated in so only one was necessary. The "Team" column was deleted in favor of NOC, which stands for the National Olympic Committee’s 3-letter country code.

Creating the income group table required removing unnecessary columns from the "income_groups.csv" file so that only current countries were represented. This is connected to the athlete event table by the NOC code and country code. A limitation of the data is that income data on countries currently considered countries, not any former countries that have since dissolved.

A dataframe was then created to represent all Olympic Games information dating back to 1960 which is tied to the original events table using a unique games id.

The population table draws from the "population_.csv "file and required only showing data for years in which there were olympic games. The data also needed to be transposed to move the years from columns to a row for each country.


## LOAD

Pandas is used again to load dataframes into a PostgreSQL database based on a schema that can be found in the "schema.sql" file.

#### Why PostgreSQL?

A relational database seemed like the best fit because the data had a lot of overlapping information like Olympic Games, Athlete Events, Athlete Info, and Team Info. By using a relational database, the amount of duplicate information was minimized.


```python

```
