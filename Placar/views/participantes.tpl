% rebase('layout.tpl', title=title, year=year)

<h2>{{ title }}</h2>

<div class="row">
	<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Registros</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>Quem</th>
								<th style="width: 50px;">Cor</th>
								<th style="width: 70px;">Ações</th>
							</tr>
						</thead>
						<tbody>
							% for i in range(0, len(dados['ninguem_liga'])):
							<tr>
								<td>{{ dados['ninguem_liga'][i]['quem'] }}</td>
								<td><div class="block-color" style="background-color: {{ dados['ninguem_liga'][i]['cor'] }};">&nbsp;</div></td>
								<td>
									<div class="btn-group btn-group-xs">
										<a href="/participantes/{{ dados['ninguem_liga'][i]['quem'] }}" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="Editar"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
										<button type="button" onclick="window.removerParticipante('/participantes/{{ i }}/remover')" class="btn btn-danger" data-toggle="tooltip" data-placement="left" title="Remover"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button>
									</div>
								</td>
							</tr>
							%end
						</tbody>
					</table>
				</div><!-- ./table-responsive -->
			</div><!-- ./panel-body -->
		</div><!-- ./panel -->
	</div><!-- ./col-md-8 -->
	<div class="col-md-4">
		<div class="panel panel-default">
			<div class="panel-heading">
				<%
					# define as variaveis
					acao = 'Novo'
					nome = ''
					cor = ''
				
					if participante != None:
						acao = 'Editar'
						nome = participante['quem']
						cor = participante['cor']
					end
				%>
				<h3 class="panel-title">{{ acao }} Participante</h3>
			</div>
			<form action="/participantes/salvar" method="post">
				<div class="panel-body">
					<input type="hidden" name="index" value="{{ participante_index }}" />
					<div class="form-group">
						<label for="nome">Nome</label>
						<input type="text" id="nome" name="nome" class="form-control" value="{{ nome }}" />
					</div>
					<div class="form-group">
						<label for="cor">Cor</label>
						<input type="color" id="cor" name="cor" class="form-control" value="{{ cor }}" />
					</div>
				</div><!-- ./panel-body -->
				<div class="panel-footer text-right">
					<button type="submit" class="btn btn-primary btn-sm">Salvar</button>
				</div>
			</form>
		</div><!-- ./panel -->
	</div><!-- ./col-md-4 -->
</div><!-- ./row -->

<script>
	window.removerParticipante = function(url) {
		window.onConfirmModalYes = function() {
			document.location = url;
		};

		$('#confirmModalText').text('Deseja realmente remover este participante?');
		$('#confirmModal').modal('show');
	};
</script>