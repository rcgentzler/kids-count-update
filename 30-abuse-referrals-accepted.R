library(ojo)
library(pdftools)

county_codes <- read_csv("county-codes.csv")

for (i in 2009:2017) {
  r <- pdf_text(paste0("pdf/abuse", i, ".pdf"))
  
  r <- r[6:7] %>% 
    enframe
  
  t <- r %>%
    separate(value, into = paste0("line", 10:99), sep = "\n") %>%
    mutate(pagenumber = row_number()) %>% 
    gather(lno, text, contains("line")) %>% 
    filter(!is.na(text), str_detect(text, "\\%")) %>% 
    mutate(lno = paste0(pagenumber, lno),
           text = str_trim(text)) %>% 
    arrange(lno) %>% 
    select(-pagenumber, -lno) %>% 
    separate(text, into = c("county", "reports_received", "screened", "screened_rate",
                            "accepted", "accepted_rate"),
             sep = " {4,}") %>% 
    mutate(TimeFrame = i)
  
  if (!exists("d")) {d <- t} else {d <- d %>% bind_rows(t)}
}

d <- d %>% 
  select(Location = county, TimeFrame, Data = accepted) %>%
  mutate(Location = ifelse(Location == "LeFlore", "Le Flore", Location)) %>% 
  mutate_all(str_squish) %>% 
  mutate(DataFormat = "Number",
         Location = case_when(str_detect(Location, "State|Total") ~ "Oklahoma",
                              TRUE ~ paste(Location, "County"))) %>% 
  right_join(county_codes) %>% 
  select(LocationId, Location, TimeFrame, DataFormat, Data)

write_csv(d, "prepared-data/Child Abuse & Neglect Referrals Accepted for Investigation in Oklahoma.csv")
