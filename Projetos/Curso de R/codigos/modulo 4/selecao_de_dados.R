head(iris)
glimpse(iris)

#filtrando o dataset para aparcer somente as species com versicolor
versicolor <- filter(iris, Species == "versicolor")

#dim() retorna a quantidade de linhas e colunas
dim(versicolor)

#slice() filtra linhas especificas ou um interlvalo de linhas
slice(iris,5:10)

#selct filtra colunas especificas ou um interlvalo de colunas
select(iris, 2:4)

#com o - antes da coluna, filtra essa coluna da exibição
select(iris, -Sepal.Width)

#Criando uma nova coluna com base em colunas pre existentes, a mutate faz isso
iris2 <- mutate(iris, nova.coluna = Sepal.Length + Sepal.Width)
iris2[c("Sepal.Length", "Sepal.Width", "nova.coluna")]

#ordernando valores, quem faz isso é o arrange
# %>% pra realizar mais de uma operação na mesma linha 
select(iris, Sepal.Length) %>% arrange(Sepal.Length)

#pra agrupar
iris %>% group_by(Species) %>% summarise(mean(Sepal.Length))
 