/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.controller.administrador;

import br.com.william.devdojo.message.Mensagem;
import br.com.william.devdojo.message.TipoDeMensagem;
import br.com.william.devdojo.model.ModeloVeiculo;
import br.com.william.devdojo.service.FabricanteService;
import br.com.william.devdojo.service.ModeloVeiculoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Controller
@RequestMapping("/adm/modelo")
public class ModelosController {

    private ModeloVeiculoService modeloVeiculoService;
    private FabricanteService fabricanteService;
    private OperacoesSistema operacao;

    @Autowired
    public ModelosController(ModeloVeiculoService modeloVeiculoService, FabricanteService fabricanteService) {
        this.modeloVeiculoService = modeloVeiculoService;
        this.fabricanteService = fabricanteService;
    }

    @RequestMapping({"/", "/index/", "/{msg}", "/index/{msg}"})
    public String index(@PathVariable(name = "msg", required = false) Integer msg, Model index) {
        Mensagem mensagem = mensageByNumero(msg);
        try {
            index.addAttribute("lista", modeloVeiculoService.getAll());
            index.addAttribute("show", operacao.MOSTRAR_DADOS);
            index.addAttribute("message", mensagem);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "adm/modelo";
    }

    /**
     * Renderiza um página para atualizar modelo
     *
     * @param id
     * @param update
     * @return
     */
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") long id, Model update) {
        ModeloVeiculo modelo = null;
        try {
            modelo = modeloVeiculoService.getById(id);
            update.addAttribute("fabricantes", fabricanteService.getAll());
        } catch (Exception ex) {
            update.addAttribute("message", new Mensagem("Erro ao buscar modelo de veículo",
                    TipoDeMensagem.ERROR));
        }
        update.addAttribute("objeto", modelo);
        update.addAttribute("show", operacao.ALTERAR);
        return "/adm/modelo";
    }

    /**
     * Renderiza um página para criar um modelo
     *
     * @param id
     * @param update
     * @return
     */
    @RequestMapping(value = "/add/")
    public String toSave(Model update) {

        update.addAttribute("show", operacao.SAVE);

        update.addAttribute("fabricantes", fabricanteService.getAll());
        return "/adm/modelo";
    }

    /**
     * Cria tanto atualiza modelo
     *
     * @param modelo
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("modelo") ModeloVeiculo modelo, Model model) {

        String retorno = null;

        if (modelo.getId() == null) {

            retorno = "redirect:/adm/modelo/index/1";
        } else {

            retorno = "redirect:/adm/modelo/index/5";
        }
        try {
            modeloVeiculoService.save(modelo);
        } catch (Exception ex) {
            if (modelo.getId() == null) {
                retorno = "redirect:/adm/modelo/index/2";
            } else {
                retorno = "redirect:/adm/modelo/index/6";
            }

            return retorno;
        }

        return retorno;
    }

    @ResponseBody
    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") long id) {

        try {
            ModeloVeiculo modelo = modeloVeiculoService.getById(id);
            modeloVeiculoService.remove(modelo);
        } catch (Exception ex) {
            return "erro";
        }
        return "ok";
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
                msg = new Mensagem("Modelo criado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 2:
                msg = new Mensagem("Não foi possível criar a modelo", TipoDeMensagem.ERROR);
                break;
            //delete
            case 3:
                msg = new Mensagem("Modelo deletado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 4:
                msg = new Mensagem("Não foi possível deletar a modelo", TipoDeMensagem.ERROR);
                break;

            //alterar
            case 5:
                msg = new Mensagem("Modelo alterado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 6:
                msg = new Mensagem("Não foi possível alterar o modelo", TipoDeMensagem.ERROR);
                break;

        }
        return msg;

    }

}
