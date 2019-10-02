# Tarea: Comentar el siguiente código.

#Carga librería tidyverse
library("tidyverse")

#carga el csv del link en la variable gap_5060
gap_5060<-readr::read_csv("https://raw.githubusercontent.com/mine-cetinkaya-rundel/reproducibility-uscots15/master/data/gapminder-5060.csv")

#De gap_5060 filtra los renglones que tienen "Canada" en la columna country
gap_5060_CA <- gap_5060 %>% filter(country == "Canada")

#Gráfica de gap_5060_CA de year contra lifeExp y usa geom_line() para dibujar una linea
ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

#Modifica la columna lifeExp con una condición, si country es "Canada" y year 1957 cambia el valor de lifeExp por 69.96 
gap_5060 <- gap_5060 %>%
  mutate(lifeExp = replace(lifeExp, (country == "Canada" & year == 1957), 69.96)) %>%
  as.data.frame()

#Filtra el dataframe con los renglones que tienen "Canada"
gap_5060_CA <- gap_5060 %>%
  filter(country == "Canada")

#Gráfica de gap_5060 de year contra lifeExp (segunda vez)
ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

#Filtra los datos con los renglones que tienen "Mexico", "Canada" y "UnitedStates" en country
gap_5060_NA <- gap_5060 %>%
  filter(country %in% c("Canada", "Mexico", "United States"))

#Gráfica de gap_5060_NA donde distingue cada país con diferente color
ggplot(data = gap_5060_NA, aes(x = year, y = lifeExp, color = country)) +
  geom_line()
