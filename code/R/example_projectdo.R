## BEGIN ##
  
# Project: AREC596 - Sample projectdo
# Created on: January 2024
# Created by: alj
# Stata v.18.0

# does
    # establishes an identical workspace between users
    # sets globals that define absolute paths
    # serves as the starting point to find any do-file, dataset or output
    # runs all do-files needed for data work
    # loads any user written packages needed for analysis

# assumes
    # access to all data and code

# TO DO:
    # personalize

# ######################################################################
  # 0(a) - setup pathways
# ######################################################################

# define global / wd pathways 
# can use either - suggest wd  

# set a working directory     
    setwd("/path/to/your/directory")
    # all file and directory operations will be relative to this path
    
# global directory
    global_path <- "/path/to/your/directory"
    # use this variable throughout your script
    
# ######################################################################
  # 0(b) - setup
# ######################################################################

    #  install necessary packages
    
    packages_to_install <- c("package1", "package2", "package3")
    ### "package1", "package2", etc. are placeholders / not real 
    
    # Check if each package is already installed, and install if not
    
    for (pkg in packages_to_install) {
      if (!require(pkg, character.only = TRUE)) {
        install.packages(pkg)
        library(pkg, character.only = TRUE)
      }
    }
    
    # Specify R version in use
    # This is specific for the package installed 
    
    # Load with library function to check version: 
    library(packageName, lib.loc = "path/to/library")
    ## replace packageName with your package 
    ## replace "path/to/library" with path to library 
    
    # Install specific version of package 
    install.packages("packageName", repos = NULL, type = "source", version = "X.X.X")
    ## replace packageName with your package
    ## replace "X.X.X" with version

# ######################################################################
  # 1 - data cleaning 
# ######################################################################
  
# ######################################################################
  # 2 - data analysis
# ######################################################################
  
## END ##
