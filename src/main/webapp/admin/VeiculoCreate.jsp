<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ page import="br.com.projetoveiculo.entity.Veiculo"%>
<jsp:useBean id="veiculoBean" class="br.com.projetoveiculo.bean.VeiculoBean" scope="session" />

<%
String acaoSalvar = request.getParameter("salvar");
String mensagem = "";
Veiculo veiculo;

if(acaoSalvar != null){
	veiculo = new Veiculo();
	veiculo.setMarca(request.getParameter("txtMarca"));
	veiculo.setModelo(request.getParameter("txtModelo"));
	
	mensagem = veiculoBean.criar(veiculo);
	out.println("<br> <font color='FF0000'>" + mensagem + "</font>");
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
<title>Novo Veículo</title>
</head>
<body>
	<form method="POST">
		<div id="cadastro">
			<fieldset>
				<legend>Novo Veiculo</legend>
				<table>
					<tr>
						<td><label for="marca">Marca: </label></td>
						<td><input type="text" name="txtMarca" id="marca"
							required="true" style="text-transform: uppercase;" /></td>
					<tr>
						<td><label for="modelo">Modelo: </label></td>
						<td><input type="text" name="txtModelo" id="uf" required="true"
							style="text-transform: uppercase;" /></td>
					</tr>
					
					<tr>
						<td> 
					</tr>
				</table>
				<hr>
				<input type="submit" value="Salvar" name="salvar">
				 <input	type="reset" value="Limpar"> 
				 <input type="button" value="Voltar" onClick="voltar()">
			</fieldset>
		</div>
	</form>
</body>
</html>