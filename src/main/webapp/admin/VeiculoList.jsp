<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="veiculoBean" class="br.com.projetoveiculo.bean.VeiculoBean" scope="session" />

<%
	String idExcluir = request.getParameter("idExcluir");
	String mensagem = "";
	
	if (idExcluir != null) {
		mensagem = veiculoBean.deletar(Integer.parseInt(idExcluir));
		out.println("<META HTTP-EQUIV=\"Refresh\" " + "CONTENT=\"0; " + "URL = VeiculoList.jsp \">");
	}
%>

<script type="text/javascript">
	function nova() {
		location.href = "VeiculoCreate.jsp";
	}
	function voltar() {
		location.href = "http://localhost:8080/WebApplicationJSPDAO/index.jsp";
	}
</script>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lista de Veículos</title>
</head>
<body>

	<form method="POST">
		<div id="cadastro">
			<fieldset>
				<legend>Veículos Cadastradas</legend>
				<table border="1">
					<tr>
						<td>COD.</td>
						<td>MARCA</td>
						<td>MODELO</td>
						<td>AÇÃO</td>
					</tr>
                    <c:forEach var="veiculo" items="${veiculoBean.listarTodos()}">
                    <tr>
                    	<td> <c:out value="${veiculo.codigo}" /> </td>
                    	<td> <c:out value="${veiculo.marca}" /> </td>
                    	<td> <c:out value="${veiculo.modelo}" /> </td>
                    	<td> <a href="VeiculoList.jsp?idExcluir=${veiculo.codigo}">Excluir</a>
                    		<a href="VeiculoEdit.jsp?cidCodigo=${veiculo.codigo}&&cidMarca=${veiculo.marca}&&cidModelo=${veiculo.modelo}">Editar</a>
                    		</td> 
                    </tr>
                    </c:forEach>
				</table>
			</fieldset>
		</div>
		<hr />
		<input type="button" value="Novo" onclick="nova()">
		 <input	type="button" value="Voltar" onclick="voltar()">
	</form>
</body>
</html>