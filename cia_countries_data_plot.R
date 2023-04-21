#Loading pertinent libraries
library('mdsr')
library('ggplot2')
library('tidyverse')

#Loading the dataframe and assigned to variable
data.frame('CIAcountries')
CIA <- CIACountries
head(CIA)


#Creating first plot that views gdp versus education with categories by net_users
g <- ggplot(CIA, aes(y = gdp, x = educ))
g + geom_point(aes(color = net_users), size = 3)


#Adding roadways measure to size of data points for additional graphical information
g + geom_point(aes(color = net_users, size = roadways))

#Converting to logarithmic scale for more clear measure of GDP
g + geom_point(aes(color = net_users, size = roadways)) +
  coord_trans(y = 'log10')

#Further clarifying with continuous scale
g +
  geom_point(aes(color = net_users, size = roadways)) + 
  scale_y_continuous(name = "Gross Domestic Prodcuct",
                     trans = "log10",
                     labels = scales::comma)
