
ecobici <- ecobici %>% 
  count(Colonia) %>% 
  arrange(Colonia)

ecobici %>% 
  group_by(Colonia) %>%
  summarise(n())%>% 
  arrange(Colonia)

unique(ecobici[ecobici$Colonia == 'Roma Norte',]$'Codigo Postal')

ecobici %>% 
  filter(Colonia == 'Roma Norte') %>%
  select(`Codigo Postal`) %>%
  unique()


