import requests
cabecalho = {'User-agent': 'Windows-12',
             'Refer': 'https://google.com'}

dados = {'usarname': 'voce disse',
         'password': 'pipoca'}
requisicao = requests.post("https://putsreq.com/4qwUtaPnWORMJTCNTtPl", headers=cabecalho, data=dados)
print(requisicao.text)