/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.model;

import java.util.Objects;
import java.util.logging.Logger;
import javax.persistence.Entity;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Entity
public class UsuarioLogin extends AbstractEntity{
    private String nomeCompleto;
    private String email;
    private String senha;

    public UsuarioLogin() {
    }

    public UsuarioLogin(String nomeCompleto, String email, String senha) {
        this.nomeCompleto = nomeCompleto;
        this.email = email;
        this.senha = senha;
    }
    public UsuarioLogin(long id,String nomeCompleto, String email, String senha) {
        this.id=id;
        this.nomeCompleto = nomeCompleto;
        this.email = email;
        this.senha = senha;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.nomeCompleto);
        hash = 59 * hash + Objects.hashCode(this.email);
        hash = 59 * hash + Objects.hashCode(this.senha);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final UsuarioLogin other = (UsuarioLogin) obj;
        if (!Objects.equals(this.nomeCompleto, other.nomeCompleto)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.senha, other.senha)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "UsuarioLogin{" + "nomeCompleto=" + nomeCompleto + ", email=" + email + ", senha=" + senha + '}';
    }
    
    
}
