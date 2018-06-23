% rebase('layout.tpl', title=title, year=year)

<div>
	<button type="button" class="btn btn-warning pull-right" onclick="window.zerarNinguemLiga('/ninguemliga/zerar');">Zerar</button>
	<h2>{{ title }}</h2>
</div>

<div class="row">
% for i in range(0, len(ninguem_liga)):
	<div class="col-md-4 text-center">
		<h3>{{ ninguem_liga[i]['quem'] }}</h3>
		<h3 style="color: {{ ninguem_liga[i]['cor'] }};">Pontos<br/><small>{{ ninguem_liga[i]['pontos'] }}</small></h4>
		<button type="button" class="btn btn-default btn-lg" style="font-size: 24px;color: {{ ninguem_liga[i]['cor'] }};" onclick="document.location = '/ninguemliga/{{ ninguem_liga[i]['quem'] }}';"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
	</div><!-- ./col-md-4 -->
% end
</div><!-- ./row -->

<script>
	window.zerarNinguemLiga = function(url) {
		window.onConfirmModalYes = function() {
			document.location = url;
		};

		$('#confirmModalText').text('Deseja realmente zerar a pontuação de ninguém liga?');
		$('#confirmModal').modal('show');
	};
</script>