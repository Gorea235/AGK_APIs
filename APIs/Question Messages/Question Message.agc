Type QM_SpriteType // Needed for the Question message function
    Id As Integer
    W As Float
    H As FLoat
    X As Float
    Y As Float
EndType

Function MessageBox_Show ( QM_Text As String , QM_Title As String , QM_ButtonLayout As Integer , QM_DefaultButton As Integer )
    RemStart
        //////////////////// Requires 'Sprite Manipulation Enhancement' to work!!! ///////////////////////////////
        QM_Text > This is the text that the message will show, it will automatically wrap to the messagebox.
        QM_Title > This is the title of the message, it will be diplayed in the top bar.
        QM_ButtonLayout > This is what buttons to show (integer form);
        '' = Button Text, =X = DefaultButton number
        0 = 'OK'
        1 = 'SUBMIT'=1 'CANCEL'=2
        2 = 'YES'=1 'NO'=2
        3 = 'YES'=1 'NO'=2 'CANCEL'=3
        QM_DefaultButton > This is the default button number that this function will return when the user clicks the 'Close' button, they are shown below:

        When the message is shown, the app will pause as this function will use a 'While' loop to check wether any
        button has been pressed. The messagebox will automatically size itself according to the screen size.
        The sprites used the the message box will use depth 1 and 2, this means that everything will be behind it.
    RemEnd
    QM_MessageText = CreateText  ( QM_Text )
    QM_MessageTitle = CreateText ( QM_Title )
    QM_ButtonImageUp = LoadImage   ( "QuestionMessageBoxMedia/Button_Up.png" )
    QM_ButtonImageDown = LoadImage   ( "QuestionMessageBoxMedia/Button_Down.png" )
    If QM_ButtonLayout = 0
        Dim QM_Buttons[0] As Integer
        QM_Buttons[0] = CreateSpriteButton ( QM_ButtonImageUp, QM_ButtonImageDown )
        SetSpriteButtonText ( QM_Buttons[0], "Ok" )
    ElseIf QM_ButtonLayout = 1
        Dim QM_Buttons[1] As Integer
        QM_Buttons[0] = CreateSpriteButton ( QM_ButtonImageUp, QM_ButtonImageDown )
        SetSpriteButtonText ( QM_Buttons[0], "Submit" )
        QM_Buttons[0].Text = "Submit"
        QM_Buttons[1] = CreateSpriteButton ( QM_ButtonImageUp, QM_ButtonImageDown )
        QM_Buttons[1].Text = "Cancel"
    ElseIf QM_ButtonLayout = 2
        Dim QM_Buttons[1] As Integer
        QM_Buttons[0].Id = CreateSpriteButton ( QM_ButtonImageUp, QM_ButtonImageDown )
        QM_Buttons[0].Text = "Yes"
        QM_Buttons[1].Id = CreateSpriteButton ( QM_ButtonImageUp, QM_ButtonImageDown )
        QM_Buttons[1].Text = "No"
        Dec QM_ButtonLayout
    ElseIf QM_ButtonLayout = 3
        Dim QM_Buttons[2] As Integer
        QM_Buttons[0].Id = CreateSpriteButton ( QM_ButtonImageUp, QM_ButtonImageDown )
        QM_Buttons[0].Text = "Yes"
        QM_Buttons[1].Id = CreateSpriteButton ( QM_ButtonImageUp, QM_ButtonImageDown )
        QM_Buttons[1].Text = "No"
        QM_Buttons[2].Id = CreateSpriteButton ( QM_ButtonImageUp, QM_ButtonImageDown )
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
