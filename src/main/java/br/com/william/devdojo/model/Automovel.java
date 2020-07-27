/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.model;

import java.time.LocalDateTime;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Entity
public class Automovel extends AbstractEntity{
    @Column(length = 60)
    private String nome;
    
    @Column(columnDefinition = "text")
    private String descricao;
    
    private double valor;
    
    
    @ManyToOne
    private ModeloVeiculo modelo;
    
    @ManyToOne
    private TipoDeVeiculo tipo;
    
    private LocalDateTime postagem;
    
    @Column(length = 4)
    private int ano;
    
    @Column(length = 7)
    private int kilometragem;
    
    
    @Column(columnDefinition = "text")
    private String imagens;
    
    @Column(length = 1)
    private int indexTumblr=0;
    
    public Automovel() {
    }

    public Automovel(long id,String nome, String descricao, double valor,  ModeloVeiculo modelo, TipoDeVeiculo tipo, LocalDateTime postagem, int ano, int kilometragem, String imagens, int indexTumblr) {
        this.id=id;
        this.nome = nome;
        this.descricao = descricao;
        this.valor = valor;
        this.modelo = modelo;
        this.tipo = tipo;
        this.postagem = postagem;
        this.ano = ano;
        this.kilometragem = kilometragem;
        this.imagens = imagens;
        this.indexTumblr = indexTumblr;
    }

    public int getIndexTumblr() {
        return indexTumblr;
    }

    public void setIndexTumblr(int indexTumblr) {
        this.indexTumblr = indexTumblr;
    }
    
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public ModeloVeiculo getModelo() {
        return modelo;
    }

    public void setModelo(ModeloVeiculo model) {
        this.modelo = model;
    }

    public TipoDeVeiculo getTipo() {
        return tipo;
    }

    public void setTipo(TipoDeVeiculo tipo) {
        this.tipo = tipo;
    }

    public LocalDateTime getPostagem() {
        return postagem;
    }

    public void setPostagem(LocalDateTime postagem) {
        this.postagem = postagem;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public int getKilometragem() {
        return kilometragem;
    }

    public void setKilometragem(int kilometragem) {
        this.kilometragem = kilometragem;
    }

    public String getImagens() {
        return imagens;
    }

    public void setImagens(String imagens) {
        this.imagens = imagens;
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
        hash = 29 * hash + Objects.hashCode(this.nome);
        hash = 29 * hash + Objects.hashCode(this.descricao);
        hash = 29 * hash + (int) (Double.doubleToLongBits(this.valor) ^ (Double.doubleToLongBits(this.valor) >>> 32));
        hash = 29 * hash + Objects.hashCode(this.modelo);
        hash = 29 * hash + Objects.hashCode(this.tipo);
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
        final Automovel other = (Automovel) obj;
        if (Double.doubleToLongBits(this.valor) != Double.doubleToLongBits(other.valor)) {
            return false;
        }
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        if (!Objects.equals(this.descricao, other.descricao)) {
            return false;
        }
       
        if (!Objects.equals(this.modelo, other.modelo)) {
            return false;
        }
        if (!Objects.equals(this.tipo, other.tipo)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Automovel{" + "nome=" + nome + ", descricao=" + descricao + ", valor=" + valor + ", modelo=" + modelo + ", tipo=" + tipo + ", postagem=" + postagem + ", ano=" + ano + ", kilometragem=" + kilometragem + ", imagens=" + imagens + ", indexTumblr=" + indexTumblr + '}';
    }

    
    
    
}
