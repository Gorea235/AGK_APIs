function LoadData ( fileName As String )
    global dim lines[0] as string
    global length as integer = 0

    datFile = opentoread

    lines[0] = readline(datFile)

    while FileEOF ( datFile ) = 0
        inc length
        global dim lines[length] as string
        lines[length] = readline(datFile)
    endwhile
endfunction
