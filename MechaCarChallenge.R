library(dplyr)
library(tidyverse)

#Deliverable 1
MechaCar <- read.csv(file="MechaCar_mpg.csv")

reg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar)
summary(reg)

ggplot(MechaCar, aes(mpg, vehicle_weight)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

#Deliverable 2
suspension <- read.csv(file="Suspension_Coil.csv")

total_summary <- summarize(suspension, mean(PSI), median(PSI), var(PSI), sd(PSI), min(PSI), max(PSI))
total_summary

lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(mean(PSI), median(PSI), var(PSI), sd(PSI),  min(PSI), max(PSI))
lot_summary

#Deliverable 3
t.test(suspension$PSI, mu=1500)

lot_1 <- subset(suspension, Manufacturing_Lot == "Lot1")
lot_2 <- subset(suspension, Manufacturing_Lot == "Lot2")
lot_3 <- subset(suspension, Manufacturing_Lot == "Lot3")

t.test(lot_1$PSI, mu=1500)

t.test(lot_2$PSI, mu=1500)

t.test(lot_3$PSI, mu=1500)