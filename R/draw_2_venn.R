draw_2_venn <- function(bed1, bed2, name1="File1", name2="File2", color1="blue", color2="red", print_mode=c('raw', 'percent'), transparency = "transparent") {
	# Convert bed to GRanges:
	bed1_GR <- GRanges( seqnames=bed1$chr, range=IRanges(start=bed1$start, end=bed1$end, names=paste(bed1$chr,bed1$start,sep=":")),strand="*" )
	bed2_GR <- GRanges( seqnames=bed2$chr, range=IRanges(start=bed2$start, end=bed2$end, names=paste(bed2$chr,bed2$start,sep=":")),strand="*" )

	# Convert each region in each set to regions of the merged dataset:
	merged_GR <- reduce(c(bed1_GR, bed2_GR))
	new_bed1_GR <- merged_GR[merged_GR %over% bed1_GR]
	new_bed2_GR <- merged_GR[merged_GR %over% bed2_GR]

	# Get overlap between two datasets:
	inters_indexes <- new_bed1_GR %over% new_bed2_GR
	inters <- length(new_bed1_GR[inters_indexes])

	# Draw Venn Diagram:
	draw.pairwise.venn( length(new_bed1_GR), length(new_bed2_GR), inters, category=c(name1,name2), fill = c(color1, color2), print.mode = print_mode, col = transparency )
}
