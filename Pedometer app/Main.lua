--Import timer and graphics from CoreLibs
import "CoreLibs/timer"
import "CoreLibs/graphics"

--Import PdSteps itself
import "PdSteps"

--Import start sound
local Start_Sound = playdate.sound.fileplayer.new( "StartSound" )

--Get system menu
local Menu = playdate.getSystemMenu()

--Add step decrease, increase and reset menu options
Menu:addMenuItem( "Steps +100", function ()
  PdSteps:IncreaseSteps( 100 )
end)
Menu:addMenuItem( "Steps -100", function ()
  PdSteps:DecreaseSteps( 100 )
end)
Menu:addMenuItem( "Reset Steps", function ()
  PdSteps:ResetSteps()
end)

function playdate.update()

  --Clear the screen
  playdate.graphics.clear()

  --Update all timers so PdSteps can work
  playdate.timer.updateTimers()

  --Get the Bold font and set the font to the bold font
  playdate.graphics.setFont( playdate.graphics.getFont("bold") )

  --Display the steps along with some other text
  playdate.graphics.drawText( "Steps: " .. tostring( PdSteps:GetSteps() ), 175, 110 )
  playdate.graphics.drawText( "KM: " .. tostring( PdSteps:GetSteps() * 0.00076 ), 179, 140 )

  --Draw UI
  playdate.graphics.drawText( "Press A to stop checking steps", 10, 215 )
  playdate.graphics.drawText( "Press B to start checking steps", 10, 195 )

  --Check if the player has pressed any buttons
  if playdate.buttonJustPressed("a") then
    
    --Stop checking for steps
    PdSteps:StopStepChecking()

    --Play start sound to alert the user
    Start_Sound:play(5)

  end

  if playdate.buttonJustPressed("b") then

    --Start checking steps after 5000 milliseconds
    PdSteps:StartStepChecking(5000)

    --Reset the steps
    PdSteps:ResetSteps()

    --Play the Start sound when step checking starts to alert the user
    playdate.timer.new( 5000, function ()

      Start_Sound:play(5)

    end)

  end

end
