generate_random_genomic_range <- function(number_chrom=5, size_range=c(50, 1000), size_inter_range=c(50, 2000), number_ranges_per_chrom=20) {

	bed_file <- NULL
	for (i in 1:number_chrom) {
		# Generate random numbers:
		range_sizes <- sample(size_range[1]:size_range[2], number_ranges_per_chrom, replace=F)				# all sizes of ranges
		inter_range_sizes <- sample(size_inter_range[1]:size_inter_range[2], number_ranges_per_chrom, replace=F)	# all sizes between ranges

		# Build file range by range:
		old_start <- 0; old_end <- 0; 
		for (j in 1:number_ranges_per_chrom) {
			new_start <- old_end + inter_range_sizes[i]
			new_end <- new_start + range_sizes[i]

			bed_file <- rbind(bed_file, c(paste("chr",i,sep=""), new_start, new_end))

			old_end <- new_end
		}
	}

	# Final touches to resulting data frame:
	bed_file <- as.data.frame(bed_file)
	colnames(bed_file) <- c("chr", "start", "end")
	bed_file$start <- as.numeric(as.character(bed_file$start))
	bed_file$end <- as.numeric(as.character(bed_file$end))

	bed_file
}
