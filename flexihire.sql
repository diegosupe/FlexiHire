-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Maio-2023 às 01:26
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `flexihire`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aplicacao`
--

CREATE TABLE `aplicacao` (
  `id_aplicacao` int(11) NOT NULL,
  `dia_semana` varchar(12) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_vaga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_estab`
--

CREATE TABLE `avaliacao_estab` (
  `id_avaliacao_estab` int(11) NOT NULL,
  `ds_avaliacao` varchar(300) NOT NULL,
  `nr_nota` int(1) NOT NULL,
  `id_estabelecimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_func`
--

CREATE TABLE `avaliacao_func` (
  `id_avaliacao_func` int(11) NOT NULL,
  `ds_avaliacao` varchar(300) NOT NULL,
  `nr_nota` int(1) NOT NULL,
  `id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `nr_cep` int(8) NOT NULL,
  `nm_rua` varchar(100) NOT NULL,
  `nm_bairro` varchar(80) NOT NULL,
  `nr_casa` int(5) NOT NULL,
  `nm_cidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estabelecimento`
--

CREATE TABLE `estabelecimento` (
  `id_estabelecimento` int(11) NOT NULL,
  `nm_estabelecimento` varchar(100) NOT NULL,
  `tipo_estabelecimento` varchar(50) NOT NULL,
  `nr_cnpj` int(14) NOT NULL,
  `nm_responsavel` varchar(100) NOT NULL,
  `nm_email` varchar(100) NOT NULL,
  `nr_senha` varchar(8) NOT NULL,
  `id_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nm_funcionario` varchar(100) NOT NULL,
  `nr_cpf` int(11) NOT NULL,
  `dt_nasc` date NOT NULL,
  `ds_experiencia` varchar(200) NOT NULL,
  `nm_email` varchar(100) NOT NULL,
  `nr_senha` varchar(8) NOT NULL,
  `id_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vaga`
--

CREATE TABLE `vaga` (
  `id_vaga` int(11) NOT NULL,
  `ds_vaga` varchar(300) NOT NULL,
  `nr_salario` float(5,2) NOT NULL,
  `hr_entrada` date NOT NULL,
  `hr_saida` date NOT NULL,
  `dt_inicio` date NOT NULL,
  `dt_fim` date NOT NULL,
  `ds_experiencia` varchar(200) NOT NULL,
  `nr_funcionarios` int(2) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `id_estabelecimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aplicacao`
--
ALTER TABLE `aplicacao`
  ADD PRIMARY KEY (`id_aplicacao`),
  ADD KEY `fk_vagaAp` (`id_vaga`),
  ADD KEY `fk_funcionarioAp` (`id_funcionario`);

--
-- Índices para tabela `avaliacao_estab`
--
ALTER TABLE `avaliacao_estab`
  ADD PRIMARY KEY (`id_avaliacao_estab`),
  ADD KEY `fk_estabelecimentoAv` (`id_estabelecimento`);

--
-- Índices para tabela `avaliacao_func`
--
ALTER TABLE `avaliacao_func`
  ADD PRIMARY KEY (`id_avaliacao_func`),
  ADD KEY `fk_funcionarioAv` (`id_funcionario`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Índices para tabela `estabelecimento`
--
ALTER TABLE `estabelecimento`
  ADD PRIMARY KEY (`id_estabelecimento`),
  ADD KEY `fk_endereco` (`id_endereco`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `fk_enderecoFunc` (`id_endereco`);

--
-- Índices para tabela `vaga`
--
ALTER TABLE `vaga`
  ADD PRIMARY KEY (`id_vaga`),
  ADD KEY `fk_estabelecimentoVaga` (`id_estabelecimento`),
  ADD KEY `fk_enderecoVaga` (`id_endereco`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aplicacao`
--
ALTER TABLE `aplicacao`
  MODIFY `id_aplicacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao_estab`
--
ALTER TABLE `avaliacao_estab`
  MODIFY `id_avaliacao_estab` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao_func`
--
ALTER TABLE `avaliacao_func`
  MODIFY `id_avaliacao_func` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estabelecimento`
--
ALTER TABLE `estabelecimento`
  MODIFY `id_estabelecimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vaga`
--
ALTER TABLE `vaga`
  MODIFY `id_vaga` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aplicacao`
--
ALTER TABLE `aplicacao`
  ADD CONSTRAINT `fk_funcionarioAp` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  ADD CONSTRAINT `fk_vagaAp` FOREIGN KEY (`id_vaga`) REFERENCES `vaga` (`id_vaga`);

--
-- Limitadores para a tabela `avaliacao_estab`
--
ALTER TABLE `avaliacao_estab`
  ADD CONSTRAINT `fk_estabelecimentoAv` FOREIGN KEY (`id_estabelecimento`) REFERENCES `estabelecimento` (`id_estabelecimento`);

--
-- Limitadores para a tabela `avaliacao_func`
--
ALTER TABLE `avaliacao_func`
  ADD CONSTRAINT `fk_funcionarioAv` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`);

--
-- Limitadores para a tabela `estabelecimento`
--
ALTER TABLE `estabelecimento`
  ADD CONSTRAINT `fk_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`);

--
-- Limitadores para a tabela `vaga`
--
ALTER TABLE `vaga`
  ADD CONSTRAINT `fk_enderecoVaga` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`),
  ADD CONSTRAINT `fk_estabelecimentoVaga` FOREIGN KEY (`id_estabelecimento`) REFERENCES `estabelecimento` (`id_estabelecimento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
