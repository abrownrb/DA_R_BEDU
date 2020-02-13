# En este curso conseguiste aprender a usar R para el análisis de datos, 
# aunque este es un lenguaje con grandes ventajas no es la única opción.

# Usando los datos de la encuesta de kaggle, responde: 
# ¿Cuál es la herramienta más usada por los científicos de datos que responden a la encuesta?
  
  
#  De preferencia enfócate en responder con una visualización efectiva 
# y plantea lo que esto aporta a la historia.

filtered %>%
  count(Q14) %>%
  ggplot(aes(fill = Q14, values = n)) +
  geom_waffle(n_rows = 5, size = 0.33, colour = "white", flip = TRUE) +
  coord_equal() +
  theme_ipsum_rc(grid="") +
  ggtitle('What is the primary tool that you use at work or school to analyze data?') +
  theme_enhance_waffle()
