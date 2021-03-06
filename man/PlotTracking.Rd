% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ConsensusClusteringCode.R
\name{PlotTracking}
\alias{PlotTracking}
\title{The PlotTracking function}
\usage{
PlotTracking(results, showSamplesNames = TRUE, plotSave = c("no", "pdf",
  "bmp", "png", "ps"), pathOutput = "")
}
\arguments{
\item{results}{output from consensusClustering function.}

\item{showSamplesNames}{logical indicating if the plot should display sample names or not.}

\item{plotSave}{character string indicating the format the plot to be saved in a file. Default is "no", the plot is not saved, but printed to the screen.}

\item{pathOutput}{directory for saving the plot if \code{plotSave == TRUE}, defaults to current working directory}
}
\description{
This graphic shows the cluster assignment of items (columns) for each k (rows) by color. The colors correspond to the colors of the consensus matrix class asssignments.
This function only produces the plot if the results were produced for more than one value of K, so that the comparison and tracking can be done.
}
\details{
This graphic shows the cluster assignment of items (columns) for each k (rows). The color asssignments corresponds to the
consensus matrix class. This plot provides a view of item cluster membership across different k and enables users to track 
the history of clusters relative to earlier clusters. For items that change clusters often (changing colors within a column)
are indicative of unstable membership and thus unstable/unreliable clusters where as items that do not frequently change colors 
shows a strong membership and stable cluster asssignment.
}
\examples{
mat <- matrix(rnorm(10*6), 10, 6)
result <- consensusClustering(mat, nIters = 5, plotTracking = FALSE)
PlotTracking(result)

}
\keyword{external}

