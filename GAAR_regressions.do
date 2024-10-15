clear 
use GAARdata.dta

*************************************************************************
***Table 1 - Summary Statistics for GAAR Complexity
*************************************************************************

sum reg08_index_c if year == 1 //2016
sum reg08_index_c if year == 2 //2018
sum reg08_index_c if year == 3 //2020

*************************************************************************
***Table 3 - Summary Statistics for Moderating Country Characteristics of GAAR rules
*************************************************************************

sum Gdppc ap_index_c FTEpop FTEmaster AI CC RPA

*************************************************************************
***Table 4 - Summary Statistics for Controls
*************************************************************************

sum vae pve gee rqe rle cce CountryTaxrate

*************************************************************************
***Table 5 - GAAR Baseline Regression
*************************************************************************
xtset country year
xtreg reg08_index_c GAARintro vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*************************************************************************
***Table 7 - GAAR - Analysis of the Moderation of Indicators for the Development of the Tax System of Countries 
*************************************************************************

*Generate mean for GDP pc

sort country
by country: egen MGdppc = mean(Gdppc)

*Regression for GDP pc
xtset country year
xtreg reg08_index_c GAARintro Gdppc c.GAARintro#c.MGdppc vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country)

*Generate mean for Full-Time Employees /Total Population
sort country
by country: egen MFTEpop = mean(FTEpop)

*Regression for Full-Time Employees /Total Population
xtset country year
xtreg reg08_index_c GAARintro FTEpop c.GAARintro#c.MFTEpop vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Mean for Full-Time Employees with Master Degree or Higher Divided by Total Full-Time Employees

sort country
by country: egen MFTEmaster = mean(FTEmaster)

*Regression for Full-Time Employees with Master Degree or Higher Divided by Total Full-Time Employees

xtset country year
xtreg reg08_index_c GAARintro FTEmaster c.GAARintro#c.MFTEmaster vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Mean for Artificial Intelligence used/implementing?
sort country
by country: egen MAI = mean(AI)

*Regression for Artificial Intelligence used/implementing?
xtset country year
xtreg reg08_index_c GAARintro AI c.GAARintro#c.MAI vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Mean for Cooperative Compliance in Place
sort country
by country: egen MCC = mean(CC)

*Regression for Cooperative Compliance in Place
xtset country year
xtreg reg08_index_c GAARintro CC c.GAARintro#c.MCC vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Mean for Robotic Process Automation
sort country
by country: egen MRPA = mean(RPA)

*Regression for Robotic Process Automation
xtset country year
xtreg reg08_index_c GAARintro RPA c.GAARintro#c.MRPA vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Mean for Appeals
sort country
by country: egen Map_index_c = mean(ap_index_c)

*Regression for Appeals
xtset country year
xtreg reg08_index_c GAARintro ap_index_c c.GAARintro#c.Map_index_c vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*************************************************************************
***Table 8 - GAAR - Analysis of the Moderation of Tax Haven Classifications
*************************************************************************



*Regression Tax Havens Lips/Cobham (TJN)
xtset country year
xtreg reg08_index_c GAARintro CountryTaxhaventjn c.GAARintro#c.CountryTaxhaventjn vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Regression Tax Havens Dyreng
xtset country year
xtreg reg08_index_c GAARintro CountryTaxhavendyreng c.GAARintro#c.CountryTaxhavendyreng vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Regression Tax havens acc. to Torslov
xtset country year
xtreg reg08_index_c GAARintro CountryTaxhavenz c.GAARintro#c.CountryTaxhavenz vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Regression Conduit Tax Havens acc. to Garcia-Bernando

xtset country year
xtreg reg08_index_c GAARintro CountryTaxhavenconduit c.GAARintro#c.CountryTaxhavenconduit vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Regression Sink OFCs acc. to Garcia-Bernando

xtset country year
xtreg reg08_index_c GAARintro CountryTaxhavensink c.GAARintro#c.CountryTaxhavensink vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


