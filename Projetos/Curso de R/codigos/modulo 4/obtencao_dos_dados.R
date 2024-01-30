#Acessando o arquivo
#sep = separa os valores por ;
#e dec = identifica o separador decimal como ",", ja q o R por padrão identifica o separador decimal como "."
viagens <- read.csv(file = "C:/Users/diego/Desktop/Estudo Ferias/Curso de R/Conteudo complementar/2019_Viagem.csv",
                    sep = ';',
                    dec = ',',
                    fileEncoding='latin1'
)
head(viagens)

#abre o csv em outra, e fica igual uma planilha do excel
View(viagens)

#exibe o numero de colunas e linhas
dim(viagens)

#o summary vai recuperar valores como a media, minima, maxima etc, de um data set
summary(viagens)

#pra ver isso especificamente os valores das passagems
summary(viagens$Valor.passagens)

library(dplyr)
glimpse(viagens)
