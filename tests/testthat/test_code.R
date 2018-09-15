# Tests for Consensus Clustering Package

mat <- matrix(rnorm(10*6), 10, 6)
results <- consensusClustering(mat, nIters = 5, verbose = F, plotHeatmaps = "no", plotSave = "no", plotCDF = F, plotTracking = F, consensusStats = F)

test_that("Several tests", {
    
    expect_error(consensusClustering(mat, K = -1, nIters = 5), 
                 'Error : all(K > 1) is not TRUE', fixed = TRUE)
    
    expect_error(consensusClustering(1:2, nIters = 5, verbose = F, plotHeatmaps = "no", plotSave = "no", plotCDF = F, plotTracking = F, consensusStats = F), 
                 'Error : class(dataMatrix) %in% c("matrix", "data.frame") is not TRUE', fixed = TRUE)
    
    expect_error(consensusClustering(mat, nIters = 5, propSamples = 1.2, verbose = F, plotHeatmaps = "no", plotSave = "no", plotCDF = F, plotTracking = F, consensusStats = F), 
                 'Error : length(propSamples) == 1 && propSamples >= 0 && propSamples <=  .... is not TRUE', fixed = TRUE)
    
    expect_error(consensusClustering(mat, nIters = 5, clusterAlgorithm = "hclust", verbose = F, plotHeatmaps = "no", plotSave = "no", plotCDF = F, plotTracking = F, consensusStats = F), 
                 'Error in { : task 1 failed - "Invalid clusterAlgorithm argument."', fixed = TRUE)
    
    expect_error(consensusClustering(mat, nIters = 5, verbose = NULL, plotHeatmaps = "no", plotSave = "no", plotCDF = F, plotTracking = F, consensusStats = F), 
                 'Error in if (verbose) { : argument is of length zero', fixed = TRUE)
    
    expect_error(consensusClustering(mat, nIters = 5, saveResults = "yes"),
                 'Error : all(sapply(c(verbose, saveResults, showDendrogram, showSamplesNames,  .... is not TRUE', fixed = TRUE)
    
    expect_error(consensusClustering(mat, nIters = 5, finalLinkage = "Average"), 
                 'Error in { : task 1 failed - "invalid clustering method Average"', fixed = TRUE)
    
    expect_error(consensusClustering(mat, nIters = 5, PACLowerLim = -2), 
                 'Error : length(PACLowerLim) == 1 && length(PACUpperLim) == 1 && all(c(PACLowerLim,  .... is not TRUE', fixed = TRUE)
    
    expect_error(consensusClustering(mat, nIters = 5, plotSave = "yes"), 
                 'Error : all(plotSave %in% c("no", "pdf", "bmp", "png", "ps")) is not TRUE', fixed = TRUE)
    
    expect_error(consensusClustering(mat, nIters = 5, plotHeatmaps = F), 
                 'Error : all(plotHeatmaps %in% c("both", "consensus", "data", "no")) is not TRUE', fixed = TRUE)
    
    expect_message(PlotHeatmaps(results, plotHeatmaps = "both", plotSave = "no"), 
                   'Heatmaps for the input data cannot be plot if dataMatrix is not provided.', fixed = TRUE)
    
    expect_error(PlotHeatmaps(results, plotHeatmaps = "both", plotSave = "no", dataMatrix = 1), 
                 'Error : class(dataMatrix) %in% c("NULL", "matrix", "data.frame") is not TRUE', fixed = TRUE)
    
    expect_error(PlotCDF(results, PACLowerLim = c(0.1, 0.9)), 
                 'Error : length(PACLowerLim) == 1 && length(PACUpperLim) == 1 && all(c(PACLowerLim,  .... is not TRUE', fixed = TRUE)
    
    expect_error(PlotTracking(results, plotSave = FALSE), 
                 'Error : all(plotSave %in% c("no", "pdf", "bmp", "png", "ps")) is not TRUE', fixed = TRUE)
    
    expect_error(ConsensusStatsAndPlots(results = list()), 
                 'Error in results[[1]] : subscript out of bounds', fixed = TRUE)
})