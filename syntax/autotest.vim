" Vim syntax file
" Language: Autotest Script
" Last Change: Oct 1, 2009
" Version: 1.0

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "log"

syn case match
syn match xSection /^\[.*\]/
syn keyword KeywordBasic print_if set_if goto_if run_if tags Tags testid TestId TestID TESTID severity Severity
syn keyword KeywordBasic sync_point curl expect buf_raw buf_endwith buf_match report check_if assert reportall
syn keyword KeywordBasic comment Comment setdebug varcomment multiexpect clear_buffer clean_buffer setenv printreport
syn keyword KeywordBasic setvarresultlist setvarfor ctrl_z ctrl_c setvar compare
syn keyword KeywordBasic myinteract myset myedit save_log save_log_stop
syn keyword xFGTFunction resetFirewall retrieveFirewall rebootFirewall rebootFirewallNow retrieveSerial coverage_upload_file coverage_upload coverage_clear backupFullConfig restoreImage backupConfig restoreConfig 
syn keyword xFGTFunction increase_vdom gatherPID
syn keyword xFGTFunction RestoreIPSSIGtftp BackupIPSSIGtftp RestoreIPStftp RestoreIPSftp
syn keyword xFGTFunction RestoreFaseftp RestoreFasetftp
syn keyword xFGTFunction scheduletime outputfile varexpect checknext  smartcompare setresultlist sleep purgequarantine writeEnv keep_running retrieveProcess
syn keyword xPCFunction checkHAstatus myftp mytelnet pcsend tool_dut tool_cmd check_address
syn keyword xSwitchFunction set_sw
syn keyword xFMGFunction formatFMG commitfgt resetFMG installfgt addfgt reloadfgt deletedevice
syn keyword xSpecialFunction localtelnet localssh windowstelnet localsshv sshsocket localftp end contained
syn keyword xSpecialFunction while endwhile loop until  if else elseif fi contained
syn region xInclude matchgroup=xHeader start=/include/ end=/$/

syn region Junk matchgroup=xFGTFunctionrange start=+[^-]range+ end="$"
syn region xAutolocal matchgroup=xParen start=/{/ end=/}/ contains=xSpecialFunction,contained oneline
syn region xif matchgroup=xParen start=/</ end=/>/ contains=xSpecialFunction oneline
syn match  xIpAddr /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/ contained

syn match   xComment /#.*$/
syn region  xComment2 start="#comment@begin" end="#comment@end"
syn keyword xToDo  TODO FIXME TBD XXX containedin=xComment,xComment2
syn match   xSetup /^#setup@\(begin\|end\)/              containedin=xComment
syn match   xSetup /^#teardown@\(begin\|end\)/           containedin=xComment
syn match   xSetup /^#matrix_setup@\(begin\|end\)/       containedin=xComment
syn match   xSetup /^#matrix_teardown@\(begin\|end\)/    containedin=xComment
syn match   xSetup /^\s*#label@\w\+/                     containedin=xComment
"syn match   xRegion /@begin\>\|@end\>/ contained
"syn match   xRegion2 /@\w\+/ contained
"
" this part is for the -e something scenario since it's a string
"
syn match xParam   /\-e[[:space:]]/              nextgroup=xValue  skipwhite
syn match xParam2  /\-p[[:space:]]+/             nextgroup=xValue2 skipwhite
syn region xValue  start=+"+ end=+"+ skip=+\\"+
syn region xValue2 start=+"+ end=+"+ skip=+\\"+

"
" this part is for the - parameter and the value, where it's not a string
"
syn region xParam2 matchgroup=xPre start="-\(line\|case\|for\|if\|from\|before\|after\|true\|false\|to\|t\|delay\|name\|batch\|v1\|v2\|fail\|r\|a\|n\|l\|h\|o\|to\|v\|b\|c\|f\|m\|d\|r\|ip\|u\|port\)[[:space:]]" end="[[:space:]]*" 


" 
" this part is for the fortigate commands
"
syn match xConfig "[[:space:]]*config[[:space:]]"
syn match xConfig2 "[[:space:]]*conf[[:space:]]"
syn match xGet "[[:space:]]*get[[:space:]]"
syn match xExec "[[:space:]]*exec[[:space:]]"
syn match xDiag "[[:space:]]*diag[[:space:]]"
syn match xShow "[[:space:]]*show[[:space:]]"
syn match xDelete "[[:space:]]*delete[[:space:]]"
syn match xDelete2 "[[:space:]]*del[[:space:]]"
syn match xPurge "[[:space:]]*purge"
syn region xEditValue matchgroup=xEdit start="edit[[:space:]]" end="[[:space:]]" 
syn keyword xFinish next end

syn region xUnSetValue matchgroup=xUnSet start="[[:space:]]*unset" end="[[:space:]]" oneline
syn region xSetValue matchgroup=xSet start="[[:space:]]*set[[:space:]]" end="[[:space:]]" oneline



" ----------------------------------------
" HighLighting part for the fortigate config part
" ----------------------------------------
hi def link xConfig Operator
hi def link xConfig2 Operator
hi def link xEdit Operator
hi def link xFinish Operator
hi def link xGet Operator
hi def link xSet Operator
hi def link xUnSet Operator
hi def link xGet Operator
hi def link xExec Operator
hi def link xDiag Operator
hi def link xShow Operator
hi def link xPurge Operator
hi def link xDelete Operator
hi def link xDelete2 Operator
hi def link xSetValue PreProc
hi def link xUnSetValue PreProc
hi def link xEditValue Typedef

" ----------------------------------------
" HighLighting part for the autotest script format 
" ----------------------------------------
hi def link xComment Comment
hi def link xComment2 Comment
hi def link KeywordBasic Function
hi def link xFGTFunction Function
hi def link xFGTFunctionrange Function
"hi def link xFGTFunction2 Function
hi def link xSpecialFunction Function 
hi def link xPCFunction Function
hi def link xSwitchFunction Function
hi def link xFMGFunction Function
hi def link xSection Type
"hi def link xInclude Include   " removed due to nan's suggestion
hi def link xHeader Identifier
"hi def link xAutolocal Typedef   " removed due to nan's suggestion
hi def link xParen SpecialChar
hi def link xToDo Todo
"hi def link xif Typedef " removed due to nan's suggestion

hi def link xParam Define
hi def link xParam2 Define
hi def link xValue String
hi def link xValue2 String
hi def link xPre Define
hi def link xIpAddr Identifier

hi def link xRegion  Identifier
hi def link xRegion2 Identifier
hi def link xLabel   Boolean
hi def link xSetup   Boolean
"highlight default link autotestComment      Define
"highlight default link autotestComment      Comment
"highlight default link autotestLabel        Label
"highlight default link autotestVariable     Identifier
"highlight default link autotestMain         Function
"highlight default link autotestType         Type
"highlight default link autotestValueOp      Operator
"highlight default link autotestEffectOp     Keyword
"highlight default link autotestNumber       Number
"highlight default link autotestBool         Boolean
"highlight default link autotestCondVariable Boolean

