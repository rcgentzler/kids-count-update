library(ojo)
library(tidycensus)
options(scipen = 999)

o <- readxl::read_xlsx("../../../OKPolicy (1) (1)/Shared Files/Special Projects/Kids Count/Data Center/Data/Updated 2019/Child Population by Race Under Age 5.xlsx")
B05003_003	

n2 <- get_acs(geography = "state", 
              variables = c(white = "B01001A_003",
                            white = "B01001A_004",
                            white = "B01001A_005",
                            white = "B01001A_006",
                            white = "B01001A_018",
                            white = "B01001A_019",
                            white = "B01001A_020",
                            white = "B01001A_021",
                            black = "B01001B_003",
                            black = "B01001B_004",
                            black = "B01001B_005",
                            black = "B01001B_006",
                            black = "B01001B_018",
                            black = "B01001B_019",
                            black = "B01001B_020",
                            black = "B01001B_021",
                            aian = "B01001C_003",
                            aian = "B01001C_004",
                            aian = "B01001C_005",
                            aian = "B01001C_006",
                            aian = "B01001C_018",
                            aian = "B01001C_019",
                            aian = "B01001C_020",
                            aian = "B01001C_021",
                            asian = "B01001D_003",
                            asian = "B01001D_004",
                            asian = "B01001D_005",
                            asian = "B01001D_006",
                            asian = "B01001D_018",
                            asian = "B01001D_019",
                            asian = "B01001D_020",
                            asian = "B01001D_021",
                            hisp = "B01001I_003",
                            hisp = "B01001I_004",
                            hisp = "B01001I_005",
                            hisp = "B01001I_006",
                            hisp = "B01001I_018",
                            hisp = "B01001I_019",
                            hisp = "B01001I_020",
                            hisp = "B01001I_021"),
              state = "OK",
              year = 2017)

n2 <- n2 %>% 
  group_by(variable) %>% 
  summarize(Data = sum(estimate))
