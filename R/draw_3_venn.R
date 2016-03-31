draw_3_venn <- function(bed1, bed2, bed3, name1="File1", name2="File2", name3="File3", color1="blue", color2="red", color3="green", print_mode=c('raw', 'percent'), transparency = "transparent") {
	bed1_GR <- GRanges( seqnames=bed1$chr, range=IRanges(start=bed1$start, end=bed1$end, names=paste(bed1$chr,bed1$start,sep=":")),strand="*" )
	bed2_GR <- GRanges( seqnames=bed2$chr, range=IRanges(start=bed2$start, end=bed2$end, names=paste(bed2$chr,bed2$start,sep=":")),strand="*" )
	bed3_GR <- GRanges( seqnames=bed3$chr, range=IRanges(start=bed3$start, end=bed3$end, names=paste(bed3$chr,bed3$start,sep=":")),strand="*" )

	merged_GR <- reduce(c(bed1_GR, bed2_GR, bed3_GR))
	new_bed1_GR <- merged_GR[merged_GR %over% bed1_GR]
	new_bed2_GR <- merged_GR[merged_GR %over% bed2_GR]
	new_bed3_GR <- merged_GR[merged_GR %over% bed3_GR]

	area1 <- length(new_bed1_GR); area2 <- length(new_bed2_GR); area3 <- length(new_bed3_GR)

	n12 <- new_bed1_GR[new_bed1_GR %over% new_bed2_GR]
	n23 <- new_bed2_GR[new_bed2_GR %over% new_bed3_GR]
	n13 <- new_bed1_GR[new_bed1_GR %over% new_bed3_GR]
	area12 <- length(n12); area23 <- length(n23); area13 <- length(n13)

	n123 <- n12[n12 %over% new_bed3_GR]
	area123 <- length(n123)

	draw.triple.venn( area1, area2, area3, area12, area23, area13, area123,	fill = c(color1, color2, color3), cex = 1.5, category=c(name1, name2, name3), cat.col = c(color1, color2, color3), cat.cex = 1.5, print.mode = print_mode, col = transparency );
}
