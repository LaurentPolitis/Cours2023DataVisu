library(readr)
library(dplyr)
# NW2018 <- read_csv("ESSCA/Cours/Cours 2/data/NW2018.csv")
# 
# metadata = select(NW2018, number_sta, lat, lon, height_sta)
# metadata = distinct(metadata, number_sta, .keep_all = TRUE)
# metadata_reduit = sample_n(metadata, 3)
# 
# NW2018 = filter(NW2018, number_sta %in% metadata_reduit$number_sta)
# write.csv(NW2018, file="ESSCA/Cours/Cours 2/data/data_2018_reduit.csv")

NW2018 = as_tibble(read_csv("~/../Desktop/ESSCA/2020-2021/Cours/Cours 2/data/data_2018_reduit.csv"))
NW2018 = select(NW2018, number_sta, lat, lon, height_sta, date, precip, t)
metadata = select(NW2018, number_sta, lat, lon)

metadata = filter(metadata, lat %in% c(47.659, 49.508, 46.766), lon %in% c(-2.971, 1.716, -0.831))
NW2018 = arrange(filter(NW2018, lat %in% c(47.659, 49.508, 46.766), lon %in% c(-2.971, 1.716, -0.831)), date)
NW2018 = mutate(NW2018, temp_C = t - 273.15)
