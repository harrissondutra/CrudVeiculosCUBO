<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ page import="br.com.projetowebjspdao.entity.Cidade"%>
<jsp:useBean id="cidadeBean" class="br.com.projetowebjspdao.bean.CidadeBean" scope="session" />

<%
String acaoSalvar = request.getParameter("salvar");
String mensagem = "";
Cidade cidade;

if(acaoSalvar != null){
	cidade = new Cidade();
	cidade.setDescricao(request.getParameter("txtDescricao"));
	cidade.setUf(request.getParameter("txtUF"));
	
	mensagem = cidadeBean.criar(cidade);
	out.println("<br> <font color='FF0000'>" + mensagem + "</font>");
}

%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function voltar() {
		location.href = "CidadeList.jsp";
	}
</script>

<meta charset="UTF-8">
<title>Nova Cidade</title>
</head>
<body>
	<form method="POST">
		<div id="cadastro">
			<fieldset>
				<legend>Nova Cidade</legend>
				<table>
					<tr>
						<td><label for="descricao">Descrição: </label></td>
						<td><input type="text" name="txtDescricao" id="descricao"
							required="true" style="text-transform: uppercase;" /></td>
					<tr>
						<td><label for="uf">UF: </label></td>
						<td><input type="text" name="txtUF" id="uf" required="true"
							size="2" maxlength="2" style="text-transform: uppercase;" /></td>
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