/* BEGIN */ 	

* AREC596 - coding practice + using github
* file created: 22 march 2024
* filed edited: 12 april 2024
* last edit: JBron

*** if you need to do an exercise, look for something labeled with "*** HERE ***"

**************************************************************************
**************************************************************************
* 0 - set up, read in file
**************************************************************************
**************************************************************************

* set your directory - either through using a project do or just using cd 

di c(hostname) 
	
    if "`c(hostname)'" == "JBRON-DESKTOP" {
            cd "\Users\jbron\OneDrive - University of Arizona\Documents\School\AREC 596"
            }

	set 	more off
	set 	matsize 1000
	*** adding , perm will ensure that these changes are permanent  

* read in the file 

	use "VDSA_Prod_Data.dta"
	
**************************************************************************
**************************************************************************
* 1 - create file for use 
**************************************************************************
**************************************************************************

* create do-file
* create log-file
	cap log close 
	*** closes an existing one, if one is open
	log 	using "596-data-practice_22march.smcl", replace

* tell me about these variables: output lab_q fert_q irr_q mech_v pest_v

	local variables "output lab_q fert_q irr_q mech_v pest_v" // local for those variables 
// Loop to describe each of the above variables 
		foreach x in `variables'{
			sum `x'
		}

* we hypothesize that gender is important here
* find a few ways to tell me about the variables above, differentiated by gender (genderH) 

	local variables "output lab_q fert_q irr_q mech_v pest_v" // local for those variables 
// Loop to describe each of the above variables, this time by gender
		foreach x in `variables'{
			sum `x', by (genderH)
		}
	

* to do anything with these data, we need to do some manipulations 

* look at the variable sur_yr 
* drop if the year is 2009 or 2013

*** HERE ***

* make new variables for lab_q fert_q irr_q mech_v pest_v
* these should be measured as logs per hectare 

*** HERE ***

* make new variables for aindex lindex tot_acre dist
* these should be log transformed 

* create log transformed variables

*** HERE ***

* labeling variables created above

*** HERE ***
	
**************************************************************************
**************************************************************************
* 2 - dig into the data
**************************************************************************
**************************************************************************

* visualizations (i may recommend scatterplots, but be creative!) 
* look at these with relationship to output
*consider: plot_area, lab_q irr_q pest_q 

*** HERE ***

* create an irrigation dummy

*** HERE ***

**************************************************************************
**************************************************************************
* 3 - end matter, save, close, etc.  
**************************************************************************
**************************************************************************

* save this file 	

*** HERE ***


* close log
	log 		close
	
/* END */ 	