/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.message;

/**
 * Auxilia o sistema a empacotar uma String e mostrar para o 
 * usuário determinada msg
 * 
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
public class Mensagem  {
    
    //Msg que será passada para o usuário
    private String mensagem;
    //Natureza da Msg
    private TipoDeMensagem tipoDeMensagem;
    
    
    public Mensagem(String mensagem, TipoDeMensagem tipoDeMensagem) {
        this.mensagem = mensagem;
        this.tipoDeMensagem=tipoDeMensagem;
    }

    public String getMensagem() {
        return mensagem;
    }

    public TipoDeMensagem getTipoDeMensagem() {
        return tipoDeMensagem;
    }
    
    
    
}
