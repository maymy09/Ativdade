-- Seleciona o banco de dados (substitua 'nome_do_banco_de_dados' pelo nome real do seu banco de dados)
USE nome_do_banco_de_dados;

-- Cria a tabela clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL
);

-- Insere alguns dados de exemplo na tabela clientes
INSERT INTO clientes (nome, email, telefone, data_cadastro)
VALUES
('João Silva', 'joao.silva@example.com', '123456789', '2024-05-27'),
('Maria Oliveira', 'maria.oliveira@example.com', '987654321', '2024-05-28'),
('Pedro Santos', 'pedro.santos@example.com', '555555555', '2024-05-28');

-- Cria a função contar_clientes_por_dia
DELIMITER //
CREATE FUNCTION contar_clientes_por_dia(data DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_clientes INT;
    SELECT COUNT(*) INTO total_clientes FROM clientes WHERE data_cadastro = data;
    RETURN total_clientes;
END //
DELIMITER ;

-- Testa a função contar_clientes_por_dia
SELECT contar_clientes_por_dia('2024-05-28');
