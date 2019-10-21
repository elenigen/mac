set Cap to (do shell script "ioreg -w0 -l | grep ExternalChargeCapable")
tell Cap to set {wallPower} to {last word of paragraph 1}
if wallPower = "Yes" then
 return 0
else
 set Cap to (do shell script "ioreg -wO -l | grep AppleRaw")
 tell Cap to set {Max, Available} to {last word of paragraph 2, last word of paragraph 1}
 set Pct to round (100 * Available / Max)
 if Pct <= 5 then
  tell application "System Events" key code 28 using {command down, option down, control down}
  end tell
  delay 1
  tell application "System Events"
   key code 28 using {command down, option down, control down}
  end tell
  if Pct <= 3 then
   delay 1
   tell application "System Events"
    key code 28 using {command down, option down, control down}
   end tell
   delay 1
   tell application "System Events"
    key code 28 using {command down, option down, control down}
   end tell
   delay 1 
   tell application "System Events"
    key code 28 using {command down, option down, control down}    
   end tell
   delay 1
   tell application "System Events"
    key code 28 using {command down, option down, control down}    
   end tell
   if Pct <= 1 then
    display notification "Computer is about to shutdown!" with title "---=== WARNING ===---"
    beep 5
    do shell script "say -v \"Alex\" \"PLUG ME IN NOW\"" 
   end if
  end if
 end if
end if
