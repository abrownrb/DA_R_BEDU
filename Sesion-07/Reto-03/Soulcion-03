filtered %>%
  count(Q14) %>%
  ggplot(aes(fill = Q14, values = n)) +
  geom_waffle(n_rows = 5, size = 0.33, colour = "white", flip = TRUE) +
  coord_equal() +
  theme_ipsum_rc(grid="") +
  ggtitle('What is the primary tool that you use at work or school to analyze data?') +
  theme_enhance_waffle()
