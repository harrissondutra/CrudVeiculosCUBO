package br.com.projetowebjspdao.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Conexao {
	//Vari�veis globais
	private Connection con;
	private Statement s;
	
	//Dados de conex�o
	private final String enderecoFisicoBanco = "jdbc:postgresql://ec2-44-198-214-172.compute-1.amazonaws.com/";
	private final String banco = "d299tttpi6ksca";
	private final String usuario = "tgpmymbkzddnma";
	private final String senha = "4f71c42bbb090746839ac7286d5585b56840a57f2d43a8d19da57efbb101946e";
	private String mensagem;
	
	//m�todo abrir conex�o com o banco
	
	public void conectar() {
		try {
			if (con == null || con.isClosed()){
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection(enderecoFisicoBanco + banco , usuario, senha);
				System.out.println("Conex�o aberta...");
			}
		}catch(Exception e){
			System.out.println("Error: " + e);
		}
	}
	
	//M�todo fechar conex�o com o banco
	public void desconectar() {
		if (con != null) {
			try {
				if(s != null) {
					s.close();
					s = null;
				}
				con.close();
				System.out.println("Conex�o fechada...");
			} catch (Exception e) {
				System.out.println("Error" + e);
			}
		}
	}
	
	//M�todo para executar atualiza��es: Atualizar, deletar, incluir
	
	public int executarAtualizacao(String sql) {
		mensagem = "Sucesso na execu��o.";
		
		try {
			conectar();
			if(s == null) {
				s = con.createStatement();
			}
			//Executando SQL
			
			int rs = s.executeUpdate(sql);
			System.out.println(mensagem);
			desconectar();
			return rs;
		} catch (Exception e) {
			desconectar();
			mensagem = "Error: " + e;
			System.out.println(mensagem);
		}
		return (0);
	}
	
	//M�todo para executar uma consulta passando uma Query
	
	public ResultSet executarConsulta(String sql) {
		mensagem = "Sucesso na execu��o.";
		try {
			if(s == null) {
				s = con.createStatement();
			}
			System.out.println("Executando SQL de consulta");
			//Armazena o resultado da consulta
			ResultSet rs = s.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			mensagem = "Error: "+ e;
			System.out.println(mensagem);
		}
		return null;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	
	
	

}
