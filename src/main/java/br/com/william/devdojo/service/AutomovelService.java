/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.service;

import br.com.william.devdojo.model.Automovel;
import br.com.william.devdojo.model.TipoDeVeiculo;
import br.com.william.devdojo.util.FileUtil;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import br.com.william.devdojo.repository.AutomovelRepository;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * Serve interfaces para gerenciar a entidade Automovel
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Service
public class AutomovelService implements ServiceAbstract<Automovel, Long> {

    private AutomovelRepository automovelRepository;
    private FileUtil fileUtil;//Responsável por salvar imgs
    private static String diretoriosImg = "/imagens/automoveis/";

    @Autowired
    public AutomovelService(AutomovelRepository automovelRepository, FileUtil fileUtil) {
        this.automovelRepository = automovelRepository;
        this.fileUtil = fileUtil;
    }

    @Override
    public void save(Automovel entidade) {
        automovelRepository.save(entidade);
    }

    public void save(Automovel entidade, MultipartFile[] files) {
        //Alem de salvar o objeto no banco salva as imagens no sistema

        try {

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-mm");
            String data = entidade.getPostagem().format(formatter);//Pega a dataFormatada

            String repositorio;//Repositório de imgs

            repositorio = diretoriosImg + entidade.getTipo().getNome() + "/" + entidade.getNome() + data;

            if (entidade.getId() != null) {//Se o objto já foi persistido e irá ser atualizado
                if (files.length > 1 || !files[0].getOriginalFilename().equals(""))//Existência de novas imgs 
                {
                    if (!entidade.getImagens().equals("")) {//Caso haja novas imgs
                        repositorio = getRepositorioImg(entidade);
                        fileUtil.deleteDirectory(repositorio);
                    }
                }
            }

            int cont = 0;
            String imagens = "";
            
            for (MultipartFile file : files) {

                if (!file.getOriginalFilename().equals("")) {
                    
                    String fileOrig = file.getOriginalFilename();//NOme original da img
                    
                    //Salva img em uma pasta repositorio da aplicação
                    String arquivo = fileUtil.saveImagem(fileOrig.substring(0, fileOrig.indexOf(".")), repositorio, file);
                    imagens += repositorio + "/" + arquivo + ",";
                }
            }
            if (files.length > 1 || !files[0].getOriginalFilename().equals("")) {//Existência de novas imgs 
                entidade.setImagens(imagens);
            }

            save(entidade);//Salva objeto no banco
            
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex.getMessage());
        }
    }

    @Override
    public void remove(Automovel entidade) {
        fileUtil.deleteDirectory(getRepositorioImg(entidade));//Deleta os arquivos de img
        automovelRepository.delete(entidade);
    }

    @Override
    public void removeByID(Long id) {
        Automovel findById;
        try {
            findById = automovelRepository.findById(id).get();
        } catch (Exception ex) {
            throw new RuntimeException("Não foi possível encontrar registro");
        }
        remove(findById);
    }

    @Override
    public List<Automovel> getAll() {
        List<Automovel> lista;
        
        Iterable<Automovel> iterable = automovelRepository.findAll();

        lista = StreamSupport.stream(iterable.spliterator(), false)
                .collect(Collectors.toList());
        
        lista.sort((t1, t2) -> t1.getNome().compareTo(t2.getNome()));

        return lista;
    }

    public List<Automovel> getAllRecentes(int limit) {
        //Devolve os limit primeiros registros mais novos cadastrados
        
        List<Automovel> lista = getAll();

        List<Automovel> automovelOrdenado = lista.stream()
                .sorted(Comparator.comparing(Automovel::getPostagem).reversed())
                .limit(limit)
                .collect(Collectors.toList());

        return automovelOrdenado;
    }

    public Map<TipoDeVeiculo, List<Automovel>> getAllByCategorias(int limit) {
        List<Automovel> lista = getAll();

        Map<TipoDeVeiculo, List<Automovel>> automovelAgrupado = lista.stream()
                .collect(Collectors.groupingBy(Automovel::getTipo,
                        Collectors.collectingAndThen(
                                Collectors.toList(),
                                l -> l.stream().limit(limit).collect(Collectors.toList()))));

        return automovelAgrupado;
    }

    public List<Automovel> getByCategoria(TipoDeVeiculo categoria) {
        
        List<Automovel> lista = getAll();

        List<Automovel> listaComCategoriaSelecionada = lista.stream()
                .filter(c -> c.getTipo().equals(categoria))
                .collect(Collectors.toList());

        return listaComCategoriaSelecionada;
    }

    public List<Automovel> getByString(String pesquisa) {
        
        List<Automovel> lista = getAll();
        
        StringBuffer sb = new StringBuffer(pesquisa.toLowerCase());
        
        List<Automovel> listaContemPesquisa = lista.stream()
                .filter(c -> c.getNome().toLowerCase().contains(sb))
                .collect(Collectors.toList());

        return listaContemPesquisa;
    }

    @Override
    public Automovel getById(Long id) {
        Optional<Automovel> findById = automovelRepository.findById(id);
        return findById.get();
    }

    public static String getDiretoriosImg() {
        return diretoriosImg;
    }

    private static String getRepositorioImg(Automovel auto) {
        //Devolve a pasta onde está sendo salva as img de um objeto
        
        String firstFile = auto.getImagens().split(",")[0];
        String repositorioImg = firstFile.substring(0, firstFile.lastIndexOf("/"));
        return repositorioImg;
    }
}
