import requests
import json
import time

def cotacao():
    requisao = requests.get("https://economia.awesomeapi.com.br/last/USD-BRL")
    dicionario = json.loads(requisao.text)

    print("Cotação do Dolar:")
    print('Dolar:',dicionario['USDBRL']['bid'])
    print("")    

cotacao()
#caso eu quisse fazer um looping q acada 5 segundos ele roda o codigo e me retorna a cotação do dolar atual
'''
def cotacao():
    while True:
        requisao = requests.get(" https://economia.awesomeapi.com.br/last/USD-BRL")
        dicionario = json.loads(requisao.text)

        print("Cotação do Dolar:")
        print('Dolar',dicionario['USDBRL']['bid'])
        print("")
        time.sleep(5)

'''