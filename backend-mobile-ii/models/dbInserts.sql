USE `backend-mobile-ii`;

-- Inserir Clientes de Teste
INSERT INTO `clientes`(`nome`, `sobrenome`, `email`, `idade`, `foto`) VALUES
('João', 'Silva', 'joao.silva@email.com', 25, 'https://i.pravatar.cc/150?img=12'),
('Maria', 'Santos', 'maria.santos@email.com', 30, 'https://i.pravatar.cc/150?img=23'),
('Pedro', 'Oliveira', 'pedro.oliveira@email.com', 28, 'https://i.pravatar.cc/150?img=33'),
('Ana', 'Costa', 'ana.costa@email.com', 22, 'https://i.pravatar.cc/150?img=45'),
('Carlos', 'Ferreira', 'carlos.ferreira@email.com', 35, 'https://i.pravatar.cc/150?img=56'),
('Julia', 'Almeida', 'julia.almeida@email.com', 27, 'https://i.pravatar.cc/150?img=47'),
('Lucas', 'Rodrigues', 'lucas.rodrigues@email.com', 31, 'https://i.pravatar.cc/150?img=68'),
('Fernanda', 'Lima', 'fernanda.lima@email.com', 24, 'https://i.pravatar.cc/150?img=29');

-- Inserir Produtos de Teste
INSERT INTO `produtos`(`nome`, `descricao`, `preco`, `data_atualizado`) VALUES
('Notebook Dell', 'Notebook Dell Inspiron 15, 8GB RAM, 256GB SSD', 3500.00, NOW()),
('Mouse Logitech', 'Mouse sem fio Logitech MX Master 3', 450.00, NOW()),
('Teclado Mecânico', 'Teclado Mecânico RGB Redragon K552', 280.00, NOW()),
('Monitor LG', 'Monitor LG 24 polegadas Full HD', 850.00, NOW()),
('Webcam Logitech', 'Webcam Logitech C920 Full HD 1080p', 420.00, NOW()),
('Headset Gamer', 'Headset Gamer HyperX Cloud II', 550.00, NOW()),
('SSD Samsung', 'SSD Samsung 970 EVO 500GB NVMe', 380.00, NOW()),
('Mousepad Gamer', 'Mousepad Gamer RGB Extended 80x30cm', 95.00, NOW()),
('Cadeira Gamer', 'Cadeira Gamer DT3 Sports Elise', 1200.00, NOW()),
('Microfone Blue Yeti', 'Microfone Condensador USB Blue Yeti', 1100.00, NOW());