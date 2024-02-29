# Code
# Importing Files
World_Happiness_2018_Raw.R <- read.csv("2018.csv")
World_Happiness_2019_Raw.R <- read.csv("2019.csv")

View(World_Happiness_2018_Raw.R)
View(World_Happiness_2019_Raw.R)


# Data Preperation
# Duplicate data 
World_Happiness_2018_Cleaned.R <- data.frame(World_Happiness_2018_Raw.R)
World_Happiness_2019_Cleaned.R <- data.frame(World_Happiness_2019_Raw.R)

# Copied data with different memory address(tracemem test)
tracemem(World_Happiness_2018_Cleaned.R) == tracemem(World_Happiness_2018_Raw.R)
tracemem(World_Happiness_2019_Cleaned.R) == tracemem(World_Happiness_2019_Raw.R)

# Data Cleaning
# Column names
World_Happiness_2018_Cleaned.R <- World_Happiness_2018_Cleaned.R %>%
  clean_names()

World_Happiness_2019_Cleaned.R <- World_Happiness_2019_Cleaned.R %>%
  clean_names()

colnames(World_Happiness_2018_Cleaned.R)[1] <- "rank"
colnames(World_Happiness_2019_Cleaned.R)[1] <- "rank"

# Rows (Duplicates, spelling errors, etc)
World_Happiness_2018_Cleaned.R %>% get_dupes(rank, country_or_region)
World_Happiness_2019_Cleaned.R %>% get_dupes(rank, country_or_region)

save(World_Happiness_2019_Cleaned.R, file = "Dashboard Data")

# Analysis/Visualization
# Scatter Plot
scatterplot <- ggplot(World_Happiness_2019_Cleaned.R, aes(x = score, y = gdp_per_capita)) + 
  geom_point(aes(color = country_or_region)) +
  geom_smooth(method = "loess") +
  labs (y = "GDP per capita (scaled)",
        x = "Happiness Score",
        subtitle = "Is there a correlation?",
        caption = "Source: Kaggle") +
  ggtitle("Happiness vs Wealth") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(face = "bold")) +
  theme(plot.subtitle = element_text(hjust =0.5)) +
  theme(plot.subtitle = element_text(face = "italic")) +
  theme(axis.title = element_text(size = 9))

ggplotly(scatterplot)
  
# Bar Graph
# top 10 countries and their split on happiness (gdp, life expectancy, etc)
bargraph <- ggplot(World_Happiness_2019_Cleaned.R, aes(x = score, y = country_or_region)) +
  geom_bar()







  

