-------------------------------------------------
-- MODELO SISTEMA DE STOCK DE ALMACEN
--------------------------------------------------
type CodItem = Int -- Codigo de cada producto en la BD
type Item = String -- Descripcion del producto
type Marca = String
type Rubro = String
type UMed = String --Unidad de Medida:1LT,800GRM, 1500CM3,etc
type CantExis=Int --cantidad de productos en deposito
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
type TProveedor=[Proveedor] --Tabla con proveedores del comercio
--funciones de extracción
codItem :: ItemStock -> CodItem
codItem
(cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) =
cod
item :: ItemStock -> Item
item
(cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) =
item
-- .....
-- y así para cada elemento de la tupla(completar el codigo si
es necesario)
pganancia::ItemStock -> PGan
pganancia
(cod,item,marca,rubro,prov,umed,cant,cmin,cmax,preciou,pgan) =
pgan
-- datos predefinidos (Ejemplos Lab.)
tabla1S:: TStock
tabla1S= [
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