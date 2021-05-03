finalSims <- function(
  alpha
  ,Rsq
  ,nsample
  ,rind
  ,nx
  ,nxPrime
  ,ns
  ,ntranscriptNoise
  ,ng
  ,ngPrime
  ,nh
  ,ngeneNoise
  ,noiseSD
  ,numClusters_1   #Number of clusters for kmeans in step 1
  ,numClusters_2   #Number of clusters for kmeans in step 2
  ,startSim = 1 #Where to start the simulation files
  ,numSims         #Number of simulations to perform
  ,outLoc
){
  
  
  #Initialize vectors
  corXY <- c()
  indicatorX <- c()
  geneX <- c()
  corGY <- c()
  indicatorG <- c()
  geneG <- c()
  removeX_1 <- c()
  removeG_1 <- c()
  xSums <- c()
  gSums <- c()
  removeX_2 <- c()
  removeG_2 <- c()
  numRemovedX_1 <- c()
  numRemovedG_1 <- c()
  numRemovedX_2 <- c()
  numRemovedG_2 <- c()
  removeX_both <- c()
  removeG_both <- c()
  removePathX <- c()
  removePathG <- c()
  removedTotX <- c()
  removedTotG <- c()
  sparseCheck_after <- c()
  simVals <- list()
  
  #Perform the same simulation many times over
  for(i in startSim:numSims){
    cat(paste('Simulation ', i,'...'))
    analysis <- PathwayAnalysis(alpha            = alpha,
                                Rsq              = Rsq,
                                nsample          = nsample,
                                rind             = rind,
                                nx               = nx,
                                nxPrime          = nxPrime,
                                ns               = ns,
                                ntranscriptNoise = ntranscriptNoise,
                                ng               = ng,
                                ngPrime          = ngPrime,
                                nh               = nh,
                                ngeneNoise       = ngeneNoise,
                                noiseSD          = noiseSD,
                                numClusters_1    = numClusters_1,
                                numClusters_2    = numClusters_2
    )
    #Add to the vectors
    # corXY <- c(corXY, analysis$corXY)
    corXY <- analysis$corXY
    # indicatorXi <- analysis$indicatorX
    # indicatorX <- c(indicatorX, indicatorXi)
    indicatorX <- analysis$indicatorX
    # geneXi <- colnames(analysis$x)
    # geneX <- c(geneX, geneXi)
    geneX <- colnames(analysis$x)
    # corGY <- c(corGY, analysis$corGY)
    corGY <- analysis$corGY
    # indicatorGi <- analysis$indicatorG
    # indicatorG <- c(indicatorG, indicatorGi)
    indicatorG <- analysis$indicatorG
    # geneGi <- colnames(analysis$g)
    # geneG <- c(geneG, geneGi)
    geneG <- colnames(analysis$g)
    # xSums <- c(xSums, analysis$xSums)
    # gSums <- c(gSums, analysis$gSums)
    xSums <- analysis$xSums
    gSums <- analysis$gSums
    #Indicators of removal from step 1
    # removeX_bothi <- rep('Keep', length(analysis$xSums))
    # if(length(analysis$removeX_both)>0) removeX_bothi[analysis$removeX_both] <- 'Remove'
    # removeX_both <- c(removeX_both, removeX_bothi)
    removeX_both <- rep('Keep', length(analysis$xSums))
    if(length(analysis$removeX_both)>0) removeX_both[analysis$removeX_both] <- 'Remove'
    # removeG_bothi <- rep('Keep', length(analysis$gSums))
    # if(length(analysis$removeG_both)>0) removeG_bothi[analysis$removeG_both] <- 'Remove'
    # removeG_both <- c(removeG_both, removeG_bothi)
    removeG_both <- rep('Keep', length(analysis$gSums))
    if(length(analysis$removeG_both)>0) removeG_both[analysis$removeG_both] <- 'Remove'
    #How many removed from X and G
    # removePathX <- c(removePathX, sum(removeX_bothi=='Remove' & indicatorXi=='pathway'))
    # removePathG <- c(removePathG, sum(removeG_bothi=='Remove' & indicatorGi=='pathway'))
    # removedTotX <- c(removedTotX, length(analysis$removeX_both))
    # removedTotG <- c(removedTotG, length(analysis$removeG_both))
    removePathX <- sum(removeX_both=='Remove' & indicatorX=='pathway')
    removePathG <- sum(removeG_both=='Remove' & indicatorG=='pathway')
    removedTotX <- length(analysis$removeX_both)
    removedTotG <- length(analysis$removeG_both)
    #Sparsity check
    # sparseCheck_after <- c(sparseCheck_after, 
    #                        (nx+nxPrime+ns+ntranscriptNoise+ng+ngPrime+nh+ngeneNoise
    #                         -removedTotX[i]-removedTotG[i])/
    #                          log(nx+ng)
    # )
    sparseCheck_after <- (nx+nxPrime+ns+ntranscriptNoise+ng+ngPrime+nh+ngeneNoise
                            -removedTotX-removedTotG
                          )/log(nx+ng)
    #Add send back all the values
    # simVals[[i]] <- list('x'=analysis$x, 'g'=analysis$g, 'y'=analysis$y)
    simVals <- list('x'=analysis$x, 'g'=analysis$g, 'y'=analysis$y)
    saveVals <- list('corXY'=corXY
                     ,'indicatorX'=indicatorX
                     ,'geneX'=geneX
                     ,'corGY'=corGY
                     ,'indicatorG'=indicatorG
                     ,'geneG'=geneG
                     ,'xSums'=xSums
                     ,'gSums'=gSums
                     ,'removeX_both'=removeX_both
                     ,'removeG_both'=removeG_both
                     ,'removePathX'=removePathX
                     ,'removePathG'=removePathG
                     ,'removedTotX'=removedTotX
                     ,'removedTotG'=removedTotG
                     ,'sparseCheck_after'=sparseCheck_after
                     ,'simVals'=simVals
    )
    saveRDS(saveVals, paste0(outLoc, '/out_',i,'.rda'))
    cat('Done\n')
  } #Loop to the next simulation
  
  #Combine the variables together to a matrix for the plots
  # corMatX_1 <- cbind.data.frame(corXY, geneX, indicatorX, removeX_both)
  # corMatG_1 <- cbind.data.frame(corGY, geneG, indicatorG, removeG_both)
  # corMatX_2 <- cbind.data.frame(xSums, geneX, indicatorX, removeX_both)
  # corMatG_2 <- cbind.data.frame(gSums, geneG, indicatorG, removeG_both)
  # colnames(corMatX_2) <- c('xSums', 'geneX', 'indicatorX', 'removeX_both')
  # colnames(corMatG_2) <- c('gSums', 'geneG', 'indicatorG', 'removeG_both')
  # 
  # #Gather information for the number of remaining elements
  # simulation <- 1:numSims
  # simDetails <- cbind(simulation, 
  #                     removedTotX, removePathX,
  #                     removedTotG, removePathG)
  # 
  # avgRemovedX_tot <- mean(removedTotX)
  # avgRemovedG_tot <- mean(removedTotG)
  # avgRemaining_X <- mean(nx+nxPrime+ns+ntranscriptNoise-removedTotX)
  # avgRemaining_G <- mean(ng+ngPrime+nh+ngeneNoise-removedTotG)
  # avgSparse_after <- mean(sparseCheck_after)
  # 
  # simSummary <- list(avgRemovedX_tot, avgRemovedG_tot,
  #                    avgRemaining_X, avgRemaining_G,
  #                    avgSparse_after)
  # names(simSummary) <- c('avgRemovedX_tot', 'avgRemovedG_tot', 'avgRemaining_X', 'avgRemaining_G'
  #                        ,'avgSparse_after')
  # 
  # returnVal <- list(corMatX_1, corMatG_1, corMatX_2, corMatG_2, simDetails, simSummary, simVals)
  # names(returnVal) <- c('corMatX_1', 'corMatG_1', 'corMatX_2', 'corMatG_2', 'simDetails', 'simSummary'
  #                       ,'simVals')
  # 
  # return(returnVal)
}