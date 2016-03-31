\name{draw_3_venn}
\alias{draw_3_venn}
\title{Draw Venn diagrams of three data frames of genomic ranges}
\usage{
draw_3_venn(bed1, bed2, bed3, name1, name2, name3, color1, color2, color3, print_mode, transparency)
}
\arguments{
  \item{bed1}{A dataframe of a bed file.}
  \item{bed2}{A dataframe of a bed file.}
  \item{bed3}{A dataframe of a bed file.}
  \item{name1}{A string with the name of the first dataset. Default value: "File1".}
  \item{name2}{A string with the name of the second dataset. Default value: "File2".}
  \item{name3}{A string with the name of the third dataset. Default value: "File3".}
  \item{color1}{A string with the color of the first set. Default value: "blue".}
  \item{color2}{A string with the color of the second set. Default value: "red".}
  \item{color3}{A string with the color of the third set. Default value: "green".}
  \item{print_mode}{A string with the following options: 'raw' for count data, 'percent' for percentages, and c('raw','percent') for both. Default value: c('raw','percent').}
  \item{transparency}{A string to set the color of the border lines, with the following options: 1 for black, 2 for red, 3 for green, 4 for blue, 5 for light blue, "transparent" for no border. Default value: "transparent".}
}
\value{
A plot with the Venn Diagram of the three sets.
}
\description{
This function takes three data frames of genomic ranges and generates a Venn diagram showing the number of overlapping and unique regions. The internal algorithm starts by merging all genomic regions in a single file, and then mapping the original regions in each dataset to the merged regions. After this, we perform intersections using the \code{GenomicRanges} package, we count the number of elements in each region of the Venn diagram, and we use this information to plot it with the \code{VennDiagram} package.
}
\examples{
a <- generate_random_genomic_ranges()
b <- generate_random_genomic_ranges()
c <- generate_random_genomic_ranges()
head(a)
head(b)
head(c)

draw_3_venn(a, b, c)
draw_3_venn(a, b, c, "A", "B", "C", "gray", "purple", "pink")
draw_3_venn(a, b, c, "A", "B", "C", "gray", "purple", "pink", 'raw', 1)
}
