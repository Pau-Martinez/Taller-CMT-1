CREATE database Almacen;
Use Almacen; 

CREATE TABLE Productos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Precio decimal (10,2)
);


CREATE TABLE Categorías (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100)
);


CREATE TABLE Productos_Categorías (
    ProductoID INT,
    CategoriaID INT,
    PRIMARY KEY (ProductoID, CategoriaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ID),
    FOREIGN KEY (CategoriaID) REFERENCES Categorías(ID)
);


INSERT INTO Categorías (ID, Nombre) VALUES 
    (1, 'Marcadores'),
    (2, 'Cuadernos');

INSERT INTO Productos (ID, Nombre, Precio) VALUES 
    (1, 'Marcadores de alcohol', 11.50),
    (2, 'Cuaderno 7 materias', 20.00),
    (3, 'Marcadores punta pincel', 13.80);
    

INSERT INTO Productos_Categorías (ProductoID, CategoriaID)
VALUES 
    (1, 1),  
    (2, 2),  
    (3, 1);

SELECT * FROM Productos;
SELECT * FROM Categorías;
SELECT * FROM Productos_Categorías;

##################  1. Cuáles son todos los productos disponibles y sus precios?
SELECT Nombre, Precio
FROM Productos;

################  2. ¿Qué productos cuestan más de $10?
SELECT Nombre, Precio
FROM Productos
WHERE Precio > 10.00;

######################### 3. ¿Qué productos pertenecen a cada categoría? (JOIN)
SELECT p.Nombre AS Producto, c.Nombre AS Categoria
FROM Productos p
JOIN Productos_Categorías pc ON p.ID = pc.ProductoID
JOIN Categorías c ON pc.CategoriaID = c.ID;

##################### 4 .Muestra todas las categorías, incluso si no tienen productos asignados. (LEFT JOIN) 
SELECT c.Nombre AS Categoria, p.Nombre AS Producto
FROM Categorías c
LEFT JOIN Productos_Categorías pc ON c.ID = pc.CategoriaID
LEFT JOIN Productos p ON pc.ProductoID = p.ID;



