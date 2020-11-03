for (f in list.files(path = "functions", pattern = "func_*")) {
  source(paste0("functions/", f))
}

source('run_Elo.R', echo = F)

rm(f)

data = read.csv("data/RFU_Premiership_1997-2018.csv")

output = run_Elo(data, K_0 = 20, HFA = 140)