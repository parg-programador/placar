% rebase('layout.tpl', title=title, year=year)

<div class="jumbotron">
    <h1>Placar</h1>
</div>

<div class="row">
	<div class="col-md-6">
	    <h2 class="text-center">Momento Ninguém Liga</h2>
	    <canvas id="ninguem_liga"></canvas>

		<h3>Resumo</h3>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>Quem</th>
						<th>Pontos</th>
					</tr>
				</thead>
				<tbody>
					% for i in range(0, len(dados['ninguem_liga'])):
					<tr>
						<td>{{ dados['ninguem_liga'][i]['quem'] }}</td>
						<td class="text-right">{{ dados['ninguem_liga'][i]['pontos'] }}</td>
					</tr>
					%end
				</tbody>
			</table>
		</div><!-- ./table-responsive -->
	</div><!-- ./col-md-6 -->
	<div class="col-md-6">
	    <h2 class="text-center">Momento Derrota</h2>
	    <canvas id="derrota"></canvas>

		<h3>Resumo</h3>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>Quem</th>
						<th>Pontos</th>
					</tr>
				</thead>
				<tbody>
					% for i in range(0, len(dados['derrota'])):
					<tr>
						<td>{{ dados['derrota'][i]['quem'] }}</td>
						<td class="text-right">{{ dados['derrota'][i]['pontos'] }}</td>
					</tr>
					%end
				</tbody>
			</table>
		</div><!-- ./table-responsive -->
	</div><!-- ./col-md-6 -->
</div>

<script>
	window.pageInit = function() {
		var ctx_ninguem_liga = document.getElementById('ninguem_liga');
		var ctx_derrota = document.getElementById('derrota');

		var myNinguemLiga = new Chart(ctx_ninguem_liga, {
		    type: 'pie',
		    data: {
				datasets: [{
					data: [{{ !ninguem_liga_dados }}],
					backgroundColor: [{{ !ninguem_liga_cores }}],
				}],
				labels: [{{ !ninguem_liga_nomes }}]
			},
		    options: {
				responsive: true,
				animation: {
					animateRotate: true
				}
			}
		});

		var myDerrota = new Chart(ctx_derrota, {
		    type: 'pie',
		    data: {
				datasets: [{
					data: [{{ !derrota_dados }}],
					backgroundColor: [{{ !derrota_cores }}],
				}],
				labels: [{{ !derrota_nomes }}]
			},
		    options: {
				responsive: true,
				animation: {
					animateRotate: true
				}
			}
		});
	};
</script>