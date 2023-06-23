local monitor = peripheral.wrap("monitor_0") -- Allows for ComputerCraft computer to access monitor


local function writeCentered(text, y, size) -- Adds text to the center by getting the size of the window and placing it in the center, Size of text is done first to account for the change in text size in comparison to the window size preventing overflow
  monitor.setTextScale(size)
  local X = term.getSize()
  local centerXPos = (x - string.len(text)) / 2
  term.setCursorPos(centerXPos, y)
  textutils.slowPrint(text)
end


function button(xPos, yPos, text) -- Gets the x and y positioning of where buttons will be placed and sets the length and height of the button
  term.setCursorPos(xPos, yPos)
  write(text)
  local xEnd, yEnd = term.getCursorPos()
  length = xEnd - xPos
  height = yEnd - yPos
  return xPos, yPos, length, height
end


function writeButton() -- Writes the buttons using input x and y positioning
  buttonYes = {button(9, 11, "yes")}
  buttonNo = {button(39, 11, "no")}

  while true do
      event, _, xPos, yPos = os.pullEvent("mouse_click")
      if xPos >= buttonYes[1] and xPos <= buttonYes[1]+buttonYes[3] and yPos >= buttonYes[2] and yPos <= buttonYes[2]+buttonYes[4] then
        ans = "yes"
        break
      end
      if xPos >= buttonNo[1] and xPos <= buttonNo[1]+buttonNo[3] and yPos >= buttonNo[2] and yPos <= buttonNo[2]+buttonNo[4] then
        ans = "no"
        break
      end
    end
  end


function door() -- Uses a wireless modem in ComputerCraft to send a signal to a receiver computer telling it to open the vault doors using redstone
  local compID1 = 1 -- CompID must match the ID of the receiving computer
  local compID2 = 2

  rednet.open("back")

  rednet.send(compID1, "REDSTONE")
  rednet.send(compID2, "REDSTONE")
end


function launchSequence -- Gives the user a countdown for their rocket launch. Could clean up using a for loop
  writeCentered("Please enter your rocket!", 4, 2)
  door()
  sleep(5)
  term.clear()
  writeCentered("Press space!", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("10", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("9", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("8", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("7", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("6", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("5", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("4", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("3", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("2", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("1", 4, 2)
  sleep(1)
  term.clear()
  writeCentered("LIFT OFF!", 4, 2)
  sleep(4)
end


while true do -- Screen the users see when first using the computer giving instructions and asking questions
  writeCentered("Launch Sequence Activated", 3, 1)
  writeCentered("Are you prepared to enter your rocket?", 5, 1)
  writeButton()
  if ans == "yes" then
    term.clear()
    writeCentered("Do you have everything you need?", 3, 1)
    writeCentered("Like fuel for your return journey", 4, 1)
    writeButton()
  end
  if ans == "no" then
    term.clear()
    writeCentered("Be sure to return when you are ready!", 3, 1)
  end

  if ans == "yes" then
    writeCentered("Then let's launch!", 7, 1)
    sleep(3)
    term.clear()
    launchSequence()
  end
    
sleep(5)
term.clear()
end
