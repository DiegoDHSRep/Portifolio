viagens <- read.csv(file = "C:/Users/diego/Desktop/Estudo Ferias/Curso de R/Conteudo complementar/2019_Viagem.csv",
                    sep = ';',
                    dec = ',',
                    fileEncoding='latin1'
)

head(viagens)

# quais os orgãos estão gastando mais com passagens aréas

#criando um data frame com os 15 orgãos que gastam mais
p1 <- viagens %>%                             #puxando a tabela
      group_by(Nome.do.órgão.superior) %>%    #agrupando pelo nome dos orgãos superiores da tabela la
      summarise(n = sum(Valor.passagens)) %>% #somando os valores das passagens
      arrange(desc(n)) %>%                    #ordenando os valores de forma decrescente
      top_n(15)                               # para exibir os 15 primeiros

names(p1) <- c("Orgão" , "Valor")

p1

#plotando os dados com o ggplot
library(ggplot2)

#criando o grafico
ggplot(p1, aes(x = reorder(Orgão, Valor), y = Valor))+ #reorder re-ordena os dados
  geom_bar(stat = "identity")+ #definindo que o grafico vai ter forma geometrica de barras
  coord_flip()+ #muda a orienteção do grafico
  labs(x = "Valor", y = "Órgão") #muda o rotulo dos eixos

#-----------------------------------------------------------------------------------------------

#valor gasto por cidade 
p2 <- viagens %>%
      group_by(Destinos) %>%
      summarise(n = sum(Valor.passagens)) %>%
      arrange(desc(n)) %>%
      top_n(15)

names(p2) <- c("destino","valor")

p2

#criando o grafico
ggplot(p2,aes(x = reorder(destino,valor), y = valor)) + 
      geom_bar(stat = "identity", fill = "#0ba791") + 
      geom_text(aes(label = valor), vjust = 0.3, size = 3) + # para enserir um texto diramente no grafico
      coord_flip() +
      labs(x = "Destino", y = "Valor")

#-------------------------------------------------------------------------------------------------------

#quantidade de viagens por mes

p3 <- viagens %>% 
      group_by(data_inicio_formatada) %>%
      summarise(qtd = n_distinct(Identificador.do.processo.de.viagem)) #o n_distinc é para garantir q uma mesma viagem seja contada duas vezes

head(p3)

#criando o grafico
ggplot(p3, aes(x = data_inicio_formatada, y = qtd, group = 1)) + 
      geom_line()+ #linha definidas por pares
      geom_point() # grafico de dispesão que transforma pares em pontos

#---------------------------------------------------------------------------------------------------------
#alterando a visualização dos dados 
install.packages("rmarkdown")
install.packages('tinytex')

tinytex::install_tinytex()

