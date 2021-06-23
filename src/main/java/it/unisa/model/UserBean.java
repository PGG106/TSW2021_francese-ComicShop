package it.unisa.model;

import java.time.LocalDate;

public class UserBean {
	private String username;
    private String nome;
    private String cognome;
    private String email;
	private String password;
    private String num_tel;
    private String paese_residenza;
    private LocalDate data_nascita;
    private  boolean valid;
    private  boolean admin;
    
    public String getUsername() {
  		return username;
  	}
  	public void setUsername(String username) {
  		this.username = username;
  	}
  	public String getCognome() {
  		return cognome;
  	}
  	public void setCognome(String cognome) {
  		this.cognome = cognome;
    
  	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNum_tel() {
		return num_tel;
	}
	public void setNum_tel(String num_tel) {
		this.num_tel = num_tel;
	}
	public String getPaese_residenza() {
		return paese_residenza;
	}
	public void setPaese_residenza(String paese_residenza) {
		this.paese_residenza = paese_residenza;
	}
	public LocalDate getData_nascita() {
		return data_nascita;
	}
	public void setData_nascita(LocalDate data_nascita) {
		this.data_nascita = data_nascita;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public boolean IsAdmin() {
		
		return admin;
	}
	public void setAdmin(Boolean admin) {
		this.admin=admin;
		
	}
	
	
}

