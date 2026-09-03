library(tidyverse)
library(karyoploteR)

# Load Dxy data
dxy <- read_tsv(file = "DXY_OUTPUT/pixy_dxy.txt")

# Calculate chromosome lengths
chr_lengths <- dxy %>% select(chromosome, window_pos_2) %>% 
  group_by(chromosome) %>% 
  summarize(length = max(window_pos_2)) %>% 
  mutate(ycoord = seq(8:1)*20)

data <- left_join(dxy, chr_lengths, by = "chromosome") %>% 
  rename("dxy"="avg_dxy") %>% 
  mutate(comparison = paste(pop1, pop2, sep = "_"),
         comparison = if_else(is.na(dxy),"unknown",comparison))

write_delim(x = data, file = "dxy_final_table.tsv", delim = "\t")

cp.genome <- toGRanges(data.frame(chr=chr_lengths$chromosome, start=rep(1,n=8), end=chr_lengths$length))

data_AB <- data %>% filter(comparison=="A_B")
data_AC <- data %>% filter(comparison=="A_C")
data_BC <- data %>% filter(comparison=="B_C")
data_unknown <- data %>% filter(comparison=="unknown")

chromosomes=c("CP044422", "CP044421", "CP044420", "CP044419",
              "CP044418", "CP044417", "CP044416","CP044415")

# Make plot
pp <- getDefaultPlotParams(plot.type=1)
pp$data1height <- 800
pp$leftmargin <- 0.2
pp$rightmargin <- 0.1
pp$data1outmargin <- 80
pp$ideogramheight <- 25

bar_margin <- 0.05

pdf(file = "karyotype.pdf", height = 16, width = 8)
kp <- plotKaryotype(plot.type=1, , genome = cp.genome, plot.params = pp, chromosomes=chromosomes)
kpAddBaseNumbers(kp, tick.dist = 1000000, tick.len = 50, tick.col="black", cex=0.7, units = "Mb",
                 minor.tick.dist = 100000, minor.tick.len = 25, minor.tick.col = "black")

# Unknown Dxy windows
kpBars(kp, chr=data_unknown$chromosome, 
       x0 = data_unknown$window_pos_1, 
       x1 = data_unknown$window_pos_2,
       y1 = 0.5,
       data.panel = 1, 
       col = "#000000",
       lwd=1,
       r0=0, r1=0.03)

kpBars(kp, chr=data_AB$chromosome, 
        x0=data_AB$window_pos_1,
        x1=data_AB$window_pos_2, 
        y1=data_AB$dxy, 
        data.panel = 1, 
        col = "#0072B2",
        lwd=0.1,
        r0=0.04, r1=0.33-bar_margin)
kpAddLabels(kp, labels="A vs B",  r0=0.04, r1=0.33-bar_margin, data.panel = 1, side="right", cex = 1)
kpAxis(kp, numticks = 3,  r0=0.04, r1=0.33-bar_margin, ymin=0, ymax=1, cex = 0.5 )

kpBars(kp, chr=data_AC$chromosome, 
        x0=data_AC$window_pos_1, 
        x1=data_AC$window_pos_2, 
        y1=data_AC$dxy, 
        data.panel = 1, 
        col = "#D55E00",
        lwd=0.1,
        r0=0.34, r1=0.66-bar_margin)
kpAddLabels(kp, labels="A vs C", r0=0.34, r1=0.66-bar_margin, data.panel = 1, side="right", cex = 1)
kpAxis(kp, numticks = 3, r0=0.34, r1=0.66-bar_margin, ymin=0, ymax=1, cex = 0.5 )

kpBars(kp, chr=data_BC$chromosome, 
        x0=data_BC$window_pos_1,
        x1=data_BC$window_pos_2,
        y1=data_BC$dxy, 
        data.panel = 1, 
        col = "#009E73",
        lwd=0.1,
        r0=0.67, r1=0.99-bar_margin)
kpAddLabels(kp, labels="B vs C", r0=0.67, r1=0.99-bar_margin, data.panel = 1, side="right", cex = 1)
kpAxis(kp, numticks = 3, r0=0.67, r1=0.99-bar_margin, ymin=0, ymax=1, cex = 0.5 )
dev.off()