/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.controller.publico;

import br.com.william.devdojo.message.Mensagem;
import br.com.william.devdojo.message.TipoDeMensagem;
import br.com.william.devdojo.service.UsuarioLoginService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Controller
@RequestMapping("/public/login")
public class LoginController {

    private UsuarioLoginService usuarioLoginService;

    @Autowired
    public LoginController(UsuarioLoginService usuarioLoginService) {
        this.usuarioLoginService = usuarioLoginService;
    }

    public static enum AbaNavegador {
        LOGIN("Sistema de login");

        private String nome;

        private AbaNavegador(String nome) {
            this.nome = nome;
        }

        public String getNome() {
            return nome;
        }

    };

    @RequestMapping({"", "/"})
    public String index(Model model) {
        model.addAttribute("title", AbaNavegador.LOGIN);
        return "public/login";
    }

    @RequestMapping(value = "/logar/", method = RequestMethod.POST)
    public String logar(@RequestParam Map<String, String> allRequestParams, Model model, HttpServletRequest request) {
        String email = allRequestParams.get("email");
        String senhas = allRequestParams.get("senha");
        boolean existUser = usuarioLoginService.verificaLogin(email, senhas);
        if (existUser) {
            request.getSession().setAttribute("usuario", usuarioLoginService.getUsuariByEmailPlusPassword(email, senhas));
            return "redirect:/adm/";
        }
        model.addAttribute("message", new Mensagem("Nenhum usuário encontrado tente novamente", TipoDeMensagem.ERROR)); 
        return "/public/login";
    }
    @RequestMapping({"/logout"})
    public String logout(Model model, HttpServletRequest request) {
         request.getSession().setAttribute("usuario", null);
        return "redirect:/public/";
    }
    
    
    

}
