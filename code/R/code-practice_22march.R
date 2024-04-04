## BEGIN ## 	
  
# AREC596 - coding practice + using github
# file created: 22 march 2024
# filed edited: 4 April 2024
# last edit: Keshav

# if you need to do an exercise, look for something labeled with "### HERE ###"

##############################################################################
##############################################################################
  # 0 - set up, read in file
##############################################################################
##############################################################################
  
#Setting up the environment
library(rio)
library(ggplot2)  
library(dplyr)            
library(tidyr)  
library(readr)
library(VIM)
library(zoo)
library(haven)
library(logr)

# set your directory - either through using a project do or just using cd 

setwd("/Users/keshavbhusal/Desktop/AREC/AREC 596 SEMINAR/AREC-596-Spring2024-Ksav")

# Verify that the working directory has been set correctly
getwd()

# 1.Read in the file from local directory

VDSA_Prod_Data <- read_dta("VDSA_Prod_Data.dta")

# 2. Loading the file directly from the github repository

# URL of the raw .dta file on GitHub
url <- "https://github.com/aljosephson/AREC-596-Spring2024/raw/Ksav/VDSA_Prod_Data.dta"

# Load the .dta file directly from the GitHub URL. Install and load the necessary packages

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

# Tell me about these variables: output lab_q fert_q irr_q mech_v pest_v
dim(VDSA_Prod_Data) # Dimension of the dataset

str(VDSA_Prod_Data) # Structure of the variables

summary(VDSA_Prod_Data)    #Summary of the variables


# Selecting the variables
variable_of_interest <- c("output", "lab_q", "fert_q", "irr_q", "mech_v", "pest_v")

# Subsetting the variables of interest
subset_data <- VDSA_Prod_Data[, variable_of_interest]

# Generating the structure of variables of interest
str(subset_data)

# Generating the summary of variables of interest
summary(subset_data)
  
# we hypothesize that gender is important here
# find a few ways to tell me about the variables above, differentiated by gender (genderH) 

variable_of_interest <- c("genderH", "output", "lab_q", "fert_q", "irr_q", "mech_v", "pest_v")

subset_data <- VDSA_Prod_Data[, variable_of_interest]

# summary stats of variable of interest by gender
summary_stats <- subset_data %>%
  group_by(genderH) %>%
  summarise(across(everything(), list(mean = mean, max = max, min = min), .names = "{.col}_{.fn}")) %>%
  ungroup()

summary_stats

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