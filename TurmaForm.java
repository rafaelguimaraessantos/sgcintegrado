package br.com.srctreinamentotecnologico.sgcintegrado.turma.struts;


import java.text.ParseException;
import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import br.com.srctreinamentotecnologico.sgcintegrado.turma.model.TurmaPO;
import br.com.srctreinamentotecnologico.sgcintegrado.utilidades.Messages;
import br.com.srctreinamentotecnologico.sgcintegrado.utilidades.Utilidades;

public class TurmaForm extends ActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6017534252924122468L;

	private String codigo;
	private String nomeConta;
	private String cpf;
	private String data;
	private String quantidade;
	

	ArrayList< TurmaPO > listaTurma = new ArrayList< TurmaPO >();


	
	
	
	public String getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getCpf() {
		
		
		return cpf;
	}

	public void setCpf(String cpf) {
		
		this.cpf = cpf;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNomeConta() {
		return nomeConta;
	}

	public void setNomeConta(String nomeConta) {
		this.nomeConta = nomeConta;
	}

	public ArrayList<TurmaPO> getListaTurma() {
		return listaTurma;
	}

	public void setListaTurma(ArrayList<TurmaPO> listaTurma) {
		this.listaTurma = listaTurma;
	}

	public void preencherAgenda( TurmaPO poEncontrado ) throws ParseException {
		this.setCodigo( codigo.toString() );
		this.setNomeConta( poEncontrado.getNomeConta() );
		this.setCpf(poEncontrado.getCpf());
		this.setData(Utilidades.parseDate(poEncontrado.getData(), "dd/MM/yyyy"));
		this.setQuantidade(poEncontrado.getQuantidade().toString());
		
		
		

	}

	public TurmaPO montarPO() throws ParseException {
		TurmaPO po = new TurmaPO();

		if ( !Utilidades.isNuloOuVazio( this.getCodigo() ) ) {
			po.setCodigo( Long.valueOf( this.getCodigo() ) );

		}
		
		if(!Utilidades.isCpfValido(this.getCpf() ) == false ){		
			po.setCpf( this.getCpf() );
				
		}
		
		if(!Utilidades.isNuloOuVazio(this.getData() ) ){	
		
			po.setData(Utilidades.parseDate(this.getData(), "dd/MM/yyyy") );
			
		}
		
		if(!Utilidades.isNuloOuVazio(this.getQuantidade())){
			/*if(!Utilidades.matchesOnlyText(quantidade)){*/
				po.setQuantidade(Integer.valueOf(quantidade));
			/*}*/
			
		}
		
		po.setNomeConta( this.getNomeConta() );
		
		

		return po;
	}

	public void limparCampos() {
		this.setCodigo("");
		this.setNomeConta("");
		this.setCpf("");
		this.setData("");
		this.setQuantidade("");
		
		

	}

}
