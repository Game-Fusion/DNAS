-- DNAS Status and Connection Server
-- By Mr_Iron2 but modem code by Gonow32
-- DNAS is (C) 2015 Game Fusion

term.clear()
term.setCursorPos(1,1)
print("DNAS Server")

local DNAS = true
 
if DNAS == true then
 print("Current Status: Online")
elseif DNAS == false then
 print("Current Status: Shut Down")
else
 print("Current Status: Unavailable")
end
 
-- on the GS2, do this: modem.transmit(30000,30000,{sType = "requestStatus"})

local modem = peripheral.find("modem")
modem.open(30000)
 
while true do
  local e = {os.pullEvent()}
  if e[1] == "modem_message" then
    if e[3] == 30000 then
      if type(e[5]) == "table" then
        if e[5].sType then
          if e[5].sType == "requestStatus" then
            if DNAS == true then
              modem.transmit(30000, 30000, {sType = "status", sContents = "online"})
            else
              modem.transmit(30000, 30000, {sType = "status", sContents = "offline"})
            end
          end
        end
      end
    end
  end
end
