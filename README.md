# Instagram Usage & Lifestyle Database Analysis

**Author:** Abdul Azeem (24i-2013)  
**Department:** AI / A  
**Course:** Database Management Systems (CS2005)

## 📌 Project Overview
This project focuses on designing and implementing a relational database to analyze the correlation between Instagram usage and user lifestyle. It encompasses the complete database lifecycle: from designing the Entity-Relationship Diagram (ERD) to implementing the schema in MySQL, populating it with a dataset using Python, and running analytical SQL queries to extract meaningful insights.

## 🛠️ Tech Stack & Tools
- **Database:** MySQL
- **Programming Language:** Python 3
- **Libraries Used:** `pandas`, `mysql-connector-python`
- **Other Tools:** Jupyter Notebook

## 🗄️ Database Schema & Entities
The database (`SocialMediaDB`) is designed with a 1:1 relationship model to ensure data integrity and minimize redundancy. The primary entities are:
1. **UserAccount:** Core account details (Primary Table).
2. **UserDemographics:** Age, gender, location, and income level.
3. **AppUsage:** Daily active minutes, sessions, and DMs.
4. **SocialEngagement:** Followers, preferred content themes, and engagement scores.
5. **HealthLifestyle:** Sleep hours, exercise frequency, and perceived stress scores.
6. **SecuritySettings:** Privacy levels and 2FA status.

## 📂 Repository Structure
- `i242013_AbdulAzeem_A1.docx`: Assignment 1 document containing the initial schema design and ERDs.
- `report.docx`: Assignment 2 complete report with query results and documentation.
- `database.sql`: SQL scripts for creating the database and tables.
- `queries.sql`: 10 analytical SQL queries used to extract insights from the data.
- `connection.ipynb`: Python Jupyter Notebook used to clean data and insert 1,200 records into the MySQL database.

## 🚀 How to Run the Project
1. **Setup Database:** Run `database.sql` in your MySQL environment to create `SocialMediaDB` and its associated tables.
2. **Insert Data:** Open `connection.ipynb`, update the MySQL credentials (username/password), and execute the cells to load the dataset into the database.
3. **Run Queries:** Execute the queries provided in `queries.sql` to see the analytical results.

## 📊 Key Analytical Insights
Through complex SQL queries (JOINS, GROUP BY, aggregations), this project answers vital questions such as:
- Identifying high-engagement users spending over 2 hours/day.
- Comparing average Instagram usage between Urban and Rural demographics.
- Correlating high stress levels (>7) with high app activity.
- Analyzing engagement trends based on income levels and preferred content themes.
