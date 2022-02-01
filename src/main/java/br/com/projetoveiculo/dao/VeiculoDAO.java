package br.com.projetoveiculo.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoveiculo.entity.Veiculo;
import br.com.projetoveiculo.utils.Conexao;

public class VeiculoDAO {
	private final Conexao con = new Conexao();
	private String msgExecucao;
	
	public List<Veiculo> findAll(){
		List<Veiculo> veiculoList = new ArrayList<>();
		Veiculo veiculo;
		
		
		try {
			String sql = "SELECT * FROM veiculo";
			con.conectar();
			ResultSet rs = con.executarConsulta(sql);
			
			while (rs.next()) {
				veiculo = new Veiculo();
				//Preparando a veiculo para ser inserido na lista
				veiculo.setCodigo(rs.getInt(1));
				veiculo.setMarca(rs.getString(2));
				veiculo.setModelo(rs.getString(3));
				//Populando lista de veiculos
				veiculoList.add(veiculo);
			}
			rs.close();
			rs = null;
			con.desconectar();
			System.out.println("-----------------------------");
		} catch (Exception e) {
			con.desconectar();
			System.out.println("Error: " + e);
		}
		return veiculoList;
	}
	
	//Método usado para deletar uma veiculo
	public String delete(Integer codigo) {
		String sql = "DELETE FROM veiculo WHERE vei_codigo = " + codigo;
		con.executarAtualizacao(sql);
		return msgExecucao = "Exclusão " + con.getMensagem();
	}
	
	//Método para inserir uma veiculo
	public String create (Veiculo veiculo) {
		String sql = "INSERT INTO veiculo(vei_marca, vei_modelo)"
				+ "Values('" + veiculo.getMarca().toUpperCase()
				+ "', '" + veiculo.getModelo().toUpperCase() + "')";
		con.executarAtualizacao(sql);
		msgExecucao = "Cadastro! " + con.getMensagem();
		return msgExecucao;
	}
	
	//Método para atualizar uma veiculo
	public String update (Veiculo veiculo) {
		String sql = "UPDATE veiculo SET vei_marca = '" 
				+ veiculo.getMarca().toUpperCase() + "', " + "vei_modelo = '"
				+ veiculo.getModelo().toUpperCase() + "' WHERE vei_codigo = " + veiculo.getCodigo();
		con.executarAtualizacao(sql);
		return msgExecucao = "Atualização! " + con.getMensagem();
		
	}
}
