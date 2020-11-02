bins = seq(0, 1, 0.1)

id_home = output$observed == 1
h_home = hist(output$expected[id_home], breaks = bins)

id_draw = output$observed == 0.5
h_draw = hist(output$expected[id_draw], breaks = bins)

id_away = output$observed == 0
h_away = hist(output$expected[id_away], breaks = bins)

total = rowSums(cbind(h_home$counts, h_draw$counts, h_away$counts))

plot(h_home$mids*100, 
     h_home$counts/total*100, 
     col = "red",
     xlim = c(0, 100),
     ylim = c(0, 100),
     xlab = "Expected [%]",
     ylab = "Observed [%]")

abline(a = 0, 
       b = 1, 
       col = "red")

points(h_draw$mids*100, 
       h_draw$counts/total*100, 
       col = "black")

points(h_away$mids*100, 
       h_away$counts/total*100, 
       col = "blue")

abline(a = 100, 
       b = -1, 
       col = "blue")
