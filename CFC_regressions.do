clear 
use CFCdata.dta

*************************************************************************
***Table 1 - Summary Statistics for CFC Complexity
*************************************************************************

sum reg04_index_c if year == 1 //2016
sum reg04_index_c if year == 2 //2018
sum reg04_index_c if year == 3 //2020

*************************************************************************
***Table 3 - Summary Statistics for Moderating Country Characteristics of CFC rules
*************************************************************************

sum CountryCfcTresholdR Cfc_A Gdppc ap_index_c FTEpop FTEmaster AI CC RPA

*************************************************************************
***Table 4 - Summary Statistics for Controls
*************************************************************************

sum vae pve gee rqe rle cce CountryTaxrate

*************************************************************************
***Table 5 - CFC Baseline Regression
*************************************************************************
xtset country year
xtreg reg04_index_c CFCintro vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*************************************************************************
***Table 6 - CFC - Analysis of the Moderation of Country-Level Design Elements of Single Anti-Tax Avoidance Rules 
*************************************************************************

*Generate mean for CFC critical tax rate
sort country
by country: egen MCountryCfcTresholdR = mean(CountryCfcTresholdR)

*Regression for CFC critical tax rate

xtset country year
xtreg reg04_index_c CFCintro CountryCfcTresholdR c.CFCintro#c.MCountryCfcTresholdR vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*EU-Sample only: Regression for ATAD Model A

xtset country year
xtreg reg04_index_c CFCintro Cfc_A c.CFCintro#c.Cfc_A vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*************************************************************************
***Table 7 - CFC - Analysis of the Moderation of Indicators for the Development of the Tax System of Countries 
*************************************************************************

*Generate mean for GDP pc

sort country
by country: egen MGdppc = mean(Gdppc)

*Regression for GDP pc
xtset country year
xtreg reg04_index_c CFCintro Gdppc c.CFCintro#c.MGdppc vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country)

*Generate mean for Full-Time Employees /Total Population
sort country
by country: egen MFTEpop = mean(FTEpop)

*Regression for Full-Time Employees /Total Population
xtset country year
xtreg reg04_index_c CFCintro FTEpop c.CFCintro#c.MFTEpop vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Mean for Full-Time Employees with Master Degree or Higher Divided by Total Full-Time Employees

sort country
by country: egen MFTEmaster = mean(FTEmaster)

*Regression for Full-Time Employees with Master Degree or Higher Divided by Total Full-Time Employees

xtset country year
xtreg reg04_index_c CFCintro FTEmaster c.CFCintro#c.MFTEmaster vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Mean for Artificial Intelligence used/implementing?
sort country
by country: egen MAI = mean(AI)

*Regression for Artificial Intelligence used/implementing?
xtset country year
xtreg reg04_index_c CFCintro AI c.CFCintro#c.MAI vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Mean for Cooperative Compliance in Place
sort country
by country: egen MCC = mean(CC)

*Regression for Cooperative Compliance in Place
xtset country year
xtreg reg04_index_c CFCintro CC c.CFCintro#c.MCC vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Mean for Robotic Process Automation
sort country
by country: egen MRPA = mean(RPA)

*Regression for Robotic Process Automation
xtset country year
xtreg reg04_index_c CFCintro RPA c.CFCintro#c.MRPA vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Mean for Appeals
sort country
by country: egen Map_index_c = mean(ap_index_c)

*Regression for Appeals
xtset country year
xtreg reg04_index_c CFCintro ap_index_c c.CFCintro#c.Map_index_c vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*************************************************************************
***Table 8 - CFC - Analysis of the Moderation of Tax Haven Classifications
*************************************************************************



*Regression Tax Havens Lips/Cobham (TJN)
xtset country year
xtreg reg04_index_c CFCintro CountryTaxhaventjn c.CFCintro#c.CountryTaxhaventjn vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Regression Tax Havens Dyreng
xtset country year
xtreg reg04_index_c CFCintro CountryTaxhavendyreng c.CFCintro#c.CountryTaxhavendyreng vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Regression Tax havens acc. to Torslov
xtset country year
xtreg reg04_index_c CFCintro CountryTaxhavenz c.CFCintro#c.CountryTaxhavenz vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 


*Regression Conduit Tax Havens acc. to Garcia-Bernando

xtset country year
xtreg reg04_index_c CFCintro CountryTaxhavenconduit c.CFCintro#c.CountryTaxhavenconduit vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

*Regression Sink OFCs acc. to Garcia-Bernando

xtset country year
xtreg reg04_index_c CFCintro CountryTaxhavensink c.CFCintro#c.CountryTaxhavensink vae pve gee rqe rle cce CountryTaxrate, i(country)fe vce(cluster country) 

