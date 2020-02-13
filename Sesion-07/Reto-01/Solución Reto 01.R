# Usando los datos de la encuesta de kaggle, responde 
# ¿Cuál es la distribución de edades de los data scientists por género?

# De preferencia enfócate en responder con una visualización efectiva
# y plantea lo que aporta a la historia. 
library(tidyverse)

mc_responses <- read.csv("~/BEDU_DA/multiple_choice_responses.csv")

mc_responses %>% is.na() %>% sum()

ggplot(data = mc_responses, aes(x = Q1, fill = Q2)) +
  geom_bar() +
  facet_wrap(~Q2, scales = 'free_y')+
  scale_fill_manual(values=c("#D69CE1", "#037ffc", "#03fc98","#03fc98")) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6),legend.position = "none") +
  xlab(element_blank())+
  ylab('numero de usuarios')
