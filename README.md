# Introduction

This respository contains R code to produce simulated data similarly performed in https://doi.org/10.1101/2020.03.12.985077. In summary, each simulation produces two data matrices, G and X, which have the same number of rows with differing variable sets. There are a subset of features within each dataset that relate to each other. Additionally, the simulations produce an outcome vector y of length matching the number of rows in G and X. There is an even further subset of features within G and X that relate to each other AND the outcome y.

This code also performs the filtering method proposed in https://doi.org/10.1101/2020.03.12.985077 on each of the simulations.

# How to Conduct Simulations

The Sims_05k.R file contains the code to replicate the simulations with the smallest number of features under strong, moderate, and weak network signal strength. Similarly for Sims_10k.R and Sims_20k.R which produce simulations with approximately 10k and 20k feature simulations.

The functions called in Sims_05k.R, Sims_10k.R, and Sims_20k.R source functions found in /SupportingFunctions/. Each simulation produces an output RDA file in the corresponding output location (NOTE, please update the outLoc input to the specified folder), and the output file will be named out_1.rda for the first simulation, out_2.rda for the second, and so on.

To access the simulated data, execute the code (for example, suppose the first simulation),

```{r}
  #Import the data
  outLoc <- "FILE PATH WITH OUTPUTS"
  sim <- readRDS(paste0(outLoc, "/out_1.rda")
  
  #Pull out the simulated datasets and outcome vector
  X <- sim$simVals$x
  G <- sim$simVals$g
  y <- sim$simVals$y
```

Note that the nx and ng inputs in the functions from Sims_05k.R, Sims_10k.R, and Sims_20k.R refer to the number of network features that belong in X and G. Thus, the first nx features in X and the first ng features in G correspond to the features within X and G that relate to each other AND the outcome y.
