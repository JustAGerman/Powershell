$Path = Resolve-Path "$HOME/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"
start-process explorer.exe "$Path"