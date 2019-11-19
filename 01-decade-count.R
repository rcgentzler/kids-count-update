library(ojo)
library(tidycensus)

o <- readxl::read_xlsx("../../../OKPolicy (1) (1)/Shared Files/Special Projects/Kids Count/Data Center/Data/Child Population -- Decade Count.xlsx")

v17 <- load_variables(2017, "acs5", cache = TRUE)

