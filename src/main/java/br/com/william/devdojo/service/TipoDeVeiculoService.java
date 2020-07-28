/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.service;

import br.com.william.devdojo.model.TipoDeVeiculo;
import br.com.william.devdojo.repository.TipoDeVeiculoRepository;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *Serve interfaces para gerenciar a entidade TipoDeVeiculo, 'categoria'
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */

@Service
public class TipoDeVeiculoService implements ServiceAbstract<TipoDeVeiculo, Long> {

    private TipoDeVeiculoRepository tipoDeVeiculoRepository;
    private AutomovelService automovelService;

    @Autowired
    public TipoDeVeiculoService(TipoDeVeiculoRepository tipoDeVeiculoRepository, AutomovelService automovelService) {
        this.tipoDeVeiculoRepository = tipoDeVeiculoRepository;
        this.automovelService=automovelService;
    }

    @Override
    public void save(TipoDeVeiculo entidade) {
        
        String nome = entidade.getNome();
        if (nome.length() <= 2) {
            throw new RuntimeException();
        }

        char[] numeros = {
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
        };
        for (char c : numeros) {
            if (nome.contains(c + "")) {
                //Verificar se o nome tem digitos e se tiver lançar uma exception
                throw new RuntimeException();
            }
        }

        nome = new StringBuilder(nome.toLowerCase()).toString();
        entidade.setNome(nome);

        tipoDeVeiculoRepository.save(entidade);
    }

    @Override
    public void remove(TipoDeVeiculo entidade) {
         if(automovelService.getAll().size()>0)
            throw new RuntimeException("Não foi possível excluir registro");
        
        removeByID(entidade.getId());
    }

    @Override
    public void removeByID(Long id) {
        tipoDeVeiculoRepository.deleteById(id);
    }

    @Override
    public List<TipoDeVeiculo> getAll() {
        
        List<TipoDeVeiculo> lista;
        Iterable<TipoDeVeiculo> iterable = tipoDeVeiculoRepository.findAll();

        lista = StreamSupport.stream(iterable.spliterator(), false)
                .collect(Collectors.toList());
        lista.sort((t1, t2) -> t1.getNome().compareTo(t2.getNome()));
     
        return lista;
    }

    @Override
    public TipoDeVeiculo getById(Long id) {
        Optional<TipoDeVeiculo> findById = tipoDeVeiculoRepository.findById(id);
        return findById.get();
    }

}
