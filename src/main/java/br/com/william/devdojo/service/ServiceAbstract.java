/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.service;

import java.util.List;

/**
 * Serve uma interface para outros services :)
 * 
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
public interface ServiceAbstract <T,L> {
    
    public void save(T entidade);
    public void remove(T entidade);
    public void removeByID(L id);
    public List<T> getAll();
    public T getById(L id);
    
}
