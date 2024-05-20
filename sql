CREATE TABLE Gonden Wing Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
);

CREATE TABLE Conta (
    ID_Conta INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Admin (
    ID_Admin INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);

CREATE TABLE Categoria (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descrição TEXT,
    ID_Admin INT NOT NULL,
    FOREIGN KEY (ID_Admin) REFERENCES Admin(ID_Admin)
);

CREATE TABLE Produto (
    ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descrição TEXT,
    Preço DECIMAL(10, 2) NOT NULL,
    Quantidade INT NOT NULL,
    ID_Categoria INT NOT NULL,
    ID_Admin INT NOT NULL,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
    FOREIGN KEY (ID_Admin) REFERENCES Admin(ID_Admin)
);

CREATE TABLE Pedido (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    Data_do_Pedido DATE NOT NULL,
    Status_do_Pedido VARCHAR(50) NOT NULL,
    ID_Conta INT NOT NULL,
    FOREIGN KEY (ID_Conta) REFERENCES Conta(ID_Conta)
);

CREATE TABLE Pagamento (
    ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT NOT NULL,
    Tipo_de_Pagamento VARCHAR(50) NOT NULL,
    Data_do_Pagamento DATE NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);
