func_rating_diff = function(id_h, id_a, HFA, Elo){
  R_h = Elo$R[id_h]
  R_a = Elo$R[id_a]
  
  dR = HFA + R_h - R_a
  
  return(dR)
}