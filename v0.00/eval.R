bins = seq(0, 1, 0.1)

id_home = output$observed == 1
h_home = hist(output$expected[id_home], breaks = bins, plot = F)

id_draw = output$observed == 0.5
h_draw = hist(output$expected[id_draw], breaks = bins, plot = F)

id_away = output$observed == 0
h_away = hist(output$expected[id_away], breaks = bins, plot = F)

total = rowSums(cbind(h_home$counts, h_draw$counts, h_away$counts))

par(mar=c(5, 5, 1, 8), xpd=T)

plot(h_home$mids*100, 
     h_home$counts/total*100, 
     col = "red",
     xlim = c(0, 100),
     ylim = c(0, 100),
     xlab = "Expected [%]",
     ylab = "Observed [%]")

abline(a = 0, 
       b = 1, 
       col = "red",
       xpd = F)

points(h_draw$mids*100, 
       h_draw$counts/total*100, 
       col = "black")

points(h_away$mids*100, 
       h_away$counts/total*100, 
       col = "blue")

abline(a = 100, 
       b = -1, 
       col = "blue",
       xpd = F)

legend("right", inset=c(-0.2,0), legend=c("Home Win", "Draw", "Away Win"), pch = c(1,1,1), col = c("red", "black", "blue"))

RMSE_h = sqrt(sum((h_home$mids*100 - h_home$counts/total*100)^2)/10)
RMSE_a = sqrt(sum(((100-h_away$mids*100) - h_away$counts/total*100)^2)/10)

cat(sprintf("Home: %5.2f%%\nAway: %5.2f%%\n", RMSE_h, RMSE_a))
