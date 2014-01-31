remstart
type FM_fileType
    name as string
    open as integer
    dim lines[0] as string
    length as integer
endtype

function FM_Load ( )
    global FM_files[0] as FM_fileType
    global FM_openFiles as integer = 0
endfunction

function LoadData ( fileName As String )
    FM_datFile = opentoread(fileName)
    FM_files[FM_openFiles].lines[0] = readline(datFile)

    while FileEOF ( FM_datFile ) = 0
        inc FM_files[FM_openFiles].length
        global dim FM_files[FM_openFiles].lines[FM_files[FM_openFiles].length] as string
        FM_files[FM_openFiles].lines[FM_files[FM_openFiles].length] = FM_remove_spaces ( getstringtoken ( readline(FM_datFile), "#", 1 ) )
    endwhile
    inc FM_openFiles
endfunction FM_openFiles

function FM_remove_spaces ( toremove as string )
    FM_tokens = countstringtokens( toremove, " " )
    FM_returnStr as string
    FM_token as string
    for i = 1 to FM_tokens
        FM_token = getstringtoken(toremove, " ", i)
        FM_returnStr = FM_returnStr + FM_token
    next
endfunction FM_returnStr

function GetDataString ( fileID as integer, dataName as string )
    for i = 0 to FM_files[fileID].length
        if getstringtoken ( FM_files[fileID].lines[i], "=", 1) = dataName then goto FM_AfterFor
    next
FM_AfterFor:
    FM_returnStr as string
    FM_returnStr = getstringtoken(FM_lines[i], "=", 2)
    if FM_returnStr <> "" then exitfunction FM_returnStr
endfunction "0"

function GetDataInteger ( fileID as integer, dataName as string )
    FM_returnVal = val ( GetDataString ( fileID, dataName ) )
endfunction FM_returnVal

function FM_GetDataFloat ( fileID as integer, dataName as string )
    FM_returnVal = valfloat ( GetDataString ( fileID, dataName ) )
endfunction FM_returnVal

function SaveDataString ( fileID dataName as string, dataValue as string )
    FM_line = 0
    for i = 0 to FM_length
        if getstringtoken(FM_lines[i], "=", 1) = dataName then FM_line = i
    next
    if FM_line > 0
        FM_token1$ = getstringtoken(lines[line], "=", 1)
        FM_lines[FM_line] = FM_token1$ + "=" + dataValue
    else
        inc FM_length
        global dim FM_lines[FM_length] as string
        FM_lines[FM_length] = dataName + "=" + dataValue
    endif
    FM_file = opentowrite( FM_dataFileName, 0 )
    for i = 0 to FM_length

endfunction
remend
