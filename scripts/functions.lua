--[[


ooooooooooo                                    o8   o88
 888       oooo  oooo  oo oooooo    ooooooo  o888oo oooo   ooooooo  oo oooooo    oooooooo8
 888ooo8    888   888   888   888 888     888 888    888 888     888 888   888  888ooooooo
 888        888   888   888   888 888         888    888 888     888 888   888          888
o888o        888o88 8o o888o o888o  88ooo888   888o o888o  88ooo88  o888o o888o 88oooooo88


    Codigo para ser utilizado en Triggers, Timers, etc.
    El contenido de este archivo debe ser puesto en algun script
    dentro de Mudlet.

]]--

-- Helpers.

function is_numeric(x)
    --[[
        Revisar si un string es un numero
    ]]--
    if tonumber(x) ~= nil then
        return true
    end
    return false
end

-- Funciones.

function irRecall()
  --[[
    Para transportarse a recall. Dejando como
    Funcion para permitir acciones adicionales.
  ]]--

  send(RECALL)

end

function generarMovimientos( path )

    --[[
        En Mudlet, cuando uno pone un path que empieza con ".", mudlet
        envia el comando gritar en vez de ir al path. Mudlet tampoco
        entiende paths numericos(e.j. 13n). Esta funcion transforma
        tales paths en comandos de movimiento.

        Basicamente existen tres tipos de paths:
            * letra
            * 1 digito 1 letra
            * 2 digitos 1 letra

        Para una version mas "flexible", mirar https://gist.github.com/martilllo/a2c9f341cb2c7431a01e320dac6fabac

        Parametros:
            * path: string. Path empezando con "."
    ]]--

    local i = 2
    local num
    local dir

    while i <= #path
    do

        -- Obtener sub-paths
        if not isNumeric(path:sub(i,i))
        then
          num = 1
          dir = path:sub(i,i)
          i = i + 1
        elseif isNumeric(path:sub(i,i)) and not isNumeric(path:sub(i+1,i+1)) then
          num = path:sub(i,i)
          dir = path:sub(i+1,i+1)
          i = i + 2
        else
          num = path:sub(i,i+2)
          dir = path:sub(i+3,i+3)
          i = i + 3
        end -- termina if

        -- Moverse
        for j=1,num do
          send(dir)
        end

    end -- termina while
end -- termina funcion
