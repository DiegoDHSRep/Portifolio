import requests
import json
from deep_translator import GoogleTranslator

def requisao(filme):
    try: 
        req = requests.get('http://www.omdbapi.com/?apikey=ce31637e&t=' + filme)
        dicionario = json.loads(req.text)
        return dicionario
    except:
        print("Erro na conexão")
        return None

def detalhes_filmes(filme):
    print('\nTitulo:', filme['Title'])
    print('Lançamento:', filme['Released'])
    print('Diretor:', filme['Director'])
    print('Atores:', filme['Actors'])
    print('Nota:', filme['Ratings'][1]['Source']+ ':',filme['Ratings'][1]['Value'])
    print('')

def conselho():
    conselho = requests.get("https://api.adviceslip.com/advice")
    deicionarioDoConselhor = json.loads(conselho.text)
    conseioEn = deicionarioDoConselhor['slip']['advice']

    tradutor = GoogleTranslator(source='en', target='pt')

    conseioPt = tradutor.translate(conseioEn)

    print("\nConselhor do dia: " + conseioPt + "\n")


sair = False
while not sair:
    option = input("Digite o filme que desaja pesquisar ou digite 1 para recerber um conselho e para sair digite SAIR: ")
    if option == "SAIR":
        sair = True
        print("Adeus amigo........")

    elif option == "1":
        conselho()

    else:
        filme = requisao(option)
        if filme['Response'] == 'False':
            print("Filme não encontrado")
        else:
            detalhes_filmes(filme)