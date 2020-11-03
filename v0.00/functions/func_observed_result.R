func_observed_result = function(M){
  if (is.na(M)) {O = 0}
  else
  if (M > 0) {O = 1}
  else
  if (M < 0) {O = 0}
  else
  {O = 0.5}
  
  return(O)
}