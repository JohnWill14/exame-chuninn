-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 28-Jul-2020 às 10:21
-- Versão do servidor: 5.7.28-0ubuntu0.16.04.2
-- PHP Version: 7.0.33-0ubuntu0.16.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devcar`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `automovel`
--
DROP DATABASE IF EXISTS devcar;
create database devcar;
use devcar;
CREATE TABLE `automovel` (
  `id` bigint(20) NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `descricao` text,
  `imagens` text,
  `index_tumblr` int(11) DEFAULT NULL,
  `kilometragem` int(11) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `postagem` datetime DEFAULT NULL,
  `valor` double NOT NULL,
  `modelo_id` bigint(20) DEFAULT NULL,
  `tipo_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `automovel`
--

INSERT INTO `automovel` (`id`, `ano`, `descricao`, `imagens`, `index_tumblr`, `kilometragem`, `nome`, `postagem`, `valor`, `modelo_id`, `tipo_id`) VALUES
(1, 2020, '<p><strong>Ferrari</strong>&nbsp;&eacute; uma fabricante&nbsp;<a href="https://pt.wikipedia.org/wiki/It%C3%A1lia">italiana</a>&nbsp;de&nbsp;<a href="https://pt.wikipedia.org/wiki/Carros_esportivos">carros esportivos</a>&nbsp;de&nbsp;<a href="https://pt.wikipedia.org/wiki/Carro_de_luxo">luxo</a>&nbsp;com sede em&nbsp;<a href="https://pt.wikipedia.org/wiki/Maranello">Maranello</a>. Fundada por&nbsp;<a href="https://pt.wikipedia.org/wiki/Enzo_Ferrari">Enzo Ferrari</a>&nbsp;em 1939 na divis&atilde;o de corridas da&nbsp;<a href="https://pt.wikipedia.org/wiki/Alfa_Romeo">Alfa Romeo</a>&nbsp;com o nome Auto Avio Costruzioni, a empresa construiu seu primeiro carro em 1940. No entanto, o in&iacute;cio da empresa como fabricante de autom&oacute;veis &eacute; geralmente reconhecido em 1947, quando o primeiro carro com o nome Ferrari foi conclu&iacute;do.</p><p>&nbsp;</p><p>Font:<a href="https://pt.wikipedia.org/wiki/Ferrari">&nbsp;https://pt.wikipedia.org/wiki/Ferrari</a></p>', '/imagens/automoveis/sports/Ferrari27-32/aparte_de_tras.jpeg,/imagens/automoveis/sports/Ferrari27-32/atras.jpeg,/imagens/automoveis/sports/Ferrari27-32/delado2.jpeg,/imagens/automoveis/sports/Ferrari27-32/de_lado.jpeg,/imagens/automoveis/sports/Ferrari27-32/frente.jpeg,', 4, 0, 'Ferrari', '2020-07-28 09:51:52', 1480000, 14, 2),
(2, 2020, '<p>Digite&nbsp;a&nbsp;descri&ccedil;&atilde;o&nbsp;do carro&nbsp;aqui.</p>', '/imagens/automoveis/sports/Audy27-34/frente.jpeg,/imagens/automoveis/sports/Audy27-34/frente2.jpeg,/imagens/automoveis/sports/Audy27-34/lado.jpeg,', 0, 0, 'Audy', '2020-07-27 16:34:29', 153900, 21, 2),
(3, 2020, '<p>A origem da Audi[<a href="https://pt.wikipedia.org/w/index.php?title=Audi&amp;veaction=edit&amp;section=1">editar</a>&nbsp;|&nbsp;<a href="https://pt.wikipedia.org/w/index.php?title=Audi&amp;action=edit&amp;section=1">editar c&oacute;digo-fonte</a>]</p><p><a href="https://pt.wikipedia.org/wiki/August_Horch">August Horch</a>&nbsp;iniciou no final do&nbsp;<a href="https://pt.wikipedia.org/wiki/S%C3%A9culo_XIX">s&eacute;culo XIX</a>&nbsp;o projeto para a constru&ccedil;&atilde;o de&nbsp;<a href="https://pt.wikipedia.org/wiki/Autom%C3%B3vel">autom&oacute;veis</a>&nbsp;dando, assim, origem &agrave; funda&ccedil;&atilde;o da marca&nbsp;<a href="https://pt.wikipedia.org/wiki/Horch">Horch</a>, na Primavera de 1899, em&nbsp;<a href="https://pt.wikipedia.org/wiki/Zwickau">Zwickau</a>, perto da cidade de&nbsp;<a href="https://pt.wikipedia.org/wiki/Chemnitz">Chemnitz</a>. A um ritmo quase alucinante para a &eacute;poca, a Horch produziu cinco modelos diferentes, at&eacute; 1909. Nesse ano, Horch, devido a diverg&ecirc;ncias com os diretores decidiu abandonar o projeto.</p><p>Como Horch perdeu os direitos do nome da empresa ent&atilde;o criada, teve que renome&aacute;-la, mas com outra designa&ccedil;&atilde;o. Horch contornou com eleg&acirc;ncia o problema, adotando como nova marca o seu pr&oacute;prio nome, mas traduzido em latim: Audi. A Audi comercializou em 2006 905.100 ve&iacute;culos.<a href="https://pt.wikipedia.org/wiki/Audi#cite_note-audi02-3">[3]</a></p><p>&nbsp;</p><p>font:&nbsp;<a target="_blank" href="https://pt.wikipedia.org/wiki/Audi">https://pt.wikipedia.org/wiki/Audi</a></p>', '/imagens/automoveis/suvs/Audi 201928-21/download.jpeg,/imagens/automoveis/suvs/Audi 201928-21/frente.jpeg,/imagens/automoveis/suvs/Audi 201928-21/frente2.jpeg,/imagens/automoveis/suvs/Audi 201928-21/lado.jpeg,/imagens/automoveis/suvs/Audi 201928-21/volante.jpeg,', 2, 3000, 'Audi 2019', '2020-07-28 09:21:15', 160000, 20, 1),
(4, 2010, '<p><strong>Fiat Palio</strong>&nbsp;foi um&nbsp;<a href="https://pt.wikipedia.org/wiki/Autom%C3%B3vel">autom&oacute;vel</a>&nbsp;compacto produzido pela&nbsp;<a href="https://pt.wikipedia.org/wiki/Fiat">Fiat</a>, tendo sido projetado para&nbsp;<a href="https://pt.wikipedia.org/wiki/Mercados_emergentes">mercados emergentes</a>&nbsp;como&nbsp;<a href="https://pt.wikipedia.org/wiki/Am%C3%A9rica_Latina">Am&eacute;rica Latina</a>,&nbsp;<a href="https://pt.wikipedia.org/wiki/%C3%81frica_do_Sul">&Aacute;frica do Sul</a>,&nbsp;<a href="https://pt.wikipedia.org/wiki/Leste_Europeu">Leste Europeu</a>&nbsp;e&nbsp;<a href="https://pt.wikipedia.org/wiki/%C3%81sia">&Aacute;sia</a>. Seu projeto foi iniciado em&nbsp;<a href="https://pt.wikipedia.org/wiki/1992">1992</a>, pelo Centro de Estilo da Fiat do Brasil junto ao est&uacute;dio italiano I.DE.A.<a href="https://pt.wikipedia.org/wiki/Fiat_Palio#cite_note-3">[3]</a></p><p>A Fiat j&aacute; contava com um produto de tamanho similar para o mercado europeu, o&nbsp;<a href="https://pt.wikipedia.org/wiki/Fiat_Punto">Punto</a>, lan&ccedil;ado na It&aacute;lia em 1993, para substituir o&nbsp;<a href="https://pt.wikipedia.org/wiki/Fiat_Uno">Uno</a>, que j&aacute; contava com 10 anos de mercado. O projeto, chamado inicialmente pelo c&oacute;digo interno 178, teria uma&nbsp;<a href="https://pt.wikipedia.org/wiki/Suspens%C3%A3o_automotiva">suspens&atilde;o</a>&nbsp;mais simples e robusta e, ao contr&aacute;rio do Punto, daria origem uma grande fam&iacute;lia de produtos.</p><p>Fonte:&nbsp;<a target="_blank" href="https://pt.wikipedia.org/wiki/Fiat_Palio">https://pt.wikipedia.org/wiki/Fiat_Palio</a></p>', '/imagens/automoveis/suvs/Palio 2010 usado28-30/palio.jpeg,', 0, 20000, 'Palio 2010 usado', '2020-07-28 09:30:53', 30000, 28, 1),
(5, 2018, '<p><a href="https://www.google.com.br/search?client=ubuntu&amp;hs=lHS&amp;sa=X&amp;bih=601&amp;biw=1349&amp;hl=pt-BR&amp;sxsrf=ALeKk007A3JNtuS9qYSHfvP_D5ZNIPvxFw:1595939822294&amp;q=ecosport+dimens%C3%B5es&amp;stick=H4sIAAAAAAAAAOPgE-LVT9c3NEzPrsq1zMgp0VLOTrbSTywtyc_NL8ksS9XPzU9JzYmvTE0sskrJzE3NK87Mz1vEKpyanF9ckF9UogARPLw1tRgASAtojUwAAAA&amp;ved=2ahUKEwiH88KR--_qAhVuD7kGHZyHBu0Q6BMoADAkegQICxAC">Dimens&otilde;es</a>:&nbsp;4.096-4.357&nbsp;mm C x 1.765&nbsp;mm L x 1.693&nbsp;mm A</p><p><a href="https://www.google.com.br/search?client=ubuntu&amp;hs=lHS&amp;sa=X&amp;bih=601&amp;biw=1349&amp;hl=pt-BR&amp;sxsrf=ALeKk007A3JNtuS9qYSHfvP_D5ZNIPvxFw:1595939822294&amp;q=ecosport+pre%C3%A7o+sugerido&amp;stick=H4sIAAAAAAAAAOPgE-LVT9c3NEzPrsq1zMgp0VLKTrbSTywtyc_NL8ksS9XPzU9JzYmvTE0sssrNzFPILS4qWMQqkZqcX1yQX1SiUFCUenh5vkJxaXpqUWZKPgBeWcQyUAAAAA&amp;ved=2ahUKEwiH88KR--_qAhVuD7kGHZyHBu0Q6BMoADAlegQIERAC">Pre&ccedil;o sugerido</a>:&nbsp;A partir de R$ 69.990</p><p><a href="https://www.google.com.br/search?client=ubuntu&amp;hs=lHS&amp;sa=X&amp;bih=601&amp;biw=1349&amp;hl=pt-BR&amp;sxsrf=ALeKk007A3JNtuS9qYSHfvP_D5ZNIPvxFw:1595939822294&amp;q=ecosport+volume+de+carga&amp;stick=H4sIAAAAAAAAAOPgE-LVT9c3NEzPrsq1zMgp0VLLTrbSTywtyc_NL8ksS9XPzU9JzYmvTE0sskpOLErPjy_LzynNTV3EKpGanF9ckF9UogARUUhJVQCpSAQA-K0T0VQAAAA&amp;ved=2ahUKEwiH88KR--_qAhVuD7kGHZyHBu0Q6BMoADAmegQIEBAC">Volume de carga</a>:&nbsp;B&aacute;sica: 356 - 362&nbsp;l / Bancos rebatidos: 1.178&nbsp;l</p><p><a href="https://www.google.com.br/search?client=ubuntu&amp;hs=lHS&amp;sa=X&amp;bih=601&amp;biw=1349&amp;hl=pt-BR&amp;sxsrf=ALeKk007A3JNtuS9qYSHfvP_D5ZNIPvxFw:1595939822294&amp;q=ecosport+motor&amp;stick=H4sIAAAAAAAAAOPgE-LVT9c3NEzPrsq1zMgp0dLITrbSTywtyc_NL8ksS9XPzU9JzYmvTE0sskrNS8_MS40vLs3NTSyqXMTKl5qcX1yQX1SiAFSbXwQA75R7F0wAAAA&amp;ved=2ahUKEwiH88KR--_qAhVuD7kGHZyHBu0Q6BMoADAnegQIDRAC">Motor</a>:&nbsp;1,5&nbsp;l 3 cilindros em linha, 2,0&nbsp;l 4 cilindros em linha</p><p><a href="https://www.google.com.br/search?client=ubuntu&amp;hs=lHS&amp;sa=X&amp;bih=601&amp;biw=1349&amp;hl=pt-BR&amp;sxsrf=ALeKk007A3JNtuS9qYSHfvP_D5ZNIPvxFw:1595939822294&amp;q=ecosport+transmiss%C3%A3o&amp;stick=H4sIAAAAAAAAAOPgE-LVT9c3NEzPrsq1zMgp0VLLTrbSTywtyc_NL8ksS9XPzU9JzYmvTE0ssiopSswrzs0sLs7Mz1vEKpqanF9ckF9UogAXP7w4HwCV9sluUQAAAA&amp;ved=2ahUKEwiH88KR--_qAhVuD7kGHZyHBu0Q6BMoADAoegQIDBAC">Transmiss&atilde;o</a>:&nbsp;Manual de 5 marchas, Autom&aacute;tico de 6 marchas</p>', '/imagens/automoveis/sports/Ecosport 201828-37/frente.jpeg,/imagens/automoveis/sports/Ecosport 201828-37/frente2.jpeg,/imagens/automoveis/sports/Ecosport 201828-37/lado.jpeg,/imagens/automoveis/sports/Ecosport 201828-37/palio.jpeg,/imagens/automoveis/sports/Ecosport 201828-37/traseira.jpeg,', 1, 50000, 'Ecosport 2018', '2020-07-28 09:37:39', 70000, 32, 2),
(6, 2005, '<p>Digite&nbsp;a&nbsp;descri&ccedil;&atilde;o&nbsp;do carro&nbsp;aqui.</p>', '/imagens/automoveis/furgões/Gol 200528-44/golAtras.jpeg,/imagens/automoveis/furgões/Gol 200528-44/golFrente.jpeg,', 1, 100000, 'Gol 2005', '2020-07-28 09:44:42', 10000, 29, 4),
(7, 2020, '<p>Eu n&atilde;o manjo de carro :D</p>', '/imagens/automoveis/furgões/Picap28-47/ford.jpg,', 0, 0, 'Picap', '2020-07-28 09:48:18', 200000, 21, 3),
(8, 2020, '<p>Ferrari :O</p>', '/imagens/automoveis/sports/Carinho de golf 28-51/capaGolf.jpeg,/imagens/automoveis/sports/Carinho de golf 28-51/frenteGolf.jpeg,/imagens/automoveis/sports/Carinho de golf 28-51/golfTunado.jpeg,/imagens/automoveis/sports/Carinho de golf 28-51/ladoGolf.jpeg,', 0, 0, 'Carinho de golf ', '2020-07-28 09:51:27', 200000, 14, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricante`
--

CREATE TABLE `fabricante` (
  `id` bigint(20) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fabricante`
--

INSERT INTO `fabricante` (`id`, `logo`, `nome`, `site`) VALUES
(15, 'FERRARI/FERRARI.jpeg', 'FERRARI', 'www.fherrary.com'),
(20, 'Volkswagem/VOLKSWAGEM.png', 'VOLKSWAGEM', 'www.Volkswagem'),
(17, 'mercedezes/MERCEDEZES.jpeg', 'MERCEDEZES', 'www.'),
(18, 'fiatys/FIATYS.png', 'FIAT', 'www.fiatys.com'),
(19, 'F0RD/F0RD.png', 'F0RD', 'www.fardes.com'),
(21, 'chevrolet/CHEVROLET.jpeg', 'CHEVROLET', 'https://www.chevrolet.com.br/');

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_veiculo`
--

CREATE TABLE `modelo_veiculo` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `fabricante_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `modelo_veiculo`
--

INSERT INTO `modelo_veiculo` (`id`, `nome`, `fabricante_id`) VALUES
(14, 'FERRAY', 15),
(15, 'VOLVO', 19),
(16, 'SLK', 17),
(17, 'SAVEIRO ', 19),
(18, 'COURIER', 19),
(19, 'PICANTO', 18),
(20, 'AUDI', 18),
(21, 'AUDI', 19),
(22, 'CORSA', 21),
(23, 'CELTA', 21),
(24, 'ONIX', 21),
(25, 'PUNTO', 18),
(26, 'SIENA', 18),
(27, 'UNO', 18),
(28, 'PALIO', 18),
(29, 'GOL', 20),
(30, 'FOX', 20),
(31, 'FOCUS', 19),
(32, 'ECOSPORT', 19),
(33, 'FIESTA', 19);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_login`
--

CREATE TABLE `usuario_login` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome_completo` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario_login`
--

INSERT INTO `usuario_login` (`id`, `email`, `nome_completo`, `senha`) VALUES
(1, 'johnwill.v.2017@gmail.com', 'john william', '97869858dccbac21dd2ab6a838495d17'),
(2, 'spring.devcar@outlook.com', 'Spring he show', 'F772C671BE88DA6C860B4C5DEE8EFCC3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`id`, `nome`) VALUES
(1, 'suvs'),
(2, 'sports'),
(3, 'pick-ups'),
(4, 'sedans'),
(5, 'furgões');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `automovel`
--
ALTER TABLE `automovel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7in28x7lsy6lxr1ou1obcoe99` (`modelo_id`),
  ADD KEY `FK13hwn3s557slp733uqmx6wyjv` (`tipo_id`);

--
-- Indexes for table `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modelo_veiculo`
--
ALTER TABLE `modelo_veiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfoki6tblepeb40un4xqmwe2lt` (`fabricante_id`);

--
-- Indexes for table `usuario_login`
--
ALTER TABLE `usuario_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `automovel`
--
ALTER TABLE `automovel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `modelo_veiculo`
--
ALTER TABLE `modelo_veiculo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `usuario_login`
--
ALTER TABLE `usuario_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
