// All of the commands are listed in the 'Commands.txt' file with these APIs.
// Copy and paste this into the 'AGKCommands.txt' file located in: 'Programs Files\The Game Creators\AGK\IDE\Compiler'

// All of the APIs have been included here:
#include "APIs\SME\Sprite Manipulation Enhancement.agc"
#include "APIs\Question Messages\Question Message.agc"
#include "APIs\Logging\Logging.agc"
#include "APIs\File Manipulation\File Manipulation.agc"

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
