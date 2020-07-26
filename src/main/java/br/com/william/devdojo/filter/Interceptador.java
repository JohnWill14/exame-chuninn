/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *  Interceptador para bloquear usuários não permitidos
 * 
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Component
public class Interceptador extends HandlerInterceptorAdapter{
    /***
     * Filtra usuários para acesso do setor administrativo
     * 
     * @param request
     * @param response
     * @param handler
     * @return boolean
     * @throws Exception 
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
        //URI que o usuário fez a requisição
        String requestURI = request.getRequestURI();
        
//        Se a URI não conter adm o usuário poderá acessar o sistema
        if(!requestURI.contains("adm")||requestURI.contains("login")){
            return true;
        }
        
        //Caso o usuário tente acessar o setor administrativo será verificado se há algum
        //usuário na seção
        
        HttpSession session = request.getSession();
        
        //Caso haja usuário o cliente acessará o sistema
        if(session.getAttribute("usuario")!=null) return true;
        
//     Caso o usuário não esteja logado será empurrado para o login
        response.sendRedirect(request.getContextPath()+"/public/login/");
        return false;
    }

   
    
}
