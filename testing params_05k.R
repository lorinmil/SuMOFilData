
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
  ,ntranscriptNoise= 5000
  ,ng= 10
  ,ngPrime= 100
  ,nh= 30
  ,ngeneNoise= 5000
  ,noiseSD= 0.5
  ,numClusters_1= 3
  ,numClusters_2= 3
  ,startSim=398
  ,numSims= 500
  ,outLoc='E:/UB Masters Project/Simulation Results/lowSig_500sims_05k/out_files'
)




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
  ,ntranscriptNoise= 5000
  ,ng= 10
  ,ngPrime= 100
  ,nh= 30
  ,ngeneNoise= 5000
  ,noiseSD= 1
  ,numClusters_1= 3
  ,numClusters_2= 3
  ,startSim = 197
  ,numSims= 500
  ,outLoc='E:/UB Masters Project/Simulation Results/medSig_500sims_05k/out_files'
)



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
  ,ntranscriptNoise= 5000
  ,ng= 10
  ,ngPrime= 100
  ,nh= 30
  ,ngeneNoise= 5000
  ,noiseSD= 2
  ,numClusters_1= 3
  ,numClusters_2= 3
  ,startSim = 220
  ,numSims= 500
  ,outLoc='E:/UB Masters Project/Simulation Results/highSig_500sims_05k/out_files'
)
