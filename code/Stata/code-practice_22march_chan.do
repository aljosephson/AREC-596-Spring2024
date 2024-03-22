/* BEGIN */ 	

* AREC596 - coding practice + using github
* file created: 22 march 2024
* filed edited: 22 march 2024
* last edit: alj 

*** if you need to do an exercise, look for something labeled with "*** HERE ***"

**************************************************************************
**************************************************************************
* 0 - set up, read in file
**************************************************************************
**************************************************************************

* set your directory - either through using a project do or just using cd 

*** HERE ***

	set 	more off
	set 	matsize 1000
	*** adding , perm will ensure that these changes are permanent  

* read in the file 

*** HERE ***
	
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

*** HERE ***

* we hypothesize that gender is important here
* find a few ways to tell me about the variables above, differentiated by gender (genderH) 

*** HERE *** 

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