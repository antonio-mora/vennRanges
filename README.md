# vennRanges
"vennRanges" is an R package to build venn diagrams between genomic ranges

## Fast tutorial
### Step 1.
Upload your bed files into R dataframes, or use the generate_random_genomic_range function:
```
library(vennRanges)
a <- generate_random_genomic_range()
b <- generate_random_genomic_range()
c <- generate_random_genomic_range()
d <- generate_random_genomic_range()
```
Here we have generated four genomic range files with the default parameters of the function (see: ?generate_random_genomic_ranges).
```
head(a)
head(b)
head(c)
head(d)
```
### Step 2.
We can use the full_range_comparison function to check how intersection between A and B can be different to the intersection between B and A.
```
ab_comparison <- full_range_comparison(a, b)
lapply(ab_comparison, dim)
```
### Step 3.
