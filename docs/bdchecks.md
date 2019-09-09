# bdchecks {#bdchecks}

## What is bdchecks

`bdchecks` supplies a Shiny app and a set of functions to perform and manage various data checks for biodiversity data.

![bdchecks in the bdverse](images/bdchecks_bdverse.png "bdchecks-bdverse")
**<span style="color:red">--> To replace with new bdchecks overview <--</span>**

#### What are biodiversity data checks? {-}

Data checks can include format checks, completeness checks, reasonableness checks, limit checks, etc. These processes usually result in flagging, documenting, and subsequent correcting or eliminating of suspect records. The checks must be specifically tailored around the structure of the data at hand, in our case, the Darwin Core standard. Ideally, a data check needs to hold its functionality and relevant metadata.

#### What `bdchecks` can do for you? {-}

`bdchecks` offers various features for various R users:

* Using the Shiny app **inexperienced R users** can easily perform all data check and can easily filter the data accordingly. See [The shiny app] section.
* **Experienced R users** can perform all data checks by utilizing few R functions form the command line or within an R script. See [Command line operations] section.
* **Advanced R users** can even edit, add and manage their own collection of data checks, quite easily so. See [Data checks infrastructure section](#). 

## Shiny app

### Data upload and download

As in`bddwc`: [data upload](#dataupload), [data download](#datadownload).

### Choose data checks

![Choose a data check by checking its box ](images/bdchecks_choose_DC.png "bdchecks-app data-choose-DC")
**<span style="color:red">--> To replace with the new app <--</span>**

![Hovering over a data check name shows a short description](images/bdchecks_hover.png "bdchecks-app DC_hover")
**<span style="color:red">--> To replace with the new app <--</span>**


### Checks results and data filtering

### Overwiew {-}

![Results page overview](images/bdchecks_DC_results_overview.png "bdchecks-app results_overview")

**<span style="color:red">--> To replace with the new app <--</span>**

### Filtering the data based on the results {-}

![Choose specific results to filter out](images/bdchecks_filtering_table.png "bdchecks-app results_filter")

**<span style="color:red">--> To replace with the new app <--</span>**

![Filter the data and download your filtered data](images/bdchecks_filtering_action.png "bdchecks-app filter-action")

**<span style="color:red">--> To replace with the new app <--</span>**

### Closing the app
Just close the app browser tab, and the R session will be terminated. To reopen it run in the R Console `runbdchecks()`.


## Command line operations

**<span style="color:red">--> To synchronize functions with the new version!!!! <--</span>**

## Load package
Load the `bdchecks` package
```r
    library(bdchecks)
```

## Perform data checks

`bdchecks` contains a dataset on bats named `dataBats`.

To perform all data checks use `performDataCheck`:
```r
resultDC <- bdchecks::performDataCheck(bdchecks::dataBats)
```
replace `bdchecks::dataBats` with your own dataset name.


## Review performed checks

See which data checks were performed:
```r
resultDC
```

Review data checks result (% of records that passed, failed or have missing data)
```r
# Nice summary
summary_DC(resultDC)
```
### Filtering your data 
**<span style="color:red">[ TBA ]</span>**

## Data checks infrastructure
**<span style="color:red">[Write short explanation + give a link to the relevant section in the developer-guide]</span>**

### Data checks YAML file

**<span style="color:red">[Move section to dev-guide; add Shiny management app; explain unit testing framework + synchronization system]</span>**

The YMAL file holds the code and metadata of all data checks. The checks are derived from a core suite of tests and assertions being developed by <a href="https://www.tdwg.org/" target="_blank">TDWG</a>'s <a href="https://www.tdwg.org/community/bdq/" target="_blank">Biodiversity Data Quality</a> **<a href="https://www.tdwg.org/community/bdq/tg-2/" target="_blank">Task Group 2 ( Data Quality Tests and Assertions)</a>**. More information and links can be found in the [Learn more] section.

### Data check example 
```ymal
DC_b23110e7-1be7-444a-a677-cdee0cf4330c:
  name: countryMismatch
  meta:
    Description:
      Main: Check if given country match given country code.
      InputQuestion: Does country and country code match?
      Example:
        Fail: Country name (dwc:country) and ISO country code (dwc:countryCode) do
          not match
        Pass: Country name (dwc:country) and ISO country code (dwc:countryCode) match
        InputFail: country=Australia, countryCode=4
        InputPass: country=Australia, countryCode=AU
        OutputFail: Failed
        OutputPass: Passed
      Resolution:
        Record: SingleRecord
        Term: MultiTerm
      DarwinCoreClass: Location
      Keywords: location,iso,country
      guid: b23110e7-1be7-444a-a677-cdee0cf4330c
    Flags:
      Severity: Warning
      Warning: Inconsistent
      Output: Validation
      Dimension: Consistency
    Pseudocode: |
      get.Country($countryCode) == $country
    Source:
      Reference:
      CreatedBy: Povilas Gibas
      MaintainedBy: Povilas Gibas
      CreationDate: 2018-06-27
      ModificationDate: 2018-06-27
      ModificationHist:
  Input:
    Target: country,countryCode
    Dependency:
      DependencyType: Internal
      DataChecks:
      Rpackages: rgbif 
      Data: isocodes$name,isocodes$code
  Functionality: |
      FUNC <- function() {
          result <- sapply(seq_along(TARGET1), function(i) {
              if (is.na(TARGET1[i]) | is.na(TARGET2[i])) {
                  NA
              } else {
                  which(DEPEND1 == TARGET1[i]) == which(DEPEND2 == TARGET2[i])
              }
          })
          result <- unlist(result)
          return(result)
       }
```
**<span style="color:red"> To replace with the new structure!!! </span>**

### Manage your own data checks

**<span style="color:red"> To encourage or not to encourage mmm... </span>**

After adding/ removing/ editing the YAML file, you can load data checks into R using `getDC()` function. 
```r
DC <- getDC("path to your YAML file")
```

You can also export data checks from your YAML file to .rda and roxygen2 comments.
```r
exportDC("path to your YAML file")
```
