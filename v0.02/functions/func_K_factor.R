func_K_factor = function(dR, M, K_0, O){
  if (O < 0.5) {dR = -dR}
  
  AC = 2.2/(2.2+0.001*dR)
  
  MoV = log(abs(M) +1)
  
  K = AC*MoV*K_0
  
  return(K)
}