# Placar
App recreativo para controlar os momentos **Ninguém Liga** e **Derrota** no ambiente de trabalho.

## Desenvolvimento e Deploy
Este app foi desenvolvido no Visual Studio Community 2017 e publicado em um servidor IIS, para
fazer o deploy eu tive que instalar no servidor o Python 3.6 e configurar o wfastcgi, fora isso
é necessário habilitar o suporte a CGI no IIS.

* Como instalar o wfastcgi - https://pypi.org/project/wfastcgi/
* Como habilitar o CGI no IIS - https://docs.microsoft.com/en-us/iis/configuration/system.webserver/cgi