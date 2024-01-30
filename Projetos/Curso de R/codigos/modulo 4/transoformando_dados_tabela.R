viagens <- read.csv(file = "C:/Users/diego/Desktop/Estudo Ferias/Curso de R/Conteudo complementar/2019_Viagem.csv",
                    sep = ';',
                    dec = ',',
                    fileEncoding='latin1'
)

head(viagens)

#alterando dados
#no arquivo, as datas estão do tipo factor, inves de date
#pra alterar pra date, se usa o as.Date
#pra isso se criou uma nova coluna com o viagens$data_inicio
# o primeiro parametro do as.Date é a coluna do dataSet q se deseja alterar
#o segundo é formato para qual se sera alterado
#a original não é alterada, so a nova (pq criou uma nova coluna)
viagens$data_inicio <- as.Date(viagens$Período...Data.de.início, "%d/%m/%Y")

glimpse(viagens)

#formatando o formato de exibição dos dados da coluna data_inicio
#para isso criou-se uma nova coluna (para nao alterar a original)
#o primeiro parametro do as.Date é a coluna do dataSet q se deseja alterar
#o segundo é formato para qual se sera alterado
viagens$data_inicio_formatada <- format(viagens$data_inicio, "%m/%Y")

viagens$data_inicio_formatada


