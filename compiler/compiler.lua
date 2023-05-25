require "keywords"

local fileLines = {}

function start_alg()
    if #fileLines > 0 then
        for i, v in pairs(fileLines) do
            local raw_text = string.gsub(v, "%s", "")
            if string.match(raw_text, "[%a]+") then
                --print(i)
            end
        end
    end
end

function check_comments()
    if #fileLines > 0 then
        for i, v in pairs(fileLines) do
            local in1, in2 = string.find(v, "@@")
            if in1 ~= nil and in2 ~= nil then
                fileLines[i] = string.sub(v, 0, in2 - 2)
            end
        end
    end
end

function open_file()
    local file_dir = io.read()
    local bool, file = pcall(io.open, file_dir)
    if file ~= nil then
        for line in file:lines() do
            table.insert(fileLines, line)
        end
        print("Arquivo carregado: ")
        for i, v in pairs(fileLines) do
            print(i, v)
        end
        check_comments()
        print("\nArquivo tratado sem comentarios: ")
        file:close()
        for i, v in pairs(fileLines) do
            print(i, v)
        end
    else
        print("O caminho especificado nao existe.")
    end
end

open_file()