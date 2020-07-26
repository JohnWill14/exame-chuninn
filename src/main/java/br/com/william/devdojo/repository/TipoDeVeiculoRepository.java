/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.repository;

import br.com.william.devdojo.model.TipoDeVeiculo;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
public interface TipoDeVeiculoRepository extends CrudRepository<TipoDeVeiculo, Long>{
    List<TipoDeVeiculo> findByNome(String nome);
}
