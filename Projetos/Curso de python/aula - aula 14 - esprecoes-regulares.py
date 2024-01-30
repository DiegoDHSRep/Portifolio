import re
import requests

req = requests.get('http://portal.mec.gov.br/spo-subsecretaria-de-planejamento-e-orcamento')

padrao = re.findall(r'[\w\.-]+@+[\w-]+[\w\.-]+',req.text)

if padrao:
    print(padrao)
else:
    print("\nPadrão não encontrado")

