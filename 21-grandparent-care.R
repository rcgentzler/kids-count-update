library(tidycensus)

n2 <- get_acs(geography = "state", 
              variables ="B10002_002",
              state = "OK",
              year = 2016)
