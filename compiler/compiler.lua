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
            if string.find(v, "@@") then
                print(i)
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
        start_alg()
        file:close()
    else
        print("O caminho especificado nao existe.")
    end
end

open_file()