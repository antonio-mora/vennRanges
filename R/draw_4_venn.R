draw_4_venn <- function(bed1, bed2, bed3, bed4, name1="File1", name2="File2", name3="File3", name4="File4", color1="blue", color2="red", color3="green", color4="orange", print_mode=c('raw', 'percent'), transparency = "transparent") {
	bed1_GR <- GRanges( seqnames=bed1$chr, range=IRanges(start=bed1$start, end=bed1$end, names=paste(bed1$chr,bed1$start,sep=":")),strand="*" )
	bed2_GR <- GRanges( seqnames=bed2$chr, range=IRanges(start=bed2$start, end=bed2$end, names=paste(bed2$chr,bed2$start,sep=":")),strand="*" )
	bed3_GR <- GRanges( seqnames=bed3$chr, range=IRanges(start=bed3$start, end=bed3$end, names=paste(bed3$chr,bed3$start,sep=":")),strand="*" )
	bed4_GR <- GRanges( seqnames=bed4$chr, range=IRanges(start=bed4$start, end=bed4$end, names=paste(bed4$chr,bed4$start,sep=":")),strand="*" )

	merged_GR <- reduce(c(bed1_GR, bed2_GR, bed3_GR, bed4_GR))
	new_bed1_GR <- merged_GR[merged_GR %over% bed1_GR]
	new_bed2_GR <- merged_GR[merged_GR %over% bed2_GR]
	new_bed3_GR <- merged_GR[merged_GR %over% bed3_GR]
	new_bed4_GR <- merged_GR[merged_GR %over% bed4_GR]

	area1 <- length(new_bed1_GR); area2 <- length(new_bed2_GR); area3 <- length(new_bed3_GR); area4 <- length(new_bed4_GR)

	n12 <- new_bed1_GR[new_bed1_GR %over% new_bed2_GR]
	n13 <- new_bed1_GR[new_bed1_GR %over% new_bed3_GR]
	n14 <- new_bed1_GR[new_bed1_GR %over% new_bed4_GR]
	n23 <- new_bed2_GR[new_bed2_GR %over% new_bed3_GR]
	n24 <- new_bed2_GR[new_bed2_GR %over% new_bed4_GR]
	n34 <- new_bed3_GR[new_bed3_GR %over% new_bed4_GR]

	area12 <- length(n12); area13 <- length(n13); area14 <- length(n14); area23 <- length(n23); area24 <- length(n24); area34 <- length(n34)

	n123 <- n12[n12 %over% new_bed3_GR]
	n124 <- n12[n12 %over% new_bed4_GR]
	n134 <- n13[n13 %over% new_bed4_GR]
	n234 <- n23[n23 %over% new_bed4_GR]

	area123 <- length(n123); area124 <- length(n124); area134 <- length(n134); area234 <- length(n234)

	n1234 <- n123[n123 %over% new_bed4_GR]

	area1234 <- length(n1234)

	draw.quad.venn( area1, area2, area3, area4, area12, area13, area14, area23, area24, area34, area123, area124, area134, area234, area1234, 
	fill = c(color1, color2, color3, color4), cex = 1, category=c(name1, name2, name3, name4), cat.col = c(color1, color2, color3, color4), cat.cex = 1.5, print.mode = print_mode, col = transparency );
}
