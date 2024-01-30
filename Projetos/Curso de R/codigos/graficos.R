#mtcars é um data set nativo do R
carros <- mtcars[,c(1,2,9)]

#head exibe as 6 primeira linhas da tabela
head(carros)

#hist cria histogramas
#carros$mpg = é a coluna mpg da tabela carros (lembra $ serve pra chamar uma coluna por nome me um data frame)
hist(carros$mpg)

#plot cria graficos de disperção
plot(carros$mpg, carros$cyl)

library(ggplot2)

#ggplot precisa de 2 parametros dataset (q aqui é o carros) e a coluna
ggplot(carros, aes(am)) + geom_bar()
