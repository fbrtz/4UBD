CREATE TABLE vendas (
  id integer primary key,
  produto varchar(200) not null,
  data_venda timestamp,
  valor float not null
);


INSERT INTO vendas (id, produto, data_venda, valor) VALUES
(1, 'Teclado Mecânico', '2025-08-19', 350.50),
(2, 'Mouse Sem Fio', '2025-08-19', 120.00),
(3, 'Monitor Gamer', '2025-08-19', 1899.90),
(4, 'Headset RGB', '2025-08-19', 450.75),
(5, 'Webcam Full HD', '2025-08-19', 250.00),
(6, 'Notebook Dell G15', '2025-08-19', 5500.00),
(7, 'Tablet Samsung', '2025-08-19', 1200.00),
(8, 'Smartphone iPhone', '2025-08-19', 7800.00),
(9, 'Caixa de Som JBL', '2025-08-19', 320.50),
(10, 'Cadeira Gamer', '2025-08-19', 1500.00),
(11, 'Microfone Condensador', '2025-08-19', 650.00),
(12, 'SSD 1TB', '2025-08-19', 580.90),
(13, 'HD Externo 2TB', '2025-08-19', 450.00),
(14, 'Placa de Vídeo RTX 4070', '2025-08-19', 4999.90),
(15, 'Processador Ryzen 7', '2025-08-19', 1850.00),
(16, 'Memória RAM 16GB', '2025-08-19', 300.00),
(17, 'Placa Mãe B550', '2025-08-19', 950.00),
(18, 'Fonte ATX 650W', '2025-08-19', 420.00),
(19, 'Gabinete Gamer', '2025-08-19', 550.00),
(20, 'Cooler para Processador', '2025-08-19', 180.50);


CREATE INDEX idx_vendas_data ON vendas(data_venda);


EXPLAIN ANALYZE
SELECT *
FROM vendas
WHERE data_venda BETWEEN DATE('2025-01-01') AND DATE('2025-06-30');
