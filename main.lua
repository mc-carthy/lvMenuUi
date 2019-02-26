BUTTON_HEIGHT = 60

local function newButton(text, callBack)
    return {
        text = text,
        func = callBack,
        clickedNow = false,
        clickedLast = false
    }
end

local buttons = {}
local font = nil

function love.load()
    font = love.graphics.newFont(32)
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

    local buttonBgColour = { 0.75, 0.75, 0.75 }
    local buttonBgHighlightedColour = { 1, 1, 1 }
    local mouseX, mouseY = love.mouse.getPosition()

    for i, button in ipairs(buttons) do
        button.clickedLast = button.clickedNow

        local buttonX = screenWidth / 2 - buttonWidth / 2
        local buttonY = screenHeight / 2 - totalHeight / 2 + (i - 1) * (BUTTON_HEIGHT + margin)

        local highlighted = mouseX > buttonX and mouseX < buttonX + buttonWidth and mouseY > buttonY and mouseY < buttonY + BUTTON_HEIGHT

        if highlighted then
            love.graphics.setColor(unpack(buttonBgHighlightedColour))
            button.clickedNow = love.mouse.isDown(1)
        else
            love.graphics.setColor(unpack(buttonBgColour))
        end

        if button.clickedNow and not button.clickedLast then
            button.func()
        end

        love.graphics.rectangle(
            'fill', 
            buttonX, buttonY,
            buttonWidth, BUTTON_HEIGHT
        )
        love.graphics.setColor(0, 0, 0)
        love.graphics.setFont(font)
        local textW = font:getWidth(button.text)
        local textH = font:getHeight(button.text)
        love.graphics.print(
            button.text,
            -- TODO: Verify these x & y parameters are correct
            (screenWidth / 2 ) - textW / 2, 
            buttonY + textH / 2
        )
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end