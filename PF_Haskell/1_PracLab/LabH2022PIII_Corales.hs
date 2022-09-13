module LaboratorioHaskell where

-- Ejercicio 1

-- Recursion 

mapTupR :: (a -> b) -> (c -> d)-> [(a,c)] -> [(b,d)]
mapTupR _ _ [] = []
mapTupR f g (x:xs) = (f (fst x), g (snd x)) : mapTupR f g xs

-- Recursion con acumulador

mapTupRA :: (a -> b) -> (c -> d)-> [(a,c)] -> [(b,d)]
mapTupRA f g ys = mapTupRA_aux f g ys []
      where mapTupRA_aux _ _ [] acc = acc
            mapTupRA_aux f g (x:xs) acc = mapTupRA_aux f g xs (acc ++ [(f (fst x), g (snd x))])

-- Foldr (a -> b -> b) -> b -> [a] -> b

mapTupfr :: (a -> b) -> (c -> d)-> [(a,c)] -> [(b,d)]
mapTupfr f g = foldr (\x xs -> (f (fst x), g (snd x)) : xs) []

-- Foldl (a -> b -> a) -> a -> [b] -> a

mapTupfl :: (a -> b) -> (c -> d)-> [(a,c)] -> [(b,d)]
mapTupfl f g ys =  foldl (\acc xs -> acc ++ [(f (fst xs), g (snd xs))]) [] ys -- VER


-- Ejercicio 2

-- Recursion 

filterTupR :: (a -> Bool) -> (b -> Bool) -> [(a,b)] -> [(a,b)]
filterTupR _ _ [] = []
filterTupR f g (x:xs) = if f (fst x) && g (snd x) 
                       then (fst x, snd x) : filterTupR f g xs 
                       else filterTupR f g xs 

-- Recursion con acumulador

filterTupRA :: (a -> Bool) -> (b -> Bool) -> [(a,b)] -> [(a,b)]
filterTupRA f g ys = filterTupRA_aux f g ys []
      where filterTupRA_aux _ _ [] zs = zs
            filterTupRA_aux f g (x:xs) zs = if f (fst x) && g (snd x) 
                                            then filterTupRA_aux f g xs (zs ++ [(fst x, snd x)])
                                            else filterTupRA_aux f g xs zs

-- Foldr (a -> b -> b) -> b -> [a] -> b

filterTupfr :: (a -> Bool) -> (b -> Bool) -> [(a,b)] -> [(a,b)]
filterTupfr f g = foldr (\x xs -> if f (fst x) && g (snd x) 
                       then (fst x, snd x) : xs 
                       else xs) []

-- Foldl (a -> b -> a) -> a -> [b] -> a

filteTuprfl :: (a -> Bool) -> (b -> Bool) -> [(a,b)] -> [(a,b)]
filteTuprfl f g ys = foldl (\acc xs -> if f (fst xs) && g (snd xs) 
                                       then acc ++ [((fst xs, snd xs))] 
                                       else acc) [] ys

-- Ejercicio 3

-- Recursion

allTupR:: Int -> [(a,b)] -> [(a,b)]
allTupR n _ | n <= 0 = [] 
allTupR _ [] = []
allTupR n (x:xs) = x : allTupR  (n - 1) xs

{-allTupR1 :: Int -> [(a,b)] -> [(a,b)]
allTupR1 n (x:xs) = take n (x:xs)-}

-- Recursion con acumulador

allTupRA :: Int -> [(a,b)] -> [(a,b)]
allTupRA n ys = allTupRA_aux n ys []
      where allTupRA_aux n _ acc | n <= 0 = reverse(acc)
            allTupRA_aux _ [] acc = reverse(acc)
            allTupRA_aux n (x:xs) acc = allTupRA_aux (n -1) xs (x:acc)

-- Foldr (a -> b -> b) -> b -> [a] -> b

allTupfr :: Int -> [(a,b)] -> [(a,b)]
allTupfr n = foldr (\x xs -> x : take (n - 1) xs) []

-- Foldl (a -> b -> a) -> a -> [b] -> a

allTupfl :: Int -> [(a,b)] -> [(a,b)]
allTupfl n ys = foldl (\acc xs -> acc ++ take(n) xs) [] [ys]

-- Ejercicio 4

-------------------------------------------------
-- MODELO SISTEMA DE STOCK DE ALMACEN
--------------------------------------------------
type CodItem = Int -- Codigo de cada producto en la BD
type Item = String -- Descripcion del producto
type Marca = String
type Rubro = String
type UMed = String --Unidad de Medida:1LT,800GRM, 1500CM3,etc
type CantExis =Int --cantidad de productos en deposito
type VMin = Int -- valor en existencia recomendado para

 -- solicitar reposicion
type VMax = Int -- valor maximo de acopio en deposito
type PrecioU = Float -- precio de compra por unidad de medida
type PGan = Int -- Porcentaje de de ganancia a aplicar

 -- sobre el precio de compra
type CodProv = Int -- Codigo de cada proveedor en la BD
type NombreP = String -- Nombre del proveedor en la BD
type DireccionP = String
type CelularP = String

-- tupla con datos de un item de Stock
type ItemStock = (
      CodItem,
      Item,
      Marca,
      Rubro,
      CodProv,
      UMed,
      CantExis,
      VMin,
      VMax,
      PrecioU,
      PGan
      )

-- tupla con datos de 1 proveedor
type Proveedor = (
      CodProv,
      NombreP,
      DireccionP,
      CelularP
      )

-- Tablas BD
type TStock = [ItemStock] --Tabla con el Stock de un comercio
type TProveedor = [Proveedor] --Tabla con proveedores del comercio

--funciones de extracción
codItem :: ItemStock -> CodItem
codItem (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = cod

item :: ItemStock -> Item
item (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = item

marca :: ItemStock -> Marca
marca (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = marca

rubro :: ItemStock -> Rubro
rubro (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = rubro

codProv ::ItemStock -> CodProv
codProv (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = prov

umed :: ItemStock -> UMed
umed (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = umed

cantExis :: ItemStock -> CantExis
cantExis (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = cant

vMin :: ItemStock -> VMin
vMin (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = cmin

vMax :: ItemStock -> VMax
vMax (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = cmax

precioU :: ItemStock -> PrecioU
precioU (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = preciou

pganancia :: ItemStock -> PGan
pganancia (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = pgan

-- Ejercicio 4

listaItems :: ItemStock -> (CodItem, Item, Marca, Rubro)
listaItems (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = (cod,item,marca,rubro) 

{-itemsReponer :: ItemStock -> (CodItem,Item,Marca,Rubro,CodProv,UMed,CantExis,VMin,VMax,PrecioU,PGan)
itemsReponer (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) = if cantExis(cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) <= vMin(cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan)  
                                                                            then (cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan)
                                                                            else (0,"0","0","0",0,"0",0,0,0,0,0)-}


-- datos predefinidos (Ejemplos Lab.)

tabla1S :: TStock
tabla1S = [
      (100,"ARROZ GRANO GRANDE", "CONDOR", "Alimentos", 20, "1LT", 8000, 500, 10000, 20, 30),
      (107,"ARROZ GRANO GRANDE", "GALLO", "Alimentos", 20,"1KG", 6000, 200, 8000, 25, 30),
      (200,"ACEITE DE GIRASOL", "NATURA", "Alimentos", 20, "1LT", 9800, 600, 10000, 40, 30),
      (200,"ACEITE DE GIRASOL", "COCINERO", "Alimentos", 20, "1LT", 900, 500, 10000, 30, 30),
      (410,"AGUA MINERAL S/GAS BAJO SODIO", "SER", "Alimentos", 31, "1.5LT", 20, 50, 3000, 10, 35),
      (412,"AGUA SABORIZADA LIMA LIMON", "SER", "Alimentos", 31, "2LT", 1570, 50, 3000, 15, 35),
      (478,"ALFAJOR CHOCOLATE TITA", "TERRABUSI", "Alimentos", 31, "36GR", 900, 200, 5000, 4, 30),
      (479,"ALFAJOR CHOCOLATE RODESIA", "TERRABUSI", "Alimentos", 31, "40GR", 9, 200, 3500, 4, 30),
      (708,"LECHE DESC.PASTEURIZADA", "SERENISIMA", "Alimentos", 31, "1TL", 230, 100, 1200, 20, 30),
      (767,"ARVEJAS SECAS REMOJADAS", "NOEL", "Alimentos", 20, "300GR", 1203, 500, 3000, 10, 30),
      (801,"ANTITRANSPIRANTE ROLL-ON", "ETIQUET", "PERFUMERIA", 20, "60gr", 30, 45, 2000, 25, 30)
      ]

tabla1P :: TProveedor
tabla1P= [
      (20,"Juan Perez","Belgrano 1827, San Luis, 5700, Argentina","2664-786543"),
      (31,"Jose Lopez","Junin 444, Mendoza,5500, Argentina","261-3452677")
      ]

