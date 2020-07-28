/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.controller.administrador;

import br.com.william.devdojo.message.Mensagem;
import br.com.william.devdojo.message.TipoDeMensagem;
import br.com.william.devdojo.model.Automovel;
import br.com.william.devdojo.model.Fabricante;
import br.com.william.devdojo.model.ModeloVeiculo;
import br.com.william.devdojo.model.TipoDeVeiculo;
import br.com.william.devdojo.service.AutomovelService;
import br.com.william.devdojo.service.FabricanteService;
import br.com.william.devdojo.service.ModeloVeiculoService;
import br.com.william.devdojo.service.TipoDeVeiculoService;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Controller
@RequestMapping("/adm/automovel")
public class AutomovelController {

    private AutomovelService automovelService;
    private FabricanteService fabricanteService;
    private ModeloVeiculoService modeloVeiculoService;
    private TipoDeVeiculoService tipoDeVeiculo;
    private OperacoesSistema operacao;

    @Autowired
    public AutomovelController(AutomovelService automovelService, FabricanteService fabricanteService, ModeloVeiculoService modeloVeiculoService, TipoDeVeiculoService tipoDeVeiculo) {
        this.automovelService = automovelService;
        this.fabricanteService = fabricanteService;
        this.modeloVeiculoService = modeloVeiculoService;
        this.tipoDeVeiculo = tipoDeVeiculo;
    }

    @RequestMapping({"/", "/index/", "/{msg}", "/index/{msg}"})
    public String index(@PathVariable(name = "msg", required = false) Integer msg, Model index) {

        //Mensagem do referido problema se não tiver retorna null
        Mensagem mensagem = mensageByNumero(msg);

        index.addAttribute("lista", automovelService.getAll());
        index.addAttribute("show", operacao.MOSTRAR_DADOS);
        index.addAttribute("message", mensagem);

        return "adm/automovel";
    }

    /**
     * Página de update
     *
     * @param id
     * @param update
     * @return
     */
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") long id, Model update) {
        Automovel tipo = null;

        try {
            tipo = automovelService.getById(id);
        } catch (Exception ex) {
            update.addAttribute("message", new Mensagem("Erro ao buscar automovel de veículo",
                    TipoDeMensagem.ERROR));
        }

        update.addAttribute("objeto", tipo);
        update.addAttribute("show", operacao.ALTERAR);

        update.addAttribute("fabricantes", fabricanteService.getAll());
        update.addAttribute("modelos", modeloVeiculoService.getAll());
        update.addAttribute("categorias", tipoDeVeiculo.getAll());
        update.addAttribute("listaImagem", Arrays.stream(tipo.getImagens().split(","))
                .map(s -> s.substring(s.lastIndexOf('/') + 1, s.length()))
                .collect(Collectors.toList())
        );

        return "/adm/automovel";
    }

    /**
     * Página de salvar
     *
     * @param update
     * @return
     */
    @RequestMapping(value = "/add/")
    public String toSave(Model salvar) {

        salvar.addAttribute("show", operacao.SAVE);
        salvar.addAttribute("automovel", new Automovel());

        salvar.addAttribute("fabricantes", fabricanteService.getAll());
        salvar.addAttribute("modelos", modeloVeiculoService.getAll());
        salvar.addAttribute("categorias", tipoDeVeiculo.getAll());

        return "/adm/automovel";
    }

    /**
     * Tanto salva quanto atualiza registros de automóveis
     *
     * @param usuario
     * @param model
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam("file") MultipartFile files[],
            @RequestParam Map<String, String> allRequestParams, Model model) {

        Automovel auto = new Automovel();
        if (allRequestParams.containsKey("id")) {//Caso seje uma operação de atualizar
            auto = automovelService.getById(Long.parseLong(allRequestParams.get("id")));
        }

        String retorno = null;

        if (auto.getId() == null) {
            retorno = "redirect:/adm/automovel/index/1";
        } else {
            retorno = "redirect:/adm/automovel/index/5";
        }

        try {

            //Não consegui pegar um obj Automovel completo no parametro do método :/
            auto.setNome(allRequestParams.get("nome"));
            auto.setAno(Integer.parseInt(allRequestParams.get("ano")));
            auto.setKilometragem(Integer.parseInt(allRequestParams.get("kilometragem")));
            auto.setModelo(modeloVeiculoService.getById(Long.parseLong(allRequestParams.get("modelo"))));
            auto.setTipo(tipoDeVeiculo.getById(Long.parseLong(allRequestParams.get("tipo"))));
            auto.setValor(Double.parseDouble(allRequestParams.get("valor")));
            auto.setDescricao(allRequestParams.get("descricao"));
            List<String> nomes = Arrays.stream(files).map(f -> f.getOriginalFilename()).collect(Collectors.toList());

            if (allRequestParams.containsKey("tumblr")) {
                int indexTumblr = Integer.parseInt(allRequestParams.get("tumblr"));
                auto.setIndexTumblr(indexTumblr);
            }
            auto.setPostagem(LocalDateTime.now());
            auto.setImagens(allRequestParams.get("imagens"));

            automovelService.save(auto, files);
        } catch (Exception ex) {

            model.addAttribute("objeto", auto);
            model.addAttribute("fabricantes", fabricanteService.getAll());
            model.addAttribute("modelos", modeloVeiculoService.getAll());
            model.addAttribute("categorias", tipoDeVeiculo.getAll());

            if (auto.getId() == null) {
                model.addAttribute("message", new Mensagem("Erro ao salvar altomóvel",
                        TipoDeMensagem.ERROR));
                model.addAttribute("show", OperacoesSistema.SAVE);
                retorno = "/adm/automovel";

            } else {
                model.addAttribute("message", new Mensagem("Erro ao atualizar altomóvel",
                        TipoDeMensagem.ERROR));
                model.addAttribute("mostrarForm", true);
                model.addAttribute("show", OperacoesSistema.ALTERAR);
                retorno = "/adm/automovel";

            }
        }

        return retorno;

    }
    
    @ResponseBody
    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") long id) {

        try {

            automovelService.removeByID(id);
        } catch (Exception ex) {

            return "erro";
        }

        return "ok";
    }
    
    @ResponseBody
    @RequestMapping(value = "/modelosByTipo/{id}", method = RequestMethod.GET)
    public List<ModeloVeiculo> getModelosByCategoria(@PathVariable("id") Long id) {
        List<ModeloVeiculo> lista=null;
        try {
            Fabricante fabricante;
            fabricante = fabricanteService.getById(id);
            lista = modeloVeiculoService.getAll()
                    .stream()
                    .filter(modelo->modelo.getFabricante().equals(fabricante))
                    .collect(Collectors.toList());
            
        } catch (Exception ex) {
            ex.printStackTrace();
            
        }

        return lista;
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
                msg = new Mensagem("Automovel criado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 2:
                msg = new Mensagem("Não foi possível criar a automovel", TipoDeMensagem.ERROR);
                break;
            //delete
            case 3:
                msg = new Mensagem("Automovel deletado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 4:
                msg = new Mensagem("Não foi possível deletar a automovel", TipoDeMensagem.ERROR);
                break;

            //alterar
            case 5:
                msg = new Mensagem("Automovel alterado com sucesso", TipoDeMensagem.SUCESSO);
                break;
            case 6:
                msg = new Mensagem("Não foi possível alterar o automovel", TipoDeMensagem.ERROR);
                break;

        }
        return msg;

    }

}
