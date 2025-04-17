
#load dataset
here::i_am("final_report.Rmd")
data<-readRDS(here::here("output/ASD_clean.RDS"))

#loading packages
library("gtsummary")
library("broom.helpers")

#creating linear model of prevalence
prevalence_model<-lm(ASD.Prevalence.Estimate.per.1.000~id_type, data=data)
summary_prevalence_model<-summary(prevalence_model)

#creating table for linear model
regression_table<-tbl_regression(prevalence_model)
regression_table %>% modify_header(label='Prevalence')

saveRDS(regression_table, file=here::here("output/regression_table.RDS"))
