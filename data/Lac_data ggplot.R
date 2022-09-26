library(tidyverse)
library(ggplot2)


lac_data %>% 
  mutate(time = factor(time, levels = 
                  c("pre", "post"))) %>%
  ggplot(aes(y = watt_4mmol, 
             x = time,
             color = sex)) + 
  geom_point() 
  