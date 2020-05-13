summ <- mc_responses %>% group_by(Q4) %>% summarise(users = length(Q4)) 
summ <- summ[order(-summ$users),]

summ%>% ggplot() +
  geom_bar(aes(x = reorder(Q4, users), y = users, fill=reorder(Q4, users)), stat = 'identity') +
  coord_flip() +
  geom_text(aes(x = reorder(Q4, users), y = users,label=users), hjust=-0.1) +
  annotate("text", x = 5, y=2000, label = "<- maldita tesis!") +
  scale_fill_manual(values=c(rep('#8D8A89',4), "#12FFDB",rep('#8D8A89',length(unique(mc_responses$Q3))-31))) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6),legend.position = "none") +
  xlab('nivel de estudios')+
  ylab("numero de usuarios")
