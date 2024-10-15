
clear 
use IDLdata.dta

*************************************************************************
***Table 1 - Summary Statistics for CFC Complexity
*************************************************************************

sum reg10_index_c if year == 1 //2016
sum reg10_index_c if year == 2 //2018
sum reg10_index_c if year == 3 //2020

*************************************************************************
***Table 3 - Summary Statistics for Moderating Country Characteristics of CFC rules
*************************************************************************

sum Standalone Groupescape UCFinterest CFintcap IDLborgroup Gdppc ap_index_c FTEpop FTEmaster AI CC RPA

*************************************************************************
***Table 4 - Summary Statistics for Controls
*************************************************************************

sum vae pve gee rqe rle cce CountryTaxrate

*************************************************************************
***Table 5 - IDL Baseline Regression
*************************************************************************
xtset country year
xtreg reg10_index_c IDLintro vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*************************************************************************
***Table 6 - IDL - Analysis of the Moderation of Country-Level Design Elements of Single Anti-Tax Avoidance Rules 
*************************************************************************

*Regression for IDL exception for standalone entities
xtset country year
xtreg reg10_index_c IDLintro Standalone c.IDLintro#c.Standalone vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Regression for IDL group escape clause
xtset country year
xtreg reg10_index_c IDLintro Groupescape c.IDLintro#c.Groupescape vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Regression for Unlimited carryforward of unused interest
xtset country year
xtreg reg10_index_c IDLintro UCFinterest c.IDLintro#c.UCFinterest vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Regression for Carryforward of unused interest capacity allowed
xtset country year
xtreg reg10_index_c IDLintro CFintcap c.IDLintro#c.CFintcap vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Regression for IDL calculation of net borrowing costs on group level?
xtset country year
xtreg reg10_index_c IDLintro IDLborgroup c.IDLintro#c.IDLborgroup vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*************************************************************************
***Table 7 - IDL - Analysis of the Moderation of Indicators for the Development of the Tax System of Countries 
*************************************************************************

*Generate mean for GDP pc

sort country
by country: egen MGdppc = mean(Gdppc)

*Regression for GDP pc
xtset country year
xtreg reg10_index_c IDLintro Gdppc c.IDLintro#c.MGdppc vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country)

*Generate mean for Full-Time Employees /Total Population
sort country
by country: egen MFTEpop = mean(FTEpop)

*Regression for Full-Time Employees /Total Population
xtset country year
xtreg reg10_index_c IDLintro FTEpop c.IDLintro#c.MFTEpop vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Mean for Full-Time Employees with Master Degree or Higher Divided by Total Full-Time Employees

sort country
by country: egen MFTEmaster = mean(FTEmaster)

*Regression for Full-Time Employees with Master Degree or Higher Divided by Total Full-Time Employees

xtset country year
xtreg reg10_index_c IDLintro FTEmaster c.IDLintro#c.MFTEmaster vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Mean for Artificial Intelligence used/implementing?
sort country
by country: egen MAI = mean(AI)

*Regression for Artificial Intelligence used/implementing?
xtset country year
xtreg reg10_index_c IDLintro AI c.IDLintro#c.MAI vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Mean for Cooperative Compliance in Place
sort country
by country: egen MCC = mean(CC)

*Regression for Cooperative Compliance in Place
xtset country year
xtreg reg10_index_c IDLintro CC c.IDLintro#c.MCC vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Mean for Robotic Process Automation
sort country
by country: egen MRPA = mean(RPA)

*Regression for Robotic Process Automation
xtset country year
xtreg reg10_index_c IDLintro RPA c.IDLintro#c.MRPA vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Mean for Appeals
sort country
by country: egen Map_index_c = mean(ap_index_c)

*Regression for Appeals
xtset country year
xtreg reg10_index_c IDLintro ap_index_c c.IDLintro#c.Map_index_c vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*************************************************************************
***Table 8 - IDL - Analysis of the Moderation of Tax Haven Classifications
*************************************************************************

*Regression Tax Havens Lips/Cobham (TJN)
xtset country year
xtreg reg10_index_c IDLintro CountryTaxhaventjn c.IDLintro#c.CountryTaxhaventjn vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Regression Tax Havens Dyreng
xtset country year
xtreg reg10_index_c IDLintro CountryTaxhavendyreng c.IDLintro#c.CountryTaxhavendyreng vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Regression Tax havens acc. to Torslov
xtset country year
xtreg reg10_index_c IDLintro CountryTaxhavenz c.IDLintro#c.CountryTaxhavenz vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Regression Conduit Tax Havens acc. to Garcia-Bernando

xtset country year
xtreg reg10_index_c IDLintro CountryTaxhavenconduit c.IDLintro#c.CountryTaxhavenconduit vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Regression Sink OFCs acc. to Garcia-Bernando

xtset country year
xtreg reg10_index_c IDLintro CountryTaxhavensink c.IDLintro#c.CountryTaxhavensink vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

