/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.william.devdojo.controller.publico;

import br.com.william.devdojo.message.Mensagem;
import br.com.william.devdojo.message.TipoDeMensagem;
import br.com.william.devdojo.model.Automovel;
import br.com.william.devdojo.model.TipoDeVeiculo;
import br.com.william.devdojo.service.AutomovelService;
import br.com.william.devdojo.service.FabricanteService;
import br.com.william.devdojo.service.TipoDeVeiculoService;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author John William Vicente <johnwill.v.2017@gmail.com>
 */
@Controller
@RequestMapping("/public/")
public class PublicoController {

    private final TipoDeVeiculoService veiculoTipoDao;
    private final FabricanteService fabricantesService;
    private final AutomovelService automovelService;

    @Autowired
    public PublicoController(TipoDeVeiculoService veiculoDao, FabricanteService fabricantesService1, AutomovelService automovelService) {
        this.veiculoTipoDao = veiculoDao;
        this.fabricantesService = fabricantesService1;
        this.automovelService = automovelService;
    }

    public static enum AbaNavegador {
        INDEX("DEVCAR"), 
        SOBRE("Quem somos"), 
        PRODUTOS("Todos os produtos"), 
        CONSULTA("Consulta"), 
        VENDO_PRODUTO("Produto consultado");

        private String nome;

        private AbaNavegador(String nome) {
            this.nome = nome;
        }

        public String getNome() {
            return nome;
        }

    };

    @RequestMapping({"/", "/index"})
    public String index(Model index) {
        index.addAttribute("title", AbaNavegador.INDEX);

        index.addAttribute("categoria", veiculoTipoDao.getAll());
        index.addAttribute("listaMarcas", fabricantesService.getAll());
        index.addAttribute("carros", automovelService.getAllRecentes(6));
        return "welcome";
    }

    @RequestMapping("/produtosAll")
    public String produtos(Model produtos) {
        produtos.addAttribute("title", AbaNavegador.PRODUTOS);
        produtos.addAttribute("categoria", veiculoTipoDao.getAll());
        produtos.addAttribute("produtosAgrupados", automovelService.getAllByCategorias(3));
        return "public/produtos";
    }

    @RequestMapping("/produtosCategoria/{id}")
    public String produtosCategoria(@PathVariable("id") long id, Model produtos) {
        produtos.addAttribute("title", AbaNavegador.PRODUTOS);
        produtos.addAttribute("categoria", veiculoTipoDao.getAll());
        TipoDeVeiculo categoria = veiculoTipoDao.getById(id);
        produtos.addAttribute("categoriaSelecionada", categoria);
        produtos.addAttribute("produtos", automovelService.getByCategoria(categoria));
        return "public/searchprodutos";
    }

    @RequestMapping(path = "/pesquisa/{pesquisa}", method = RequestMethod.GET)
    public String produtosPesquisa(@PathVariable("pesquisa") String pesquisa, Model produtos) {
        produtos.addAttribute("title", AbaNavegador.PRODUTOS);
        produtos.addAttribute("categoria", veiculoTipoDao.getAll());
        produtos.addAttribute("pesquisa", pesquisa);
        produtos.addAttribute("produtos", automovelService.getByString(pesquisa));
        return "public/searchprodutos";
    }

    @RequestMapping("/sobre")
    public String sobre(Model sobre) {
        sobre.addAttribute("title", AbaNavegador.SOBRE);
        return "public/sobre";
    }

    @RequestMapping("/produto/{id}")
    public String produto(@PathVariable("id") Long id, Model produto) {
        produto.addAttribute("title", AbaNavegador.VENDO_PRODUTO);
        produto.addAttribute("categoria", veiculoTipoDao.getAll());
        
        
        try {
            Automovel produtoSelecionado = automovelService.getById(id);
            produto.addAttribute("produto", produtoSelecionado);
            produto.addAttribute("produtosSemelhantes", 
                    automovelService.getByCategoria(produtoSelecionado.getTipo())
                    .stream()
                    .filter(c->c.getId()!=produtoSelecionado.getId())
                    .limit(3)
                    .collect(Collectors.toList())
            );
        } catch (Exception ex) {

            produto.addAttribute("message", new Mensagem("Produto não encontrado", TipoDeMensagem.ERROR));
        }
        return "public/produto";
    }
}
