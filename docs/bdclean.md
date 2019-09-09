# bdclean {#bdclean}

## What is bddwc

`bdclean` is a user-friendly data cleaning Shiny app for the inexperienced R user. It provides features to manage complete workflow for biodiversity data cleaning, from uploading the data; collecting user input - in order to adjust cleaning procedures; cleaning the data; and finally, generating various reports and several versions of the data.

![bdclean in the bdverse](images/bdclean_bdverse.png "bdclean-bdverse")

![The main idea behind bdclean](images/bdclean_overview.png "bdclean-overview")

**<span style="color:red">--> To replace with new bdclean overview <--</span>**

bdclean workflow is comprised of three distinct mechanisms, user input, data cleaning and outputs. In most R packages this basic workflow (i.e. input; processing; output) operates via an R function. Functions are fundamental building blocks of R, and usually focus on very specific task. Users must understand and supply the function with its mandatory arguments (e.g. data in the specified format, setting of various function variables). Thus, in order to create a specific workflow, users must write an R script, which requires reasonable programing skills. bdclean avoids all that by creating a user-friendly Shiny app with questionnaire that collects the necessary user input.

## App overview

![bdclean overview](images/bdclean_app_overview.png "bdclean-overview")

### Data cleaning configuration

#### Option 1: a questionnaire {-}

![Data cleaning questionnaire](images/bdclean_questionnaire-empty.png "bdclean-questionnaire-empty")

The questionnaire is reactive and more questions will be shown based on your input. 

![Filling the questionnaire](images/bdclean_questionnaire-full.png "bdclean-questionnaire-full")


#### Option 2: choose data checks {-}

![Choose your data checks](images/bdclean_data-checks.png "bdclean-ddata-checks")

### Flaging and cleaning


#### Data flags {-}

![View flags](images/bdclean_flag.png "bdclean-download-data")



## Perform cleaning

![Perform the cleaning](images/bdclean_clean.png "bdclean-download-data")

### Artifacts and reports


**<span style="color:red">[ TBA ]</span>**









