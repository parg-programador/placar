% rebase('layout.tpl', title=title, year=year)

<div>
	<button type="button" class="btn btn-warning pull-right" onclick="window.zerarDerrota('/derrota/zerar');">Zerar</button>
	<h2>{{ title }}</h2>
</div>

<div class="row">
% for i in range(0, len(derrota)):
	<div class="col-md-4 text-center">
		<h3>{{ derrota[i]['quem'] }}</h3>
		<h3 style="color: {{ derrota[i]['cor'] }};">Pontos<br/><small>{{ derrota[i]['pontos'] }}</small></h4>
		<button type="button" class="btn btn-default btn-lg" style="font-size: 24px;color: {{ derrota[i]['cor'] }};" onclick="document.location = '/derrota/{{ derrota[i]['quem'] }}';"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
	</div><!-- ./col-md-4 -->
% end
</div><!-- ./row -->

<script>
	window.zerarDerrota = function(url) {
		window.onConfirmModalYes = function() {
			document.location = url;
		};

		$('#confirmModalText').text('Deseja realmente zerar a pontua��o de derrota?');
		$('#confirmModal').modal('show');
	};
</script>