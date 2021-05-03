# alpha= 0.35
# Rsq= 0.85
# nsample= 500
# rind= 0.35
# nx= 75
# nxPrime= 75
# ns= 75
# ntranscriptNoise= 75
# ng= 50
# ngPrime= 49
# nh= 49
# ngeneNoise= 52
# noiseSD= 1
# numClusters_1= 5
# numClusters_2= 5
# numSims= 5

# Sys.setenv(RSTUDIO_PANDOC='')

#--------
# rmarkdown::render("C:/Users/GCE Employee/Desktop/UB Masters project/R Markdown results/Simulation Tests v5.Rmd"
#                   ,params = list(
#                     alpha= 0.35
#                     ,Rsq= 0.85
#                     ,nsample= 500
#                     ,rind= 0.35
#                     ,nx= 15
#                     ,nxPrime= 95
#                     ,ns= 95
#                     ,ntranscriptNoise= 500
#                     ,ng= 10
#                     ,ngPrime= 63
#                     ,nh= 63
#                     ,ngeneNoise= 500
#                     ,noiseSD= 1
#                     ,numClusters_1= 5
#                     ,numClusters_2= 5
#                     ,numSims= 5
#                     ,outputLoc = 'C:/Users/GCE Employee/Desktop/UB Masters project/Simulation Results/'
#                     ,outputFile = 'Test 2.rda'
#                     )
#                   ,output_dir='C:/Users/GCE Employee/Desktop/UB Masters project/Simulation Results'
#                   ,output_file='Test 2.pdf'
# )




#---Small Signal-----
source('C:/Users/lorin/Desktop/UB Masters project/function_setpar.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_calsigma.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_genobs.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_genlat.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_gen_eff_obs_V2.R')
source('C:/Users/lorin/Desktop/UB Masters project/Pathway Analysis.R')
source('C:/Users/lorin/Desktop/UB Masters project/Final Simulations.R')
finalSims(
  alpha= 0.35
  ,Rsq= 0.35
  ,nsample= 1000
  ,rind= 0.35
  ,nx= 15
  ,nxPrime= 100
  ,ns= 50
  ,ntranscriptNoise= 25000
  ,ng= 10
  ,ngPrime= 100
  ,nh= 30
  ,ngeneNoise= 20000
  ,noiseSD= 0.5
  ,numClusters_1= 3
  ,numClusters_2= 3
  ,startSim=282
  ,numSims= 500
  ,outLoc='E:/UB Masters Project/Simulation Results/lowSig_1000sims/out_files'
)
# rmarkdown::render("C:/Users/lorin/Desktop/UB Masters Project/R Markdown results/Simulation Tests v5.Rmd"
#                   ,params = list(
#                     alpha= 0.35
#                     ,Rsq= 0.35
#                     ,nsample= 1000
#                     ,rind= 0.35
#                     ,nx= 15
#                     ,nxPrime= 100
#                     ,ns= 50
#                     ,ntranscriptNoise= 25000
#                     ,ng= 10
#                     ,ngPrime= 100
#                     ,nh= 30
#                     ,ngeneNoise= 20000
#                     ,noiseSD= 0.5
#                     ,numClusters_1= 3
#                     ,numClusters_2= 3
#                     ,numSims= 500
#                     ,outputLoc= 'C:/Users/lorin/Desktop/UB Masters Project/Simulation Results/lowSig_1000sims/'
#                     ,outputFile= 'lowSig_1000sims.rda'
#                   )
#                   ,output_dir='C:/Users/lorin/Desktop/UB Masters Project/Simulation Results/lowSig_1000sims'
#                   ,output_file='lowSig_1000sims.pdf'
# )
# rmarkdown::render("C:/Users/GCE Employee/Desktop/UB Masters project/R Markdown results/Simulation Tests_read_sim_v3.Rmd"
#                   ,params = list(
#                     alpha= 0.35
#                     ,Rsq= 0.35
#                     ,nsample= 1000
#                     ,rind= 0.35
#                     ,nx= 15
#                     ,nxPrime= 100
#                     ,ns= 50
#                     ,ntranscriptNoise= 25000
#                     ,ng= 10
#                     ,ngPrime= 100
#                     ,nh= 30
#                     ,ngeneNoise= 20000
#                     ,noiseSD= 0.5
#                     ,numClusters_1= 3
#                     ,numClusters_2= 3
#                     ,numSims= 500
#                     ,outputLoc= 'C:/Users/lorin/Desktop/UB Masters Project/Simulation Results/lowSig_1000sims/'
#                     ,outputFile= 'lowSig_1000sims.rda'
#                   )
#                   ,output_dir='C:/Users/lorin/Desktop/UB Masters Project/Simulation Results/lowSig_1000sims'
#                   ,output_file='lowSig_1000sims.pdf'
# )




#---Medium Signal-----
source('C:/Users/lorin/Desktop/UB Masters project/function_setpar.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_calsigma.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_genobs.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_genlat.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_gen_eff_obs_V2.R')
source('C:/Users/lorin/Desktop/UB Masters project/Pathway Analysis.R')
source('C:/Users/lorin/Desktop/UB Masters project/Final Simulations.R')
finalSims(
  alpha= 0.35
  ,Rsq= 0.85
  ,nsample= 1000
  ,rind= 0.35
  ,nx= 15
  ,nxPrime= 100
  ,ns= 50
  ,ntranscriptNoise= 25000
  ,ng= 10
  ,ngPrime= 100
  ,nh= 30
  ,ngeneNoise= 20000
  ,noiseSD= 1
  ,numClusters_1= 3
  ,numClusters_2= 3
  ,startSim = 267
  ,numSims= 500
  ,outLoc='E:/UB Masters Project/Simulation Results/medSig_500sims/out_files'
)
# rmarkdown::render("C:/Users/GCE Employee/Desktop/UB Masters project/R Markdown results/Simulation Tests v5.Rmd"
#                   ,params = list(
#                     alpha= 0.35
#                     ,Rsq= 0.85
#                     ,nsample= 1000
#                     ,rind= 0.35
#                     ,nx= 15
#                     ,nxPrime= 100
#                     ,ns= 50
#                     ,ntranscriptNoise= 25000
#                     ,ng= 10
#                     ,ngPrime= 100
#                     ,nh= 30
#                     ,ngeneNoise= 20000
#                     ,noiseSD= 1
#                     ,numClusters_1= 3
#                     ,numClusters_2= 3
#                     ,numSims= 5
#                     ,outputLoc= 'C:/Users/GCE Employee/Desktop/UB Masters project/Simulation Results/medium size_3clusts/'
#                     ,outputFile= 'Medium Signal both_data.rda'
#                   )
#                   ,output_dir='C:/Users/GCE Employee/Desktop/UB Masters project/Simulation Results'
#                   ,output_file='Medium Signal both.pdf'
# )
# rmarkdown::render("C:/Users/GCE Employee/Desktop/UB Masters project/R Markdown results/Simulation Tests_read_sim_v3.Rmd"
#                   ,params = list(
#                     alpha= 0.35
#                     ,Rsq= 0.85
#                     ,nsample= 1000
#                     ,rind= 0.35
#                     ,nx= 15
#                     ,nxPrime= 100
#                     ,ns= 50
#                     ,ntranscriptNoise= 25000
#                     ,ng= 10
#                     ,ngPrime= 100
#                     ,nh= 30
#                     ,ngeneNoise= 20000
#                     ,noiseSD= 1
#                     ,numClusters_1= 3
#                     ,numClusters_2= 3
#                     ,numSims= 5
#                     ,outputLoc= 'C:/Users/GCE Employee/Desktop/UB Masters project/Simulation Results/medium size_3clusts/'
#                     ,outputFile= 'Medium Signal both_data.rda'
#                   )
#                   ,output_dir='C:/Users/GCE Employee/Desktop/UB Masters project/Simulation Results'
#                   ,output_file='Medium Signal both.pdf'
# )



#---High Signal-----
source('C:/Users/lorin/Desktop/UB Masters project/function_setpar.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_calsigma.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_genobs.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_genlat.R')
source('C:/Users/lorin/Desktop/UB Masters project/function_gen_eff_obs_V2.R')
source('C:/Users/lorin/Desktop/UB Masters project/Pathway Analysis.R')
source('C:/Users/lorin/Desktop/UB Masters project/Final Simulations.R')
finalSims(
  alpha= 0.35
  ,Rsq= 0.85
  ,nsample= 1000
  ,rind= 0.85
  ,nx= 15
  ,nxPrime= 100
  ,ns= 50
  ,ntranscriptNoise= 25000
  ,ng= 10
  ,ngPrime= 100
  ,nh= 30
  ,ngeneNoise= 20000
  ,noiseSD= 2
  ,numClusters_1= 3
  ,numClusters_2= 3
  ,startSim = 422
  ,numSims= 500
  ,outLoc='E:/UB Masters Project/Simulation Results/highSig_500sims_20k/out_files'
)
# rmarkdown::render("C:/Users/GCE Employee/Desktop/UB Masters project/R Markdown results/Simulation Tests v5.Rmd"
#                   ,params = list(
#                     alpha= 0.35
#                     ,Rsq= 0.85
#                     ,nsample= 500
#                     ,rind= 0.85
#                     ,nx= 15
#                     ,nxPrime= 100
#                     ,ns= 50
#                     ,ntranscriptNoise= 25000
#                     ,ng= 10
#                     ,ngPrime= 100
#                     ,nh= 30
#                     ,ngeneNoise= 20000
#                     ,noiseSD= 2
#                     ,numClusters_1= 3
#                     ,numClusters_2= 3
#                     ,numSims= 5
#                     ,outputLoc= 'C:/Users/GCE Employee/Desktop/UB Masters project/Simulation Results/'
#                     ,outputFile= 'High Signal both_data.rda'
#                   )
#                   ,output_dir='C:/Users/GCE Employee/Desktop/UB Masters project/Simulation Results'
#                   ,output_file='High Signal both.pdf'
# )
# rmarkdown::render("C:/Users/GCE Employee/Desktop/UB Masters project/R Markdown results/Simulation Tests_read_sim_v3.Rmd"
#                   ,params = list(
#                     alpha= 0.35
#                     ,Rsq= 0.85
#                     ,nsample= 500
#                     ,rind= 0.85
#                     ,nx= 15
#                     ,nxPrime= 100
#                     ,ns= 50
#                     ,ntranscriptNoise= 25000
#                     ,ng= 10
#                     ,ngPrime= 100
#                     ,nh= 30
#                     ,ngeneNoise= 20000
#                     ,noiseSD= 2
#                     ,numClusters_1= 3
#                     ,numClusters_2= 3
#                     ,numSims= 5
#                     ,outputLoc= 'C:/Users/GCE Employee/Desktop/UB Masters project/Simulation Results/medium size_3clusts/'
#                     ,outputFile= 'High Signal both_data.rda'
#                   )
#                   ,output_dir='C:/Users/GCE Employee/Desktop/UB Masters project/Simulation Results'
#                   ,output_file='High Signal both.pdf'
# )