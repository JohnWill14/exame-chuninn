/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Repository
public class FileUtil {

    @Autowired
    private HttpServletRequest request;

    public String saveImagem(String nome, String path, MultipartFile file) {
        if (file.isEmpty()) {
            throw new RuntimeException("Arquivo vazio");
        }
        String extensao = "";
        try {

            String pathUpdates = request.getServletContext().getRealPath(path);
            if (!new File(pathUpdates).exists()) {
                new File(pathUpdates).mkdirs();
            }

            extensao = file.getOriginalFilename();
            extensao = extensao.substring(extensao.indexOf("."), extensao.length());
            formatoSuportado(extensao);
            Path caminho = Paths.get(pathUpdates, nome + extensao);

            file.transferTo(caminho);

        } catch (IOException ex) {
            ex.printStackTrace();
//            throw new RuntimeException("Erro ao salvar arquivo");
        } catch (Exception ex) {
            ex.printStackTrace();
//            throw new RuntimeException("Erro ao salvar arquivo");
        }

        return nome + extensao;

    }

    public void deletImageWithDirectory(String path) {

        try {

            String pathUpdates = request.getServletContext().getRealPath(path);
            
            Path file = Paths.get(pathUpdates);
            if (Files.notExists(file)) {//Se não existir parti para excluir o msm
                file = file.getParent();//Vai para o pai dele
            }
            if (!Files.isDirectory(file)) {//Se não for um diretório exclui o arquivo e vai para a pasta pai
                Files.deleteIfExists(file);
                file = file.getParent();
            }
            Files.deleteIfExists(file);//deleta o pai

        } catch (IOException ex) {
            ex.printStackTrace();
            throw new RuntimeException("Erro ao salvar arquivo");
        } catch (Exception ex) {
            ex.printStackTrace();
           throw new RuntimeException("Erro ao salvar arquivo");
        }

    }
    
    /***
     * Bomberman deleta o diretório
     * @param path 
     */
    public void deleteDirectory(String path) {
        String pathUpdates = request.getServletContext().getRealPath(path);
            
            Path file = Paths.get(pathUpdates);
            
        try(DirectoryStream<Path> ds=Files.newDirectoryStream(file)){
            for(Path p:ds){
                Files.deleteIfExists(p);
            }
             Files.deleteIfExists(file);
        } catch (IOException ex) {
            ex.printStackTrace();
//            throw new RuntimeException("Erro ao salvar arquivo");
        } catch (Exception ex) {
            ex.printStackTrace();
//            throw new RuntimeException("Erro ao salvar arquivo");
        }
       
    }
    
    /***
     * Se a String relacionada com a extensão não conferir na lista
     * o método lança uma exception
     * 
     * @param extensao 
     */
    private void formatoSuportado(String extensao){
        String extensoesPermitidas=".png"+".jpg"+".jpeg"+".jfif";
        
         if(!(extensoesPermitidas.contains(extensao)))
                throw new RuntimeException("formato não suportado");
    }
}
