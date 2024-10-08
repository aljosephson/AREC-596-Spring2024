## BEGIN ## 	
  
# AREC596 - coding practice + using github
# file created: 22 march 2024
# filed edited: 22 march 2024
# last edit: alj 

# if you need to do an exercise, look for something labeled with "### HERE ###"

##############################################################################
##############################################################################
  # 0 - set up, read in file
##############################################################################
##############################################################################
  
# Set directory
directory <- "C:/Users/andre/OneDrive/Documents/GitHub/AREC-596-Spring2024/Code/R"

# Get and set working directory
getwd()
setwd("C:/Users/andre/OneDrive/Documents/GitHub/AREC-596-Spring2024/Code/R")

### HERE ###
  
library()
question5 <- read_csv("C:/Users/andre/OneDrive/Desktop/VDSP_Prod_Data.csv")

### HERE ###
  
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
  
  tmp <- file.path(tempdir(), "march22_code-practice_Soderberg.log")

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