/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.service;

import br.com.william.devdojo.model.ModeloVeiculo;
import br.com.william.devdojo.repository.ModeloVeiculoRepository;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *Serve interfaces para gerenciar a entidade modelo
 * 
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */

@Service
public class ModeloVeiculoService implements ServiceAbstract<ModeloVeiculo, Long> {

    private ModeloVeiculoRepository modeloVeiculoRepository;
    private AutomovelService automovelService;

    @Autowired
    public ModeloVeiculoService(ModeloVeiculoRepository modeloVeiculoRepository, AutomovelService automovelService) {
        this.modeloVeiculoRepository = modeloVeiculoRepository;
        this.automovelService=automovelService;
    }

    @Override
    public void save(ModeloVeiculo entidade) {
        String nome = entidade.getNome();
        if (nome.length() <= 2||nome.length() > 20) {
            //Regra de negócios: limit do nome
            throw new RuntimeException();
        }


        nome = new StringBuilder(nome.toUpperCase()).toString();
        entidade.setNome(nome);

        modeloVeiculoRepository.save(entidade);
    }

    @Override
    public void remove(ModeloVeiculo entidade) {
        if(automovelService.getAll().size()>0)
            throw new RuntimeException("Não foi possível excluir registro");
        
        removeByID(entidade.getId());
    }

    @Override
    public void removeByID(Long id) {
        modeloVeiculoRepository.deleteById(id);
    }

    @Override
    public List<ModeloVeiculo> getAll() {
        List<ModeloVeiculo> lista;
        Iterable<ModeloVeiculo> iterable = modeloVeiculoRepository.findAll();

        lista = StreamSupport.stream(iterable.spliterator(), false)
                .collect(Collectors.toList());
        lista.sort((t1, t2) -> t1.getNome().compareTo(t2.getNome()));
        
        return lista;
    }

    @Override
    public ModeloVeiculo getById(Long id) {
        Optional<ModeloVeiculo> findById = modeloVeiculoRepository.findById(id);
        return findById.get();
    }

}
