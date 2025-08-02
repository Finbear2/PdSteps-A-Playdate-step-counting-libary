# Welome to PdSteps!
A step-counting library for the Playdate

## Installation
To install PdSteps, copy the "PdSteps.lua" file into your project and import it with this line of code:

```lua
import "Path/to/the/lua/file"
```
## Important

To work, the Playdate must be in the pocket of the user.

### Accuracy

According to a video review of pd-steps by Playdate Player on YouTube, after a walk around the park, I
the amount of steps PD-steos said had been walked was exactly the same as a pedometer from Amazon though it differed by a bit compared to the pedometer on his phone.

## Time to get started!
To start tracking the steps, you need the following lines:

```lua
--Import timer from CoreLibs
import "CoreLibs/timer"

--Import PdSteps itself
import "Path/To/PdSteps"

--Start checking steps after 15000 milliseconds ( 15 seconds )
  PdSteps:StartStepChecking( 15000 )

function playdate.update()

  --Update all timers so PdSteps can work
  playdate.timer.updateTimers()

end
```

So this piece of code will start tracking the steps, but it doesn't display the steps. For that, we'll use this piece of code:

```lua
--Import timer and graphics from CoreLibs
import "CoreLibs/timer"
import "CoreLibs/graphics"

--Import PdSteps itself
import "Path/To/PdSteps"

--Start checking steps after 15000 milliseconds ( 15 seconds )
  PdSteps:StartStepChecking( 15000 )

function playdate.update()

  --Clear the screen
  playdate.graphics.clear()

  --Update all timers so PdSteps can work
  playdate.timer.updateTimers()

  --Display the steps
  playdate.graphics.drawText( tostring( PdSteps:GetSteps()), 200, 120 )

end
```

YAY! You made a working pedometer for the Playdate!

## Everything you can do
This section goes through all the functions and features


```lua
PdSteps:GetSteps()
```
Returns the number of steps taken as an integer.


```lua
PdSteps:GetAreStepsTracking()
```
Returns whether or not steps are being tracked as a boolean.


```lua
PdSteps:ResetSteps()
```
Sets steps to 0.


```lua
PdSteps:StartStepChecking( Delay )
```
Starts to check steps after delay, this includes disabling screen auto lock and starting the accelerometer. The delay needs to be in milliseconds.


```lua
PdSteps:StopStepChecking()
```
Stops checking the steps, which includes turning off the accelerometer and disabling the auto lock.


```lua
PdSteps:IncreaseSteps( Amount )
```
Increases the steps by amount.


```lua
PdSteps:DecreaseSteps( Amount )
```
Decreases the steps by amount.


## THANK YOU!

I hope that in the future people use this library to make fun and interesting games that take up full use of the Playdate's capabilities.
From Finley
