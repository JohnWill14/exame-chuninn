/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.controller.administrador;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
public enum OperacoesSistema {
    SAVE("save"), MOSTRAR_DADOS("show"), ALTERAR("update");
    
    private  String descricao;

    private OperacoesSistema(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }
    
    public String getNome(){
        return this.name();
    }
    
    
    
}
