<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }} - Placar</title>
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
    <script src="/static/scripts/modernizr-2.6.2.js"></script>
</head>

<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/" class="navbar-brand">Placar</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/home">Inicio</a></li>
                    <li><a href="/ninguemliga">Ninguém Liga</a></li>
					<li><a href="/derrota">Derrota</a></li>
					<li><a href="/participantes">Participantes</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container body-content">
        {{!base}}
        <hr />
        <footer>
            <p>&copy; {{ year }} - Placar</p>
        </footer>
    </div>

	<div id="confirmModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header bg-warning">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Você confirma?</h4>
				</div>
				<div class="modal-body">
					<p id="confirmModalText">Deseja realmente executar está ação?</p>
				</div>
				<div class="modal-footer text-right">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Não</button>
					<button type="button" class="btn btn-primary btn-sm" onclick="window.onConfirmModalYes();">Sim</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div class="ajax">
		<h1>Aguarde</h1>
	</div>

    <script src="/static/scripts/jquery-1.10.2.js"></script>
    <script src="/static/scripts/bootstrap.js"></script>
    <script src="/static/scripts/respond.js"></script>
	<script src="/static/scripts/Chart.min.js"></script>

	<script>
		$(document).ready(function() {
			if (window.pageInit !== undefined) {
				window.pageInit();
			}

			// configura os tooltips
			$('[data-toggle="tooltip"]').tooltip();

			// oculta a mensagem de aguarde
			$('div.ajax').hide();
		});

		$(window).on('beforeunload', function() {
			// mostra a mensagem de aguarde
			$('div.ajax').show();
		});
	</script>

</body>
</html>
