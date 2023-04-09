number = 1
speed = 80
push = require 'push'

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

player_x= 0
player_y= 0
function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync= true

        
       
    })
    

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'space' then
        number = number + 1
    end
end

function love.update(dt)
    if love.keyboard.isDown('d') then
        player_x = math.min(VIRTUAL_WIDTH -40, player_x + speed * dt)
    end
    
    if love.keyboard.isDown('w') then
        player_y = math.max(0, player_y - speed * dt)
    end
    
    if love.keyboard.isDown('a') then
        player_x = math.max(0, player_x - speed * dt)
    end
    
    if love.keyboard.isDown('s') then
        player_y = math.min(VIRTUAL_HEIGHT - 40, player_y + speed * dt)
    end
end

print(math.min(3 , 4))
print(math.max(3 , 4))

function love.draw()
    push:apply('start')
-- ბეგრაუნდის ფერი.
    love.graphics.clear(155/255, 138/255, 255/255, 255/255)
    -- ფერის შეცვლა.
    love.graphics.setColor(47/255, 255/255, 138/255, 255/255)
-- პრინტავს ეკრანზე ტექსტს.
    love.graphics.printf(
        number,
        0,
        VIRTUAL_HEIGHT/2 - 18,
        VIRTUAL_WIDTH,
        'center'
    )
    love.graphics.setColor(51/255, 219/255, 152/255, 255/255)
-- მოძრავი ოთხკუთხედი.
    love.graphics.rectangle('fill', player_x, player_y, 40, 40)
    push:apply('end')
end


