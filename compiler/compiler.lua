require "keywords"

local fileLines = {}

function start_alg()
    if #fileLines > 0 then
        
    end
end

function open_file()
    local file_dir = "D:\\scobs-language\\compiler\\test.scobs" --io.read()
    local bool, file = pcall(io.open, file_dir)
    if file ~= nil then
        for line in file:lines() do
            table.insert(fileLines, line)
        end
        start_alg()
        file:close()
    else
        print("O Caminho especificado nao existe.")
    end
end

open_file()