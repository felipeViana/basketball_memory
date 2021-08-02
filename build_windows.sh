# starting from game folder
Compress-Archive -Path ./* -DestinationPath BasketballMemoryLegends.zip
cp D:\LOVE\love.exe .
cmd /c copy /b love.exe+BasketballMemoryLegends.love BasketballMemoryLegends.exe

cp D:\LOVE\love.dll .
cp D:\LOVE\lua51.dll .
cp D:\LOVE\SDL2.dll .
cp D:\LOVE\OpenAL32.dll .
cp D:\LOVE\mpg123.dll .
