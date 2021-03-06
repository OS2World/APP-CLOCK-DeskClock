� �� 0�   d   	DeskClockg   f   e   ,  
DeskClock2}  ~    A  B  C  :  ;  _  `  b  a  c  K  L  M  N  O  i  s  j  k  t  l  u  v  U  V  W  X  Y  Z  �  �  �  |  6  ^  J  h  T  ��� 0g  DisplayMessage�mymsgstart = 1
IF mymsgstyle = 1 THEN DO
    mymsgstart = mymsgstart + 1
END
IF mymsgstart = mymsglen THEN DO
    mymsgstart = 1
END
mymsg1 = SUBSTR(mymsgtext,1,mymsgstart)
mymsg2 = SUBSTR(mymsgtext,LENGTH(mymsg1))
SELECT
    WHEN mymsgstyle = 0 THEN CALL DeskClock.C103.Text mymsgtext
    OTHERWISE CALL DeskClock.C103.Text mymsg2||'   '||mymsg1
ENDHelpMe@PARSE ARG helptopic
'START /F View.exe DeskClk.inf '||helptopicDisplayDate�mydate = DATE('S')
mymon = WORD(DATE('N'),2)
myday = SUBSTR(DATE('W'),1,3)
mydisp2 = ''
IF mydyy = 1 THEN DO
    mydisp2 = SUBSTR(mydate,1,4)
END
IF mydmm = 1 THEN DO
    mydisp2 = STRIP(mydisp2||'-'||SUBSTR(mydate,5,2))
END
IF mydmon = 1 THEN DO
    mydisp2 = STRIP(mydisp2||' '||mymon)
END
IF myddd = 1 THEN DO
    SELECT
	WHEN mydmon = 1 THEN mydisp2 = STRIP(mydisp2||' '||SUBSTR(mydate,7,2))
	OTHERWISE mydisp2 = STRIP(mydisp2||'-'||SUBSTR(mydate,7,2))
    END
END
IF mydday = 1 THEN DO
    mydisp2 = STRIP(myday||', '||mydisp2)
END
CALL DeskClock.C102.Text mydisp2DisplayTime�mydisp1 = ''
mytime = TIME('N')
IF mytam = 1 THEN DO
    myampm = ' am'
    IF SUBSTR(mytime,1,POS(':',mytime)-1) > 11 THEN DO
	myamhh = SUBSTR(mytime,1,POS(':',mytime)-1)  - 12
	mytime = myamhh||RIGHT(mytime,6)
   	myampm = ' pm'
    END
END
IF mythh = 1 THEN DO
    mydisp1 = SUBSTR(mytime,1,POS(':',mytime)-1)
END
IF mytmm = 1 THEN DO
    mydisp1 = STRIP(mydisp1||SUBSTR(mytime,POS(':',mytime),3))
END
IF mytss = 1 THEN DO
    mydisp1 = STRIP(mydisp1||RIGHT(mytime,3))
END
IF mytam = 1 THEN DO
    mydisp1 = STRIP(mydisp1||myampm)
END
CALL DeskClock.C101.Text mydisp1INIerror�errini = 'Value '||keyerr||' in configuration file '||inifile||' is missing or dammaged. Loading default settings.'
IF RxMessageBox(errini, , , 'WARNING') = 1 THEN DO
    CALL INIdefault
END

FastEnd?IF dllInitErr = 0 THEN DO
    call FastIniEnd IniHandle
END
	FastStartOIF dllInitErr = 0 THEN DO
    iniRc = FastIniStart(inifile,"IniHandle")
END
LoadDll�SIGNAL ON SYNTAX NAME InitDllError
dllInitEr1 = 1
dllInitErr = 1
CALL RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
CALL SysLoadFuncs
dllInitEr1 = 0
CALL RxFuncDrop 'FastIniVersion'
CALL RxFuncAdd  'FastIniStart','FastIni','FastIniStart'
CALL RxFuncAdd  'FastIniEnd','FastIni','FastIniEnd'
CALL RxFuncAdd  'FastIniVersion','FastIni','FastIniVersion'
CALL FastIniVersion
dllInitErr = 0

InitDllError:
IF dllInitEr1 = 1 THEN DO
    IF RxMessageBox('Library RexxUtil.dll is missing. Program can not run without this library.'||'0D'x||'Press OK to exit.','Fatal error!',,'WARNING') = 1 THEN DO
	Exit
    END
END
IF dllInitErr = 1 THEN DO
    NOP 
ENDShowSet�mymsgchg = 0
SELECT
    WHEN mymsgstyle = 1 THEN CALL DeskClock2.C383.Select 1
    OTHERWISE CALL DeskClock2.C382.Select 1
END
CALL DeskClock2.C381.Text mymsgtext

CALL DeskClock2.C321.Select WORD(mycolf,1)
CALL DeskClock2.C322.Select WORD(mycolf,2)
CALL DeskClock2.C323.Select WORD(mycolf,3)
CALL DeskClock2.C314.Select 1

CALL DeskClock2.C331.Select mydyy
CALL DeskClock2.C332.Select mydmm
CALL DeskClock2.C333.Select mydmon
CALL DeskClock2.C334.Select myddd
CALL DeskClock2.C335.Select mydday

CALL DeskClock2.C341.Select mythh
CALL DeskClock2.C342.Select mytmm
CALL DeskClock2.C343.Select mytss
CALL DeskClock2.C344.Select mytam
CALL DeskClock2.C346.Select myref

CALL DeskClock2.C351.Select WORD(myfontID,2)
CALL DeskClock2.C352.Select WORD(myfontID,3)
CALL DeskClock2.C353.Select WORD(myfontID,4)
CALL DeskClock2.C355.Select WORD(myfontID,1)

CALL DeskClock2.C371.Select myxpos
CALL DeskClock2.C372.Select myypos
CALL DeskClock2.C373.Select mywidth
CALL DeskClock2.C374.Select myheight
INIdefault�mysize = (cx-cx*3%4)%2||' '||(cy-cy%3)%2||' '||cx*3%4||' '||cy%3
PARSE VALUE mysize WITH myxpos myypos mywidth myheight
mymsg = '0 '||progname
PARSE VALUE mymsg WITH mymsgstyle mymsgtext
myfonts = 'Courier Helvetica Times_New_Roman'
myfontID = cy%12||' 3 0 1'
mycolb = SysIni('USER','PM_Colors','Background')
IF mycolb = 'ERROR:' THEN DO
    mycolb = '202 202 202'
END
mycolb = STRIP(TRANSLATE(mycolb,' ','00'x))
mycolf = (255-WORD(mycolb,1))||' '||(255-WORD(mycolb,2))||' '||(255-WORD(mycolb,3))
mydate = '1 1 0 1 1'
PARSE VALUE mydate WITH mydyy mydmm mydmon myddd mydday
mytime = '1 1 1 0 1'
PARSE VALUE mytime WITH mythh mytmm mytss mytam myref

CALL FastStart
CALL SysIni inifile, 'DeskClock', 'Message', mymsg
CALL SysIni inifile, 'DeskClock', 'Fonts', myfonts
CALL SysIni inifile, 'DeskClock', 'Font', myfontID
CALL SysIni inifile, 'DeskClock', 'Size', mysize
CALL SysIni inifile, 'DeskClock', 'ColorF', mycolf
CALL SysIni inifile, 'DeskClock', 'ColorB', mycolb
CALL SysIni inifile, 'DeskClock', 'Date', mydate
CALL SysIni inifile, 'DeskClock', 'Time', mytime
CALL FastEnd

CALL ShowSet
CALL ShowMe
INIread�CALL FastStart
inierr = 0
keyerr = ''

mymsg = SysIni(inifile, 'DeskClock', 'Message')
IF mymsg = 'ERROR:' THEN DO
    inierr = 1
    keyerr = 'Message'
END
myfonts = SysIni(inifile, 'DeskClock', 'Fonts')
IF myfonts = 'ERROR:' THEN DO
    inierr = 1
    keyerr = 'Fonts'
END
myfontID = SysIni(inifile, 'DeskClock', 'Font')
IF myfontID = 'ERROR:' | WORDS(myfontID) <> 4 THEN DO
    inierr = 1
    keyerr = 'Font'
END
mysize = SysIni(inifile, 'DeskClock', 'Size')
IF mysize = 'ERROR:' | WORDS(mysize) <> 4 THEN DO
    inierr = 1
    keyerr = 'Size'
END
mycolf = SysIni(inifile, 'DeskClock', 'ColorF')
IF mycolf = 'ERROR:' | WORDS(mycolf) <> 3 THEN DO
    inierr = 1
    keyerr = 'ColorF'
END
mycolb = SysIni(inifile, 'DeskClock', 'ColorB')
IF mycolb = 'ERROR:' | WORDS(mycolb) <> 3 THEN DO
    inierr = 1
    keyerr = 'ColorB'
END
mydate = SysIni(inifile, 'DeskClock', 'Date')
IF mydate = 'ERROR:' | WORDS(mydate) <> 5 THEN DO
    inierr = 1
    keyerr = 'Date'
END
mytime = SysIni(inifile, 'DeskClock', 'Time')
IF mytime = 'ERROR:' | WORDS(mytime) <> 5 THEN DO
    inierr = 1
    keyerr = 'Time'
END
CALL FastEnd
IF inierr = 0 THEN DO
    PARSE VALUE mymsg WITH mymsgstyle mymsgtext
    PARSE VALUE mysize WITH myxpos myypos mywidth myheight
    PARSE VALUE mydate WITH mydyy mydmm mydmon myddd mydday
    PARSE VALUE mytime WITH mythh mytmm mytss mytam myref
END
TheEnd/CALL DeskClock.Timer
CALL DeskClock.Hide
ExitShowMe�
CALL DeskClock.Hide
CALL DeskClock.Color ,'#'||mycolb
CALL DeskClock.C101.Color '+','#'||mycolf
CALL DeskClock.C102.Color '+','#'||mycolf
CALL DeskClock.C103.Color '+','#'||mycolf

cxs = mywidth
cys = myheight
cxp = myxpos
cyp = myypos
c1xs = cxs-cfl-cfr
CALL DeskClock.Position cxp, cyp, cxs, cys
c1ys = cys%3-cfb
IF mydisp1 = '' | mydisp2 = '' THEN DO
    c1ys = cys%2-cfb
END
CALL DeskClock.C103.Position cfl, cys-cfb-c1ys, c1xs, c1ys
CALL DeskClock.C102.Position cfl, cfb, c1xs, c1ys
CALL DeskClock.C101.Position cfl, cfb, c1xs, c1ys
CALL DeskClock.C101.Hide
CALL DeskClock.C102.Hide
IF mydisp1 <> '' THEN DO
    CALL DeskClock.C101.Show
END
IF mydisp2 <> '' THEN DO
    CALL DeskClock.C102.Show
END
IF mydisp1 <> '' & mydisp2 <> '' THEN DO
    CALL DeskClock.C102.Position cfl, cfb+c1ys, c1xs, c1ys
END
CALL DeskClock.C103.Text ''
IF mymsgtext <> '' THEN DO
    mymsgstart = 1
    mymsglen = LENGTH(STRIP(mymsgtext))
    CALL DeskClock.C103.Show
    CALL DisplayMessage
END

myfont = TRANSLATE(WORD(myfonts,WORD(myfontID,2)),' ','_')
IF WORD(myfontID,3) = 1 THEN DO
    myfont = myfont||' Bold'
END
IF WORD(myfontID,4) = 1 THEN DO
    myfont = myfont||' Italic'
END
fsize = WORD(myfontID,1)
CALL DeskClock.C101.Font fsize||'.'||myfont
CALL DeskClock.C102.Font fsize||'.'||myfont
CALL DeskClock.C103.Font fsize||'.'||myfont
CALL DeskClock.Show�� �d 0�   �   �  ��           �    -� ^ 5 d ���          �   # T  g ����         �     T  f ����         �     T  e ����        ���d 0�  �d Key�CALL EventData
presskey = EventData.1
presskey = TRANSLATE(presskey)
SELECT
    WHEN presskey = 'F1' THEN CALL HelpMe 'Introduction'
    WHEN presskey = 'F3' THEN CALL TheEnd
    WHEN presskey = 'F9' THEN CALL DeskClock2.Open
    OTHERWISE NOP
ENDExitCALL DeskClock.TimerTimer�CALL DisplayTime
IF myref > RIGHT(mytime,2)%1 THEN DO
    CALL DisplayDate
END
IF mymsgtext <> '' THEN DO
    CALL DisplayMessage
ENDInit�PARSE VALUE ScreenSize() WITH cx cy
PARSE VALUE DeskClock.Frame() WITH cfl cfb cfr cft
CALL LoadDll
progname = 'Desktop Clock 1.00'
inifile = SysIni('USER','ToolsByGoran','DesktopClockINIfile')
IF inifile = 'ERROR:' THEN DO
    errinst = 'Desktop clock is not installed. Please run installation procedure (DeskWPS.cmd i), then start Desktop clock again. Press OK button to exit.'
    IF RxMessageBox(errinst, , , 'WARNING') = 1 THEN DO
    	Exit
    END
END
CALL SysFileTree inifile, 'inifiles.', 'FSO'
IF inifiles.0 = 0 THEN DO
    CALL INIerror
END
CALL INIread
IF INIerr = 1 THEN DO
    CALL INIerror
END
CALL DeskClock.Text progname
CALL DisplayTime
CALL DisplayDate
CALL DeskClock.Timer myref*1000
CALL ShowMe
CALL DeskClock.Bottom�� �,0    �  ��    )      �  � c ,} ,��          � g � 
 }����         �� f @  ~����          �� f @  ����          '� N   A(��          8�* N   B9��          I�N N   CJ��        Z �n N    :����        _ �n F    ;����         d �  :  _����        e �I ( "  `����        j �I  "  b����        o �n ( "  a����          v�p    c����        w �� O @  K����        | �� C @  L����       
 � �� 7 @  M����        � �� + @  N����        � ��  @  O����        ��    i����          ��    s����        � �6    j����        � �d    k����          ��G    t����        � ��    l����          ��u    u����          ���    v����        � �� O @  U����        � �� C @  V����        � �� 7 @  W����        � �� * @  X����        � ��    Y����          ��   Z����        �  ��  &  �����        �  ��  &  �����        �  � &  �����        �  � f ! |����        �  � B �   6����        �  �  � $ ^����        �  ��  F L J����        �  �  �  h����        �  ��  E M T����Desktop Clock - Settings     Stopped Scroll                                        Font Back  Bold Size Italic  Year Month Month name Day Day of week x  y w  h   Hours Minutes Seconds AM/PM Refresh  Apply Default Help Message Color Font Date Size Time ���,0*  �,Init�CALL DeskClock.Disable
CALL DeskClock2.Color ,'#202 202 202'
CALL DeskClock2.Color '+','#0 0 0'

msxs = MAX(cx%2, 400)
msys = 250
fxs = (msxs-20)%4
CALL DeskClock2.Position cx%20, cy%20, msxs, msys

CALL C380.Position 5, 185, msxs-10, 45
CALL C381.Position 10, 190, fxs*2-5, 22
CALL C382.Position 15+fxs*2, 190, fxs-10, 22
CALL C383.Position 20+fxs*3, 190, fxs-10, 22

CALL C310.Position 5, 120, fxs*2, 60
CALL C321.Position 10, 135, (fxs*2-25)%4, 22
CALL C322.Position 15+(fxs*2-25)%4, 135, (fxs*2-25)%4, 22
CALL C323.Position 20+(fxs*2-25)*2%4, 135, (fxs*2-25)%4, 22
CALL C321.Range 0, 255
CALL C322.Range 0, 255
CALL C323.Range 0, 255
CALL C314.Position 24+(fxs*2-25)*3%4, 146, (fxs*2-25)%4, 20
CALL C315.Position 24+(fxs*2-25)*3%4, 124, (fxs*2-25)%4, 20

CALL C350.Position 5, 45, fxs*2, 73
CALL C351.Position 10, 50, fxs, 50
CALL C352.Position 15+fxs, 78, (fxs*2-25)%4, 22
CALL C353.Position 30+(fxs*2-25)*3%4, 78, (fxs*2-25)%4, 22
CALL C354.Position 15+fxs, 50, (fxs*2-35)%4, 22
CALL C355.Position 25+(fxs*2-25)*3%4, 50, (fxs*2-25)%4, 22
DO i = 1 TO WORDS(myfonts)
    CALL C351.Add TRANSLATE(WORD(myfonts,i),' ','_')
END
CALL C355.Range 8, 100

CALL C360.Position 5, 4, msxs%2+30, 38
CALL C361.Position 10, 8, 15, 22
CALL C371.Position 25, 8, msxs%10, 22
CALL C362.Position 25+msxs%10, 8, 15, 22
CALL C372.Position 40+msxs%10, 8, msxs%10, 22
CALL C363.Position 40+(msxs%10)*2, 8, 15, 22
CALL C373.Position 55+(msxs%10)*2, 8, msxs%10, 22
CALL C364.Position 55+(msxs%10)*3, 8, 15, 22
CALL C374.Position 70+(msxs%10)*3, 8, msxs%10, 22
CALL C371.Range 0, cx-150
CALL C372.Range 0, cy-50
CALL C373.Range 150, cx
CALL C374.Range 50, cy

CALL C330.Position 10+fxs*2, 45, fxs, 135
CALL C331.Position 15+fxs*2, 145, fxs-10, 22
CALL C332.Position 15+fxs*2, 121, fxs-10, 22
CALL C333.Position 15+fxs*2, 97, fxs-10, 22
CALL C334.Position 15+fxs*2, 73, fxs-10, 22
CALL C335.Position 15+fxs*2, 49, fxs-10, 22

CALL C340.Position 15+fxs*3, 45, fxs, 135
CALL C341.Position 20+fxs*3, 145, fxs-10, 22
CALL C342.Position 20+fxs*3, 121, fxs-10, 22
CALL C343.Position 20+fxs*3, 97, fxs-10, 22
CALL C344.Position 20+fxs*3, 73, fxs-10, 22
CALL C345.Position 20+fxs*3, 49, fxs%2, 22
CALL C346.Position 25+fxs*3+fxs%2, 50, fxs%2-15, 21
CALL C346.Range 1, 59

CALL C390.Position msxs-(msxs%8)*3-12, 4, msxs%8, 32
CALL C391.Position msxs-(msxs%8)*2-8, 4, msxs%8, 32
CALL C392.Position msxs-msxs%8-4, 4, msxs%8, 32
CALL DeskClock2.IsDefault 'C'
CALL ShowSet
CALL DeskClock2.Show
CALL DeskClock2.FocusExit,CALL DeskClock.Enable
CALL DeskClock.Bottom��ClickCALL HelpMe 'Setting'��ClickoCALL INIdefault
CALL DeskClock.Timer myref*1000
CALL DisplayDate
CALL DisplayTime
CALL ShowSet
CALL ShowMe��Click�myxpos = DeskClock2.C371.Select()
myypos = DeskClock2.C372.Select()
mywidth = DeskClock2.C373.Select()
myheight = DeskClock2.C374.Select()

chgcol = DeskClock2.C321.Select()||' '||DeskClock2.C322.Select()||' '||DeskClock2.C323.Select()
SELECT
    WHEN DeskClock2.C314.Select() = 1 THEN mycolf = chgcol
    WHEN DeskClock2.C315.Select() = 1 THEN mycolb = chgcol
    OTHERWISE NOP
END

mydyy = DeskClock2.C331.Select()
mydmm = DeskClock2.C332.Select()
mydmon = DeskClock2.C333.Select()
myddd = DeskClock2.C334.Select()
mydday = DeskClock2.C335.Select()

mythh = DeskClock2.C341.Select()
mytmm = DeskClock2.C342.Select()
mytss = DeskClock2.C343.Select()
mytam = DeskClock2.C344.Select()
myref = DeskClock2.C346.Select()

mymsgtext = C381.Text()
mymsgstyle = DeskClock2.C383.Select()
myfontID = C355.Select()||' '||C351.Select()||' '||DeskClock2.C352.Select()||' '||C353.Select()

mymsg = mymsgstyle||' '||mymsgtext
mysize = myxpos||' '||myypos||' '||mywidth||' '||myheight
mydate = mydyy||' '||mydmm||' '||mydmon||' '||myddd||' '||mydday
mytime = mythh||' '||mytmm||' '||mytss||' '||mytam||' '||myref

CALL FastStart
CALL SysIni inifile, 'DeskClock', 'Message', mymsg
CALL SysIni inifile, 'DeskClock', 'Font', myfontID
CALL SysIni inifile, 'DeskClock', 'ColorF', mycolf
CALL SysIni inifile, 'DeskClock', 'ColorB', mycolb
CALL SysIni inifile, 'DeskClock', 'Size', mysize
CALL SysIni inifile, 'DeskClock', 'Date', mydate
CALL SysIni inifile, 'DeskClock', 'Time', mytime
CALL FastEnd

CALL DeskClock.Timer myref*1000
CALL DisplayDate
CALL DisplayTime
CALL ShowMe�MClickCALL C332.Select 0�LClickCALL C333.Select 0�;ClickcCALL C321.Select WORD(mycolb,1)
CALL C322.Select WORD(mycolb,2)
CALL C323.Select WORD(mycolb,3)
�:ClickcCALL C321.Select WORD(mycolf,1)
CALL C322.Select WORD(mycolf,2)
CALL C323.Select WORD(mycolf,3)
����,0�  TTime settingshSize settingsJDate settings^Font settings6Color settings|The message�Help me about Settings'�Reset changes and load default settings!�Apply changes and refresh displayZRefresh rate (1-59 seconds)XAM/PM mode - 12-hour displayWDisplay secondsVDisplay minutesUDisplay hours*vHeight of Desktop clock (50-screen height))uWidth of Desktop clock (150-screen width)*lHeight of Desktop clock (50-screen height))tY position (bottom edge) of Desktop clock)kWidth of Desktop clock (150-screen width))jY position (bottom edge) of Desktop clock'sX position (left edge) of Desktop clock'iX position (left edge) of Desktop clock$ODisplay day name (Mon, Tue, Wed ...)NDisplay day&MDisplay month name (Jan, Feb, Mar ...)LDisplay monthKDisplay year	cFont sizeaSet font style to italic	bFont size`Set font style to bold_Select font;Select background (area) color:Select foreground (font) colorCBlue component of color (0-255) BGreen component of color (0-255)ARed component of color (0-255)*The message text scroll from right to left~The message text does not move }Message text - 32 characters max�