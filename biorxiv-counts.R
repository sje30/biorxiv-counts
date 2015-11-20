dat = read.csv("biorxiv-counts.csv",comment.char="#",as.is=TRUE)


date = as.Date(dat[,1],format="%Y-%m-%d")
counts = dat[,2]
subtitle = sprintf("%d papers to date", sum(counts))

pdf(file='biorxiv-counts.pdf',width=7, height=4)
par(mar=c(4.5, 4.5,1,3),las=1)
plot(date, counts, pch=20, ylim=c(0,250), bty='n',xaxt='n',
     main='Biorxiv submissions per month',
     xlab='month', ylab='# of submissions')
legend('topleft', legend=subtitle, bty='n')
axis.Date(1, at=seq(date[length(date)], date[1], length=6), format="%Y-%m")
dev.off()

##system("convert biorxiv-counts.pdf biorxiv-counts.png")
