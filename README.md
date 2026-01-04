# PacVec Manuscript Data - Newton et al. 2025 
Abstract

Lyme disease, which is caused by the bacterium Borrelia burgdorferi, remains the most prevalent vector-borne disease in the United States. Lyme disease is maintained through an enzootic cycle of pathogen transmission exchanged between infected reservoir hosts and questing tick vectors. Reservoir host targeted strategies have recently been examined for their ability to disrupt the enzootic transmission cycle of Lyme disease within natural environments. Currently, there have been no studies in the western U.S. examining the effect of permethrin and deltamethrin-based topical acaricides targeting multiple reservoir host species over continuous years of treatment application. We evaluated reservoir targeted topical acaricide treatments in California to examine their impact on attached larval Ixodes pacificus ticks and the density of questing nymphal I. pacificus ticks in the year following application. Modified bait stations were applied with topical acaricides to treat reservoir host species throughout peak tick questing activity. Topical acaricide treatments including permethrin and deltamethrin were tested on three sets of paired, replicate plots. Our results show that larval I. pacificus tick burdens decreased significantly on all reservoir hosts present at acaricide treated plots compared to control plots. In addition, the density of questing nymphal I. pacificus was significantly lower at acaricide treated plots compared to control plots in the year following treatment introduction. This suggests that in the western U.S. host-targeted, topical acaricide treatments are a highly effective strategy for reducing reservoir-attached ticks as well as the abundance of questing nymphal ticks.

Description of data and file structure - 
  "Newton_Manuscript_1" R script in .R format to be used in R or RStudio. Script includes all necessary packages and instructions to set up analysis of host    larval Ixodes pacificus burdens and questing nymphal I. pacificus density modeling. Code for comparing the total abundance of captured host species by        treatment type are included. 

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
All analyses were run in R v.4.3.1 and implemented the packages "ggplot", "ggpattern", and "glmmTMB" to generate figures and to evaluate treatment effect on host burdens and questing nymphal density.
  



