--[[

Nome da criatura
Descrição
Som que faz
Atributos
    Ataque
    Defesa
    Vitalidade
    Velocidade
    Inteligência
Habilidades
    Furtividade
    Explosão

===================================================
|
| CREEPER
| Um monstro muito sagaz que explode na sua cara.
|
| Som: Tssssss
|
| Atributos:
|   Ataque: ########00
|   Defesa: ###0000000
|   ...
|
===================================================


]]

-- Habilitar UTF-8 no terminal
os.execute("chcp 65001")

-- função que recebe um atributo e nos retorna uma barra de progresso em string / texto
local function getProgressBar(attribute)
    local fullChar = "⬜"
    local emptyChar = "⬛"

    local result = ""
    for i = 1, 10 do
        if i <= attribute then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
    end
    return result
end

local function renderCreatureCard(creature)
    local border = "==================================================="
    local cardLines = {
        border,
        "| ",
        "| " .. creature.name,
        "| " .. creature.description,
        "| ",
    }

    local information = {
        { label = "Item", value = creature.item },
        { label = "Som", value = creature.sound },
        { label = "Emoji Favorito", value = creature.favoriteEmoji },
        { label = "Horário Favorito", value = creature.favoriteTime },
    }

    for _, info in ipairs(information) do
        table.insert(cardLines, "| " .. info.label .. ": " .. info.value)
    end

    table.insert(cardLines, "| ")
    table.insert(cardLines, "| Atributos")

    for _, attribute in ipairs(creature.attributes) do
        local line = string.format(
            "|    %-13s %s",
            attribute.name .. ":",
            getProgressBar(attribute.value)
        )
        table.insert(cardLines, line)
    end

    table.insert(cardLines, "| ")
    table.insert(cardLines, border)

    for _, line in ipairs(cardLines) do
        print(line)
    end
end

local creeper = {
    name = "CREEPER",
    description = "Um monstro furtivo com um temperamento explosivo.",
    item = "Pólvora",
    sound = "Tssssss",
    favoriteEmoji = "💥",
    favoriteTime = "Noturno",
    attributes = {
        { name = "Ataque", value = 10 },
        { name = "Defesa", value = 1 },
        { name = "Vida", value = 5 },
        { name = "Velocidade", value = 7 },
        { name = "Inteligência", value = 2 },
    },
}

renderCreatureCard(creeper)