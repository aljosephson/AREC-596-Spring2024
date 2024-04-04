## BEGIN ## 	
  
# AREC596 - coding practice + using github
# file created: 22 march 2024
# filed edited: 22 march 2024
# last edit: Ksav

# if you need to do an exercise, look for something labeled with "### HERE ###"

##############################################################################
##############################################################################
  # 0 - set up, read in file
##############################################################################
##############################################################################
  
# set your directory - either through using a project do or just using cd 

setwd("/Users/keshavbhusal/Desktop/AREC/AREC 596 SEMINAR/AREC-596-Spring2024-Ksav")

# Verify that the working directory has been set correctly
getwd()

# 1.Read in the file from local directory
library(haven)
VDSA_Prod_Data <- read_dta("VDSA_Prod_Data.dta")

# 2. Loading the file directly from the github repository

# URL of the raw .dta file on GitHub
url <- "https://github.com/aljosephson/AREC-596-Spring2024/raw/Ksav/VDSA_Prod_Data.dta"

# Load the .dta file directly from the GitHub URL. Install and load the necessary packages
# install.packages("rio")
  library(rio)

# Loading
data <- import(url)

# read in the file 

View(VDSA_Prod_Data)
View(data)
  
##############################################################################
##############################################################################
  # 1 - create file for use 
##############################################################################
##############################################################################
  
# create do-file
# create log-file 
### this is non standard in r, so you'll want to ensure to install the package logr

  install.packages('logr')

# create temp file location
  
  tmp <- file.path(tempdir(), "march22_code-practice.log")

# open log
  lf <- log_open(tmp)

# tell me about these variables: output lab_q fert_q irr_q mech_v pest_v

### HERE ###
  
# we hypothesize that gender is important here
# find a few ways to tell me about the variables above, differentiated by gender (genderH) 

### HERE ###
  
# to do anything with these data, we need to do some manipulations 

# look at the variable sur_yr 
# drop if the year is 2009 or 2013

### HERE ###
  
# make new variables for lab_q fert_q irr_q mech_v pest_v
# these should be measured as logs per hectare 
    
### HERE ###
    
# make new variables for aindex lindex tot_acre dist
# these should be log transformed 

# create log transformed variables

### HERE ###
  
# labeling variables created above

### HERE ###
  
##############################################################################
##############################################################################
  # 2 - dig into the data
##############################################################################
##############################################################################
  
# visualizations (i may recommend scatterplots, but be creative!) 
# look at these with relationship to output
# consider: plot_area, lab_q irr_q pest_q 

### HERE ###
  
# create an irrigation dummy

### HERE ###
  
##############################################################################
##############################################################################
  # 3 - end matter, save, close, etc.  
##############################################################################
##############################################################################
  
# save this file 	

### HERE ###
  
  
# close log

    log_close(tmp)

## END ## 	
