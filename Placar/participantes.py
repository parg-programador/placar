"""
    Participantes da aplicação
"""

from bottle import route, view, redirect
from datetime import datetime
import os, json

@route('/participantes')
@view('participantes')
def participantes():
    # define os dados
    dados = None

    # obtem as informações do placar
    with open('data' + os.sep + 'placar.json') as read_file:
        dados = json.load(read_file)

    """Renders the contact page."""
    return dict(
        title='Participantes',
        dados=dados,
        year=datetime.now().year
    )