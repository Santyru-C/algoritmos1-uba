identidad :: t -> t
identidad x = x

primero :: tx -> ty -> tx --devuelve el primer argumento no importa el tipo
primero x y = x

segundo :: tx -> ty -> ty --devuelve el segundo argumento no importa el tipo
segundo x y = y

--devuelve 5:Int no importa los argumentos
constante5 :: tx -> ty -> tz -> Int
constante5 x y z = 5

--devuelve True si al momento de pasar los argumentos estos son del mismo tipo
--de otra manera tirara un error debido a que estos no coinciden
mismoTipo :: t -> t -> Bool
mismoTipo x y = True

--- type clases

triple :: (Num t) => t -> t
triple x = 3 * x

maximo :: (Ord t) => t -> t -> t -- acepta todo tipo de Ord pero no evalua a todos en conjunto. ej solo bool con bool.
maximo x y
    | x >= y = x
    | otherwise = y

