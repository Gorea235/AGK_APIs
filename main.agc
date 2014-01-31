#include "APIs\Main_API.agc"
SetupAPIs ( )

button = createspritebutton ( 0 , 0 )

do
    if getspritebuttonpressed(button) = true then message("Fired!")
    sme_sync()
loop
