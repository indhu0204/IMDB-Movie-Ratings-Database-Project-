***

# 🎬 IMDB Movie Ratings Database Project

A comprehensive relational database project simulating a movie ratings platform, demonstrating database design, SQL querying, data preprocessing, and analytics.

## 📊 Project Overview

This project creates a realistic movie ratings database using **SQLite** with synthetic data generation via Python. It implements proper database normalization, composite keys, foreign key relationships, and handles real-world data challenges including missing values and data integrity.

## 🎯 Key Features

- **Normalized Database Schema**: Three-table relational design (Users, Movies, Ratings)
- **Composite Primary Key**: Ensures unique user-movie rating pairs
- **Realistic Data Generation**: 500 users, 500 movies, 1000 ratings with authentic missing values
- **Data Preprocessing**: Systematic handling of missing/null values
- **SQL Analytics**: Complex queries including joins, aggregations, and grouping
- **Data Visualization**: Charts showing rating distributions, genre popularity, and geographic trends
- **Ethics & Privacy**: Synthetic data generation ensuring no PII exposure

## 🗄️ Database Schema

```
Users (user_id PK, gender, location, age)
  ↓ 1:N
Ratings (user_id PK/FK, movie_id PK/FK, rating, review_text, date_rated, minutes_watched)
  ↑ N:1
Movies (movie_id PK, title, genre, release_year, duration_minutes)
```

## 🛠️ Technologies Used

- **Python 3.x**: Data generation (Pandas, Faker, Random)
- **SQLite**: Database management
- **DB Browser for SQLite**: Database visualization and querying
- **SQL**: Complex queries and data analysis
- **Jupyter Notebook**: Interactive development and documentation

## 📁 Project Structure

```
├── generate_movie_ratings.py    # Python script for data generation
├── users.csv                     # Generated user data
├── movies.csv                    # Generated movie data
├── ratings.csv                   # Generated ratings data
├── movie_ratings.db              # SQLite database file
├── queries.sql                   # SQL analysis queries
├── report.pdf                    # Full project documentation
├── figures/                      # Charts and ER diagram
└── README.md                     # This file
```

## 🚀 Getting Started

### Prerequisites
```bash
pip install pandas faker
```

### Running the Project

1. **Generate Data**:
```bash
python generate_movie_ratings.py
```

2. **Import CSV to SQLite**:
   - Open DB Browser for SQLite
   - Create new database: `movie_ratings.db`
   - Execute table creation SQL
   - Import CSV files into respective tables

3. **Run Analytics**:
```bash
sqlite3 movie_ratings.db < queries.sql
```

## 📈 Key Analyses

- **Demographic Insights**: Rating patterns by user location and age
- **Genre Popularity**: Most-rated and highest-rated movie genres
- **Rating Distribution**: Analysis of 1-5 star rating spread
- **Geographic Trends**: User activity by city
- **Missing Data Handling**: Identification and imputation strategies

## 🔍 Sample Queries

**Top Rated Movies**:
```sql
SELECT Movies.title, AVG(Ratings.rating) AS avg_rating, COUNT(*) AS num_ratings
FROM Ratings
JOIN Movies ON Ratings.movie_id = Movies.movie_id
GROUP BY Ratings.movie_id
ORDER BY avg_rating DESC
LIMIT 10;
```

**User Activity by Location**:
```sql
SELECT Users.location, COUNT(*) AS total_ratings
FROM Ratings
JOIN Users ON Ratings.user_id = Users.user_id
GROUP BY Users.location
ORDER BY total_ratings DESC;
```

## 📊 Results Summary

- **1000 ratings** from 500 unique users across 500 movies
- **8 global cities** represented
- **8 movie genres** analyzed
- **Realistic missing data**: 3-13 missing values per table
- **No duplicate ratings** enforced via composite key

## 🔐 Ethics & Privacy

- All data is **synthetically generated** - no real personal information
- **Anonymous user IDs** protect privacy
- **Transparent data handling** with documented preprocessing steps
- **Bias prevention** through randomized demographic assignments

## 📚 Learning Outcomes

- Database normalization and schema design
- Composite and foreign key implementation
- SQL joins, aggregations, and subqueries
- Data generation and preprocessing with Python
- Missing value handling strategies
- ER diagram creation
- Data ethics and privacy considerations

## 👤 Author

**Indhu Reddy Kottalam Raveendra Reddy**
- Student ID: 24096112
- LinkedIn: https://www.linkedin.com/in/indhu-reddy-kr-2002mac/
- Email: indhureddy2002@gmail.com

## 📄 License

This project is created for educational purposes.

##  Acknowledgments

- Faker library for realistic synthetic data generation
- SQLite for lightweight database management
- DB Browser for SQLite for database visualization

