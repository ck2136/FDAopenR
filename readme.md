# FDAopenR

## Introduction

The purpose of the this R package is to provide a set of functions to make it easy to navigate, access, and extract data from the [openFDA API](https://open.fda.gov/apis/). There are multiple end-points that can be reached. Namely:

- Drug
- Device
- Food
- and Other (NDC SPL Data Elements File!?)

## How to Install

Those that have R (>= 3.5.0) should be able to do as such:

```
library(devtools)
devtools::install_github("ck2136/FDAopenR")
```

## How to Use

I'll make the vignette soon but here is how you would run a query to get an ndc code # of 68788-9736


```
res <- find_drug(
    src = 'fda',
    ndc = 687889736
)

```

## Authors

* [Chong Hoon Kim](mailto:chong.kim@ucdenver.edu)
