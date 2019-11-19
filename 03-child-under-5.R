library(ojo)
library(tidycensus)
options(scipen = 999)

o <- readxl::read_xlsx("../../../OKPolicy (1) (1)/Shared Files/Special Projects/Kids Count/Data Center/Data/Updated 2019/Child Population by Race Under Age 5.xlsx")


n2 <- get_acs(geography = "state", 
              variables = c(white = "B01001A_003",
                            white = "B01001A_018",
                            black = "B01001B_003",
                            black = "B01001B_018",
                            aian = "B01001C_003",
                            aian = "B01001C_018",
                            asian = "B01001D_003",
                            asian = "B01001D_018",
                            hisp = "B01001I_003",
                            hisp = "B01001I_018"),
              state = "OK",
              year = 2017)

n2 <- n2 %>% 
  group_by(variable) %>% 
  summarize(Data = sum(estimate))
