% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ConsensusClusteringCode.R
\name{runAllIterations}
\alias{runAllIterations}
\title{The runAllIterations function}
\usage{
runAllIterations(dataMatrix, K, nIters, propSamples, clusterAlgorithm,
  pathOutput, verbose, seed)
}
\arguments{
\item{dataMatrix}{matrix or data frame with data to cluster, samples/items in the columns and features in the rows.}

\item{K}{vector of integers representing numbeer of clusters to evaluate. It can be of length 1 and it does not need to consist of consecutive integers. For example, either of \code{K = 4}, \code{K = 2:5} or \code{K = c(5, 10, 15)} would work.}

\item{nIters}{number of iterations (bootstrap samples).}

\item{propSamples}{proportion of items to sample in each bootstrap sample.}

\item{clusterAlgorithm}{algorithm to perform the clustering, for the moment only K-means is available.}

\item{pathOutput}{directory for output files and iterations progress report, the current working directory by default.}

\item{verbose}{logical, print progress messages to screen. During the bootstrap iterations, a report to monitor the progress is created in \code{pathOutput}.}

\item{seed}{numerical value to set random seed for reproducible results. It uses \code{doRNG} package to guarantee reproducible results even when running in parallel.}
}
\value{
Vector with consensus index for each pair of samples.
}
\description{
Internal. Runs all the iterations of consensus clustering.
}
\keyword{internal}

