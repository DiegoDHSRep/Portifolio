#---------------------------------------obtenção dos dados-----------------------------------------
#carreagando os dados
diabetes <- read.csv("C:/Users/diego/Desktop/Estudo Ferias/Curso de R/Conteudo complementar/diabetes.csv")

head(diabetes)

#--------------------------------------preparação dos dados----------------------------------------
#conferindo se os tipos dos dados estão corretos
str(diabetes)

#conferindo se ha alguma coluna sem dados
colSums(is.na(diabetes))

#transformando a coluna Outcome para o tipo factor
diabetes$Outcome <- as.factor(diabetes$Outcome)

#---------------------------------------Análise exploratória----------------------------------------
boxplot(diabetes)

library(dplyr)

diabetes2 <- diabetes %>% filter(Insulin <= 250)

boxplot(diabetes2$Insulin)

boxplot(diabetes2)
summary(diabetes2$Insulin)

#---------------------------------------Construção do modelo----------------------------------------
install.packages("caTools")
library(caTools) #biblioteca para separa os dados em treino e teste

set.seed(123)
#vamos usar o sample.split para criar os dados de treino e de teste
#o primeiro parametro é o dataSet 
#o segundo parametro é o porcentual de divisão, nesse caso, de 70%
index = sample.split(diabetes2$Pregnancies, SplitRatio = .70)

index

train = subset(diabetes2, index == TRUE) #70% dos dados serão armazenados nessa variavel
test = subset(diabetes2, index == FALSE) #30% dos dados serão armazenado nessa variavel

#agr com os dados dividos, hora de treinar
install.packages("caret")
install.packages("e1071")

library(caret)
library(e1071)

#trainando o modelo, se usa o train
#a variavel preditora é o Outcome, da tabela diabetes "~" é para é usado para informar as demais colunas que serão variaveis preditora
# ne caso se usou "." para definir q todas a outras colunas, tambem são variaveis preditoras
# o data set é o train
# é o metodo é o knn
modelo <- train(Outcome ~., data = train, method = "knn")

#acuracia de cada valor de k
modelo$results
#melhor valor de k
modelo$bestTune

#expandido os valores de k, para obter uma melhor acuracia
modelo2 <- train(Outcome ~., data = train, method = "knn", tuneGrid = expand.grid(k = c(1:20)))

modelo2$results
modelo2$bestTune
plot(modelo2)


#usando outros metedos-----------------
modelo3 <- train(Outcome ~., data = train, method = "naive_bayes")
modelo3$results
modelo3$bestTune


#usando outros metedos-------------
install.packages("randomForest")
library(randomForest)

modelo4 <- train(Outcome ~., data = train, method = "rpart2")
modelo4$results
modelo4$bestTune
#Verificando a importância das váriaveis para o aprendizado do modelo
varImp(modelo4$finalModel)
#As colunas "Insulin e Blood Pressure" não contribuem muito para o aprendizado do modelo

#Treinando o modelo sem as colunas "Insulin e BloodPressure" - train[,c(-3,-5)] exclui as colunas
modelo4_1 <- train(Outcome ~., data = train[,c(-3,-5)], method = "rpart2")
modelo4_1$results

# Visualizando a arvore de decisão
plot(modelo4_1$finalModel)
text(modelo4_1$finalModel)


#usando outros metedos-------------
install.packages("kernlab")
library(kernlab)

set.seed(100)
modelo5 <- train(Outcome ~., data = train, method = "svmRadialSigma", preProcess=c("center"))

modelo5$results
modelo5$bestTune


#vendo as melhores acuracias
modelo$results
modelo2$results
modelo3$results
modelo4_1$results
modelo5$results


#----------------------------------------avaliando o modelo--------------------------------------------
#testando o modelo com os dados teste
predicoes <- predict(modelo5,test)
predicoes

#calculando a diferença entre os valores previstos e os valores esperados
resul_predicoes <- confusionMatrix(predicoes, test$Outcome)
resul_predicoes

# ---------------------------------------------------------Realizando predições-------------------------------------------

#Criando um dataframe apenas com o registro de um unico paciente para simular a utilização do modelo
novos_dados <- data.frame(
  Pregnancies = c(6),           
  Glucose = c(148.130),
  BloodPressure = c(72),
  SkinThickness = c(35),          
  Insulin = c(0),
  BMI = c(33.60),       
  DiabetesPedigreeFunction = c(0.62),
  Age = c(80)                     
)

diabetes5l = diabetes2[c(1:20), c(1:8)]


previsao <- predict(modelo5, diabetes5l)
resultado <- ifelse(previsao == 1, "Positivo","Negativo")

print(paste(diabetes5l$Age,"Anos,", "Resultado:", resultado))




#criando um csv com os resultados das previçoes
write.csv(predicoes, 'resultado.csv')
