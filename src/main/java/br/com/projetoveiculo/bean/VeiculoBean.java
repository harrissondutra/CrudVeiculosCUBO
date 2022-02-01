package br.com.projetoveiculo.bean;

import java.util.List;

import br.com.projetoveiculo.dao.VeiculoDAO;
import br.com.projetoveiculo.entity.Veiculo;

public class VeiculoBean {
	private VeiculoDAO veiculoDao = new VeiculoDAO();
	private Veiculo veiculo = new Veiculo();
	
	public String criar (Veiculo cid){
		return veiculoDao.create(cid);
	}
	
	public List<Veiculo> listarTodos(){
		return veiculoDao.findAll();
	}
	
	public String deletar(Integer codigo) {
		return veiculoDao.delete(codigo);
	}
	
	public String atualizar(Veiculo cid) {
		return veiculoDao.update(cid);
	}

	public VeiculoDAO getVeiculoDao() {
		return veiculoDao;
	}

	public void setVeiculoDao(VeiculoDAO veiculoDao) {
		this.veiculoDao = veiculoDao;
	}

	public Veiculo getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}
	
	
}
