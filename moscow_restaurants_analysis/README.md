# Moscow Public Catering Market Analysis

## Project Description

This project is an exploratory data analysis of the Moscow public catering market based on data collected in summer 2022. The analysis was designed as a business-oriented research case aimed at helping investors identify promising food service formats, evaluate potential locations, and better understand the competitive landscape of Moscow’s restaurant industry.

The main objective of the project was to build an analytical overview of the market and answer several practical business questions. In particular, the research focused on the overall market structure, the most common establishment categories, their distribution across Moscow administrative districts, differences between chain and non-chain businesses, pricing patterns, seating capacity, ratings, and the relationship between these characteristics.

Two datasets were used in the project. The first dataset contains general information about food establishments, including restaurant name, category, address, district, opening hours, rating, chain indicator, and number of seats. The second dataset contains pricing information, including price segment, textual average bill description, median average bill, and median cappuccino price. These datasets were merged into a single dataframe to create a unified basis for analysis.

A separate stage of the project was devoted to data preprocessing. During this stage, the structure and quality of the data were examined, missing values were calculated and interpreted, duplicate checks were performed, and text fields were normalized for cleaner validation. The project also included feature engineering: for example, a boolean chain flag was created, as well as a separate indicator showing whether an establishment operates 24/7. Missing values were not filled artificially when there was no reliable basis for imputation, which helped preserve the original logic of the source data.

The exploratory analysis covered several important directions. First, the project examined the distribution of establishments by category and showed that cafes and restaurants dominate the market, while canteens and bakeries are much less common. Second, the analysis looked at the geographical structure of the market and found that the Central Administrative District has the highest concentration of establishments, whereas peripheral districts contain significantly fewer venues. Additional analysis was carried out specifically for the central district to better understand its internal category structure.

The project also explored the ratio of chain and non-chain establishments. The results showed that non-chain businesses prevail overall, although some categories, such as bakeries, have a relatively high share of chain operators. Seating capacity was analyzed using descriptive statistics and boxplots, which made it possible to identify a typical size range for establishments as well as large outliers. Median seat capacity was also compared across categories, showing that restaurants, bars, and coffee shops tend to offer more seating than compact formats such as bakeries and pizzerias.

Another important part of the project was rating analysis. Average ratings were compared across categories, revealing that bars/pubs, pizzerias, and restaurants have the highest mean ratings, while fast food and cafes tend to score slightly lower. At the same time, the rating gap between categories remains relatively small, which suggests that quality differences are moderate across the market.

To better understand the drivers of ratings, the project used Phi_k correlation analysis for mixed data types. Several features were compared with rating, including category, district, chain status, seating capacity, price segment, and 24/7 operation status. The strongest relationship was found between rating and price category, indicating that higher-priced establishments tend to have slightly higher ratings, although the relationship remains weak to moderate rather than strong.

The project also included an analysis of the most popular chains in Moscow. Chain establishments were grouped by brand, and the top chains were ranked by number of outlets. This made it possible to identify the largest players in the market and compare them by average rating and dominant category. The results showed that coffee shop and pizzeria chains are especially well represented among the top brands.

Finally, the project examined median average bill across Moscow districts. This analysis showed that the city center and nearby western districts are associated with the highest median bill levels, while more peripheral districts tend to have lower checks. In general, the results suggest that pricing decreases with distance from the center, although the pattern is not perfectly linear.

Based on the analytical findings, the project formulated practical business recommendations. The most promising formats appear to be coffee shops/bakeries, pizzerias, and bars, depending on the target audience and business model. Central districts are better suited for premium concepts with higher average bills, while more affordable formats may be more competitive in residential and peripheral areas. The results also suggest that investors should pay attention to seating capacity, traffic clusters near business centers or metro stations, and a clear balance between price positioning and service quality.

Overall, this project demonstrates a full-cycle analytical workflow: data loading, preprocessing, data quality assessment, feature engineering, exploratory data analysis, visualization, correlation analysis, and translation of results into business recommendations.

## Key Skills Demonstrated

- Exploratory data analysis (EDA)
- Data cleaning and preprocessing
- Missing value analysis
- Duplicate detection and validation
- Dataset merging
- Feature engineering
- Descriptive statistics
- Data visualization
- Correlation analysis with mixed data types
- Business insight generation
- Recommendation building based on analytical findings

## Tools and Libraries

- Python
- pandas
- matplotlib
- seaborn
- phik
- Jupyter Notebook
