---
title: "Getting and Cleaning Data: Q3"
author: "Jean-Baptiste Poullet"
date: '2015-02-01'
output: html_document
---

## Question 1


```r
library(data.table)
AmericanCommunitySurveyFile <- file.path(getwd(),"AmericanCommunitySurvey")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = AmericanCommunitySurveyFile ,method='curl')
df <- read.csv(AmericanCommunitySurveyFile)
DT <- as.data.table(df)
DT[,agricultureLogical:=(ACR==3 & AGS ==6)]
```

```
##       RT SERIALNO DIVISION PUMA REGION ST  ADJUST WGTP NP TYPE ACR AGS BDS
##    1:  H      186        8  700      4 16 1015675   89  4    1   1  NA   4
##    2:  H      306        8  700      4 16 1015675  310  1    1  NA  NA   1
##    3:  H      395        8  100      4 16 1015675  106  2    1   1  NA   3
##    4:  H      506        8  700      4 16 1015675  240  4    1   1  NA   4
##    5:  H      835        8  800      4 16 1015675  118  4    1   2   1   5
##   ---                                                                     
## 6492:  H  1357238        8  300      4 16 1015675  108  2    1  NA  NA   2
## 6493:  H  1357340        8  400      4 16 1015675   58  2    1   1  NA   3
## 6494:  H  1357874        8  900      4 16 1015675   32  2    1   1  NA   2
## 6495:  H  1357880        8  500      4 16 1015675  123  2    1   2   1   1
## 6496:  H  1358490        8  700      4 16 1015675  353  2    1  NA  NA   2
##       BLD BUS CONP ELEP FS FULP GASP HFL INSP KIT MHP MRGI MRGP MRGT MRGX
##    1:   2   2   NA  180  0    2    3   3  600   1  NA    1 1300    1    1
##    2:   7  NA   NA   60  0    2    3   3   NA   1  NA   NA   NA   NA   NA
##    3:   2   2   NA   70  0    2   30   1  200   1  NA   NA   NA   NA    3
##    4:   2   2   NA   40  0    2   80   1  200   1  NA    1  860    1    1
##    5:   2   2   NA  250  0    2    3   3  700   1  NA    1 1900    1    1
##   ---                                                                    
## 6492:   5  NA   NA   40  0    1    3   3   NA   1  NA   NA   NA   NA   NA
## 6493:   2   2   NA   30  0    2   70   1  260   1  NA   NA   NA   NA    3
## 6494:   2   2   NA   70  0    2  120   1  420   1  NA    2  400    2    1
## 6495:   2   2   NA  140  0    2    3   3   NA   1  NA   NA   NA   NA   NA
## 6496:   7  NA   NA   30  0    2    3   3   NA   1  NA   NA   NA   NA   NA
##       PLM RMS RNTM RNTP SMP TEL TEN VACS VAL VEH WATP YBL FES  FINCP FPARC
##    1:   1   9   NA   NA  NA   1   1   NA  17   3  840   5   2 105600     2
##    2:   1   2    2  600  NA   1   3   NA  NA   1    1   3  NA     NA    NA
##    3:   1   7   NA   NA  NA   1   2   NA  18   2   50   5   7   9400     2
##    4:   1   6   NA   NA 400   1   1   NA  19   3  500   2   1  66000     1
##    5:   1   7   NA   NA 650   1   1   NA  20   5    2   3   1  93000     2
##   ---                                                                     
## 6492:   1   3    2  480  NA   2   3   NA  NA   1    1   2   2  -2600     4
## 6493:   1   6   NA   NA  NA   1   2   NA  16   1  400   3   4  53200     4
## 6494:   1   4   NA   NA 240   1   1   NA   6   2  410   9   3  18000     4
## 6495:   1   3    2  600  NA   2   3   NA  NA   5    1   9   1  33000     4
## 6496:   1   3    2  610  NA   1   3   NA  NA   2    1   3   5  32600     4
##       GRNTP GRPIP HHL HHT  HINCP HUGCL HUPAC HUPAOC HUPARC LNGI MV NOC NPF
##    1:    NA    NA   1   1 105600     0     2      2      2    1  4   2   4
##    2:   660    23   1   4  34000     0     4      4      4    1  3   0  NA
##    3:    NA    NA   1   3   9400     0     2      2      2    1  2   1   2
##    4:    NA    NA   1   1  66000     0     1      1      1    1  3   2   4
##    5:    NA    NA   1   1  93000     0     2      2      2    1  1   1   4
##   ---                                                                     
## 6492:   520    NA   1   1  -2600     0     4      4      4    1  1   0   2
## 6493:    NA    NA   1   1  53200     0     4      4      4    1  5   0   2
## 6494:    NA    NA   1   1  18000     0     4      4      4    1  4   0   2
## 6495:   740    27   1   1  33000     0     4      4      4    1  2   0   2
## 6496:   640    24   1   2  32600     0     4      4      4    1  3   0   2
##       NPP NR NRC OCPIP PARTNER PSF R18 R60 R65 RESMODE SMOCP SMX SRNT SVAL
##    1:   0  0   2    18       0   0   1   0   0       1  1550   3    0    1
##    2:   0  0   0    NA       0   0   0   0   0       2    NA  NA    1    0
##    3:   0  0   1    23       0   0   1   0   0       1   179  NA    0    1
##    4:   0  0   2    26       0   0   1   0   0       2  1422   1    0    1
##    5:   0  0   1    36       0   0   1   0   0       1  2800   1    0    1
##   ---                                                                     
## 6492:   0  0   0    NA       0   0   0   0   0       1    NA  NA    1    0
## 6493:   0  0   0     6       0   0   0   2   2       1   273  NA    0    1
## 6494:   0  0   0    63       0   0   0   2   2       1   949   2    0    1
## 6495:   0  0   0    NA       0   0   0   0   0       1    NA  NA    1    0
## 6496:   0  0   0    NA       0   0   0   0   0       2    NA  NA    1    0
##       TAXP WIF WKEXREL WORKSTAT FACRP FAGSP FBDSP FBLDP FBUSP FCONP FELEP
##    1:   24   3       2        3     0     0     0     0     0     0     0
##    2:   NA  NA      NA       NA     0     0     0     0     0     0     0
##    3:   16   1      13       13     0     0     0     0     0     0     0
##    4:   31   2       2        1     0     0     0     0     0     0     0
##    5:   25   3       1        1     0     0     0     0     0     0     0
##   ---                                                                    
## 6492:   NA   1       6        3     0     0     0     0     0     0     0
## 6493:   26   0       9        9     0     0     0     0     0     0     0
## 6494:   14   1       8        7     0     0     0     0     0     0     0
## 6495:   NA   2       4        1     0     0     0     0     0     0     0
## 6496:   NA   2      10       10     0     0     0     0     0     0     1
##       FFSP FFULP FGASP FHFLP FINSP FKITP FMHP FMRGIP FMRGP FMRGTP FMRGXP
##    1:    0     0     0     0     0     0    0      0     0      0      0
##    2:    0     0     0     0     0     0    0      0     0      0      0
##    3:    0     0     0     0     0     0    0      0     0      0      0
##    4:    0     0     0     0     0     0    0      0     0      0      0
##    5:    0     0     0     0     0     0    0      0     0      0      0
##   ---                                                                   
## 6492:    0     0     0     0     0     0    0      0     0      0      0
## 6493:    0     0     0     0     0     0    0      0     0      0      0
## 6494:    0     1     0     0     0     0    0      0     0      0      0
## 6495:    0     0     0     0     0     0    0      0     0      0      0
## 6496:    0     0     0     0     0     0    0      0     0      0      0
##       FMVYP FPLMP FRMSP FRNTMP FRNTP FSMP FSMXHP FSMXSP FTAXP FTELP FTENP
##    1:     0     0     0      0     0    0      0      0     0     0     0
##    2:     0     0     0      0     0    0      0      0     0     0     0
##    3:     0     0     0      0     0    0      0      0     0     0     0
##    4:     0     0     0      0     0    0      0      0     0     0     0
##    5:     0     0     0      0     0    0      0      0     0     0     0
##   ---                                                                    
## 6492:     0     0     0      0     0    0      0      0     0     0     0
## 6493:     0     0     0      0     0    0      0      0     0     0     0
## 6494:     1     0     0      0     0    1      0      0     1     0     0
## 6495:     0     0     0      0     0    0      0      0     0     0     0
## 6496:     0     0     0      0     0    0      0      0     0     0     0
##       FVACSP FVALP FVEHP FWATP FYBLP wgtp1 wgtp2 wgtp3 wgtp4 wgtp5 wgtp6
##    1:      0     0     0     0     0    87    28   156    95    26    25
##    2:      0     0     0     0     1   539   363   293   422   566   289
##    3:      0     0     0     0     0   187    35   184   178    83    95
##    4:      0     0     0     0     0   232   406   234   270   249   242
##    5:      0     0     0     0     0   107   194   129    41   156   174
##   ---                                                                   
## 6492:      0     0     0     0     0   154   116   208   241    36    33
## 6493:      0     0     0     0     0   100    49    52    83    51    79
## 6494:      0     0     0     0     0    10    15    47    65    32     8
## 6495:      0     0     0     0     0    40   106    34    36   123    33
## 6496:      0     0     0     0     1   397   622   589   396   580   105
##       wgtp7 wgtp8 wgtp9 wgtp10 wgtp11 wgtp12 wgtp13 wgtp14 wgtp15 wgtp16
##    1:    95    93    93     91     87    166     90     25    153     89
##    2:    87   242   453    453    334    358    414    102    281     99
##    3:    31    32   177    118    110    114    184    107     95    115
##    4:   406   249   287     67     72    413    399     77    245    424
##    5:    47   113   101     33    115     52    113     95    135    206
##   ---                                                                   
## 6492:   140   111    26    201    191    102     73     47    142     84
## 6493:    59    55    54     13     58     16     96     68     26     78
## 6494:    35    35     6     37     62     68     52     29     28     23
## 6495:   233   140   121    125    184    125     36    105    243    218
## 6496:   335   380   400    107    327    557    339    100    117    389
##       wgtp17 wgtp18 wgtp19 wgtp20 wgtp21 wgtp22 wgtp23 wgtp24 wgtp25
##    1:    148     82     25    180     90     24    140     92     25
##    2:    108    278    131    407    447    264    352    238    390
##    3:     33    118    120     37    184     35    176    176    110
##    4:     67     63    226    254    238     69    238    255    239
##    5:    100    185    135    279    116     33    105    244     38
##   ---                                                               
## 6492:    130    134     36     84    104     98     27     34    212
## 6493:     58     17     14     20     18     59     55     18     52
## 6494:     26     38     10      7     55     49     26      8     39
## 6495:    153    110    184    110     38    105     36     37    122
## 6496:    309     96    552    348    334     97    109    358    107
##       wgtp26 wgtp27 wgtp28 wgtp29 wgtp30 wgtp31 wgtp32 wgtp33 wgtp34
##    1:     27     86     84     87     93     90    149     91     28
##    2:    336    122    374    482    468    335    251    613    104
##    3:    103     29     30    197    127     92    118    177     99
##    4:    248     69    234    247    437    423     74     61    401
##    5:     30    230    123    123    243    120    238     98     90
##   ---                                                               
## 6492:    190     37     90    125     27     28    104    102    151
## 6493:     16     48     65     60    114     78     99     57     79
## 6494:     57     38     36     50     26      9     10     10     28
## 6495:     47    214    112    119    112    192    119     35    143
## 6496:    604    351    360    354    664    333    115    330    588
##       wgtp35 wgtp36 wgtp37 wgtp38 wgtp39 wgtp40 wgtp41 wgtp42 wgtp43
##    1:    143     81    144     95     27     22     90    171     27
##    2:    284    116     91    326    102    361    107    253    321
##    3:     99    109     34    100    105     33    173     36    168
##    4:    267     72    388    335    229    236    239     65    259
##    5:    107     44    122     32    127    195    116     36    135
##   ---                                                               
## 6492:    194    123     96     99    190     94     85     92     33
## 6493:     86     44     27    132     80     91    113     66     52
## 6494:     35     43     26     29     54     65     14     11     36
## 6495:    206    244    129    130    233    129     35    115     42
## 6496:    677    349    314    511    115    349    360     97    119
##       wgtp44 wgtp45 wgtp46 wgtp47 wgtp48 wgtp49 wgtp50 wgtp51 wgtp52
##    1:     83    153    148     92     91     91     93     90     26
##    2:    289     96    343    564    274    118    118    321    261
##    3:    175     99    103     30     35    155    102     95    107
##    4:    247    230    225     82    220    233    419    390     69
##    5:    237     33     33    249    102     84    224    119    250
##   ---                                                               
## 6492:     25    139    184     47    121    228     32     35    104
## 6493:     97     45     84     51     48     69     13     48     15
## 6494:     53     32     10     30     36      6     33     64     55
## 6495:     38    123     43    233    115    113    114    193    120
## 6496:    362    108    574    362    333    324    622    340    102
##       wgtp53 wgtp54 wgtp55 wgtp56 wgtp57 wgtp58 wgtp59 wgtp60 wgtp61
##    1:     94    142     24     91     29     84    148     30     93
##    2:    130    463    294    479    391    307    476    283    116
##    3:    185    120    114    113     36    115    103     29    183
##    4:     74    391    276     70    422    409    223    245    269
##    5:    119    125    126     32    112     33    131     45    101
##   ---                                                               
## 6492:    148    179    109    151     89    102    202    140    117
## 6493:     71     51     16     82     79     13     18     21     15
## 6494:     47     34     27     27     33     25     11     13     45
## 6495:     36    144    212    226    122    118    245    127     33
## 6496:    367    531    619    337    362    635    106    336    378
##       wgtp62 wgtp63 wgtp64 wgtp65 wgtp66 wgtp67 wgtp68 wgtp69 wgtp70
##    1:    143     24     88    147    145     91     83     83     86
##    2:    353    323    374    106    236    380    313     90     94
##    3:     35    179    169     95    110     28     34    233     97
##    4:    488    221    250    247    240    415    234    219     66
##    5:    165    125     41    191    195     49    119     92     44
##   ---                                                               
## 6492:     96    244    136     27     39    150    107     52    232
## 6493:     67     55     19     53     14     51     66     71    100
## 6494:     51     41      9     30     50     38     31     49     31
## 6495:    134     33     35    129     38    206    127    116    112
## 6496:    659    554    356    636    110    372    346    354    108
##       wgtp71 wgtp72 wgtp73 wgtp74 wgtp75 wgtp76 wgtp77 wgtp78 wgtp79
##    1:     81     27     93    151     28     79     25    101    157
##    2:    292    401     81    494    346    496    615    286    454
##    3:    123    119    168    107     95    101     30    124    106
##    4:     68    359    385     71    234    421     76     77    242
##    5:    127     36    119    121    116    209     97    176    144
##   ---                                                               
## 6492:    198     88    112     26     64    106    142    106     33
## 6493:     66    101     62     52    105     75     20    127    105
## 6494:      7      8     12     37     44     36     28     33     48
## 6495:    201    123     38    104    186    203    132    118    201
## 6496:    312    558    372    102    108    381    340    114    563
##       wgtp80 agricultureLogical
##    1:    129              FALSE
##    2:    260                 NA
##    3:     31              FALSE
##    4:    231              FALSE
##    5:     38              FALSE
##   ---                          
## 6492:    111                 NA
## 6493:     68              FALSE
## 6494:     59              FALSE
## 6495:    125              FALSE
## 6496:    358                 NA
```

```r
#setkey(DT,agricultureLogical)
head(which(DT$agricultureLogical==TRUE),3)
```

```
## [1] 125 238 262
```
## Question 2


```r
library(jpeg)
imagefile = file.path(getwd(),'image.jpg')
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg",method='curl',destfile = imagefile )
im <- readJPEG(imagefile,native=TRUE)
str(im)
```

```
##  'nativeRaster' int [1:180, 1:180] -11494710 -11494710 -11494710 -11494710 -11494710 -11494710 -11494710 -11494710 -11494710 -11494710 ...
##  - attr(*, "channels")= int 3
```

```r
head(im)
```

```
## [1] -11494710 -11494710 -11494710 -11494710 -11494710 -11494710
```

```r
quantile(im,probs = c(30,80)/100)
```

```
##       30%       80% 
## -15258512 -10575416
```


## Question 3

```r
library(dplyr)
GrossDomesticProductFile = file.path(getwd(),'GrossDomesticProduct.csv')
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",method='curl',destfile = GrossDomesticProductFile)
educationaldataFile = file.path(getwd(),'educationaldata.csv')
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",method='curl',destfile = educationaldataFile)
GDP = read.csv(GrossDomesticProductFile, skip=5, header=FALSE, nrow=231)
colnames(GDP) = c("country","ranking","empty","economy","millions in US dollars",'empty2')
GDP <- GDP[,c('country','ranking','economy','millions in US dollars')]
GDPT <- GDP %>% filter(ranking != '') %>% filter(country != '') ##%>% mutate(ranking=as.integer(ranking))
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
##ED <- ED %>% filter(!grepl('[Ee]uro|Europe|Asia|income|America|Africa',Long.Name))
MDF <- merge(GDPT,ED,by.x='country',by.y='CountryCode')
MDFS <- select(MDF, country,ranking,Long.Name,Income.Group) 
MDFSO <- MDFS  %>% arrange(desc(ranking))
nrow(MDFSO)
```

```
## [1] 189
```

```r
length(unique(MDFSO$country))
```

```
## [1] 189
```

```r
intersect(ED$CountryCode,GDP$country)
```

```
##   [1] "ABW" "ADO" "AFG" "AGO" "ALB" "ARE" "ARG" "ARM" "ASM" "ATG" "AUS"
##  [12] "AUT" "AZE" "BDI" "BEL" "BEN" "BFA" "BGD" "BGR" "BHR" "BHS" "BIH"
##  [23] "BLR" "BLZ" "BMU" "BOL" "BRA" "BRB" "BRN" "BTN" "BWA" "CAF" "CAN"
##  [34] "CHE" "CHI" "CHL" "CHN" "CIV" "CMR" "COG" "COL" "COM" "CPV" "CRI"
##  [45] "CUB" "CYM" "CYP" "CZE" "DEU" "DJI" "DMA" "DNK" "DOM" "DZA" "EAP"
##  [56] "ECA" "ECU" "EGY" "EMU" "ERI" "ESP" "EST" "ETH" "FIN" "FJI" "FRA"
##  [67] "FRO" "FSM" "GAB" "GBR" "GEO" "GHA" "GIN" "GMB" "GNB" "GNQ" "GRC"
##  [78] "GRD" "GRL" "GTM" "GUM" "GUY" "HIC" "HKG" "HND" "HRV" "HTI" "HUN"
##  [89] "IDN" "IMY" "IND" "IRL" "IRN" "IRQ" "ISL" "ISR" "ITA" "JAM" "JOR"
## [100] "JPN" "KAZ" "KEN" "KGZ" "KHM" "KIR" "KNA" "KOR" "KSV" "KWT" "LAC"
## [111] "LAO" "LBN" "LBR" "LBY" "LCA" "LIC" "LIE" "LKA" "LMC" "LMY" "LSO"
## [122] "LTU" "LUX" "LVA" "MAC" "MAR" "MCO" "MDA" "MDG" "MDV" "MEX" "MHL"
## [133] "MIC" "MKD" "MLI" "MLT" "MMR" "MNA" "MNE" "MNG" "MNP" "MOZ" "MRT"
## [144] "MUS" "MWI" "MYS" "NAM" "NCL" "NER" "NGA" "NIC" "NLD" "NOR" "NPL"
## [155] "NZL" "OMN" "PAK" "PAN" "PER" "PHL" "PLW" "PNG" "POL" "PRI" "PRK"
## [166] "PRT" "PRY" "PYF" "QAT" "ROM" "RUS" "RWA" "SAS" "SAU" "SDN" "SEN"
## [177] "SGP" "SLB" "SLE" "SLV" "SMR" "SOM" "SRB" "SSA" "STP" "SUR" "SVK"
## [188] "SVN" "SWE" "SWZ" "SYC" "SYR" "TCA" "TCD" "TGO" "THA" "TJK" "TKM"
## [199] "TMP" "TON" "TTO" "TUN" "TUR" "TUV" "TZA" "UGA" "UKR" "UMC" "URY"
## [210] "USA" "UZB" "VCT" "VEN" "VIR" "VNM" "VUT" "WBG" "WLD" "WSM" "YEM"
## [221] "ZAF" "ZAR" "ZMB" "ZWE"
```

```r
MDFSO$Long.Name[13]
```

```
## [1] St. Kitts and Nevis
## 234 Levels: American Samoa Antigua and Barbuda ... World
```

## Question 4

```r
incomeRankingSummary <- MDFSO %>% group_by(Income.Group) %>% summarize(averageRanking=mean(ranking))
incomeRankingSummary
```

```
## Source: local data frame [5 x 2]
## 
##           Income.Group averageRanking
## 1 High income: nonOECD       91.91304
## 2    High income: OECD       32.96667
## 3  Lower middle income      107.70370
## 4           Low income      133.72973
## 5  Upper middle income       92.13333
```

## Question 5

```r
MDFSOG <- MDFSO %>% mutate(rankingQuantile = cut(ranking,include.lowest = TRUE,breaks = quantile(ranking,probs=seq(0,100,20)/100)))
MDFSOGS <- MDFSOG %>% select(Income.Group,rankingQuantile)
table(MDFSOGS)
```

```
##                       rankingQuantile
## Income.Group           [1,38.6] (38.6,76.2] (76.2,114] (114,152] (152,190]
##                               0           0          0         0         0
##   High income: nonOECD        4           5          8         4         2
##   High income: OECD          18          10          1         1         0
##   Lower middle income         5          13         11         9        16
##   Low income                  0           1          9        16        11
##   Upper middle income        11           9          8         8         9
```

```r
sum(table(MDFSOGS))
```

```
## [1] 189
```

```r
incomeRankingGroupDF<- as.data.frame(table(MDFSOGS))
incomeRankingGroupDF %>% filter(Income.Group == 'Lower middle income' & rankingQuantile == '[1,38.6]')
```

```
##          Income.Group rankingQuantile Freq
## 1 Lower middle income        [1,38.6]    5
```









