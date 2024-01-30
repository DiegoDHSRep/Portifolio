import os
import requests
import json
from deep_translator import GoogleTranslator

os.system("cls")

palavra_requisao = requests.get("https://random-word-api.herokuapp.com/word")
palavraalea = json.loads(palavra_requisao.text)

traducao = str(palavraalea[0])
letra = []
chances = 7
ganhou = False
letra_errada = []

tradutor = GoogleTranslator(source='en', target='pt')

palavra = tradutor.translate(traducao)

while True:
    #Roda os _ e valida se a letra esta correta ou não
    for i in palavra:
        if i.lower() in letra:
            print(i, end = " ")
        else:
            print("_", end = " ")

    print(f" || Você tem {chances}")
    print("")

    #armazena a letra digitada pela usuario
    print("Tentativas incorretas:", *letra_errada)
    tentativa = input("Digite uma letra para adivinhar: ").lower()
    letra.append(tentativa)
    if tentativa not in palavra:
        letra_errada.append(tentativa)

    #valida se o usuario venceu o jogo
    ganhou = True
    for i in palavra:
        if i.lower() not in letra:
            ganhou = False

    #tira um tentativa se a letra for incorreta
    if tentativa not in palavra:
        chances -= 1

    #chances 0, cabo o jogo
    if chances == 0 or ganhou:
        break
    os.system("cls")
#texto escrito ao vencer ou perder    
if ganhou:
    print("\nParabens, você ganhou, a palvra era: " + palavra)
    print("")

else:
    print("\nVocê perdeu!!! A palavra era: " + palavra)
    print("")



