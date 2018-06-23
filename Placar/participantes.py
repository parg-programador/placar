"""
    Participantes da aplicação
"""

from bottle import route, post, view, redirect, request
from datetime import datetime
import os, json

@route('/participantes')
@route('/participantes/<nome>')
@view('participantes')
def participantes(nome = None):
    # define os dados
    dados = None
    participante = None
    participante_index = -1

    # obtem as informações do placar
    with open('data' + os.sep + 'placar.json', 'r') as read_file:
        dados = json.load(read_file)

    # verifica se é para editar um participante
    if nome != None and len(nome) > 0:
        for i in range(0, len(dados['ninguem_liga'])):
            if dados['ninguem_liga'][i]['quem'] == nome:
                participante = dados['ninguem_liga'][i]
                participante_index = i

    """Renders the contact page."""
    return dict(
        title='Participantes',
        dados=dados,
        participante=participante,
        participante_index=participante_index,
        year=datetime.now().year
    )

@post('/participantes/salvar')
def participantes_salvar(nome = None):
    # obtem os dados
    dados = None
    post_vars = request.forms.decode()
    index = post_vars['index']
    nome = post_vars['nome']
    cor = post_vars['cor']

    # nome do arquivo
    arquivo = 'data' + os.sep + 'placar.json'

    if nome != None and len(nome) > 0 and cor != None and len(cor) > 0:
        # obtem as informações do placar
        with open(arquivo, 'r') as read_file:
            dados = json.load(read_file)

        # verifica se é uma edição
        if index != None and int(index) >= 0:
            dados['ninguem_liga'][int(index)]['quem'] = nome
            dados['ninguem_liga'][int(index)]['cor'] = cor
            dados['derrota'][int(index)]['quem'] = nome
            dados['derrota'][int(index)]['cor'] = cor
        else:
            registro = { 'quem': nome, 'cor': cor, 'pontos': 0 }
            dados['ninguem_liga'].append(registro)
            dados['derrota'].append(registro)

        # ordena por nome os participantes
        def getKeyQuem(target):
            return target['quem']

        dados['ninguem_liga'] = sorted(dados['ninguem_liga'], key=getKeyQuem)
        dados['derrota'] = sorted(dados['derrota'], key=getKeyQuem)

        # salva
        with open(arquivo, 'w') as write_file:
            json.dump(dados, write_file, sort_keys=True, indent=4)

    return redirect('/participantes')

@route('/participantes/<index:int>/remover')
def participantes(index):
    # nome do arquivo
    arquivo = 'data' + os.sep + 'placar.json'

    # obtem as informações do placar
    with open(arquivo, 'r') as read_file:
        dados = json.load(read_file)

    # remove
    del dados['ninguem_liga'][index]
    del dados['derrota'][index]

    # salva
    with open(arquivo, 'w') as write_file:
        json.dump(dados, write_file, sort_keys=True, indent=4)

    return redirect('/participantes')