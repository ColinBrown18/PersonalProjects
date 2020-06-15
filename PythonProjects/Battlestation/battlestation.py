import os
import subprocess
import webbrowser

spotify = r'C:\Users\Colin\AppData\Roaming\Spotify\Spotify.exe'
vscode = r'C:\Users\Colin\AppData\Local\Programs\Microsoft VS Code\Code.exe'

#open chrome and get URL's for websites I may want to open
chrome = r'C:\Program Files (x86)\Google\Chrome\Application\Chrome.exe %s'
TwitchURL = 'https://www.twitch.tv/'
GitURL = 'https://github.com/ColinBrown18/PersonalProjects'

#doesn't seem to want to open it but it doesn't throw an error
#android = r'C:\Users\Colin\AppData\Local\Android\Sdk\emulator\qemu\windows-x86_64\qemu-system-x86_64.exe'
#subprocess.Popen(android)

#add the 'Popen(vscode, filename)' to open the exact file I want
#subprocess.Popen(vscode)

#figure out how to open multiple windows
webbrowser.get(chrome).open(TwitchURL)
#webbrowser.get(chrome).open(GitURL)