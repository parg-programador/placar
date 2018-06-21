"""
Routes and views for the bottle application.
"""

from bottle import route, view
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
        ninguem_liga_dados=ninguem_liga_dados,
        ninguem_liga_nomes=ninguem_liga_nomes,
        ninguem_liga_cores=ninguem_liga_cores,
        derrota_dados=derrota_dados,
        derrota_nomes=derrota_nomes,
        derrota_cores=derrota_cores,
        year=datetime.now().year
    )

@route('/participantes')
@view('participantes')
def participantes():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )
