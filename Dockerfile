FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc && apt install -y libxml2

WORKDIR /project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN R -e "renv::restore(prompt=FALSE)"

COPY Makefile .
COPY final_report.Rmd .
RUN mkdir code
RUN mkdir output
COPY code/*.R code
COPY autism_prevalence_studies_20250220.csv .

RUN mkdir final_report
CMD make final_report.html && mv final_report.html final_report
