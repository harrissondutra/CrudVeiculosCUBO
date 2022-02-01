<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ page import="br.com.projetoveiculo.entity.Veiculo" %>
<jsp:useBean id="veiculoBean" class="br.com.projetoveiculo.bean.VeiculoBean" scope="session"></jsp:useBean>

<%
	String acaoSalvar = request.getParameter("salvar");
	String mensagem = "";
	Veiculo veiculo;
	
	//Armazenando em variáveis, parâmetros recebidos no formulário VeiculoList.jsp
	Integer codigo = Integer.parseInt(request.getParameter("cidCodigo"));
	String marca = (String) request.getParameter("cidMarca");
	String modelo = (String) request.getParameter("cidModelo");
	
	if(acaoSalvar != null){
		//Montando a veiculo a partir dos valores dos formulários
		veiculo = new Veiculo();
		veiculo.setCodigo(codigo);
		veiculo.setMarca(request.getParameter("txtMarca"));
		veiculo.setModelo(request.getParameter("txtModelo"));
		
		//executa o método e retorna a mensagem do servidor
		mensagem = veiculoBean.atualizar(veiculo);
		//exibe a mensagem recebida do servidor
		out.println("<br> <font color='FF0000'>" + mensagem + "</font>");
		
		//verifica se houve atualização dos dados e exibe da mesma forma
		if(!marca.equals(request.getParameter("txtMarca"))){
			marca = request.getParameter("txtMarca");			
		}
		if(!modelo.equals(request.getParameter("txtModelo"))){
		}
	}
	
	%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function voltar() {
		location.href = "VeiculoList.jsp";
	}
</script>
<meta charset="UTF-8">
<title>Atualizar Veículo</title>
</head>
<body>
	<form method="POST">
		<div id="Form">
			<fieldset>
				<legend>Atualizar Veículo</legend>
				<table>
					<tr>
						<td><label for="codigo">Cod: </label></td>
						<td><input type="text" name="txtCodigo" id="codigo" size="6"
							disabled="true" value="<%=codigo%>" /></td>
					<tr>
					<tr>
						<td><label for="marca">Marca: </label></td>
						<td><input type="text" name="txtMarca" id="marca"
							required="true" style="text-transform: uppercase;" value="<%=marca%>" /></td>
					<tr>
						<td><label for="modelo">Modelo: </label></td>
						<td><input type="text" name="txtModelo" id="modelo" required="true"
							style="text-transform: uppercase;"
							value="<%=modelo%>" /></td>
					</tr>
				</table>
				<hr>
				<input type="submit" value="Salvar" name="salvar"> 
				<input type="button" value="Voltar" onClick="voltar()">
			</fieldset>
		</div>
	</form>

</body>
</html>