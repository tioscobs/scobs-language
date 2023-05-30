require "keywords"

local function check_comments(fileLines)
    for i = 1, #fileLines do
        local in1, in2 = string.find(fileLines[i], "@@")
        if in1 ~= nil and in2 ~= nil then
            fileLines[i] = string.sub(fileLines[i], 0, in1 - 1)
        end
    end
end

local function format_text(fileLines)
    if #fileLines > 0 then
        check_comments(fileLines)
        for i = 1, #fileLines do
            local raw_text = fileLines[i]
            if not raw_text:match("[%a]+") then
                fileLines[i] = nil
            end
        end
    end
end

function start_alg(fileLines)

end

function open_file()
    local file_dir = io.read()
    local bool, file = pcall(io.open, file_dir)
    if file ~= nil then
        local fileLines = {}
        for line in file:lines() do
            table.insert(fileLines, line)
        end
        
        print("Arquivo carregado: ")
        for i, v in pairs(fileLines) do
            print(i, v)
        end
        
        format_text(fileLines)
        print("\nArquivo tratado: ")
        for i, v in pairs(fileLines) do
            print(i, v)
        end

        file:close()
    else
        print("O caminho especificado nao existe.")
    end
end

open_file()