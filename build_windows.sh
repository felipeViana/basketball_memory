zip -9r BasketballMemoryLegends.love .
cat ~/love/distros/love-11.3-win32/love.exe BasketballMemoryLegends.love > BasketballMemoryLegends.exe
mv BasketballMemoryLegends.exe ~/love/distros/BasketballMemoryLegends-windows/
rm BasketballMemoryLegends.love
cd ~/love/distros/
zip -9rX BasketballMemoryLegends-windows.zip  BasketballMemoryLegends-windows/
