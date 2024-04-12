## BEGIN ## 	
  
# AREC596 - coding practice + using github
# file created: 22 march 2024
# filed edited: 12 April 2024
# last edit: Rodrigo

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
library(labelled)

# set your directory - either through using a project do or just using cd 
    setwd("/Users/rodrigoguerra/Library/CloudStorage/OneDrive-UniversityofArizona/Documents/GitHub/AREC-596-Spring2024")

# Verify that the working directory has been set correctly
    getwd()

# 1.Read in the file from local directory
    data_VDSA <- read_dta("VDSA_Prod_Data.dta")

# 2. Loading the file directly from the github repository

# URL of the raw .dta file on GitHub
url <- "https://github.com/aljosephson/AREC-596-Spring2024/raw/VDSA_Prod_Data.dta"

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

VDSA_Prod_Data1 <- VDSA_Prod_Data %>% 
  filter(!(sur_yr %in% c("2009", "2013")))

# Verifying the drop
unique(VDSA_Prod_Data1["sur_yr"])

# make new variables for lab_q fert_q irr_q mech_v pest_v
# these should be measured as logs per hectare 
    
VDSA_Prod_Data1 <- VDSA_Prod_Data1 %>% 
  mutate(lab_log_per_ha = log(lab_q)/plot_area,
           fert_log_per_ha = log(fert_q)/plot_area,
           irr_log_per_ha = log(irr_q)/plot_area,
           mech_log_per_ha = log(mech_v)/plot_area,
           pest_log_per_ha = log(pest_v)/plot_area)
    
# make new variables for aindex lindex tot_acre dist
# these should be log transformed 

# create log transformed variables

VDSA_Prod_Data1 <- VDSA_Prod_Data1 %>% 
  mutate(aindex_log = log(aindex),
         lindex_log = log(lindex),
         tot_acre_log = log(tot_acre),
         dist_log = log(dist))
  
# labeling variables created above
# Install and load the Hmisc package if you haven't already
install.packages("Hmisc")
library(Hmisc)

# Assuming 'VDSA_Prod_Data1' is your dataset

VDSA_Prod_Data2 <- VDSA_Prod_Data1 %>%
  label(aindex_log = "Log of Aindex",
        lindex_log = "Log of Lindex",
        tot_acre_log = "Log of Total Acres",
        dist_log = "Log of Distance",
        lab_log_per_ha = "Log of Lab q per Hectare",
        fert_log_per_ha = "Log of Fert q per Hectare",
        irr_log_per_ha = "Log of Irr q per Hectare",
        mech_log_per_ha = "Log of Mech v per Hectare",
        pest_log_per_ha = "Log of Pest v per Hectare")

labels(VDSA_Prod_Data2)

##############################################################################
##############################################################################
  # 2 - dig into the data
##############################################################################
##############################################################################
  
# visualizations (i may recommend scatterplots, but be creative!) 
# look at these with relationship to output
# consider: plot_area, lab_q irr_q pest_q 

# Scatterplot for plot_area vs. output

ggplot(VDSA_Prod_Data1, aes(x = plot_area, y = output)) +
  geom_point() +
  labs(x = "Plot Area", y = "Output") +
  ggtitle("Scatterplot of Plot Area vs. Output")

# Scatterplot for lab_q vs. output
ggplot(VDSA_Prod_Data1, aes(x = lab_q, y = output)) +
  geom_point() +
  labs(x = "Lab Q", y = "Output") +
  ggtitle("Scatterplot of Lab Q vs. Output")

# Scatterplot for irr_q vs. output
ggplot(VDSA_Prod_Data1, aes(x = irr_q, y = output)) +
  geom_point() +
  labs(x = "Irr Q", y = "Output") +
  ggtitle("Scatterplot of Irrigation Q vs. Output")

# Scatterplot for pest_q vs. output
ggplot(VDSA_Prod_Data1, aes(x = pest_v, y = output)) +
  geom_point() +
  labs(x = "Pest V", y = "Output") +
  ggtitle("Scatterplot of Pest V vs. Output")

  
# create an irrigation dummy
VDSA_Prod_Data1 <- VDSA_Prod_Data1 %>%
  mutate(irrigation_dum = if_else(irr_q == 0, 0, 1))

##############################################################################
##############################################################################
  # 3 - end matter, save, close, etc.  
##############################################################################
##############################################################################
  
# save this file 	
write_dta(VDSA_Prod_Data1, "VDSA_Prod_Data1_modified.dta")
  
# close log
log_close(tmp)

## END ## 	