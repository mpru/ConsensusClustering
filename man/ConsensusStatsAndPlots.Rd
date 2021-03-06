% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ConsensusClusteringCode.R
\name{ConsensusStatsAndPlots}
\alias{ConsensusStatsAndPlots}
\title{The ConsensusStatsAndPlots function}
\usage{
ConsensusStatsAndPlots(results, plots = TRUE, plotSave = c("no", "pdf",
  "bmp", "png", "ps"), pathOutput = "")
}
\arguments{
\item{results}{output from consensusClustering function.}

\item{plots}{logical indicating whether the plots should be produced. Plots are produced if the results have been produced for more than a single value of K (\code{length(K) > 1}).}

\item{plotSave}{character string indicating the format the plot to be saved in a file. Default is \code{"no"}, the plot is not saved, but printed to the screen.}

\item{pathOutput}{directory for saving plots if \code{plotSave == TRUE}, defaults to current working directory.}
}
\value{
A list with the following elements:
\itemize{
     \item \code{clusterConsensus}: average consensus index between all pairs of items belonging to the same cluster, for each K.
     \item \code{itemConsensus}: average consensus index between item i and all the (other) items in cluster cl, for all i and cl, for each K.
     \item \code{intraInterCons}: matrix with intra consensus statistic (the mean of all cluster consensus for each K) and inter consensus statistic (mean of all item consensus between an item and all clusters to which the item does not belong, for each K).
}
}
\description{
Calculates cluster consensus and item consensus (with their plots), and intra and inter cluster consensus summary.
}
\details{
The \strong{Cluster Consensus Plot} highlights the mean pairwise consensus values between a cluster's members for each k. The color scheme
follows all previous graphs and sample are stacked bars grouped by K value on the horizontal x-axis. High values show that the clusters hold 
high stability and likewise low values highlights a clusters instability. 
In the \strong{Item Consensus Plots}, each stacked bar is a sample. Item-consensus values are indicated by the heights of the colored portion of the bars (using the tracking color scheme). This plot provides a view of item-consensus across all other clusters at a given k. As Wilkerman (2010) explains, with this plot it is possible to see if a sample is a very "pure" member of a cluster or if it shares high consensus to multiple clusters (large rectangles in a column of multiple colors), suggesting that it is an unstable member.
}
\examples{
mat <- matrix(rnorm(10*6), 10, 6)
result <- consensusClustering(mat, nIters = 5, consensusStatsPlots = FALSE)
ConsensusStatsAndPlots(result)

}
\keyword{external}

