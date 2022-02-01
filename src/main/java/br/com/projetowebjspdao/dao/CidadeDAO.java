package br.com.projetowebjspdao.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.projetowebjspdao.entity.Cidade;
import br.com.projetowebjspdao.utils.Conexao;

public class CidadeDAO {
	private final Conexao con = new Conexao();
	private String msgExecucao;
	
	public List<Cidade> findAll(){
		List<Cidade> cidadeList = new ArrayList<>();
		Cidade cidade;
		
		
		try {
			String sql = "SELECT * FROM cidade";
			con.conectar();
			ResultSet rs = con.executarConsulta(sql);
			
			while (rs.next()) {
				cidade = new Cidade();
				//Preparando a cidade para ser inserido na lista
				cidade.setCodigo(rs.getInt(1));
				cidade.setDescricao(rs.getString(2));
				cidade.setUf(rs.getString(3));
				//Populando lista de cidades
				cidadeList.add(cidade);
			}
			rs.close();
			rs = null;
			con.desconectar();
			System.out.println("-----------------------------");
		} catch (Exception e) {
			con.desconectar();
			System.out.println("Error: " + e);
		}
		return cidadeList;
	}
	
	//Método usado para deletar uma cidade
	public String delete(Integer codigo) {
		String sql = "DELETE FROM cidade WHERE cid_codigo = " + codigo;
		con.executarAtualizacao(sql);
		return msgExecucao = "Exclusão " + con.getMensagem();
	}
	
	//Método para inserir uma cidade
	public String create (Cidade cidade) {
		String sql = "INSERT INTO cidade(cid_descricao, cid_uf)"
				+ "Values('" + cidade.getDescricao().toUpperCase()
				+ "', '" + cidade.getUf().toUpperCase() + "')";
		con.executarAtualizacao(sql);
		msgExecucao = "Cadastro! " + con.getMensagem();
		return msgExecucao;
	}
	
	//Método para atualizar uma cidade
	public String update (Cidade cidade) {
		String sql = "UPDATE cidade SET cid_descricao = '" 
				+ cidade.getDescricao().toUpperCase() + "', " + "cid_uf = '"
				+ cidade.getUf().toUpperCase() + "' WHERE cid_codigo = " + cidade.getCodigo();
		con.executarAtualizacao(sql);
		return msgExecucao = "Atualização! " + con.getMensagem();
		
	}
}
