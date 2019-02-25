BUTTON_HEIGHT = 60

local function newButton(text, callBack)
    return {
        text = text,
        func = callBack
    }
end

local buttons = {}

function love.load()
    table.insert(buttons, newButton(
        'Start Game',
        function()
            print('Starting Game')
        end
    ))
    table.insert(buttons, newButton(
        'Load Game',
        function()
            print('Loading Game')
        end
    ))
    table.insert(buttons, newButton(
        'Settings',
        function()
            print('Going to Settings')
        end
    ))
    table.insert(buttons, newButton(
        'Quit Game',
        function()
            love.event.quit()
        end
    ))
end

function love.update(dt)

end

function love.draw()
    local screenWidth, screenHeight = love.graphics.getDimensions()
    local buttonWidth = screenWidth / 3
    local margin = 20
    local totalHeight = (BUTTON_HEIGHT + margin) * #buttons
    for i, button in ipairs(buttons) do
        love.graphics.setColor(0.75, 0.75, 0.75)
        love.graphics.rectangle(
            'fill', 
            screenWidth / 2 - buttonWidth / 2,
            screenHeight / 2 - totalHeight / 2 + (i - 1) * (BUTTON_HEIGHT + margin),
            buttonWidth, BUTTON_HEIGHT
        )
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end