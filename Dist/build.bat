CALL "%VS140COMNTOOLS%vsvars32.bat"
pushd ..
devenv ActWebSocket.sln /build Release
mkdir Dist\temp
copy /Y ACTWebSocket.Loader\bin\Release\ACTWebSocket*.dll Dist\temp
copy /Y ACTWebSocket.Loader\bin\Release\websocket*.dll Dist\temp
copy /Y ACTWebSocket.Loader\bin\Release\MimeType*.dll Dist\temp
xcopy /Y/s Sample Dist\temp\
popd
del ACTWebSocket_latest.7z
xcopy /Y/s "C:\Workspace\QtTest\bin\Windows\x86\Release" overlay
pushd temp
xcopy /Y/s ..\overlay overlay
"c:\Program Files\7-Zip\7z.exe" a ..\ACTWebSocket_latest.7z *
popd temp
