final_report.html: final_report.Rmd code/render_report.R output/ASD_clean.RDS output/regression_table.RDS output/graph.RDS
	Rscript code/render_report.R
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

output:
	mkdir output

output/ASD_clean.RDS: code/data_cleaning.R autism_prevalence_studies_20250220.csv output
	Rscript code/data_cleaning.R

output/regression_table.RDS: code/regression.R output/ASD_clean.RDS
	Rscript code/regression.R

output/graph.RDS: code/graph.R output/ASD_clean.RDS
	Rscript code/graph.R

.PHONY: clean
clean:
	rm -r output && rm *.html
