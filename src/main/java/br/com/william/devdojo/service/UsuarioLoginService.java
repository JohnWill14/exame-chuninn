/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.service;

import br.com.william.devdojo.model.UsuarioLogin;
import br.com.william.devdojo.repository.UsuarioLoginRepository;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *Serve interfaces para gerenciar a entidade UsuarioLogin
 * 
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Service
public class UsuarioLoginService implements ServiceAbstract<UsuarioLogin, Long> {

    private UsuarioLoginRepository usuarioDao;

    @Autowired
    public UsuarioLoginService(UsuarioLoginRepository usuarioDao) {
        this.usuarioDao = usuarioDao;
    }

    public boolean verificaLogin(String email, String senha) {
        String s = md5(senha);
        Iterable<UsuarioLogin> findAll = usuarioDao.findAll();

        List<UsuarioLogin> collect = StreamSupport.stream(findAll.spliterator(), false)
                .filter(u -> u.getEmail().equals(email) && u.getSenha().equalsIgnoreCase(s))
                .collect(Collectors.toList());
        
        long count = collect.size();
        if (count == 0) {
            return false;
        } else {
            return true;
        }

    }

    public UsuarioLogin getUsuariByEmailPlusPassword(String email, String senha) {
        Iterable<UsuarioLogin> findAll = usuarioDao.findAll();
        String s = md5(senha);
        UsuarioLogin login = StreamSupport.stream(findAll.spliterator(), false)
                .filter(u -> u.getEmail().equals(email) && u.getSenha().equalsIgnoreCase(s))
                .limit(1)
                .findFirst().get();
        return login;

    }

    private static String md5(String texto) {
        MessageDigest m;
        try {
            m = MessageDigest.getInstance("MD5");
            m.update(texto.getBytes(), 0, texto.length());
            BigInteger big = new BigInteger(1, m.digest());
            texto = String.format("%1$032X", big);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UsuarioLoginService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return texto;
    }

    @Override
    public void save(UsuarioLogin entidade) {
        if (entidade.getId() == null) {
            entidade.setSenha(md5(entidade.getSenha()));
        }
        usuarioDao.save(entidade);

    }

    @Override
    public void remove(UsuarioLogin entidade) {
        usuarioDao.delete(entidade);
    }

    @Override
    public void removeByID(Long id) {
        remove(getById(id));
    }

    @Override
    public List<UsuarioLogin> getAll() {
        Iterable<UsuarioLogin> findAll = usuarioDao.findAll();

        return StreamSupport.stream(findAll.spliterator(), false)
                .collect(Collectors.toList());
    }

    @Override
    public UsuarioLogin getById(Long id) {

        return usuarioDao.findById(id).get();
    }

    public void mudaSenha(Long id, String antiga, String nova) {
        UsuarioLogin user=getById(id);
        if(user.getSenha().equalsIgnoreCase(md5(antiga))){
            user.setSenha(md5(nova));
            save(user);
        }else{
            throw new RuntimeException("Erro senha antiga não confere. "+md5(nova));
        }
    }

}
