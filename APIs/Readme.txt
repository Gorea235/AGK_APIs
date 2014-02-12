To set up the highlighting, please follow these steps:

(From here, I will use '~' to reference the AGK installation location, which is by default 'C:\Program Files\The Game Creators\AGK\' or 'C:\Program Files (x86)\The Game Creators\AGK\'. This is a technique that I have got from using linux.)

To install the commands, you first have to go to ~\IDE\Compiler and open the 'AGKCommands.txt' file. If this is in the program files folder, you will need administrator permissions to do this, and so you should copy the file somewhere else for editing, then copy it back to allow saving. When you have opened it, copy the contents of the 'Commands.txt' file into the end of the AGKCommands.txt file. The functions will now highlight.

To install the keywords, you have to copy 'lexer_api.xml' and 'lexer_api.sample' to ~\IDE\Editor\share\CodeBlocks\lexers. Now you have to go into the AGK program. Click on 'Settings', then 'Editor'. Goto 'Syntax Highlighting' and click on the 'Syntax highlighing for:' dropdown box. Click on 'API' and your done.