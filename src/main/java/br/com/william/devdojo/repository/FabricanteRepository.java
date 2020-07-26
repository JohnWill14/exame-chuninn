/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.repository;

import br.com.william.devdojo.model.Fabricante;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
public interface FabricanteRepository extends CrudRepository<Fabricante, Long>{
    
}
