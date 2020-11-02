func_rating_diff = function(id_h, id_a){
  R_h = Elo$R[id_h]
  R_a = Elo$R[id_a]
  
  dR = R_h - R_a
  
  return(dR)
}