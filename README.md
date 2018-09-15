# ConsensusClustering

Consensus Clustering is a revised tool for implementing the methodology for class discovery and clustering validation, based off of Monti et al, 2003 paper, Consensus Clustering: A Resampling-Based Method for Class Discovery and Visualization of Gene Expression Microarray Data. This method is used to find a consensus assignment across multiple runs of a clustering approach, allowing one to assess and validate the stability of the discovered clusters empirically. The objective of this method is to identify robust clusters in the context of genomic data, but is applicable for any unsupervised learning task.

## Description of Consensus Clustering 

The development of Consensus Clustering is driven by the need to determine the number of cluster as well as how likely the membership of the clusters repeatably agreed within a dataset. This application is aimed towards genomic data within cancer genomics where subclasses of disease are clinically relevant for treatment but can easily be applied elsewhere. This method includes taking random subsamples of data points, applying a clustering algorithm to cluster the samples into k groups and then calculating some consensus among all the iterations to produce a final and robust cluster assignment. This is done for different values of k, and the Consensus Clustering methodology also provides tools for assesing the optimal number of clusters.

More specifically, Consensus Clustering was inspired by ConsensusClusterPlus (Wilkerson 2010), with major design and application renovation to the implementation which includes but not limited to:

- **Implementation of parallelization**: Our package let the user take advantage of multiple cores or the power of computational clusters to perform the bootstrap iterations in a faster way.
- **Improved use of data structures**: In order to have better memory efficiency, we replaced all symmetric consensus matrices between pairs of samples with consensus vectors which store the same data in smaller structures.
- **User-friendly source code**: Our code was developed following good-practice style, with descriptive variable names and a clear separation of the different tasks. These characteristics contribute to maintainability, understandably, reuseability, debugability and extensibility of the code.
- **Functions for analysis of the results that can be called later independently of the main function**: All the diagnosis plots for assessment of optimal value of K, as well as the calculation of consensus statistics, can be obtained in the main execution of the consensusClustering function but can also be disabled and run individually later calling the respective functions with consensusClustering results as input. This allows the user to choose whether to spend time and computational resources in these tasks or not.
- **More flexible options for plots**: Heatmaps for big data sets can run into computational problems when they try to plot deep dendrograms or visualization issues when annotating samples and features names. We made these characteristics available to be defined by the user.
- **Implementation of PAC scores**: Our package adds one extra measure to asses the optimal number of K, the Proportion of Ambiguously Clustering (PAC score, Senbabaoglu, 2014).
- **Intra and Inter Cluster Consensus summary**: Our package returns single intra and inter cluster consensus coefficients for each value of K evaluated, allowing easy comparison. 
- **Analysis is performed for any desired values of K**: In our package the user can provide a vector with the desired values of K to evaluate (for example, K= 4, K = 2:5, K = c(5, 10, 15)).
- **Plots implemented with ggplot2 and ComplexHeatmap packages**: resulting in plots that was easy to understand and visually appealing.
This first version of our package only handles Kmeans as the clustering algorithm. Wilkersons's ConsensusClusterPlus package provides a wide range of other options.


See more in the vignettes.
