<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ page import="br.com.projetowebjspdao.entity.Cidade" %>
<jsp:useBean id="cidadeBean" class="br.com.projetowebjspdao.bean.CidadeBean" scope="session"></jsp:useBean>

<%
	String acaoSalvar = request.getParameter("salvar");
	String mensagem = "";
	Cidade cidade;
	
	//Armazenando em variáveis, parâmetros recebidos no formulário CidadeList.jsp
	Integer codigo = Integer.parseInt(request.getParameter("cidCodigo"));
	String descricao = (String) request.getParameter("cidDescricao");
	String uf = (String) request.getParameter("cidUF");
	
	if(acaoSalvar != null){
		//Montando a cidade a partir dos valores dos formulários
		cidade = new Cidade();
		cidade.setCodigo(codigo);
		cidade.setDescricao(request.getParameter("txtDescricao"));
		cidade.setUf(request.getParameter("txtUF"));
		
		//executa o método e retorna a mensagem do servidor
		mensagem = cidadeBean.atualizar(cidade);
		//exibe a mensagem recebida do servidor
		out.println("<br> <font color='FF0000'>" + mensagem + "</font>");
		
		//verifica se houve atualização dos dados e exibe da mesma forma
		if(!descricao.equals(request.getParameter("txtDescricao"))){
			descricao = request.getParameter("txtDescricao");			
		}
		if(!uf.equals(request.getParameter("txtUF"))){
		}
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
<title>Atualizar Cidade</title>
</head>
<body>
	<form method="POST">
		<div id="Form">
			<fieldset>
				<legend>Atualizar Cidade</legend>
				<table>
					<tr>
						<td><label for="codigo">Cod: </label></td>
						<td><input type="text" name="txtCodigo" id="codigo" size="6"
							disabled="true" value="<%=codigo%>" /></td>
					<tr>
					<tr>
						<td><label for="descricao">Descrição: </label></td>
						<td><input type="text" name="txtDescricao" id="descricao"
							required="true" style="text-transform: uppercase;" value="<%=descricao%>" /></td>
					<tr>
						<td><label for="uf">UF: </label></td>
						<td><input type="text" name="txtUF" id="uf" required="true"
							size="2" maxlength="2" style="text-transform: uppercase;"
							value="<%=uf%>" /></td>
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