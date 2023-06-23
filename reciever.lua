local reCompID = 1 -- Must match the ID of the ComputerCraft PC
rednet.open("back") -- Dependent on which side of the block the wireless modem is attached to  

while true do
  local senderID, message = rednet.receive()
  if senderID == reCompID then
    if message == "REDSTONE" then
      redstone.setOutput("right", true) -- Tells the computer which side of the ComputerCraft computer block to send a redstone signal to and using "true" to signal that the redstone signal should be on
      sleep(2)
      redstone.setOutput("right", false) -- Using false tells the ComputerCraft computer to turn off the redstone signal
    end
  end
end
