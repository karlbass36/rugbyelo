for (f in list.files(path = "functions", pattern = "func_*")) {
  source(paste0("functions/", f))
}

rm(f)

data = read.csv("../RFU_Premiership_1997-2018.csv")

output = {}

Elo = data.frame(team = sort(unique(data$home)), 
                 R = 1500)

K_0 = 20

for (i in 1:nrow(data)) {
  id_h = func_team_id(data$home[i])
  id_a = func_team_id(data$away[i])
  
  M = data$hscore[i] - data$ascore[i]
  
  dR = func_rating_diff(id_h, id_a)
  
  E = func_expected_result(dR)
  
  O = func_observed_result(M)
  
  if (! is.na(M)){
    K = func_K_factor(K_0)
  } else {
    K = 0
  }
  
  output = func_output(i, data, Elo, id_h, id_a, M, E, O, K, output)
  
  Elo = func_rating_update(id_h, id_a, K, O, E)
  
  output = func_ouptut_append(i, Elo, id_h, id_a, output)
}