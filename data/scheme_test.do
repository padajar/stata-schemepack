****************************
****************************
***                      ***
***   schemepack v1.4    *** 
***                      ***
***     Asjad Naqvi      ***
***                      ***
***   The Stata Guide    ***  
***     on Medium        ***
***                      ***
***     08 Nov 2022      ***  
***                      ***
****************************
****************************

// Source
* https://github.com/asjadnaqvi/stata-schemepack
* https://medium.com/the-stata-guide

// Report errors here: 
* https://github.com/asjadnaqvi/stata-schemepack/issues

set autotabgraph on
clear
foreach graph in scatter line pie box histogram bar hbar ci range	///
				 area scatter_label scatter_by 						{			
	cap graph drop `graph'
}

* Installation
	// See GitHub page to check if there are version differences between SSC and GitHub

	// install from ssc
	*ssc install schemepack, replace
	
	// OR install from GitHub 
	*net install schemepack, from("https://raw.githubusercontent.com/asjadnaqvi/stata-schemepack/main/installation/") replace
	
	// read the data
	use "https://github.com/asjadnaqvi/stata-schemepack/blob/main/data/scheme_test.dta?raw=true", clear
	

* Setup
	// Set the scheme, e.g.:
	* set scheme white_tableau 
	* set scheme black_tableau 
	* set scheme gg_tableau

	// Or permanently set the theme
	* set scheme white_tableau, perm

	// Or set it in a graph directly
	* twoway (scatter var2 date if group==1), scheme(white_tableau)

	set scheme white_tableau


*****************************************
*********** TEST GRAPHS BELOW ***********
*****************************************

// Feel free to try these on your own datasets; report errors if you find any.

// Note that some schemes might only have only 6 or 8 colors. Therefore, the 	
// cycle repeats once the last defined color of a scheme is reached.

*** Scatter plot

twoway ///
	(scatter var2 date if group==1) 											///
	(scatter var2 date if group==2) 											///
	(scatter var2 date if group==3) 											///
	(scatter var2 date if group==4) 											///
	(scatter var2 date if group==5) 											///
	(scatter var2 date if group==6) 											///
	(scatter var2 date if group==7) 											///
	(scatter var2 date if group==8) 											///
	(scatter var2 date if group==9) 											///
	(scatter var2 date if group==10) 											///
	(scatter var2 date if group==11) 											///
	(scatter var2 date if group==12), 											///
	legend(order(1  "group1"  2  "group2" 3 "group3" 4 "group4"  5 "group5" 	///
				 6  "group6"  7  "group7" 8 "group8" 9 "group9" 10 "group10"	///
				 11 "group11" 12 "group12")) 									///
	title("Scatter plot") 														///
	subtitle("A subtitle example")												///
	note("The Stata Guide") 													///
	name(scatter)
	
	
*** Line graph
	
twoway ///
	(line var2 date if group==1) 												///
	(line var2 date if group==2) 												///
	(line var2 date if group==3) 												///
	(line var2 date if group==4) 												///
	(line var2 date if group==5) 												///
	(line var2 date if group==6) 												///
	(line var2 date if group==7) 												///
	(line var2 date if group==8) 												///
	(line var2 date if group==9) 												///
	(line var2 date if group==10)												///
	(line var2 date if group==11)												///
	(line var2 date if group==12),												///
	legend(order(1  "group1"   2 "group2" 3 "group3" 4 "group4"  5 "group5" 	///
				 6  "group6"   7 "group7" 8 "group8" 9 "group9" 10 "group10"	///
				 11 "group11" 12 "group12")) 									///
	title("Line plot") 															///
	note("The Stata Guide", size(vsmall)) 										///
	name(line)		
	
		
*** Pie chart
		
graph pie var2 if group <= 10, 													///
	over(group) plabel(_all percent, format(%9.2f)) 							///
	line(lcolor(black) lwidth(vvthin)) 	/// outline colors manually added       ///          
	title("Pie plot") 															///
	note("The Stata Guide", size(vsmall)) 										///
	name(pie)
	
	
*** Box plot

graph box 																		///
	var*, 																		///
	title("Box plot") 															///
	note("The Stata Guide", size(vsmall)) 										///
	name(box)


*** Histogram

histogram var4, percent															///
	title("Histogram") 															///
	note("The Stata Guide", size(vsmall)) 										///
	name(histogram)																///


*** Bar graph

graph bar 																		///
	var*, 																		///
	blabel(bar, format(%9.2f)) 													///
	title("Bar graph") 															///
	note("The Stata Guide", size(vsmall)) 										///
	name(bar)


*** Horizontal bar graph

graph hbar (mean) 																///
	var* 																		///
	if group <= 6, 																///
	over(group) 																///
	percentages stack															///
	legend(order(1 "Var 1" 2 "Var 2" 3 "Var 3" 4 "Var 4"  5 "Var 5" 6 "Var 6")) ///
	title("Bar graph") 															///
	note("The Stata Guide", size(vsmall)) 										///
	name(hbar)


*** Confidence bands
	
twoway 																			///
	(lpolyci var1 var9, fcolor(%80)) 											///
	(lpolyci var2 var9, fcolor(%80)) 											///
	(lpolyci var3 var9, fcolor(%80)),											///
	title("Confidence Interval") 												///
	note("The Stata Guide", size(vsmall)) 										///
	name(ci)
	
	
*** Range graphs	

twoway 																			///
	(rcapsym var2 var3 date if group==1, sort) 									///
	(rcapsym var2 var3 date if group==2, sort), 								///
	title("Range plots") 														///
	note("The Stata Guide", size(vsmall)) 										///
	name(range)
	

*** Area graphs	

twoway 																			///
	(area den1d den1x, fcolor(%50)) 											///
	(area gen2d gen2x, fcolor(%50)) 											///
	(area gen3d gen3x, fcolor(%50)),											///
	title("Density plots") 														///
	note("The Stata Guide", size(vsmall)) 										///
	name(area)

	
*** Scatter labels			

twoway																			///
	(scatter var2 var1, mlabel(group)) 											///
	if date==22320,																///
	title("Confidence Interval") 												///
	note("The Stata Guide", size(vsmall)) 										///
	name(scatter_label)
		

*** By graphs
		
twoway 																			///
	(scatter var2 var1) 														///
	if group <= 12, 															///
	by(group, yrescale xrescale)												///
	by(, title("By graphs") note("The Stata Guide", size(vsmall))) 				///
	name(scatter_by)
			
			
//// *******  END OF FILE ******* \\\\
