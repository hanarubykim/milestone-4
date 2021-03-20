library(tidyverse)
library(tidycensus)
library(readxl)
library(janitor)

x <- read_excel(path = "demographics.xlsx", skip = 1) %>%
  clean_names()

data <- x %>%
  select(economic_need_index, average_grade_8_english_proficiency,
         average_grade_8_math_proficiency) %>%
  ggplot(mapping = aes(x = economic_need_index, y = average_grade_8_english_proficiency)) +
  geom_point() +
  labs(title = "Relationship Between Economic Need Index and Average 8th Grade English Proficiency at Schools",
       x = "Economic Need Index",
       y = "Average 8th Grade English Proficiency") +
  geom_smooth(method = "lm",
              formula = y ~ x) +
  theme_classic()

ggsave("data.png", data)

data_2 <- x %>% 
  ggplot(mapping = aes(x = percent_asian, 
                     y = average_grade_8_english_proficiency)) +
  labs(title = "Relationship Between Representation of Asians and Average 8th Grade English Proficiency at Schools",
       x = "Percentage of School Being Asian",
       y = "Average 8th Grade English Proficiency") +
  geom_point() +
  geom_smooth(method = "lm",
              formula = y ~ x) +
  theme_classic()

ggsave("data_2.png", data_2)