func_output = function(i, data, Elo, id_h, id_a, M, E, O, K, output){
  
  output = rbind(output,
                 data.frame(season   = data$season[i],
                            date     = data$date[i],
                            home     = data$home[i],
                            away     = data$away[i],
                            hscore   = data$hscore[i],
                            ascore   = data$ascore[i],
                            hElo_o   = Elo$R[id_h],
                            aElo_o   = Elo$R[id_a],
                            margin   = M,
                            expected = E,
                            observed = O,
                            K_factor = K,
                            hElo_n   = 0,
                            aElo_n   = 0)
  )
  
  return(output)
}