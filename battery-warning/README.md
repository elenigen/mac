## Description
In order to make it more explicit when the battery is low and needs to be charged.   
If the charge is ...   
< 5% ➔ Blink the screen one time   
< 3% ➔ Blink the screen three times   
< 2% ➔ Blink the screen three times and send a voice message `PLUG ME IN NOW` + a notification: `Computer is about to shutdown!`   

## Steps

1. Enable invert colors shortcut:
```
System Preferences... -> Keyboard -> Accessibility -> Invert colors [x]
```
2. Allow macscript to modify Accessibility
```
System Preferences... -> Security & Privacy -> Accessibility -> Privacy -> + -> osascript
```
3. Test that it's working from your shell:
```
osascript -e "tell application \"System Events\"" -e "key code 28 using {command down, option down, control down}" -e "end tell"
```
4. Create the script
```
sudo vim /etc/batteryScript.applescript
```
Copy content from `batteryScript.applescript` file

5. Configure script access:
```
sudo chmod +rx /etc/batteryScript.applescript
```
6. Invoking script
```
vim ~/Library/LaunchAgents/batteryAlert.plist
```
Copy content from `batteryAlert.plist` file

7. Reboot the OS or manually load the launchd module. 
```
launchctl load ~/Library/LaunchAgents/batteryAlert.plist
```
