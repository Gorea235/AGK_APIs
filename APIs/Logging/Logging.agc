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
