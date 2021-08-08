
<!-- README.md is generated from README.Rmd. Please edit that file -->

`FDAopenR` : R package for accessing and manipulating openFDA API.

<!-- badges: start -->

[![Travis build
status](https://app.travis-ci.com/ck2136/FDAopenR.svg?branch=master)](https://travis-ci.com/ck2136/FDAopenR)
[![codecov](https://codecov.io/gh/ck2136/FDAopenR/branch/master/graph/badge.svg?token=PNCASBPWB1)](https://codecov.io/gh/ck2136/FDAopenR)
<!-- badges: end -->

The following functions are implemented:

-   ndcToString: Converting numeric ndc values to appropriate ndc string
    values for open FDA API search
-   listSF: Listing Search Field Parameters
-   extractFDA: Extracts relevant information from the [open FDA
    API](https://open.fda.gov/apis/)

### Installation

``` r
# you'll want to see the vignettes, trust me
library("devtools")
devtools::install_github("ck2136/FDAopenR")
# for now not on CRAN :(
```

### Usage

``` r
library("FDAopenR")
library("dplyr")
## 
## Attaching package: 'dplyr'
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union

# current verison
packageVersion("FDAopenR")
## [1] '0.2.0.9000'

# - - - - - - - - - - - - - - - - - - - - - #
# Instantiate example classes
# - - - - - - - - - - - - - - - - - - - - - #
drug1 <- new(Class="Drug", 
          ndc = 687889736,
          apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
)
## *** FDA Class Inspection *** 
## *** FDA Class Inspection Complete: APIKEYFOUND***
device1 <- new(Class="Device",
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )
## *** FDA Class Inspection *** 
## *** FDA Class Inspection Complete: APIKEYFOUND***
food1 <- new(Class="Food",
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )
## *** FDA Class Inspection *** 
## *** FDA Class Inspection Complete: APIKEYFOUND***
other1 <- new(Class="Other",
               ndc=6382447364,
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )
## *** FDA Class Inspection *** 
## *** FDA Class Inspection Complete: APIKEYFOUND***
```

#### Convert NDC numeric to NDC string

``` r
drug1@ndcquery 
## character(0)
drug1 <- ndcToString(drug1)
drug1@ndcquery
## [1] "68788-9736"
#ndcToString(device1) # this will be an error!
other1 <- ndcToString(other1)
other1 %>% str(max.level=2)
## Formal class 'Other' [package "FDAopenR"] with 13 slots
##   ..@ nsdeTab      :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ ndc          : num 6.38e+09
##   ..@ ndcquery     : chr "63824-4736-4"
##   ..@ url          : chr "https://api.fda.gov/"
##   ..@ apikey       : chr "Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
##   ..@ endpointfront: chr "other"
##   ..@ endpointback : chr "nsde"
##   ..@ searchfield  : chr(0) 
##   ..@ aeTab        :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ prodTab      :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ ndcTab       :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ reTab        :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ dafTab       :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
```

#### Search Field

``` r
listSF(drug1,"event") %>% head
## [1] "authoritynumb"           "companynumb"             "duplicate"               "fulfillexpeditecriteria"
## [5] "occurcountry"            "patient"
listSF(drug1,"label") %>% head
## [1] "abuse"                   "abuse_table"             "accessories"             "accessories_table"      
## [5] "active_ingredient"       "active_ingredient_table"
listSF(drug1,"ndc") %>% head
## [1] "product_id"   "product_ndc"  "spl_id"       "product_type" "finished"     "brand_name"

listSF(device1,"510k") %>% head
## [1] "address_1"                      "address_2"                      "advisory_committee"            
## [4] "advisory_committee_description" "applicant"                      "city"
listSF(device1,"classification") %>% head
## [1] "definition"                "device_class"              "device_name"               "gmp_exempt_flag"          
## [5] "implant_flag"              "life_sustain_support_flag"
listSF(device1,"enforcement") %>% head
## [1] "address_1"                  "address_2"                  "center_classification_date" "city"                      
## [5] "classification"             "code_info"
listSF(device1,"event") %>% head
## [1] "adverse_event_flag"         "date_facility_aware"        "date_manufacturer_received" "date_of_event"             
## [5] "date_received"              "date_report"
listSF(device1,"pma") %>% head
## [1] "advisory_committee"             "advisory_committee_description" "ao_statement"                  
## [4] "applicant"                      "city"                           "date_received"
listSF(device1,"recall") %>% head
## [1] "event_date_initiated"  "event_date_created"    "event_date_posted"     "event_date_terminated"
## [5] "recall_status"         "recalling_firm"
listSF(device1,"registrationlisting") %>% head
## [1] "establishment_type" "k_number"           "pma_number"         "products"           "proprietary_name"  
## [6] "registration"
listSF(device1,"udi") %>% head
## [1] "brand_name"                       "catalog_number"                   "commercial_distribution_end_date"
## [4] "commercial_distribution_status"   "company_name"                     "customer_contacts"

listSF(food1,"enforcement") %>% head
## [1] "address_1"                  "address_2"                  "center_classification_date" "city"                      
## [5] "classification"             "code_info"
listSF(food1,"event") %>% head
## [1] "consumer"     "date_created" "date_started" "outcomes"     "products"     "reactions"

listSF(other1) %>% head
## [1] "package_ndc"                    "package_ndc11"                  "proprietary_name"              
## [4] "dosage_form"                    "marketing_category"             "application_number_or_citation"
```

#### Extract FDA information

``` r
extractFDA(drug1,"event","receivedate:[20040101+TO+20081231]&limit=15")[1:5,1:5]
##   receiptdateformat receiver seriousnessdeath      companynumb receivedateformat
## 1               102       NA                1       JACAN16471               102
## 2               102       NA                1    WAES 97101426               102
## 3               102       NA             <NA> CDN/97/00530/LEX               102
## 4               102       NA             <NA> USA/97/02459/LAS               102
## 5               102       NA             <NA>    1997002193-FJ               102
extractFDA(drug1,"ndc", "finished:true&limit=3")[1:5,1:5] 
##      product_ndc marketing_end_date                  generic_name                     labeler_name
## 1      0409-6139           20220801                         water                    Hospira, Inc.
## 2      71919-080               <NA> ARISTOLOCHIA CYMBIFERA FLOWER  Washington Homeopathic Products
## 3      74028-355               <NA>             Isopropyl Alcohol Creative Consumer Products, Inc.
## NA          <NA>               <NA>                          <NA>                             <NA>
## NA.1        <NA>               <NA>                          <NA>                             <NA>
##                  brand_name
## 1             Sterile Water
## 2    Aristolochia milhomens
## 3     Dionis Hand Sanitizer
## NA                     <NA>
## NA.1                   <NA>

extractFDA(device1,"registrationlisting",'')[1:5,1:5] 
##                 proprietary_name
## 1    Sit-up bed supporter ladder
## NA                          NULL
## NA.1                        NULL
## NA.2                        NULL
## NA.3                        NULL
##                                                                                                                                                                 establishment_type
## 1    Manufacture Medical Device, Manufacture Medical Device for Another Party (Contract Manufacturer), Export Device to the United States But Perform No Other Operation on Device
## NA                                                                                                                                                                            NULL
## NA.1                                                                                                                                                                          NULL
## NA.2                                                                                                                                                                          NULL
## NA.3                                                                                                                                                                          NULL
##      registration.registration_number registration.fei_number registration.status_code
## 1                          3012946064              3012946064                        1
## NA                               <NA>                    <NA>                     <NA>
## NA.1                             <NA>                    <NA>                     <NA>
## NA.2                             <NA>                    <NA>                     <NA>
## NA.3                             <NA>                    <NA>                     <NA>
##      registration.initial_importer_flag registration.reg_expiry_date_year                      registration.name
## 1                                     N                              2021 NINGBO GIBBON SPORTS CULTURE CO., LTD.
## NA                                 <NA>                              <NA>                                   <NA>
## NA.1                               <NA>                              <NA>                                   <NA>
## NA.2                               <NA>                              <NA>                                   <NA>
## NA.3                               <NA>                              <NA>                                   <NA>
##                      registration.address_line_1 registration.address_line_2 registration.city registration.state_code
## 1    1001,1#, SHANGDONG BUSINESS CENTRE, YINZHOU                               Ningbo Zhejiang                        
## NA                                          <NA>                        <NA>              <NA>                    <NA>
## NA.1                                        <NA>                        <NA>              <NA>                    <NA>
## NA.2                                        <NA>                        <NA>              <NA>                    <NA>
## NA.3                                        <NA>                        <NA>              <NA>                    <NA>
##      registration.iso_country_code registration.zip_code registration.postal_code registration.us_agent.name
## 1                               CN                                         315040                 Fanny Zhao
## NA                            <NA>                  <NA>                     <NA>                       <NA>
## NA.1                          <NA>                  <NA>                     <NA>                       <NA>
## NA.2                          <NA>                  <NA>                     <NA>                       <NA>
## NA.3                          <NA>                  <NA>                     <NA>                       <NA>
##      registration.us_agent.business_name registration.us_agent.bus_phone_area_code registration.us_agent.bus_phone_num
## 1               J & F Technology Service                                       909                             5100201
## NA                                  <NA>                                      <NA>                                <NA>
## NA.1                                <NA>                                      <NA>                                <NA>
## NA.2                                <NA>                                      <NA>                                <NA>
## NA.3                                <NA>                                      <NA>                                <NA>
##      registration.us_agent.bus_phone_extn registration.us_agent.fax_area_code registration.us_agent.fax_num
## 1                                                                                                          
## NA                                   <NA>                                <NA>                          <NA>
## NA.1                                 <NA>                                <NA>                          <NA>
## NA.2                                 <NA>                                <NA>                          <NA>
## NA.3                                 <NA>                                <NA>                          <NA>
##      registration.us_agent.email_address registration.us_agent.address_line_1 registration.us_agent.address_line_2
## 1                     info@jf-yiliao.com             19838 Moon Shadow Circle                                     
## NA                                  <NA>                                 <NA>                                 <NA>
## NA.1                                <NA>                                 <NA>                                 <NA>
## NA.2                                <NA>                                 <NA>                                 <NA>
## NA.3                                <NA>                                 <NA>                                 <NA>
##      registration.us_agent.city registration.us_agent.state_code registration.us_agent.iso_country_code
## 1                        Walnut                               CA                                     US
## NA                         <NA>                             <NA>                                   <NA>
## NA.1                       <NA>                             <NA>                                   <NA>
## NA.2                       <NA>                             <NA>                                   <NA>
## NA.3                       <NA>                             <NA>                                   <NA>
##      registration.us_agent.zip_code registration.us_agent.postal_code  registration.owner_operator.firm_name
## 1                             91789                                   NINGBO GIBBON SPORTS CULTURE CO., LTD.
## NA                             <NA>                              <NA>                                   <NA>
## NA.1                           <NA>                              <NA>                                   <NA>
## NA.2                           <NA>                              <NA>                                   <NA>
## NA.3                           <NA>                              <NA>                                   <NA>
##      registration.owner_operator.owner_operator_number registration.owner_operator.official_correspondent.first_name
## 1                                             10053544                                                        Xudong
## NA                                                <NA>                                                          <NA>
## NA.1                                              <NA>                                                          <NA>
## NA.2                                              <NA>                                                          <NA>
## NA.3                                              <NA>                                                          <NA>
##      registration.owner_operator.official_correspondent.middle_initial
## 1                                                                     
## NA                                                                <NA>
## NA.1                                                              <NA>
## NA.2                                                              <NA>
## NA.3                                                              <NA>
##      registration.owner_operator.official_correspondent.last_name
## 1                                                            Feng
## NA                                                           <NA>
## NA.1                                                         <NA>
## NA.2                                                         <NA>
## NA.3                                                         <NA>
##      registration.owner_operator.official_correspondent.subaccount_company_name
## 1                                                                              
## NA                                                                         <NA>
## NA.1                                                                       <NA>
## NA.2                                                                       <NA>
## NA.3                                                                       <NA>
##      registration.owner_operator.official_correspondent.phone_number
## 1                                                  86-574-83031127-x
## NA                                                              <NA>
## NA.1                                                            <NA>
## NA.2                                                            <NA>
## NA.3                                                            <NA>
##      registration.owner_operator.contact_address.address_1 registration.owner_operator.contact_address.address_2
## 1              1001,1#, SHANGDONG BUSINESS CENTRE, YINZHOU                                                      
## NA                                                    <NA>                                                  <NA>
## NA.1                                                  <NA>                                                  <NA>
## NA.2                                                  <NA>                                                  <NA>
## NA.3                                                  <NA>                                                  <NA>
##      registration.owner_operator.contact_address.city registration.owner_operator.contact_address.state_code
## 1                                              Ningbo                                                  CN-ZJ
## NA                                               <NA>                                                   <NA>
## NA.1                                             <NA>                                                   <NA>
## NA.2                                             <NA>                                                   <NA>
## NA.3                                             <NA>                                                   <NA>
##      registration.owner_operator.contact_address.state_province
## 1                                                      Zhejiang
## NA                                                         <NA>
## NA.1                                                       <NA>
## NA.2                                                       <NA>
## NA.3                                                       <NA>
##      registration.owner_operator.contact_address.iso_country_code
## 1                                                              CN
## NA                                                           <NA>
## NA.1                                                         <NA>
## NA.2                                                         <NA>
## NA.3                                                         <NA>
##      registration.owner_operator.contact_address.postal_code pma_number k_number
## 1                                                     315040                    
## NA                                                      <NA>       <NA>     <NA>
## NA.1                                                    <NA>       <NA>     <NA>
## NA.2                                                    <NA>       <NA>     <NA>
## NA.3                                                    <NA>       <NA>     <NA>
extractFDA(device1,"udi",'public_version_status:Update')[1:5,1:5] 
##      has_donation_id_number                                       mri_safety record_status is_labeled_as_nrl is_rx
## 1                     false Labeling does not contain MRI Safety Information     Published             false  true
## NA                     <NA>                                             <NA>          <NA>              <NA>  <NA>
## NA.1                   <NA>                                             <NA>          <NA>              <NA>  <NA>
## NA.2                   <NA>                                             <NA>          <NA>              <NA>  <NA>
## NA.3                   <NA>                                             <NA>          <NA>              <NA>  <NA>
extractFDA(device1,"pma",'decision_code:APPR&limit=3')[1:5,1:5] 
##      pma_number supplement_number                      applicant           street_1 street_2
## 1       P090016              S018        MERZ NORTH AMERICA, INC 4133 COURTNEY ROAD SUITE 10
## 2       P810017              S001  ADVANCED MEDICAL OPTICS, INC.    2525 DUPONT DR.         
## 3       P010030              S141 ZOLL MANUFACTURING CORPORATION       121 GAMMA DR         
## NA         <NA>              <NA>                           <NA>               <NA>     <NA>
## NA.1       <NA>              <NA>                           <NA>               <NA>     <NA>

extractFDA(food1, "enforcement", 'report_date:[20040101+TO+20131231]&limit=3')[1:5,1:5] 
##            country    city                      address_1
## 1    United States Medford             2500 S Pacific Hwy
## 2    United States  Newark                   170 Avenue L
## 3    United States  Boston 18 Bunker Hill Industrial Park
## NA            <NA>    <NA>                           <NA>
## NA.1          <NA>    <NA>                           <NA>
##                                                                                             reason_for_recall address_2
## 1    Product received from supplier is being recalled due to the potential to be contaminated with Salmonella          
## 2                                 Products have the potential to be contaminated with Listeria monocytogenes.          
## 3                                       Products contain recalled Gill's Onions due to Listeria monocytogenes          
## NA                                                                                                       <NA>      <NA>
## NA.1                                                                                                     <NA>      <NA>
extractFDA(food1, "event", 'date_created:[20040101+TO+20131231]&limit=5')[1:5,1:5] 
##   report_number                            outcomes date_created
## 1        115666 Patient Visited Healthcare Provider     20090715
## 2        100210 Patient Visited Healthcare Provider     20080207
## 3        112318                       Other Outcome     20090423
## 4        130489                       Other Outcome     20101001
## 5        136173                 Medically Important     20110301
##                                                                                                                                                               reactions
## 1                                                                                                                                                 SWELLING, PHARYNGITIS
## 2 WEIGHT DECREASED, TREMOR, SKIN DISCOLOURATION, PRURITUS, PARAESTHESIA, LOCALISED OEDEMA, EYE IRRITATION, DIARRHOEA, CONVULSION, BURNING SENSATION, ASTHENIA, ALOPECIA
## 3                                                                                           VOMITING, NAUSEA, MALAISE, HAEMATOCHEZIA, DIARRHOEA, CHILLS, ABDOMINAL PAIN
## 4                                      VOMITING, THROAT IRRITATION, SNEEZING, NASOPHARYNGITIS, LETHARGY, FEELING OF BODY TEMPERATURE CHANGE, BODY TEMPERATURE INCREASED
## 5                                                                                                                                   SARCOMA, HEADACHE, FEELING ABNORMAL
##   date_started
## 1           NA
## 2           NA
## 3           NA
## 4           NA
## 5           NA

extractFDA(other1, query='marketing_start_date:[20040101+TO+20131231]&limit=5')[1:5,1:5] 
##                                         proprietary_name application_number_or_citation            product_type
## 1             Isopropyl Rubbing Alcohol With Wintergreen                       part333A          HUMAN OTC DRUG
## 2                        Purell Advanced Refreshing Aloe                       part333E          HUMAN OTC DRUG
## 3 Korres Wild Rose Mineral Foundation Wrmf2 Light Spf 30                        part352          HUMAN OTC DRUG
## 4                                                Jet Lag                           <NA>          HUMAN OTC DRUG
## 5                                             Prednisone                     ANDA085161 HUMAN PRESCRIPTION DRUG
##   marketing_start_date  package_ndc
## 1             20120722 52862-009-12
## 2             20120314 21749-705-89
## 3             20110202 10279-120-10
## 4             20110301 55714-1110-0
## 5             20131120 52125-775-08
```

## Authors

-   [Chong Hoon Kim](mailto:chong.kim@ucdenver.edu)
