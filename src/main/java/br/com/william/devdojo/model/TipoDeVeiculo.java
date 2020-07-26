/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.model;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Entity
@Table(name = "veiculo")
public class TipoDeVeiculo extends AbstractEntity{
    @Column(length = 20)
    private String nome;
    
    public TipoDeVeiculo(String nome) {
        this.nome = nome;
    }

    public TipoDeVeiculo() {
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 89 * hash + Objects.hashCode(this.nome);
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
        final TipoDeVeiculo other = (TipoDeVeiculo) obj;
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "TipoDeVeiculo{"+"id="+ id+ "nome=" + nome + '}';
    }

    
    
    
}
