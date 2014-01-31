                            
SetupAPIs ( )

button = createspritebutton ( 0 , 0 )

do
    if getspritebuttonpressed(button) = true then message("Fired!")
    sme_sync()
loop    
// All of the commands are listed in the 'Commands.txt' file with these APIs.
// Copy and paste this into the 'AGKCommands.txt' file located in: 'Programs Files\The Game Creators\AGK\IDE\Compiler'

// All of the APIs have been included here:
                                                       
                                                      
                                   
                                                       

// These are constants to make it easier to write your code:
#constant true 1
#constant false 0
#constant KEY_A 65
#constant KEY_B 66
#constant KEY_C 67
#constant KEY_D 68
#constant KEY_E 69
#constant KEY_F 70
#constant KEY_G 71
#constant KEY_H 72
#constant KEY_I 73
#constant KEY_J 74
#constant KEY_K 75
#constant KEY_L 76
#constant KEY_M 77
#constant KEY_N 78
#constant KEY_O 79
#constant KEY_P 80
#constant KEY_Q 81
#constant KEY_R 82
#constant KEY_S 83
#constant KEY_T 84
#constant KEY_U 85
#constant KEY_V 86
#constant KEY_W 87
#constant KEY_X 88
#constant KEY_Y 89
#constant KEY_Z 90
#constant KEY_SHIFT 16
#constant KEY_CTRL 17
#constant KEY_ENTER 13
#constant KEY_ESC 27
#constant KEY_TAB 9
#constant KEY_COMMA 188
#constant KEY_PERIOD 190
#constant KEY_FSLASH 191
#constant KEY_FORWARDSLASH 191
#constant KEY_BSLASH 220
#constant KEY_BACKWORDSLASH 220
#constant KEY_SEMICOLON 186
#constant KEY_SBRACKETOPEN 219
#constant KEY_SQUAREBRACKETOPEN 219
#constant KEY_SBRACKETCLOSE 221
#constant KEY_SQUAREBRACKETCLOSE 221
#constant KEY_APOSTROPHE 192
#constant KEY_HASHTAG 222
#constant KEY_EQUALS 187
#constant KEY_MINUS 189
#constant KEY_ALTGR 18
#constant KEY_INSERT 45
#constant KEY_HOME 36
#constant KEY_DELETE 46
#constant KEY_BACKSPACE 8
#constant KEY_END 35
#constant KEY_PGUP 33
#constant KEY_PAGEUP 33
#constant KEY_PGDOWN 34
#constant KEY_PAGEDOWN 34
#constant KEY_NUMSLASH 192
#constant KEY_NUMMULTI 106
#constant KEY_NUMMULTIPLY 106
#constant KEY_SCROLLLOCK 145
#constant KEY_GRAVE 223
#constant KEY_F1 112
#constant KEY_F2 113
#constant KEY_F3 114
#constant KEY_F4 115
#constant KEY_F5 116
#constant KEY_F6 117
#constant KEY_F7 118
#constant KEY_UP 38
#constant KEY_DOWN 40
#constant KEY_LEFT 37
#constant KEY_RIGHT 39

function SetupAPIs ( )
    Log_Start ( )
    SME_Setup ( )
endfunction

RemStart
    This is the Sprite Manipulation Enhancement file for AGK
    All variables in this file start with the prefix 'SME_', as to not interfer with any other variables in your code

    To make the sprite buttons work, you will need to add in the following function:
    SME_Sync ( )
        This goes instead of the normal sync. So instead of using 'Sync ()', you use 'SME_Sync ()'.

    Remeber to include this file at the start of your code!

    Hidden Commands:
_SME_ScaleAdjust
_SME_CenterText
_SME_SetSpriteSliderVars

    Commands:
SME_Setup
CreateSpriteWithScale
SetSpriteSizeWithScale
CreateSpriteButton
DeleteSpriteButton
SetSpriteButtonSize
SetSpriteButtonPosition
SetSpriteButtonActive
SetSpriteButtonVisible
GetSpriteButtonExists
SetSpriteButtonPositionByOffset
SetSpriteButtonAlpha
SetSpriteButtonColor
GetSpriteButtonWidth
GetSpriteButtonHeight
GetSpriteButtonPressed
GetSpriteButtonReleased
GetSpriteButtonState
SetSpriteButtonText
SetSpriteButtonTextSize
SetSpriteButtonTextSpacing
SetSpriteButtonTextColor
SetSpriteButtonTextColour
SetSpriteButtonTextFontImage
SetSpriteButtonTextDefaultFontImage
SetSpriteButtonDepth
SetSpriteButtonTextDepth
SetSpriteButtonAngle
GetSpriteButtonAngle
GetSpriteButtonX
GetSpriteButtonY
GetSpriteButtonXByOffset
GetSpriteButtonYByOffset
SetSpriteButtonX
SetSpriteButtonY
SetSpriteButtonXByOffset
SetSpriteButtonYByOffset
SetSpriteButtonPressSound
SetSpriteButtonReleaseSound
GetSpriteButtonPressSound
GetSpriteButtonReleaseSound
SetSpriteButtonDefaultPressSound
SetSpriteButtonDefaultReleaseSound
GetSpriteButtonDefaultPressSound
GetSpriteButtonDefaultReleaseSound
CreateSpriteSlider
GetSpriteSliderPercentage
SetSpriteSliderPosition
SetSpriteSliderPositionByOffset
DeleteSpriteSlider
SetSpriteSliderSize
SME_Sync
SpriteHitPointer
GetSpritePressed
GetSpriteState
GetSpriteReleased
GetSpriteMiddleY
GetSpriteMiddleX

RemEnd

Type SME_SpriteButtonType // Needed for the Sprite Manipulation Enhancment
    Id As Integer
    ImageUp As Integer
    ImageDown As Integer
    TimeDown As Integer
    ImageActive As Integer
    Active As Integer
    Visible As Integer
    Available As Integer
    Text As Integer
    PressSound As Integer
    ReleaseSound As Integer
EndType

Type SME_SpriteSliderType // Needed for the Sprite Manipulation Enhancment
    IdBack As Integer
    ImageBack As Integer
    IdButton As Integer
    ImageButton As Integer
    BackWidth As Float
    BackHeight As Float
    ButtonDiameter As Float
    Available As Integer
    ButtonX As Float
    ButtonY As Float
    BackX As Float
    BackY As Float
EndType

// ============================= Scale Adjustment ============================================

Function _SME_ScaleAdjust                 ( ) // Only for other SME functions, not needed to be called
    SME_DeviceWidth       As Float
    SME_DeviceHeight      As Float
    SME_ScaleAdjustment   As Float
    SME_DeviceWidth     = GetDeviceWidth  ( )
    SME_DeviceHeight    = GetDeviceHeight ( )
    If SME_Orientation = 1 Or SME_Orientation = 2
        SME_ScaleAdjustment = SME_DeviceWidth / SME_DeviceHeight
    Else
        SME_ScaleAdjustment = SME_DeviceHeight / SME_DeviceWidth
    EndIf
EndFunction SME_ScaleAdjustment

Function CreateSpriteWithScale    ( SME_ByOffset As Integer , SME_SprX As Float , SME_SprY As Float , SME_SprH As Float , SME_SprW As Float , Image As Integer ) //Creates a sprite but also includes size and heigth setting
    SME_Spr = CreateSprite        ( Image )
    If SME_Orientation = 1 Or SME_Orientation = 2
        SetSpriteSize             ( SME_Spr , SME_SprW / _SME_ScaleAdjust ( ) , SME_SprH )
    Else
        SetSpriteSize             ( SME_Spr , SME_SprW , SME_SprH / _SME_ScaleAdjust ( ) )
    EndIf
    If SME_ByOffset = 0
        SetSpritePosition         ( SME_Spr , SME_SprX , SME_SprY )
    ElseIf SME_ByOffset = 1
        SetSpritePositionByOffset ( SME_Spr , SME_SprX , SME_SprY )
    Else
        Message                   ( "ByOffset not set to 1 or 0, ending sprite creation..." )
        DeleteSprite              ( SME_Spr )
        ExitFunction
    EndIf
EndFunction SME_Spr

Function SetSpriteSizeWithScale ( SME_Spr As Integer , SME_NewSprW As Float , SME_NewSprY As Float ) //Set the sprite's size, but with the scaling
    If SME_Orientation = 1 Or SME_Orientation = 2
        SetSpriteSize           ( SME_Spr , SME_SprW / _SME_ScaleAdjust ( ) , SME_SprH )
    Else
        SetSpriteSize           ( SME_Spr , SME_SprW , SME_SprH / _SME_ScaleAdjust ( ) )
    EndIf
EndFunction

// ============================== End Of Scale Adjustment ===============================
// ============================== Sprite Buttons ========================================

Function CreateSpriteButton ( SME_ImageUp As Integer , SME_ImageDown As Integer )
    For I = 1 To SME_SprBCount
        If SME_ButtonSprites[I].Available = 1
            SME_Spr = I
            Exit
        EndIf
    Next
    If SME_Spr = 0
        Inc SME_SprBCount
        SME_Spr = SME_SprBCount
    EndIf
    SME_ButtonSprites[SME_Spr].ImageUp = SME_ImageUp
    SME_ButtonSprites[SME_Spr].ImageDown = SME_ImageDown
    SME_ButtonSprites[SME_Spr].Id = CreateSprite ( SME_ImageUp )
    SME_ButtonSprites[SME_Spr].ImageActive = 1
    SME_ButtonSprites[SME_Spr].Active = 1
    SME_ButtonSprites[SME_Spr].Visible = 1
    SME_ButtonSprites[SME_Spr].Available = 0
EndFunction SME_Spr

Function DeleteSpriteButton ( SME_Spr As Integer )
    DeleteSprite ( SME_ButtonSprites[SME_Spr].Id )
    SME_ButtonSprites[SME_Spr].ImageUp = 0
    SME_ButtonSprites[SME_Spr].ImageDown = 0
    If GetTextExists ( SME_ButtonSprites[SME_Spr].Text ) Then DeleteText ( SME_ButtonSprites[SME_Spr].Text )
    SME_ButtonSprites[SME_Spr].Available = 1
EndFunction

Function SetSpriteButtonSize ( SME_Spr As Integer , SME_SprW As Float , SME_SprH As Float )
    SetSpriteSize ( SME_ButtonSprites[SME_Spr].Id , SME_SprW , SME_SprH )
    _SME_CenterText ( SME_Spr )
EndFunction

Function SetSpriteButtonPosition ( SME_Spr As Integer , SME_SprX As Float , SME_SprY As Float )
    SetSpritePosition ( SME_ButtonSprites[SME_Spr].Id , SME_SprX , SME_SprY )
    _SME_CenterText ( SME_Spr )
EndFunction

Function SetSpriteButtonActive ( SME_Spr As Integer , SME_SprActive As Integer )
    SME_ButtonSprites[SME_Spr].Active = SME_SprActive
EndFunction

Function SetSpriteButtonVisible ( SME_Spr As Integer , SME_SprVisi As Integer )
    SetSpriteVisible ( SME_ButtonSprites[SME_Spr].Id , SME_SprVisi )
    SME_ButtonSprites[SME_Spr].Visible = SME_SprVisi
EndFunction

Function GetSpriteButtonExists ( SME_Spr As Integer )
    If SME_Spr <= SME_SprBCount And SME_ButtonSprites[SME_Spr].Available = 0
        ExitFunction 1
    EndIf
EndFunction 0

Function SetSpriteButtonPositionByOffset ( SME_Spr As Integer , SME_SprX As Float , SME_SprY As Float )
    SetSpritePositionByOffset ( SME_ButtonSprites[SME_Spr].Id , SME_SprX , SME_SprY )
    _SME_CenterText ( SME_Spr )
EndFunction

Function SetSpriteButtonAlpha ( SME_Spr As Integer , SME_SprAlpha As Integer )
    SetSpriteColorAlpha ( SME_ButtonSprites[SME_Spr].Id , SME_SprAlpha )
EndFunction

Function SetSpriteButtonColor ( SME_Spr As Integer , SME_Red As Integer , SME_Green As Integer , SME_Blue As Integer )
    SetSpriteColor ( SME_ButtonSprites[SME_Spr].Id , SME_Red , SME_Green , SME_Blue, 255 )
EndFunction

Function GetSpriteButtonWidth ( SME_Spr As Integer )
    returnVal = GetSpriteWidth ( SME_ButtonSprites[SME_Spr].Id )
EndFunction returnVal

Function GetSpriteButtonHeight ( SME_Spr As Integer )
    returnVal = GetSpriteHeight ( SME_ButtonSprites[SME_Spr].Id )
EndFunction returnVal

Function GetSpriteButtonPressed ( SME_Spr As Integer )
    If SME_SprPressed = SME_Spr
        SME_Return = 1
    Else
        SME_Return = 0
    EndIf
EndFunction SME_Return

Function GetSpriteButtonReleased ( SME_Spr As Integer )
    If SME_SprReleased = SME_Spr
        SME_Return = 1
    Else
        SME_Return = 0
    EndIf
EndFunction SME_Return

Function GetSpriteButtonState ( SME_Spr As Integer )
    If SME_SprState = SME_Spr
        SME_Return = 1
    Else
        SME_Return = 0
    EndIf
EndFunction SME_Return

Function SetSpriteButtonText ( SME_Spr As Integer , SME_Text As String )
    If SME_Text = "" Or GetTextExists ( SME_ButtonSprites[SME_Spr].Text )
        DeleteText ( SME_ButtonSprites[SME_Spr].Text )
        ExitFunction
    EndIf
    SME_ButtonSprites[SME_Spr].Text = CreateText ( SME_Text )
    If SME_DefaultFontImage > -1
        SetSpriteButtonTextFontImage ( SME_Spr , SME_DefaultFontImage )
    EndIf
    _SME_CenterText ( SME_Spr )
EndFunction

Function _SME_CenterText ( SME_Spr As Integer )
    If GetTextExists ( SME_ButtonSprites[SME_Spr].Text )
        SME_SprCenterX# = GetSpriteMiddleX ( SME_ButtonSprites[SME_Spr].Id )
        SME_SprCenterY# = GetSpriteMiddleY ( SME_ButtonSprites[SME_Spr].Id )
        SME_TextWidth# = GetTextTotalWidth ( SME_ButtonSprites[SME_Spr].Text )
        SME_TextHeight# = GetTextTotalHeight ( SME_ButtonSprites[SME_Spr].Text )
        SetTextPosition ( SME_ButtonSprites[SME_Spr].Text , SME_SprCenterX# - ( SME_TextWidth# / 2 ) , SME_SprCenterY# - ( SME_TextHeight# / 2 ) )
    EndIf
EndFunction

Function SetSpriteButtonTextSize ( SME_Spr As Integer , SME_Size As Float )
    SetTextSize ( SME_ButtonSprites[SME_Spr].Text , SME_Size )
    _SME_CenterText ( SME_Spr )
EndFunction

Function SetSpriteButtonTextSpacing ( SME_Spr As Integer , SME_Space As Float )
    SetTextSpacing ( SME_ButtonSprites[SME_Spr].Text , SME_Space )
    _SME_CenterText ( SME_Spr )
EndFunction

Function SetSpriteButtonTextColor ( SME_Spr As Integer , SME_Red As Integer , SME_Green As Integer , SME_Blue As Integer , SME_Alpha As Integer )
    SetTextColor ( SME_ButtonSprites[SME_Spr].Text , SME_Red , SME_Green , SME_Blue , SME_Alpha )
EndFunction

Function SetSpriteButtonTextColour ( SME_Spr As Integer , SME_Red As Integer , SME_Green As Integer , SME_Blue As Integer , SME_Alpha As Integer )
    SetTextColor ( SME_ButtonSprites[SME_Spr].Text , SME_Red , SME_Green , SME_Blue , SME_Alpha )
EndFunction

Function SetSpriteButtonTextFontImage ( SME_Spr As Integer , SME_FontImage As Integer )
    SetTextFontImage ( SME_ButtonSprites[SME_Spr].Text , SME_FontImage )
    _SME_CenterText ( SME_Spr )
EndFunction

Function SetSpriteButtonTextDefaultFontImage ( SME_FontImage As Integer )
    SME_DefaultFontImage = SME_FontImage
EndFunction

Function SetSpriteButtonDepth ( SME_Spr As Integer , SME_Depth As Integer )
    SetSpriteDepth ( SME_ButtonSprites[SME_Spr].Id , SME_Depth )
EndFunction

Function SetSpriteButtonTextDepth ( SME_Spr As Integer , SME_Depth As Integer )
    SetTextDepth ( SME_ButtonSprites[SME_Spr].Text , SME_Depth )
EndFunction

Function SetSpriteButtonAngle ( SME_Spr As Integer , SME_Rot As Float )
    SetSpriteAngle ( SME_ButtonSprites[SME_Spr].Id , SME_Rot )
EndFunction

Function GetSpriteButtonAngle ( SME_Spr As Integer )
    ReturnVal = GetSpriteAngle ( SME_ButtonSprites[SME_Spr].Id )
EndFunction ReturnVal

Function GetSpriteButtonX ( SME_Spr As Integer )
    ReturnVal = GetSpriteX ( SME_ButtonSprites[SME_Spr].Id )
EndFunction ReturnVal

Function GetSpriteButtonY ( SME_Spr As Integer )
    ReturnVal = GetSpriteY ( SME_ButtonSprites[SME_Spr].Id )
EndFunction ReturnVal

Function GetSpriteButtonXByOffset ( SME_Spr As Integer )
    ReturnVal = GetSpriteXByOffset ( SME_ButtonSprites[SME_Spr].Id )
EndFunction ReturnVal

Function GetSpriteButtonYByOffset ( SME_Spr As Integer )
    ReturnVal = GetSpriteYByOffset ( SME_ButtonSprites[SME_Spr].Id )
EndFunction ReturnVal

Function SetSpriteButtonX ( SME_Spr As Integer , SME_SprX As Integer )
    SetSpriteX ( SME_ButtonSprites[SME_Spr].Id , SME_SprX )
    _SME_CenterText ( SME_Spr )
EndFunction

Function SetSpriteButtonY ( SME_Spr As Integer , SME_SprY As Integer )
    SetSpriteY ( SME_ButtonSprites[SME_Spr].Id , SME_SprY )
    _SME_CenterText ( SME_Spr )
EndFunction

Function SetSpriteButtonXByOffset ( SME_Spr As Integer , SME_SprX As Integer )
    SetSpriteX ( SME_ButtonSprites[SME_Spr].Id , SME_SprX - ( GetSpriteWidth ( SME_ButtonSprites[SME_Spr].Id ) / 2 ) )
    _SME_CenterText ( SME_Spr )
EndFunction

Function SetSpriteButtonYByOffset ( SME_Spr As Integer , SME_SprY As Integer )
    SetSpriteY ( SME_ButtonSprites[SME_Spr].Id , SME_SprY - ( GetSpriteHeight ( SME_ButtonSprites[SME_Spr].Id ) / 2 ) )
    _SME_CenterText ( SME_Spr )
EndFunction

Function SetSpriteButtonPressSound ( SME_Spr As Integer , SME_Sound As Integer )
    SME_ButtonSprites[SME_Spr].PressSound = SME_Sound
EndFunction

Function SetSpriteButtonReleaseSound ( SME_Spr As Integer , SME_Sound As Integer )
    SME_ButtonSprites[SME_Spr].ReleaseSound = SME_Sound
EndFunction

Function GetSpriteButtonPressSound ( SME_Spr As Integer )
    rVal = SME_ButtonSprites[SME_Spr].PressSound
EndFunction rVal

Function GetSpriteButtonReleaseSound ( SME_Spr As Integer )
    rVal = SME_ButtonSprites[SME_Spr].ReleaseSound
EndFunction rVal

Function SetSpriteButtonDefaultPressSound ( SME_Sound As Integer )
    SME_PressSound = SME_Sound
EndFunction

Function SetSpriteButtonDefaultReleaseSound ( SME_Sound As Integer )
    SME_ReleaseSound = SME_Sound
EndFunction

Function GetSpriteButtonDefaultPressSound ( )
EndFunction SME_PressSound

Function GetSpriteButtonDefaultReleaseSound ( )
EndFunction SME_ReleaseSound

// ====================== End Of Sprite Buttons ===========================================
// =================================== Sprite Slider ======================================

Function CreateSpriteSlider ( SME_ImageBack As Integer , SME_ImageButton As Integer , SME_Percent As Float )
    For I = 1 To SME_SprSCount
        If SME_ButtonSprites[I].Available = 1
            SME_Spr = I
            Exit
        EndIf
    Next
    If SME_Spr = 0
        Inc SME_SprSCount
        SME_Spr = SME_SprSCount
    EndIf
    SME_Sliders[SME_Spr].IdBack = CreateSprite ( SME_ImageBack )
    SME_Sliders[SME_Spr].ImageBack = SME_ImageBack
    SME_Sliders[SME_Spr].IdButton = CreateSprite ( SME_ImageButton )
    SME_Sliders[SME_Spr].ImageButton = SME_ImageButton
    SetSpriteDepth ( SME_Sliders[SME_Spr].IdButton , 9 )
    SetSpritePosition ( SME_Sliders[SME_Spr].IdButton , GetSpriteX ( SME_Sliders[SME_Spr].IdBack ) , GetSpriteMiddleY ( SME_Sliders[SME_Spr].IdBack ) )
    _SME_SetSpriteSliderVars ( SME_Spr )
    SetSpriteSliderPercentage ( SME_Spr , SME_Percent )
    SME_Sliders[SME_Spr].Available = 0
EndFunction SME_Spr

Function GetSpriteSliderPercentage ( SME_Spr As Integer )
    returnVal# = ( ( SME_Sliders[SME_Spr].ButtonX - SME_Sliders[SME_Spr].BackX ) / SME_Sliders[SME_Spr].BackWidth ) * 100
    log( "Debug: " , "SME" , "percentage="+str(returnVal#))
EndFunction returnVal#

Function SetSpriteSliderPercentage ( SME_Spr As Integer , SME_Percent As Float )
    SME_Along# = SME_Sliders[SME_Spr].BackWidth * ( SME_Percent / 100 )
    log ("Debug: " , "SME" , "SME.BackWidth="+str(SME_Sliders[SME_Spr].BackWidth))
    log ("Debug: " , "SME" , "SME_Along#="+str(SME_Along#))
    SetSpritePositionByOffset ( SME_Sliders[SME_Spr].IdButton , SME_Sliders[SME_Spr].BackX + SME_Along# , GetSpriteMiddleY ( SME_Sliders[SME_Spr].IdBack ) )
    _SME_SetSpriteSliderVars ( SME_Spr )
EndFunction

Function SetSpriteSliderPosition ( SME_Spr As Integer , SME_X As Float , SME_Y As Float )
    SME_TmpPer# = GetSpriteSliderPercentage ( SME_Spr )
    SetSpritePosition ( SME_Sliders[SME_Spr].IdBack , SME_X , SME_Y )
    _SME_SetSpriteSliderVars ( SME_Spr )
    SetSpriteSliderPercentage ( SME_Spr , SME_TmpPer# )
EndFunction

Function SetSpriteSliderPositionByOffset ( SME_Spr As Integer , SME_X As Float , SME_Y As Float )
    SME_TmpPer# = GetSpriteSliderPercentage ( SME_Spr )
    SetSpritePositionByOffset ( SME_Sliders[SME_Spr].IdBack , SME_X , SME_Y )
    _SME_SetSpriteSliderVars ( SME_Spr )
    SetSpriteSliderPercentage ( SME_Spr , SME_TmpPer# )
EndFunction

Function DeleteSpriteSlider ( SME_Spr As Integer )
    DeleteImage ( SME_Sliders[SME_Spr].ImageBack )
    DeleteImage ( SME_Sliders[SME_Spr].ImageButton )
    DeleteSprite ( SME_Sliders[SME_Spr].IdButton )
    DeleteSprite ( SME_Sliders[SME_Spr].IdBack )
    SME_Sliders[SME_Spr].Available = 1
EndFunction

Function SetSpriteSliderSize ( SME_Spr As Integer , SME_BackWidth As Float , SME_BackHeight As Float , SME_ButtonDiameter As Float )
    SME_TmpPer# = GetSpriteSliderPercentage ( SME_Spr )
    log ("Debug: " , "SME" , str ( SME_TmpPer# ) )
    SetSpriteSize ( SME_Sliders[SME_Spr].IdBack , SME_BackWidth , SME_BackHeight )
    log ("Debug: " , "SME" , "SME.BackWidth="+str(SME_Sliders[SME_Spr].BackWidth))
    SetSpriteSize ( SME_Sliders[SME_Spr].IdButton , SME_ButtonDiameter , -1 )
    _SME_SetSpriteSliderVars ( SME_Spr )
    SetSpriteSliderPercentage ( SME_Spr , SME_TmpPer# )
EndFunction

Function _SME_SetSpriteSliderVars ( SME_Spr As Integer )
    SME_Sliders[SME_Spr].BackX = GetSpriteX ( SME_Sliders[SME_Spr].IdBack )
    SME_Sliders[SME_Spr].BackY = GetSpriteY ( SME_Sliders[SME_Spr].IdBack )
    SME_Sliders[SME_Spr].ButtonX = GetSpriteX ( SME_Sliders[SME_Spr].IdButton )
    SME_Sliders[SME_Spr].ButtonY = GetSpriteY ( SME_Sliders[SME_Spr].IdButton )
    SME_Sliders[SME_Spr].ButtonDiameter = GetSpriteWidth ( SME_Sliders[SME_Spr].IdButton )
    SME_Sliders[SME_Spr].BackWidth = GetSpriteWidth ( SME_Sliders[SME_Spr].IdBack )
    SME_Sliders[SME_Spr].BackHeight = GetSpriteHeight ( SME_Sliders[SME_Spr].IdBack )
EndFunction

// ================================== End Of Sprite Slider ================================
// ================================== Main SME Sync Command ==============================

Function SME_Sync ( )
    SME_SprPressed = -1
    SME_SprReleased = -1
    SME_Pressed = GetPointerPressed ( )
    SME_Released = GetPointerReleased ( )

    SME_Px# = GetPointerX ( )
    // ===== Buttons ======
    If SME_Pressed = 1
        For I = 0 To SME_SprBCount
            If GetSpritePressed ( SME_ButtonSprites[I].Id ) = 1 And SME_ButtonSprites[I].Active = 1
                If SME_ButtonSprites[I].Id = 0 Then Goto SME_AfterPressed
                SME_SprPressed = I
                SetSpriteImage ( SME_ButtonSprites[SME_SprPressed].Id , SME_ButtonSprites[SME_SprPressed].ImageDown )
                SME_SprMouseOver = 1
                SME_ButtonSprites[SME_SprPressed].ImageActive = 2
                SME_SprState = I
                If SME_ButtonSprites[SME_State].PressSound > 0
                    PlaySound ( SME_ButtonSprites[SME_State].PressSound )
                ElseIf SME_PressSound > 0
                    PlaySound ( SME_PressSound )
                EndIf
                Exit
            EndIf
        Next
    EndIf
    SME_AfterPressed:
    If SME_SprState > -1
        If SpriteHitPointer ( ) = SME_ButtonSprites[SME_SprState].Id
            If SME_SprMouseOver = 0
                SetSpriteImage ( SME_ButtonSprites[SME_SprState].Id , SME_ButtonSprites[SME_SprState].ImageDown )
                SME_SprMouseOver = 1
                SME_ButtonSprites[SME_SprState].ImageActive = 2
            EndIf
        Else
            If SME_SprMouseOver = 1
                SetSpriteImage ( SME_ButtonSprites[SME_SprState].Id , SME_ButtonSprites[SME_SprState].ImageUp )
                SME_SprMouseOver = 0
                SME_ButtonSprites[SME_SprState].ImageActive = 1
            EndIf
        EndIf
    EndIf
    If SME_SprState > -1
        If SME_Released = 1
            If SME_SprMouseOver = 1
                SME_SprReleased = SME_SprState
                SME_ButtonSprites[SME_SprReleased].ImageActive = 1
                SetSpriteImage ( SME_ButtonSprites[SME_SprReleased].Id , SME_ButtonSprites[SME_SprReleased].ImageUp )
                If SME_ButtonSprites[SME_SprState].ReleaseSound > 0
                    PlaySound ( SME_ButtonSprites[SME_SprState].ReleaseSound )
                ElseIf SME_ReleaseSound > 0
                    PlaySound ( SME_ReleaseSound )
                EndIf
            EndIf
            SME_SprPressed = -1
            SME_SprState = -1
        EndIf
    EndIf
    // ================ Sliders ================
    If SME_Pressed = 1
        For I = 0 To SME_SprSCount
            If GetSpritePressed ( SME_Sliders[I].IdButton )
                SME_SliderButtonState = I
                Exit
            EndIf
        Next
    EndIf
    If SME_SliderButtonState > -1
        If SME_Px# > SME_Sliders[SME_SliderButtonState].BackX And SME_Px# < ( SME_Sliders[SME_SliderButtonState].BackX + SME_Sliders[SME_SliderButton].BackWidth )
            SetSpritePositionByOffset ( SME_Sliders[SME_SliderButtonState].IdButton , SME_Px# , SME_Sliders[SME_SliderButtonState].ButtonY )
            _SME_SetSpriteSliderVars ( SME_SliderButtonState )
        EndIf
    EndIf
    If SME_SliderButtonState > -1 And SME_Released = 1
        SME_SliderButtonState = -1
    EndIf
    Sync ( )
EndFunction

// ========================== SME Variables ===================================

Function SME_Setup ( )
    Global SME_Exists As String = "TRUE"
    Global SME_Orientation As Integer
    SME_Orientation = GetOrientation ( )
    Global SME_SprBCount As Integer = 0
    Global Dim SME_ButtonSprites[10000] As SME_SpriteButtonType
    Global SME_SprReleased As Integer = -1
    Global SME_SprPressed As Integer = -1
    Global SME_SprState As Integer = -1
    Global SME_SprMouseOver As Integer
    Global SME_DefaultFontImage As Integer = -1
    Global SME_PressSound As Integer = 0
    Global SME_ReleaseSound As Integer = 0

    Global Dim SME_Sliders[10000] As SME_SpriteSliderType
    Global SME_SprSCount As Integer = 0
    Global SME_SliderButtonState As Integer = -1

    log ( "APIs: ", "SME", "Sprite Manipulation Enhancement API has been loaded!" )
EndFunction

// ============================ Misc Functions =====================================

function SpriteHitPointer ( )
    ReturnValue = GetSpriteHit ( ScreenToWorldX ( GetPointerX ( ) ) , ScreenToWorldY ( GetPointerY ( ) ) )
endfunction ReturnValue

Function GetSpritePressed   ( SME_Spr As Integer ) // Custom hit detection funtion
    If GetPointerPressed    ( ) = 1
        If SpriteHitPointer ( ) = SME_Spr
            SME_ReturnValue   = 1
        Else
            SME_ReturnValue   = 0
        EndIf
    EndIf
EndFunction SME_ReturnValue

Function GetSpriteState     ( SME_Spr As Integer ) // Custom hit detection funtion
    If GetPointerState      ( ) = 1
        If SpriteHitPointer ( ) = SME_Spr
            SME_ReturnValue   = 1
        Else
            SME_ReturnValue   = 0
        EndIf
    EndIf
EndFunction SME_ReturnValue

Function GetSpriteReleased  ( SME_Spr As Integer ) // Custom hit detection funtion
    If GetPointerReleased   ( ) = 1
        If SpriteHitPointer ( ) = SME_Spr
            SME_ReturnValue   = 1
        Else
            SME_ReturnValue   = 0
        EndIf
    EndIf
EndFunction SME_ReturnValue

Function GetSpriteMiddleY ( SME_Spr As Integer )
    returnVal = GetSpriteY ( SME_Spr ) + ( GetSpriteHeight ( SME_Spr ) / 2 )
EndFunction returnVal

Function GetSpriteMiddleX ( SME_Spr As Integer )
    returnVal = GetSpriteX ( SME_Spr ) + ( GetSpriteWidth ( SME_Spr ) / 2 )
EndFunction returnVal

Type QM_ButtonType // Needed for the Question message function
    Id As Integer
    Text As String
EndType

Type QM_SpriteType // Needed for the Question message function
    Id As Integer
    W As Float
    H As FLoat
    X As Float
    Y As Float
EndType

Function MessageBox_Show ( QM_Text As String , QM_Title As String , QM_ButtonLayout As Integer , QM_DefaultButton As Integer )
    RemStart
        QM_Text > This is the text that the message will show, it will automatically wrap to the messagebox.
        QM_Title > This is the title of the message, it will be diplayed in the top bar.
        QM_DefaultButton > This is the default button this will show when the user clicks the 'Close' button, they are shown below:
        QM_Buttons > This is what buttons to show (integer form);
        '' = Button Text, =X = DefaultButton number
        0 = 'OK'
        1 = 'SUBMIT'=1 'CANCEL'=2
        2 = 'YES'=1 'NO'=2
        3 = 'YES'=1 'NO'=2 'CANCEL'=3

        When the message is shown, the app will pause as this function will use a 'While' loop to check wether any
        button has been pressed. The messagebox will automatically size itself according to the screen size.
        The sprites used the the message box will use depth 1 and 2, this means that everything will be behind it.
    RemEnd
    QM_MessageText = CreateText  ( QM_Text )
    QM_MessageTitle = CreateText ( QM_Title )
    QM_ButtonImage = LoadImage   ( "QuestionMessageBoxMedia/Button.png" )
    If QM_ButtonLayout = 0
        Dim QM_Buttons[0] As QM_ButtonType
        QM_Buttons[0].Id = CreateSprite ( QM_ButtonImage )
        QM_Buttons[0].Text = "Ok"
    ElseIf QM_ButtonLayout = 1
        Dim QM_Buttons[1]
        QM_Buttons[0].Id = CreateSprite ( QM_ButtonImage )
        QM_Buttons[0].Text = "Submit"
        QM_Buttons[1].Id = CreateSprite ( QM_ButtonImage )
        QM_Buttons[1].Text = "Cancel"
    ElseIf QM_ButtonLayout = 2
        Dim QM_Buttons[1]
        QM_Buttons[0].Id = CreateSprite ( QM_ButtonImage )
        QM_Buttons[0].Text = "Yes"
        QM_Buttons[1].Id = CreateSprite ( QM_ButtonImage )
        QM_Buttons[1].Text = "No"
        Dec QM_ButtonLayout
    ElseIf QM_ButtonLayout = 3
        Dim QM_Buttons[2]
        QM_Buttons[0].Id = CreateSprite ( QM_ButtonImage )
        QM_Buttons[0].Text = "Yes"
        QM_Buttons[1].Id = CreateSprite ( QM_ButtonImage )
        QM_Buttons[1].Text = "No"
        QM_Buttons[2].Id = CreateSprite ( QM_ButtonImage )
        QM_Buttons[2].Text = "Cancel"
        Dec QM_ButtonLayout
    EndIf
    QM_Orientation = GetOrientation     ( )
    QM_MessageTop As QM_SpriteType
    QM_MessageTop.Id = CreateSprite     ( LoadImage ( "QuestionMessageBoxMedia/BackgroundTop.png" ) )
    SetSpriteDepth                      ( QM_MessageTop.Id , 2 )
    QM_MessageBottom As QM_SpriteType
    QM_MessageBottom.Id = CreateSprite  ( LoadImage ( "QuestionMessageBoxMedia/BackgroundBottom.png" ) )
    SetSpriteDepth                      ( QM_MessageBottom.Id , 2 )
    QM_VirtualWidth = GetVirtualWidth   ( )
    QM_VirtualHeight = GetVirtualHeight ( )
    If Orientation = 1 Or QM_Orientation = 2
        QM_MessageTop.W = QM_VirtualWidth - ( QM_VirtualWidth * 0.05 )
        QM_MessageTop.H = QM_VirtualHeight - ( QM_VirtualHeight * 0.5 )
        QM_MessageTop.X = ScreenToWorldX ( ( QM_VirtualWidth * 0.5 ) - ( QM_MessageTop.W * 0.5 ) )
        QM_MessageTop.Y = ScreenToWorldY ( ( QM_VirtualHeight * 0.5 ) - ( QM_MessageTop.H * 0.5 ) )
        SetSpriteSize     ( QM_MessageTop.Id , QM_MessageTop.W , QM_MessageTop.H )
        SetSpritePosition ( QM_MessageTop.Id , QM_MessageTop.X , QM_MessageTop.Y )
        SetSpriteSize     ( QM_MessageBottom.Id , QM_MessageBottom.W , QM_MessageBottom.H )
        SetSpritePosition ( QM_MessageBottom.Id , QM_MessageBottom.X , QM_MessageBottom.Y )
    Else

    EndIf
EndFunction

function Log ( log_prefix as string , log_suffix as string , log_data as string )
    if log_run <> "1" then log_start ()
    log_file as integer
    log_file = opentowrite( log_name , 1 )
    log_write as string
    log_write = log_prefix + "[" + getcurrentdate() + "] [" + getcurrenttime() + "] [" + log_suffix + "] " + log_data
    writeline( log_file , log_write )
    closefile ( log_file )
endfunction

function Log_Start ()
    global log_run as string = "1"
    cTimeRaw as string
    cTimeRaw = getcurrenttime ()
    currenttime as string
    currenttime = getstringtoken ( cTimeRaw , ":" , 1 ) + "." + getstringtoken ( cTimeRaw , ":" , 2 ) + "." + getstringtoken ( cTimeRaw , ":" , 3 )
    currentdate as string
    currentdate = getcurrentdate ()
    logname as string
    logname = "Log_[" + currentdate + "]_[" + currenttime + "].log"
    global log_name as string
    log_name = logname
    global dim backlog_prefix[0] as string
    global dim backlog_suffix[0] as string
    global dim backlog_data[0]   as string
    global dim backlog_time[0]   as string
    global dim backlog_date[0]   as string
    global backlog_length as integer = 0
    Log ( "APIs: ", "Logger", "Logging API has been loaded!")
endfunction

function Add_Backlog ( log_prefix as string , log_suffix as string , log_data as string )
    newL as integer
    newL = backlog_length
    global dim backlog_prefix[newL] as string
    global dim backlog_suffix[newL] as string
    global dim backlog_data[newL]   as string
    global dim backlog_time[newL]   as string
    global dim backlog_date[newL]   as string
    backlog_prefix[newL] = log_prefix
    backlog_suffix[newL] = log_suffix
    backlog_data[newL] = log_data
    backlog_time[newL] = getcurrenttime ()
    backlog_date[newL] = getcurrentdate ()
    inc backlog_length
endfunction

function Dump_Backlog ()
    log ( "Output: " , "Logger" , "Starting backlog dump:")
    log_file = opentowrite( log_name , 1 )
    log_write as string
    if backlog_length > 1
        for i = 0 to backlog_length - 1
            log_write = "    Dump: " + backlog_prefix[i] + "[" + backlog_date[i] + "] [" + backlog_time[i] + "] [" + backlog_suffix[i] + "] " + backlog_data[i]
            writeline( log_file , log_write )
        next
    endif
    closefile ( log_file )
    global dim backlog_prefix[0] as string
    global dim backlog_suffix[0] as string
    global dim backlog_data[0]   as string
    global dim backlog_time[0]   as string
    global dim backlog_date[0]   as string
    global backlog_length as integer = 0
    log ( "Output: " , "Logger" , "Backlog successfully dumped")
endfunction

function ClearLogs ()
    dim files[0] as string
    files[0] = getfirstfile()
    fLength = 1
    nextfile as string
    nextfile = getnextfile ()
    while nextfile <> ""
        dim files[fLength] as string
        files[fLength] = nextfile
        inc fLength
        nextfile = getnextfile()
    endwhile
    for i = 0 to fLength - 1
        if getstringtoken( files[i], ".", countstringtokens ( files[i] , "." ) ) = "log"
            if files[i] <> log_name then deletefile ( files[i] )
        endif
    next
    log ( "Warning: " , "Logger" , "All logs successfully cleared, you cannot retrive them")
endfunction

function LoadData ( fileName As String )
    global dim lines[0] as string
    global length as integer = 0

    datFile = opentoread(fileName)

    lines[0] = readline(datFile)

    while FileEOF ( datFile ) = 0
        inc length
        global dim lines[length] as string
        lines[length] = _remove_spaces ( getstringtoken ( readline(datFile), " ", 1 ) )
    endwhile
endfunction

function _remove_spaces ( toremove as string )
    tokens = countstringtokens( toremove, " " )
    returnStr as string
    token as string
    for i = 1 to tokens
        token = getstringtoken(toremove, " ", i)
        returnStr = returnStr + token
    next
endfunction returnStr

function GetDataString ( dataName as string )
    for i = 0 to length
        if getstringtoken ( lines[i], "=", 1) = dataName then goto FM_AfterFor
    next
FM_AfterFor:
    returnStr as string
    returnStr = getstringtoken(lines[i], "=", 2)
    if returnStr <> "" then exitfunction returnStr
endfunction "0"
