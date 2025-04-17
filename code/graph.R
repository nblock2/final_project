#load dataset
here::i_am("final_report.Rmd")
data<-readRDS(here::here("output/ASD_clean.RDS"))

#loading packages
library("ggplot2")

#creating graph of case upper age limit by prevalence
age_upper_prevalance<-ggplot(data, aes(age_upper_cat, ASD.Prevalence.Estimate.per.1.000, color=age_upper_cat))+geom_boxplot()+labs(title= "ASD Prevalance by Age Limit of Study", y="Prevelance per 1000 Population", x="Highest Age Group in Study")

saveRDS(age_upper_prevalance, file=here::here("output/graph.RDS"))
