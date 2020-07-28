/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.model;

import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Entity
@Table(name = "modeloVeiculo")
public class ModeloVeiculo extends AbstractEntity{
    @Column(length = 20,nullable = false)
    private String nome;
    @ManyToOne
    @JoinColumn(name = "fabricante_id")
    private Fabricante fabricante;
    public ModeloVeiculo() {
    }

    public ModeloVeiculo(String nome, Fabricante fabricante) {
        this.nome = nome;
        this.fabricante = fabricante;
    }

   

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Fabricante getFabricante() {
        return fabricante;
    }

    public void setFabricante(Fabricante fabricante) {
        this.fabricante = fabricante;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.nome);
        hash = 59 * hash + Objects.hashCode(this.fabricante);
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
        final ModeloVeiculo other = (ModeloVeiculo) obj;
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        if (!Objects.equals(this.fabricante, other.fabricante)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ModeloVeiculo{" + "nome=" + nome + ", fabricante=" + fabricante + '}';
    }

   
    
    
}
