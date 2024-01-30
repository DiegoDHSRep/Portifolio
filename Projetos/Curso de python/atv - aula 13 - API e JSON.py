import requests
import json

def lista_filmes(titulo):
    lista = []
    for i in range(1 , 101):
        try:
            print("Pesquisando na pagina:", i) 
            url = 'http://www.omdbapi.com/?apikey=ce31637e&s=' + titulo + '&type=movie&page=' + str(i)
            req = requests.get(url)
            resposta = json.loads(req.text)
            if resposta['Response'] == 'True':
                for filme in resposta['Search']:
                    tit = filme["Title"]
                    ano = filme["Year"]
                    textinho = tit + " (" + ano + ")"
                    lista.append(textinho)
            else:
                print("Fim da pagina")
                break
        except:
            print("Conexão falhou")
    return lista

sair = False
while not sair:
    option = input("Digite o filme que desaja pesquisar ou digite SAIR para sair do programa: ")
    if option == "SAIR":
        sair = True
        print("Adeus amigo........")
    else:
        filmesPesquisa = lista_filmes(option)
        for i in filmesPesquisa:
            print(i)
        print("\nTotal de filmes encontrados é: ", len(filmesPesquisa))