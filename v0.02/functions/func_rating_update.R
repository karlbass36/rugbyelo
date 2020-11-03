func_rating_update = function(id_h, id_a, K, O, E, Elo){
  Elo$R[id_h] = Elo$R[id_h] + K*(O - E)
  Elo$R[id_a] = Elo$R[id_a] - K*(O - E)
  
  return(Elo)
}