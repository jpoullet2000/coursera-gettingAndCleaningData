---
title: "Getting and Cleaning Data: Q4"
author: "Jean-Baptiste Poullet"
date: '2015-02-04'
output: html_document
---

## Question 1


```r
AmericanCommunitySurveyFile <- file.path(getwd(),"AmericanCommunitySurvey")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = AmericanCommunitySurveyFile, method='curl')
ACS <- read.csv(AmericanCommunitySurveyFile)
str(ACS)
```

```
## 'data.frame':	6496 obs. of  188 variables:
##  $ RT      : Factor w/ 1 level "H": 1 1 1 1 1 1 1 1 1 1 ...
##  $ SERIALNO: int  186 306 395 506 835 989 1861 2120 2278 2428 ...
##  $ DIVISION: int  8 8 8 8 8 8 8 8 8 8 ...
##  $ PUMA    : int  700 700 100 700 800 700 700 200 400 500 ...
##  $ REGION  : int  4 4 4 4 4 4 4 4 4 4 ...
##  $ ST      : int  16 16 16 16 16 16 16 16 16 16 ...
##  $ ADJUST  : int  1015675 1015675 1015675 1015675 1015675 1015675 1015675 1015675 1015675 1015675 ...
##  $ WGTP    : int  89 310 106 240 118 115 0 35 47 51 ...
##  $ NP      : int  4 1 2 4 4 4 1 1 2 2 ...
##  $ TYPE    : int  1 1 1 1 1 1 2 1 1 1 ...
##  $ ACR     : int  1 NA 1 1 2 1 NA 1 1 1 ...
##  $ AGS     : int  NA NA NA NA 1 NA NA NA NA NA ...
##  $ BDS     : int  4 1 3 4 5 3 NA 2 3 2 ...
##  $ BLD     : int  2 7 2 2 2 2 NA 1 2 1 ...
##  $ BUS     : int  2 NA 2 2 2 2 NA 2 2 2 ...
##  $ CONP    : int  NA NA NA NA NA NA NA NA NA NA ...
##  $ ELEP    : int  180 60 70 40 250 130 NA 40 2 20 ...
##  $ FS      : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ FULP    : int  2 2 2 2 2 2 NA 480 2 2 ...
##  $ GASP    : int  3 3 30 80 3 3 NA 3 3 140 ...
##  $ HFL     : int  3 3 1 1 3 3 NA 4 3 1 ...
##  $ INSP    : int  600 NA 200 200 700 250 NA NA 770 120 ...
##  $ KIT     : int  1 1 1 1 1 1 NA 1 1 1 ...
##  $ MHP     : int  NA NA NA NA NA NA NA NA NA 220 ...
##  $ MRGI    : int  1 NA NA 1 1 1 NA NA 1 NA ...
##  $ MRGP    : int  1300 NA NA 860 1900 700 NA NA 750 NA ...
##  $ MRGT    : int  1 NA NA 1 1 1 NA NA 1 NA ...
##  $ MRGX    : int  1 NA 3 1 1 1 NA NA 1 3 ...
##  $ PLM     : int  1 1 1 1 1 1 NA 1 1 1 ...
##  $ RMS     : int  9 2 7 6 7 6 NA 4 6 5 ...
##  $ RNTM    : int  NA 2 NA NA NA NA NA NA NA NA ...
##  $ RNTP    : int  NA 600 NA NA NA NA NA NA NA NA ...
##  $ SMP     : int  NA NA NA 400 650 400 NA NA NA NA ...
##  $ TEL     : int  1 1 1 1 1 1 NA 1 1 1 ...
##  $ TEN     : int  1 3 2 1 1 1 NA 4 1 2 ...
##  $ VACS    : int  NA NA NA NA NA NA NA NA NA NA ...
##  $ VAL     : int  17 NA 18 19 20 15 NA NA 13 1 ...
##  $ VEH     : int  3 1 2 3 5 2 NA 1 2 2 ...
##  $ WATP    : int  840 1 50 500 2 1200 NA 650 660 2 ...
##  $ YBL     : int  5 3 5 2 3 5 NA 5 3 5 ...
##  $ FES     : int  2 NA 7 1 1 2 NA NA 2 NA ...
##  $ FINCP   : int  105600 NA 9400 66000 93000 61000 NA NA 209000 NA ...
##  $ FPARC   : int  2 NA 2 1 2 1 NA NA 4 NA ...
##  $ GRNTP   : int  NA 660 NA NA NA NA NA NA NA NA ...
##  $ GRPIP   : int  NA 23 NA NA NA NA NA NA NA NA ...
##  $ HHL     : int  1 1 1 1 1 1 NA 1 1 2 ...
##  $ HHT     : int  1 4 3 1 1 1 NA 6 1 5 ...
##  $ HINCP   : int  105600 34000 9400 66000 93000 61000 NA 10400 209000 35400 ...
##  $ HUGCL   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ HUPAC   : int  2 4 2 1 2 1 NA 4 4 4 ...
##  $ HUPAOC  : int  2 4 2 1 2 1 NA 4 4 4 ...
##  $ HUPARC  : int  2 4 2 1 2 1 NA 4 4 4 ...
##  $ LNGI    : int  1 1 1 1 1 1 NA 1 1 2 ...
##  $ MV      : int  4 3 2 3 1 4 5 5 1 1 ...
##  $ NOC     : int  2 0 1 2 1 2 NA 0 0 0 ...
##  $ NPF     : int  4 NA 2 4 4 4 NA NA 2 NA ...
##  $ NPP     : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ NR      : int  0 0 0 0 0 0 NA 0 0 1 ...
##  $ NRC     : int  2 0 1 2 1 2 NA 0 0 0 ...
##  $ OCPIP   : int  18 NA 23 26 36 26 NA NA 5 7 ...
##  $ PARTNER : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ PSF     : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ R18     : int  1 0 1 1 1 1 NA 0 0 0 ...
##  $ R60     : int  0 0 0 0 0 0 NA 1 1 0 ...
##  $ R65     : int  0 0 0 0 0 0 NA 1 1 0 ...
##  $ RESMODE : int  1 2 1 2 1 2 NA 2 1 1 ...
##  $ SMOCP   : int  1550 NA 179 1422 2800 1330 NA NA 805 196 ...
##  $ SMX     : int  3 NA NA 1 1 2 NA NA 3 NA ...
##  $ SRNT    : int  0 1 0 0 0 0 NA 1 0 0 ...
##  $ SVAL    : int  1 0 1 1 1 1 NA 0 1 0 ...
##  $ TAXP    : int  24 NA 16 31 25 7 NA NA 22 4 ...
##  $ WIF     : int  3 NA 1 2 3 1 NA NA 1 NA ...
##  $ WKEXREL : int  2 NA 13 2 1 7 NA NA 6 NA ...
##  $ WORKSTAT: int  3 NA 13 1 1 3 NA NA 3 NA ...
##  $ FACRP   : int  0 0 0 0 0 0 NA 0 0 1 ...
##  $ FAGSP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FBDSP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FBLDP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FBUSP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FCONP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FELEP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FFSP    : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ FFULP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FGASP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FHFLP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FINSP   : int  0 0 0 0 0 1 NA 0 0 0 ...
##  $ FKITP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FMHP    : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FMRGIP  : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FMRGP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FMRGTP  : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FMRGXP  : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FMVYP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FPLMP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FRMSP   : int  0 0 0 0 0 0 NA 0 0 1 ...
##  $ FRNTMP  : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FRNTP   : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FSMP    : int  0 0 0 0 0 0 NA 0 0 0 ...
##  $ FSMXHP  : int  0 0 0 0 0 0 NA 0 0 0 ...
##   [list output truncated]
```

```r
strsplit(x=names(ACS),split='wgtp')[[123]]
```

```
## [1] ""   "15"
```
## Question 2


```r
library(dplyr)
GrossDomesticProductFile = file.path(getwd(),'GrossDomesticProduct.csv')
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",method='curl',destfile = GrossDomesticProductFile)
GDP = read.csv(GrossDomesticProductFile, skip=5, header=FALSE, nrow=231)
colnames(GDP) = c("country","ranking","empty","countryNames","millions in US dollars",'empty2')
GDP <- GDP[,c('country','ranking','countryNames','millions in US dollars')]
GDPT <- GDP %>% filter(ranking != '') %>% filter(country != '')
GDPTT <- GDPT %>% mutate(`millions in US dollars` = as.numeric(gsub(',','',as.character(`millions in US dollars`))))
mean(GDPTT$`millions in US dollars`)
```

```
## [1] 377652.4
```


## Question 3

```r
countryNames <- GDPTT$countryNames
length(grep("^United",countryNames))
```

```
## Warning in grep("^United", countryNames): input string 99 is invalid in
## this locale
```

```
## Warning in grep("^United", countryNames): input string 186 is invalid in
## this locale
```

```
## [1] 3
```

## Question 4

```r
educationaldataFile = file.path(getwd(),'educationaldata.csv')
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",method='curl',destfile = educationaldataFile)
ED = read.csv(educationaldataFile)
names(ED)
```

```
##  [1] "CountryCode"                                      
##  [2] "Long.Name"                                        
##  [3] "Income.Group"                                     
##  [4] "Region"                                           
##  [5] "Lending.category"                                 
##  [6] "Other.groups"                                     
##  [7] "Currency.Unit"                                    
##  [8] "Latest.population.census"                         
##  [9] "Latest.household.survey"                          
## [10] "Special.Notes"                                    
## [11] "National.accounts.base.year"                      
## [12] "National.accounts.reference.year"                 
## [13] "System.of.National.Accounts"                      
## [14] "SNA.price.valuation"                              
## [15] "Alternative.conversion.factor"                    
## [16] "PPP.survey.year"                                  
## [17] "Balance.of.Payments.Manual.in.use"                
## [18] "External.debt.Reporting.status"                   
## [19] "System.of.trade"                                  
## [20] "Government.Accounting.concept"                    
## [21] "IMF.data.dissemination.standard"                  
## [22] "Source.of.most.recent.Income.and.expenditure.data"
## [23] "Vital.registration.complete"                      
## [24] "Latest.agricultural.census"                       
## [25] "Latest.industrial.data"                           
## [26] "Latest.trade.data"                                
## [27] "Latest.water.withdrawal.data"                     
## [28] "X2.alpha.code"                                    
## [29] "WB.2.code"                                        
## [30] "Table.Name"                                       
## [31] "Short.Name"
```

```r
fiscalYear = grep('[Ff]iscal [Yy]ear',ED[,'Special.Notes'],value=TRUE)
fiscalYearJune = grep('[Jj]une',fiscalYear,value=TRUE)
length(fiscalYearJune)
```

```
## [1] 13
```

## Question 5

```r
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
dates <- ymd(sampleTimes)
sum(year(dates)==2012)
```

```
## [1] 250
```

```r
sum(year(dates)==2012 & as.character(wday(dates,label=TRUE))=='Mon')
```

```
## [1] 47
```









