# vennRanges
"vennRanges" is an R package to build venn diagrams between dataframes of genomic ranges (bed format).

## Fast tutorial
### Step 1.
Upload your bed files into R dataframes, or use the *generate_random_genomic_range* function:
```
library(vennRanges)
a <- generate_random_genomic_range()
b <- generate_random_genomic_range()
c <- generate_random_genomic_range()
d <- generate_random_genomic_range()
```
Here we have generated four genomic range files with the default parameters of the function (see: *?generate_random_genomic_ranges*).
```
head(a)
head(b)
head(c)
head(d)
```
### Step 2.
We can use the *full_range_comparison* function to check how intersection between A and B can be different to the intersection between B and A.
```
ab_comparison <- full_range_comparison(a, b)
lapply(ab_comparison, dim)
```
### Step 3.
We can use the *draw_2_venn*, *draw_3_venn*, and *draw_4_venn* functions to build the diagrams.
```
draw_2_venn(a, b)
x11(); draw_3_venn(a, b, c, "A", "B", "C", "gray", "purple", "pink")
x11(); draw_4_venn(a, b, c, d, "A", "B", "C", "D", "green", "purple", "red", "yellow", 'raw', 1)
```
See the help files for more options.
