PathwayAnalysis <- function(
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
){
  
  #---------------Perform simulation------------------
  sim <- gen_eff_obs_v2 (alpha            = alpha,
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
                            noiseSD          = noiseSD
  )
  
  system <- sim$Obs
  
  x <- system$transcripts
  colnames(x) <- paste0('x',1:ncol(x))
  g <- system$genes
  colnames(g) <- paste0('g',1:ncol(g))
  y <- system$y
  indicatorX <- system$truetranscripts
  indicatorX[indicatorX==1] <- 'pathway'
  indicatorX[indicatorX==0] <- 'not in pathway'
  indicatorG <- system$truegenes
  indicatorG[indicatorG==1] <- 'pathway'
  indicatorG[indicatorG==0] <- 'not in pathway'
  
  #---------------------------------------------------------------------------------
  #Step 1: Filter X and G Correlations with Y, individually-------------------------
  #---------------------------------------------------------------------------------
  
  #----------Calculate absolute correlations----------
  corXY <- apply(x, 2, function(z) abs(cor(z, y)))
  corGY <- apply(g, 2, function(z) abs(cor(z, y)))
  
  #----------Perform k-means on correlations----------
  clustersXY <- kmeans(corXY, centers=numClusters_1)
  clustersGY <- kmeans(corGY, centers=numClusters_1)
  
  #----------Remove Smallest Cluster------------------
  #Filter the X items
  clusterMeansX_1 <- clustersXY$centers
  smallestX <- which(clusterMeansX_1 == min(clusterMeansX_1))
  removeX_1 <- which(clustersXY$cluster == smallestX)
  step1X <- x
  
  #Filter the G items
  clusterMeansG_1 <- clustersGY$centers
  smallestG <- which(clusterMeansG_1 == min(clusterMeansG_1))
  removeG_1 <- which(clustersGY$cluster == smallestG)
  step1G <- g
  
  #---------------------------------------------------------------------------------
  #Step 2: Filter X and G Correlations with eachother-------------------------------
  #---------------------------------------------------------------------------------
  
  #------------Correlation between X and G-------------
  corXG <- abs(cor(step1X, step1G))
  xSums <- rowSums(corXG)
  gSums <- colSums(corXG)
  
  #Kmeans on the correlation sums
  clustersXSums <- kmeans(xSums, centers=numClusters_2)
  clustersGSums <- kmeans(gSums, centers=numClusters_2)
  
  #----------Remove Smallest Cluster------------------
  #Filter the X items
  clusterMeansX_2 <- clustersXSums$centers
  smallestX <- which(clusterMeansX_2 == min(clusterMeansX_2))
  removeX_2 <- which(clustersXSums$cluster == smallestX)
  removeX_both <- removeX_1[which(removeX_1 %in% removeX_2)]
  step2X <- x
  if(length(removeX_both) > 0){
    step2X <- step2X[,-removeX_both]
  }
  
  #Filter the G items
  clusterMeansG_2 <- clustersGSums$centers
  smallestG <- which(clusterMeansG_2 == min(clusterMeansG_2))
  removeG_2 <- which(clustersGSums$cluster == smallestG)
  removeG_both <- removeG_1[which(removeG_1 %in% removeG_2)]
  step2G <- g
  if(length(removeG_both) > 0){
    step2G <- step2G[,-removeG_both]
  }
  
  #------------Return results-------------------------
  returnVal <- list(x, g, y, indicatorX, indicatorG, corXY, corGY, xSums, gSums, removeX_1, removeG_1
                    , removeX_2, removeG_2, removeX_both, removeG_both)
  names(returnVal) <- c('x', 'g', 'y', 'indicatorX', 'indicatorG', 'corXY', 'corGY', 'xSums', 'gSums'
                        , 'removeX_1', 'removeG_1', 'removeX_2', 'removeG_2'
                        , 'removeX_both', 'removeG_both')
  
  return(returnVal)
  
}