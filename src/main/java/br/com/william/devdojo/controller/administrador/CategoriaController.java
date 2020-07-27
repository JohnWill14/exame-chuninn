/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.controller.administrador;

import br.com.william.devdojo.message.Mensagem;
import br.com.william.devdojo.message.TipoDeMensagem;
import br.com.william.devdojo.model.TipoDeVeiculo;
import br.com.william.devdojo.service.TipoDeVeiculoService;
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
@RequestMapping("/adm/categoria")
public class CategoriaController {

    private TipoDeVeiculoService tipoDeVeiculoService;
    private OperacoesSistema operacao;

    @Autowired
    public CategoriaController(TipoDeVeiculoService tipoDeVeiculoService) {
        this.tipoDeVeiculoService = tipoDeVeiculoService;
    }

    @RequestMapping({"/", "/index/", "/{msg}", "/index/{msg}"})
    public String index(@PathVariable(name = "msg", required = false) Integer msg, Model index) {

        //Mensagem do referido problema se não tiver retorna null
        Mensagem mensagem = mensageByNumero(msg);

        index.addAttribute("categorias", tipoDeVeiculoService.getAll());
        index.addAttribute("show", operacao.MOSTRAR_DADOS);
        index.addAttribute("message", mensagem);

        return "adm/categoria";
    }

    /**
     * Retorna uma página para alterar
     *
     * @param id
     * @param update
     * @return
     */
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") long id, Model update) {

        TipoDeVeiculo tipo = null;

        try {
            tipo = tipoDeVeiculoService.getById(id);
        } catch (Exception ex) {

            update.addAttribute("message", new Mensagem("Erro ao buscar categoria de veículo",
                    TipoDeMensagem.ERROR));
        }

        update.addAttribute("tipoVeiculo", tipo);
        update.addAttribute("show", operacao.ALTERAR);

        return "/adm/categoria";
    }

    /**
     * Carrega uma página para criar uma nova categoria
     *
     * @param update
     * @return
     */
    @RequestMapping(value = "/add/")
    public String toSave(Model save) {

        save.addAttribute("show", operacao.SAVE);
        return "/adm/categoria";
    }

    /**
     * Tanto salva quanto atualiza registros de tipo de Veículos
     *
     * @param usuario
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("tipo") TipoDeVeiculo tipo, Model model) {

        String retorno = null;

        if (tipo.getId() == null) {
            retorno = "redirect:/adm/categoria/index/1";
        } else {
            retorno = "redirect:/adm/categoria/index/5";
        }

        try {
            tipoDeVeiculoService.save(tipo);
        } catch (Exception ex) {

            if (tipo.getId() == null) {
                retorno = "redirect:/adm/categoria/index/2";
            } else {
                retorno = "redirect:/adm/categoria/index/6";
            }

            return retorno;
        }

        return retorno;
    }
    
    @ResponseBody
    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") long id) {

        TipoDeVeiculo categoria = new TipoDeVeiculo();

        categoria.setId(id);

        try {
            tipoDeVeiculoService.remove(categoria);
        } catch (Exception ex) {
            ex.printStackTrace();
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
                msg = new Mensagem("Categoria criada com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 2:
                msg = new Mensagem("Não foi possível criar a categoria", TipoDeMensagem.ERROR);
                break;
            //delete
            case 3:
                msg = new Mensagem("Categoria deletada com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 4:
                msg = new Mensagem("Não foi possível deletar a categoria", TipoDeMensagem.ERROR);
                break;

            //alterar
            case 5:
                msg = new Mensagem("Categoria alterada com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 6:
                msg = new Mensagem("Não foi possível alterar a categoria", TipoDeMensagem.ERROR);
                break;

        }
        return msg;

    }

}
