"""
Routes and views for the bottle application.
"""

from bottle import route, view, redirect
from datetime import datetime
import os, json

@route('/')
@route('/home')
@view('index')
def home():
    # define os dados
    dados = None
    ninguem_liga_dados = ''
    ninguem_liga_nomes = ''
    ninguem_liga_cores = ''
    derrota_dados = ''
    derrota_nomes = ''
    derrota_cores = ''

    # obtem as informações do placar
    with open('data' + os.sep + 'placar.json') as read_file:
        dados = json.load(read_file)

    # verifica os dados
    if dados != None:
        # percorre os dados de ninguem liga
        for item in dados['ninguem_liga']:
            # define os pontos
            if len(ninguem_liga_dados) > 0:
                ninguem_liga_dados += ', '

            ninguem_liga_dados += str(item['pontos'])

            # define os nomes
            if len(ninguem_liga_nomes) > 0:
                ninguem_liga_nomes += ', '

            ninguem_liga_nomes += '"' + item['quem'] + '"'

            # define as cores
            if len(ninguem_liga_cores) > 0:
                ninguem_liga_cores += ', '

            ninguem_liga_cores += '"' + item['cor'] + '"'

        # percorre os dados da derrota
        for item in dados['derrota']:
            # define os pontos
            if len(derrota_dados) > 0:
                derrota_dados += ', '

            derrota_dados += str(item['pontos'])

            # define os nomes
            if len(derrota_nomes) > 0:
                derrota_nomes += ', '

            derrota_nomes += '"' + item['quem'] + '"'

            # define as cores
            if len(derrota_cores) > 0:
                derrota_cores += ', '

            derrota_cores += '"' + item['cor'] + '"'

    """Renders the home page."""
    return dict(
        title='Placar',
        dados=dados,
        ninguem_liga_dados=ninguem_liga_dados,
        ninguem_liga_nomes=ninguem_liga_nomes,
        ninguem_liga_cores=ninguem_liga_cores,
        derrota_dados=derrota_dados,
        derrota_nomes=derrota_nomes,
        derrota_cores=derrota_cores,
        year=datetime.now().year
    )

@route('/ninguemliga')
@view('ninguemliga')
def ninguemliga():
    # define os dados
    dados = None

    # obtem as informações do placar
    with open('data' + os.sep + 'placar.json') as read_file:
        dados = json.load(read_file)

    """Renders the contact page."""
    return dict(
        title='Ninguém Liga',
        ninguem_liga=dados['ninguem_liga'],
        year=datetime.now().year
    )

@route('/ninguemliga/<nome>')
def ninguemliga(nome):
    # define os dados
    dados = None

    # nome do arquivo
    arquivo = 'data' + os.sep + 'placar.json'

    # obtem as informações do placar
    with open(arquivo, 'r') as read_file:
        dados = json.load(read_file)

    # percorre os dados
    for i in range(0, len(dados['ninguem_liga'])):
        if dados['ninguem_liga'][i]['quem'] == nome:
            dados['ninguem_liga'][i]['pontos'] += 1

    # salva
    with open(arquivo, 'w') as write_file:
        json.dump(dados, write_file, sort_keys=True, indent=4)

    return redirect('/ninguemliga')

@route('/ninguemliga/zerar')
def ninguemliga_zerar():
    # define os dados
    dados = None

    # nome do arquivo
    arquivo = 'data' + os.sep + 'placar.json'

    # obtem as informações do placar
    with open(arquivo, 'r') as read_file:
        dados = json.load(read_file)

    # percorre os dados
    for i in range(0, len(dados['ninguem_liga'])):
        dados['ninguem_liga'][i]['pontos'] = 0

    # salva
    with open(arquivo, 'w') as write_file:
        json.dump(dados, write_file, sort_keys=True, indent=4)

    return redirect('/ninguemliga')

@route('/derrota')
@view('derrota')
def derrota():
    # define os dados
    dados = None

    # obtem as informações do placar
    with open('data' + os.sep + 'placar.json') as read_file:
        dados = json.load(read_file)

    """Renders the contact page."""
    return dict(
        title='Derrota',
        derrota=dados['derrota'],
        year=datetime.now().year
    )

@route('/derrota/<nome>')
def derrota(nome):
    # define os dados
    dados = None

    # nome do arquivo
    arquivo = 'data' + os.sep + 'placar.json'

    # obtem as informações do placar
    with open(arquivo, 'r') as read_file:
        dados = json.load(read_file)

    # percorre os dados
    for i in range(0, len(dados['derrota'])):
        if dados['derrota'][i]['quem'] == nome:
            dados['derrota'][i]['pontos'] += 1

    # salva
    with open(arquivo, 'w') as write_file:
        json.dump(dados, write_file, sort_keys=True, indent=4)

    return redirect('/derrota')

@route('/derrota/zerar')
def derrota_zerar():
    # define os dados
    dados = None

    # nome do arquivo
    arquivo = 'data' + os.sep + 'placar.json'

    # obtem as informações do placar
    with open(arquivo, 'r') as read_file:
        dados = json.load(read_file)

    # percorre os dados
    for i in range(0, len(dados['derrota'])):
        dados['derrota'][i]['pontos'] = 0

    # salva
    with open(arquivo, 'w') as write_file:
        json.dump(dados, write_file, sort_keys=True, indent=4)

    return redirect('/derrota')