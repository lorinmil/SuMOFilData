#PURPOSE: Generates the simulations and performs SuMO-Fil on simulations with approximately 5k features each

#---Weak Signal-----#
source('./function_setpar.R')
source('./function_calsigma.R')
source('./function_genobs.R')
source('./function_genlat.R')
source('./function_gen_eff_obs_V2.R')
source('./Pathway Analysis.R')
source('./Final Simulations.R')
finalSims(
  alpha= 0.35
  ,Rsq= 0.35
  ,nsample= 1000
  ,rind= 0.35
  ,nx= 15
  ,nxPrime= 100
  ,ns= 50
  ,ntranscriptNoise= 5000
  ,ng= 10
  ,ngPrime= 100
  ,nh= 30
  ,ngeneNoise= 5000
  ,noiseSD= 0.5
  ,numClusters_1= 3
  ,numClusters_2= 3
  ,startSim=1
  ,numSims= 500
  ,outLoc='FILE PATH TO SAVE OUTPUTS'
)




#---Moderate Signal-----#
source('./function_setpar.R')
source('./function_calsigma.R')
source('./function_genobs.R')
source('./function_genlat.R')
source('./function_gen_eff_obs_V2.R')
source('./Pathway Analysis.R')
source('./Final Simulations.R')
finalSims(
  alpha= 0.35
  ,Rsq= 0.85
  ,nsample= 1000
  ,rind= 0.35
  ,nx= 15
  ,nxPrime= 100
  ,ns= 50
  ,ntranscriptNoise= 5000
  ,ng= 10
  ,ngPrime= 100
  ,nh= 30
  ,ngeneNoise= 5000
  ,noiseSD= 1
  ,numClusters_1= 3
  ,numClusters_2= 3
  ,startSim = 1
  ,numSims= 500
  ,outLoc='FILE PATH TO SAVE OUTPUTS'
)



#---Strong Signal-----#
source('./function_setpar.R')
source('./function_calsigma.R')
source('./function_genobs.R')
source('./function_genlat.R')
source('./function_gen_eff_obs_V2.R')
source('./Pathway Analysis.R')
source('./Final Simulations.R')
finalSims(
  alpha= 0.35
  ,Rsq= 0.85
  ,nsample= 1000
  ,rind= 0.85
  ,nx= 15
  ,nxPrime= 100
  ,ns= 50
  ,ntranscriptNoise= 5000
  ,ng= 10
  ,ngPrime= 100
  ,nh= 30
  ,ngeneNoise= 5000
  ,noiseSD= 2
  ,numClusters_1= 3
  ,numClusters_2= 3
  ,startSim = 1
  ,numSims= 500
  ,outLoc='FILE PATH TO SAVE OUTPUTS'
)
