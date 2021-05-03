gen_eff_obs_v2 <- function(alpha,
  												 Rsq,
  												 nsample,
  												 rind,
  												 nx,
  												 nxPrime,
  												 ns,
  												 ntranscriptNoise,
  												 ng,
  												 ngPrime,
  												 nh,
  												 ngeneNoise,
  												 noiseSD)
{
	cat("generating obs...")


	input <- list(alpha = alpha,
								Rsq = Rsq,
								nsample = nsample,
								rind = rind,
								nx = nx,
								nxPrime = nxPrime,
								ns = ns,
								ntranscriptNoise = ntranscriptNoise,
								ng = ng,
								ngPrime = ngPrime,
								nh = nh,
								ngeneNoise = ngeneNoise,
								noiseSD = noiseSD)
							
		
	input <- c(input, 
	           Gcolmn = input$ng + input$ngPrime + input$nh + input$ngeneNoise,
						 actvGcolmn = input$ng,
						 Xcolmn = input$nx + input$nxPrime + input$ns + input$ntranscriptNoise,
						 actvXcolmn = input$nx)

	
	obs <- genIndicators(alpha = input$alpha,
											 Rsq = input$Rsq,
											 nsample = input$nsample,
											 rind = input$rind,
											 nx = input$nx,
											 nxPrime = input$nxPrime,
											 ns = input$ns,
											 ntranscriptNoise = input$ntranscriptNoise,
											 ng = input$ng,
											 ngPrime = input$ngPrime,
											 nh = input$nh,
											 ngeneNoise = input$ngeneNoise,
											 noiseSD = input$noiseSD)

	cat("Done\n")
	return(list(Obs = obs, Input = input))
}