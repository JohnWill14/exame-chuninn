/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.service;

import br.com.william.devdojo.model.Fabricante;
import br.com.william.devdojo.util.FileUtil;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import br.com.william.devdojo.repository.FabricanteRepository;
import org.springframework.stereotype.Service;

/**
 *Serve interfaces para gerenciar a entidade Fabricantes
 * 
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Service
public class FabricanteService implements ServiceAbstract<Fabricante, Long> {

    private FabricanteRepository fabricanteRepository;
    private ModeloVeiculoService modeloVeiculoService;
    private FileUtil fileUtil;//Gerencia imgs
    private static String diretoriosImg="/imagens/fabricantes/";

    @Autowired
    public FabricanteService(FabricanteRepository fabricanteRepository, FileUtil fileUtil, ModeloVeiculoService modeloVeiculoService) {
        this.fabricanteRepository = fabricanteRepository;
        this.fileUtil = fileUtil;
        this.modeloVeiculoService=modeloVeiculoService;
    }

    @Override
    public void save(Fabricante entidade) {
        String nome = entidade.getNome();
        
        if (nome.length() <= 2 || nome.length() > 20) {
            //Regra de negócios: limit do nome
            throw new RuntimeException();
        }

        nome = new StringBuilder(nome.toUpperCase()).toString();
        entidade.setNome(nome);

        fabricanteRepository.save(entidade);
    }

    public void save(Fabricante entidade, MultipartFile file) {
        
        try {
            if(!file.getOriginalFilename().equals("")||entidade.getId()==null){
                //Se há imgs enviadas pelo usuário
                
                String nome = entidade.getNome();
                fileUtil.deleteDirectory(diretoriosImg+entidade.getNome());
                String arquivo = fileUtil.saveImagem(nome.toUpperCase(), diretoriosImg + nome, file);
                entidade.setLogo(nome + "/" + arquivo);
                
            }
            save(entidade);
        } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }

    @Override
    public void remove(Fabricante entidade) {
        
        if(modeloVeiculoService.getAll().size()>0)
            throw new RuntimeException("Não foi possível excluir registro");
        
        //Deleta os diretório de imgs de um objeto
        fileUtil.deletImageWithDirectory(diretoriosImg+entidade.getLogo());
        
        fabricanteRepository.delete(entidade);

    }

    @Override
    public void removeByID(Long id) {
        
        Fabricante findById;
        try {
            findById = fabricanteRepository.findById(id).get();
        } catch (Exception ex) {
            throw new RuntimeException("Não foi possível encontrar registro");
        }
        remove(findById);
    }

    @Override
    public List<Fabricante> getAll() {
        
        List<Fabricante> lista;
        Iterable<Fabricante> iterable = fabricanteRepository.findAll();

        lista = StreamSupport.stream(iterable.spliterator(), false)
                .collect(Collectors.toList());
        lista.sort((t1, t2) -> t1.getNome().compareTo(t2.getNome()));

        return lista;
    }

    @Override
    public Fabricante getById(Long id) {
        Optional<Fabricante> findById = fabricanteRepository.findById(id);
        return findById.get();
    }

    public static String getDiretoriosImg() {
        return diretoriosImg;
    }

    
    
}
