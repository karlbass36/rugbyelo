func_ouptut_append = function(i, Elo, id_h, id_a, output){
  output$hElo_n[i] = Elo$R[id_h]
  output$aElo_n[i] = Elo$R[id_a]
  
  return(output)
}