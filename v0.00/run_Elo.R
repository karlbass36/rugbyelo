run_Elo = function(data, K_0, HFA){
  output = {}
  
  Elo = data.frame(team = sort(unique(data$home)), 
                   R = 1500)
  
  for (i in 1:nrow(data)) {
    id_h = func_team_id(data$home[i], Elo)
    id_a = func_team_id(data$away[i], Elo)
    
    M = data$hscore[i] - data$ascore[i]
    
    dR = func_rating_diff(id_h, id_a, Elo)
    
    E = func_expected_result(dR)
    
    O = func_observed_result(M)
    
    if (! is.na(M)){
      K = func_K_factor(K_0)
    } else {
      K = 0
    }
    
    output = func_output(i, data, Elo, id_h, id_a, M, E, O, K, output)
    
    Elo = func_rating_update(id_h, id_a, K, O, E, Elo)
    
    output = func_ouptut_append(i, Elo, id_h, id_a, output)
  }
  
  return(output)
}