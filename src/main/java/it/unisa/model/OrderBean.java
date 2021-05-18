package it.unisa.model;

import java.time.LocalDate;

public class OrderBean {
	private long id;
private long num_ordine;
private float costo_totale;
private String indirizzo_spedizione;
private LocalDate data_spedizione;
private String metodo_di_pagamento;
private String Username;
private LocalDate data_ordine;

public long  getId() {
	return id;
}


public void setId(long l) {
	this.id = l;
}


public long getNum_ordine() {
	return num_ordine;
}
public void setNum_ordine(long num_ordine) {
	this.num_ordine = num_ordine;
}
public float getCosto_totale() {
	return costo_totale;
}
public void setCosto_totale(float costo_totale) {
	this.costo_totale = costo_totale;
}
public String getIndirizzo_spedizione() {
	return indirizzo_spedizione;
}
public void setIndirizzo_spedizione(String indirizzo_spedizione) {
	this.indirizzo_spedizione = indirizzo_spedizione;
}
public LocalDate getData_spedizione() {
	return data_spedizione;
}
public void setData_spedizione(LocalDate data_spedizione) {
	this.data_spedizione = data_spedizione;
}
public String getMetodo_di_pagamento() {
	return metodo_di_pagamento;
}
public void setMetodo_di_pagamento(String metodo_di_pagamento) {
	this.metodo_di_pagamento = metodo_di_pagamento;
}
public String getUsername() {
	return Username;
}
public void setUsername(String username) {
	Username = username;
}
public LocalDate getData_ordine() {
	return data_ordine;
}
public void setData_ordine(LocalDate data_ordine) {
	this.data_ordine = data_ordine;
}

}
