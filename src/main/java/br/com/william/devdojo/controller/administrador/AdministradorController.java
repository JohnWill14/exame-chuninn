/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.controller.administrador;

import br.com.william.devdojo.message.Mensagem;
import br.com.william.devdojo.message.TipoDeMensagem;
import br.com.william.devdojo.model.UsuarioLogin;
import br.com.william.devdojo.service.UsuarioLoginService;
import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Controller
@RequestMapping("/adm")
public class AdministradorController {

    private UsuarioLoginService usuarioLoginService;

    @Autowired
    public AdministradorController(UsuarioLoginService usuarioLoginService) {
        this.usuarioLoginService = usuarioLoginService;
    }
    
    /***
     * 
     * Recebe um parametro optativo 'msg' para renderizar uma
     * mensagem para o cliente
     * 
     * @param msg
     * @param model
     * @return 
     */
    @RequestMapping({"/administrador/", "/adm/", "/adm/index/", "/administrador/{msg}", "/adm/{msg}", "/adm/index/{msg}"})
    public ModelAndView index(@PathVariable(name = "msg", required = false) Integer msg, Model model) {
       
        //Mensagem do referido problema
        Mensagem mensagem = mensageByNumero(msg);
        
        model.addAttribute("message", mensagem);
        model.addAttribute("lista", usuarioLoginService.getAll());
        
        return new ModelAndView("/adm/adm");
    }

    /***
     * Carrega uma página do perfil do usuário 
     * @param model
     * @return 
     */
    @RequestMapping({"/perfil/"})
    public String perfil(Model model) {
        
        return "/adm/perfilUser";
    }

    /**
     * Tanto salva quanto atualiza registros de usuários
     * @param usuario
     * @param model
     * @return 
     */
    @RequestMapping(value = {"/save/"}, method = RequestMethod.POST)
    public String save(@ModelAttribute("usuario") UsuarioLogin usuario, Model model) {
        
        String retorno = null;
        
        if (usuario.getId() == null) {
            retorno = "redirect:/adm/adm/index/1";
        } else {
            retorno = "redirect:/adm/adm/index/5";
        }
        
        try {
            if (usuario.getId() != null) {
                
                String senhaDoBanco = usuarioLoginService.getById(usuario.getId()).getSenha();
                usuario.setSenha(senhaDoBanco);
                
            } else {
                
                //Se o usuário for novo ele cria-o setando a senha dele com o nome no
                //diminutivo e sem espaços
                String semEspaco = Arrays.stream(usuario.getNomeCompleto().split(""))
                        .filter(c->!c.equals(" "))
                        .collect(Collectors.joining());
                
                usuario.setSenha(semEspaco.toLowerCase());
                
            }
            
            usuarioLoginService.save(usuario);
        } catch (Exception ex) {
            ex.printStackTrace();
            
            if (usuario.getId() == null) {

                retorno = "redirect:/adm/adm/index/2";
            } else {

                retorno = "redirect:/adm/adm/index/6";
            }
        }
        return retorno;
    }

    /**
     * Responsável por verificar e atualizar a senha do usuário
     * @param allRequestParams
     * @param model
     * @return 
     */
    @RequestMapping("saveSenha/")
    public String saveSenha(@RequestParam Map<String, String> allRequestParams, Model model) {
        try {
            
            String antiga = allRequestParams.get("senhaAntiga");
            String nova = allRequestParams.get("novaSenha");
            Long id = Long.parseLong(allRequestParams.get("id"));

            usuarioLoginService.mudaSenha(id, antiga, nova);

        } catch (Exception ex) {
            ex.printStackTrace();
            return "redirect:/adm/adm/index/6";
        }

        return "redirect:/adm/adm/5";
    }
    
    /**
     *Deleta o usuário do sistema
     * 
     * @param request
     * @param model
     * @return 
     */
    @RequestMapping({"/excluir"})
    public String excluir(HttpServletRequest request, Model model) {
        
        UsuarioLogin user = (UsuarioLogin) request.getSession().getAttribute("usuario");
        
        try {
            usuarioLoginService.remove(user);
            request.getSession().setAttribute("usuario", null);
        } catch (Exception ex) {
            ex.printStackTrace();
            return "redirect:/adm/adm/index/4";
        }
        return "redirect:/public/";
    }

    /***
     * A partir de um numero é renderizado uma msg para
     * o usuário, msgs de sucesso ou que deu ruim :/
     * 
     * @param num
     * @return 
     */
    private static Mensagem mensageByNumero(Integer num) {
        if (num == null) {
            return null;
        }
        Mensagem msg = null;

        switch (num) {
            //salvar
            case 1:
                msg = new Mensagem("Usuário criado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 2:
                msg = new Mensagem("Não foi possível criar o usuário", TipoDeMensagem.ERROR);
                break;
            //delete
            case 3:
                msg = new Mensagem("Usuário deletado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 4:
                msg = new Mensagem("Não foi possível deletar o usuário", TipoDeMensagem.ERROR);
                break;

            //alterar
            case 5:
                msg = new Mensagem("Usuário alterado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 6:
                msg = new Mensagem("Não foi possível alterar o usuário", TipoDeMensagem.ERROR);
                break;

        }
        return msg;

    }
}
