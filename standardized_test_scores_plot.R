#Loading the data
ChargesNJ <- MedicareCharges %>%
  filter(stateProvider == 'NJ')

#Bar graph for charges by procedure
p <- ggplot(data = ChargesNJ,
            aes(x = reorder(drg, mean_charge), y = mean_charge)
            ) +
  geom_col(fill = 'grey') +
  ylab('Statewide Average Charges ($)') +
  xlab('Medical Procedure (DRG)') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = rel(0.5)))

#Plotting graph
p


#Plotting SAT math scores in histogram
g <- ggplot(data = SAT_2010, aes(x = math))
g + geom_histogram(binwidth = 10) + labs(x = 'Average math SAT score')


#Density plot for SAT scores
g + geom_density(adjust = 0.3)


#Bar chart comparing different states SAT math scores
ggplot(data = head(SAT_2010, 10),
       aes(x = reorder(state, math), y = math)
) +
  geom_col() + 
  labs(x = "State", y = "Average math SAT score")


#Loading mosaicData
install.packages("mosaicData")
library('mosaicData')


#Plotting HELP data
ggplot(data = mosaicData::HELPrct, aes(x = homeless)) +
  geom_bar(aes(fill = substance), position = 'fill') +
  scale_fill_brewer(palette = "Spectral") +
  coord_flip()
