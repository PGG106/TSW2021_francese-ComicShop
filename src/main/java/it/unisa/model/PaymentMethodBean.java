package it.unisa.model;

import java.time.LocalDate;

public class PaymentMethodBean {
	private int id;
	private int tipo;
	private String titolare;
	private LocalDate scadenza;
	private boolean predefinito;
	private String indirizzo_fatturazione;
	private Long numero;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getTitolare() {
		return titolare;
	}
	public void setTitolare(String titolare) {
		this.titolare = titolare;
	}
	public boolean isPredefinito() {
		return predefinito;
	}
	public void setPredefinito(boolean predefinito) {
		this.predefinito = predefinito;
	}
	public String getIndirizzo_fatturazione() {
		return indirizzo_fatturazione;
	}
	public void setIndirizzo_fatturazione(String indirizzo_fatturazione) {
		this.indirizzo_fatturazione = indirizzo_fatturazione;
	}
	public Long getNumero() {
		return numero;
	}
	public void setNumero(Long numero) {
		this.numero = numero;
	}
	public LocalDate getScadenza() {
		return scadenza;
	}
	public void setScadenza(LocalDate scadenza) {
		this.scadenza = scadenza;
	}
	
	
	

}
