/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.controller.administrador;

import br.com.william.devdojo.message.Mensagem;
import br.com.william.devdojo.message.TipoDeMensagem;
import br.com.william.devdojo.model.Fabricante;
import br.com.william.devdojo.service.FabricanteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Controller
@RequestMapping("/adm/fabricante")
public class FabricanteController {

    private FabricanteService fabricanteVeiculoService;
    private OperacoesSistema operacao;

    @Autowired
    public FabricanteController(FabricanteService fabricanteVeiculoService) {
        this.fabricanteVeiculoService = fabricanteVeiculoService;
    }

    @RequestMapping({"/", "/index/", "/{msg}", "/index/{msg}"})
    public String index(@PathVariable(name = "msg", required = false) Integer msg, Model index) {
        Mensagem mensagem = mensageByNumero(msg);
        index.addAttribute("lista", fabricanteVeiculoService.getAll());
        index.addAttribute("show", operacao.MOSTRAR_DADOS);
        index.addAttribute("message", mensagem);

        return "adm/fabricante";
    }
    
    /**
     * Renderiza um página para atualizar fabricante
     * @param id
     * @param update
     * @return 
     */
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") long id, Model update) {
        br.com.william.devdojo.model.Fabricante tipo = null;
        try {
            tipo = fabricanteVeiculoService.getById(id);
        } catch (Exception ex) {
            update.addAttribute("message", new Mensagem("Erro ao buscar fabricante de veículo",
                    TipoDeMensagem.ERROR));
        }
        update.addAttribute("objeto", tipo);
        update.addAttribute("show", operacao.ALTERAR);
        return "/adm/fabricante";
    }

    
    /**
     * Renderiza um página para criar um fabricante
     * @param id
     * @param update
     * @return 
     */
    @RequestMapping(value = "/add/")
    public String toSave(Model update) {

        update.addAttribute("show", operacao.SAVE);
        return "/adm/fabricante";
    }

    /**
     * Cria tanto atualiza fabricante
     * @param modelo
     * @param model
     * @return 
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam("file") MultipartFile file,
            @ModelAttribute("fabricante") Fabricante fabricante, Model model) {

        String retorno = null;
        
        if (fabricante.getId() == null){
            retorno = "redirect:/adm/fabricante/index/1";
        } else {
            retorno = "redirect:/adm/fabricante/index/5";
        }

        try {
            fabricanteVeiculoService.save(fabricante, file);
        } catch (Exception ex) {

            
            model.addAttribute("objeto", fabricante);
        
            if (fabricante.getId() == null) {
                model.addAttribute("message", new Mensagem("Erro ao salvar fabricante de veículo",
                    TipoDeMensagem.ERROR));
                 model.addAttribute("show", OperacoesSistema.SAVE);
            
                 retorno = "/adm/fabricante";
            
            } else {
                
                model.addAttribute("message", new Mensagem("Erro ao atualizar fabricante de veículo",
                    TipoDeMensagem.ERROR));
                model.addAttribute("mostrarForm", true);
                model.addAttribute("show", OperacoesSistema.ALTERAR);
                
                retorno = "/adm/fabricante";
            }
            return retorno;
        }

        return retorno;
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") long id) {
        
        try {
            fabricanteVeiculoService.removeByID(id);
        } catch (Exception ex) {
            return "redirect:/adm/fabricante/index/4";
        }
        return "redirect:/adm/fabricante/index/3";
    }

    /**
     * *
     * A partir de um numero é renderizado uma msg para o usuário, msgs de
     * sucesso ou que deu ruim :/
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
                msg = new Mensagem("Fabricante criado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 2:
                msg = new Mensagem("Não foi possível criar a fabricante", TipoDeMensagem.ERROR);
                break;
            //delete
            case 3:
                msg = new Mensagem("Fabricante deletado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 4:
                msg = new Mensagem("Não foi possível deletar a fabricante", TipoDeMensagem.ERROR);
                break;

            //alterar
            case 5:
                msg = new Mensagem("Fabricante alterado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 6:
                msg = new Mensagem("Não foi possível alterar o fabricante", TipoDeMensagem.ERROR);
                break;

        }
        return msg;

    }

}
