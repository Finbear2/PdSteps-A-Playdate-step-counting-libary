import "CoreLibs/timer"

-- Hi, thanks for using my Step Counting Libary!
-- I hope you make some cool and uniqe games.
-- From Finley :)

local pd = playdate


StepChecking = false

local Pre_Acel
local Acel


PdSteps = {}

Steps = 0


function PdSteps:GetSteps()
    
    return Steps

end

function PdSteps:GetAreStepsTracking()
    
    return StepChecking

end

function PdSteps:ResetSteps()
    
    Steps = 0

end

function PdSteps:StartStepChecking( Delay )
    
    pd.timer.new( Delay, function ()
        
        Pre_Acel = 0

		StepChecking = true

        CheckSteps()

    end)

end

function CheckSteps()
    
	pd.startAccelerometer()
	pd.setAutoLockDisabled( true )


	local x, y, z = pd.readAccelerometer()

	Acel = x

	local accellaration

	
	accellaration = math.abs( Acel - Pre_Acel )

	
	if accellaration > 0.89 then
		
		Steps += 1

	end

	Pre_Acel = x

	if StepChecking == true then

		pd.timer.new( 23, function ()

			CheckSteps()

		end )

	end

end

function PdSteps:StopStepChecking()
    
    StepChecking = false

    pd.stopAccelerometer()
    pd.setAutoLockDisabled(false)

end

function PdSteps:IncreaseSteps( Amount )
    
    Steps += Amount

end

function PdSteps:DecreaseSteps( Amount )
    
    if Steps - Amount < 0 then
		
		Steps = 0

	else

		Steps -= Amount

	end

end
