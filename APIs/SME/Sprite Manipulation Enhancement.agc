RemStart
    This is the Sprite Manipulation Enhancement file for AGK
    All variables in this file start with the prefix 'SME_', as to not interfer with any other variables in your code

    To make the sprite buttons work, you will need to add in the following function:
    SME_Sync ( )
        This goes instead of the normal sync. So instead of using 'Sync ()', you use 'SME_Sync ()'.

    Remember to include this file at the start of your code, and call SME_Setup()! Or, if it is in the 'Main_API' library, you should include that file at the start and call 'SetupAPIs()'

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
