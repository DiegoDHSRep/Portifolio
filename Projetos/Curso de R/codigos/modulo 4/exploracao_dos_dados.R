viagens <- read.csv(file = "C:/Users/diego/Desktop/Estudo Ferias/Curso de R/Conteudo complementar/2019_Viagem.csv",
                    sep = ';',
                    dec = ',',
                    fileEncoding='latin1'
)

head(viagens)

hist(viagens$Valor.passagens)

#o valor maximo ta muito longe da media, o que indica um outlier
#outliers são valores que fogem da normalidade dos dados
#fazendo com que o resultado da anilise não reflita a realidade
summary(viagens$Valor.passagens)

#visualizando os valores em boxplot
boxplot(viagens$Valor.passagens)

#calculando o desvio padrão
sd(viagens$Valor.passagens)


#colSums() = contabiliza a quantidade de campos não preenchidos por coluna
#is.na() = verifica se existe campos com valores não preenchido
colSums(is.na(viagens))

#str() = verifica o numero de ocorrências
str(viagens$Situação)

#table() = verifica o numero de ocorrencias
table(viagens$Situação)

#pra ver em porcentual
prop.table(table(viagens$Situação)) * 100


