# starting from game folder
Set-Location D:\Code\Love\basketball_memory

# copy love dlls
Copy-Item D:\LOVE\love.exe .
Copy-Item D:\LOVE\love.dll .
Copy-Item D:\LOVE\lua51.dll .
Copy-Item D:\LOVE\SDL2.dll .
Copy-Item D:\LOVE\OpenAL32.dll .
Copy-Item D:\LOVE\mpg123.dll .

# zip files
Compress-Archive -Path ./* -DestinationPath temp.zip
Rename-Item -Path temp.zip -NewName BasketballMemoryLegends.love

# bundle together everything
cmd /c copy /b love.exe + BasketballMemoryLegends.love BasketballMemoryLegends.exe

# create final zip
Compress-Archive -Path "./BasketballMemoryLegends.exe", "love.dll", "lua51.dll", "SDL2.dll", "OpenAL32.dll", "mpg123.dll" -DestinationPath "./BasketballMemoryLegends.zip"

# cleanup
Remove-Item BasketballMemoryLegends.exe
Remove-Item BasketballMemoryLegends.love
Remove-Item love.exe
Remove-Item love.dll
Remove-Item lua51.dll
Remove-Item SDL2.dll
Remove-Item OpenAL32.dll
Remove-Item mpg123.dll
