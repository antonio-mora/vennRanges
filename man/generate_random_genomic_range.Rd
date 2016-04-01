\name{generate_random_genomic_range}
\alias{generate_random_genomic_range}
\title{Generate data frames of random genomic ranges}
\usage{
generate_random_genomic_range(number_chrom, size_range, size_inter_range, number_ranges_per_chrom)
}
\arguments{
  \item{number_chrom}{An integer with the number of chromosomes to be created. Default value: 5.}
  \item{size_range}{A vector with the minimum and maximum size of each genomic range. Default value: c(50, 1000).}
  \item{size_inter_range}{A vector with the minimum and maximum size of the distance between each pair of genomic ranges. Default value: c(50, 2000).}
  \item{number_ranges_per_chrom}{An integer with the number of desired genomic ranges per chromosome. Default value: 20.}
}
\value{
A dataframe with the specified number of chromosomes and genomic ranges per chromosomes, where genomic ranges and inter-ranges distances are randomly chosen from an uniform distribution between specified integer values.
}
\description{
This is a function to generate dataframes of genomic ranges in a fast way. It is not meant to work as a background for statistical analyses, but only to allow fast testing of all the other functions. This function can take four arguments: The number of chromosomes to be included in the resulting dataframe, a range to sample the sizes of each genomic range (using R's "sample" function), a range to sample the sizes of the inter-range distances (using again "sample"), and the number of ranges we want to create per chromosome.
}
\examples{
a <- generate_random_genomic_ranges()
b <- generate_random_genomic_ranges(19, c(10, 1000), c(10, 5000), 100)
head(a)
head(b)
}
