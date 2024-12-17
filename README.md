# PacVec-Data-Analysis
PacVec Project Data Analysis: Includes years 2023 and 2024

Description of data and file structure - 
  "Newton_Manuscript_1" R script in .R format to be used in R or RStudio. Script includes all necessary packages and instructions are included to set up analysis for tick burden and density modeling. Code for running number of captured host species by treatment type comparison is included. 

Source Code:
"Newton_Manuscript_1"

Packages used - 
  "ggplot2", "ggpattern", "glmmTMB"

Burden_DATA_Master.csv
  Headers -
    Area: Name of park, regional open space, or general location where data was collected
    County: Name of county where data was collected 
    Site: Name of individual plot where data was collected from. Name of Plot is Area name followed by treatment type abbreviated. Secondary control plots        are followed by a 2. ex. San Pedro Acaricide (SPA), San Pedro Control (SPC), San Pedro secondary control (SPC2)
    Animal ID: 4-digit unique indentifier for each captured animal 
    Species: Abbreviation of animal species scientific name ex. Neotoma fuscipes (NEFU)
    Burden: Number of larval Ixodes pacificus tick burdens on captured animal 
    Treatment: Describes if animal was captured from acaricide or control plot
    Type: Describes if animal was captured from acaricide (deltamethrin, permethrin) or control plot
    Year: Year animal was captured 

Questing_Ticks_Master.csv
  Headers -
    Area: Name of park, regional open space, or general location where data was collected
    County: Name of county where data was collected 
    Site: Name of individual plot where data was collected from. Name of Plot is Area name followed by treatment type abbreviated. Secondary control plots        are followed by a 2. ex. San Pedro Acaricide (SPA), San Pedro Control (SPC), San Pedro secondary control (SPC2)
    Animal ID: 4-digit unique indentifier for each captured animal 
    Species: Abbreviation of animal species scientific name ex. Neotoma fuscipes (NEFU)
    Stage: Life stage of individual tick abbreviation ex. Larvae (L), Nymph (N), Adult (A)
    Year: Year tick was collected
    Treatment: Describes if tick was collected from acaricide or control plot
    Type: Describes if tick was collected from acaricide (deltamethrin, permethrin) or control plot
    

Code/Software - 
All analyses were run in R v.4.0.4
  



