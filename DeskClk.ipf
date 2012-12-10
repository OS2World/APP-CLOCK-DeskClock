.* Help for Desktop Clock
.*
:userdoc.
:title. Desktop Clock Version 1.00
:docprof toc=12.
.*
.* Panel definition : Introduction
.*
:h1 id=100  res=100 x=0% y=0% width=100% height=100%  group=1.Introduction
:i1 id=100.Introduction
:p.
This is configurable clock for your Desktop. You can configure date and time display and add your message to display with date and/or time.
When started, Desktop Clock becomes (and remains) the bottom window - behind all other windows on your Desktop.
Click on Desktop Clock's area (message text, date or time display), brings Desktop Clock to the foreground.
:p.
:hp2.Features:ehp2.
:ul compact.
:li.Various date and time display formats
:li.User's message (stopped or scrolling from right to left)
:li.Selectable foreground and background color, position, size, font and fontsize
:li.Source code for Desktop Clock is included - to modify source, you need DrDialog, a visual programming environment for REXX.
:eul.
:p.
:i2 refid=100.Installation
:hp2.REXX MUST BE INSTALLED ON YOUR SYSTEM TO RUN DESKTOP CLOCK AND INSTALL PROCEDURE.:ehp2.
:parml compact tsize=5.
:pt.
:hp2.Files in archive dskclk10.zip&colon.:ehp2.
:pd.
:dl compact tsize=15.
:dt.:hp5.File name:ehp5.
:dd.:hp5.Description:ehp5.
:dt.DeskClk.exe
:dd.Desktop Clock - program
:dt.DeskClk.ico
:dd.Desktop Clock - icon
:dt.DeskClk.inf
:dd.Desktop Clock - manual (this file)
:dt.DeskWPS.cmd
:dd.Desktop Clock - installation procedure
:dt.source.zip
:dd.Source files for Desktop Clock
:edl.
:eparml.
:p.
File FastIni.dll (not included in this archive) is not required, but it's recommended for faster reading/writing to configuration file.
:p.
Installation procedure (DeskWPS.cmd) writes Desktop Clock's specific entry in OS2.INI file, App ToolsByGoran,
creates Desktop Clock's program object on your Desktop and creates shadow of Desktop Clock in startup folder (if you select so).
:p.
To Install Desktop Clock, run install procedure with parameter i - :hp9.DeskWPS i:ehp9..
If you have previous version (0.90) installed, uninstall it before installing Desktop Clock 1.00
(to do it go to Desktop Clock 0.90 directory and run install procedure with parameter i - :hp9.DeskWPS i:ehp9.).
:p.
:i2 refid=100.Usage
On first start, Desktop Clock will create configuration file (DESKCLK.INI) with default values.
Desktop Clock resides on Desktop behind all other windows, until you click on it (bring it to front).
If it is invisible (i.e. hidden behind other opened windows), select Desktop Clock in Window List (press :hp9.Ctrl-Esc:ehp9.).
Then you can use following keys:
:dl compact tsize=5.
:dt.:hp9.F1:ehp9.
:dd.Show Help (this document)
:dt.:hp9.F9:ehp9.
:dd.Open Settings dialog
:dt.:hp9.F3:ehp9.
:dd.Exit Desktop Clock.
:edl.
:p.
If you want to uninstall Desktop Clock, run install procedure with parameter u - :hp9.DeskWPS u:ehp9.
:p.
.*
.* Panel definition : Settings
.*
:h1 id=200  res=200 x=0% y=0% width=100% height=100%  group=1.Settings
:i1 id=200.Settings
:p.
When you click on Desktop Clock's area (message text, date or time display) and press :hp9.F9:ehp9. key, Settings dialog opens. Following values can be changed&colon.
:parml tsize=5.
:pt.:hp2.Message:ehp2.
:pd.Enter your message (32 characters max) to display with date and/or time. Message text can be :hp9.Stopped:ehp9. (text will not move), or you can select to :hp9.Scroll:ehp9. message text from right to left (it will act like banner).
:pt.:hp2.Color settings:ehp2.
:pd.Select foreground (:hp9.Font:ehp9. radio button) and background (:hp9.Back:ehp9. radio button) color.
.br
Use spin buttons for Red, Green and Blue components until you get desired color.
:pt.:hp2.Font settings:ehp2.
:pd.Select one of displayed font names in the list and select it's style (:hp2.Bold:ehp2. and/or :hp1.Italic:ehp1.). You can select Font size (between 8 and 100).
:pt.:hp2.Size settings:ehp2.
:pd.
X position - left edge of Desktop Clock (in pixels - between 0 and screen width-150),
.br
Y position - bottom edge of Desktop Clock (in pixels - between 0 and screen height-50),
.br
Width (in pixels - between 150 and screen width),
.br
Height (in pixels - between 50 and screen height).
:pt.:hp2.Date settings:ehp2. - format of date display&colon.
:pd.
:hp9.Year:ehp9.
.br
:hp9.Month:ehp9. - (01, 02, 03 ...). If you select to display month, then month name is disabled.
.br
:hp9.Month name:ehp9. - (Jan, Feb, Mar ...). If you select to display month name, then month is disabled.
.br
:hp9.Day:ehp9. (01, 02, 03 ...)
.br
:hp9.Day of week:ehp9. - (Mon, Tue, Wed ...)
:pt.:hp2.Time settings:ehp2. - format of time display&colon.
:pd.
:hp9.Hours:ehp9.
.br
:hp9.Minutes:ehp9.
.br
:hp9.Seconds:ehp9.
.br
:hp9.AM/PM:ehp9. - AM/PM mode - 12-hour display.
.br
:hp9.Refresh:ehp9. - refresh rate in time display (between 1 and 59 seconds).
:eparml.
:p.
After you changed settings values press :hp9.Apply:ehp9. button to refresh display.
.br
If you don't like new settings, press :hp9.Default:ehp9. button to reset changes and load default settings.
Then you can change settings again.
:nt.
If configuration file (DESKCLK.INI) is missing or dammaged, Desktop Clock will create new configuration file with default values.
:ent.
.*
.* Panel definition : Tips &amp. tricks
.*
:h1 id=800  res=800 x=0% y=0% width=100% height=100%  group=1. Tips &amp. tricks
:i1 id=800. Tips &amp. tricks
:parml tsize=5.
:i2 refid=800.Limitations
:pt.:hp2.Limitations:ehp2.
:pd.
If you are using background bitmap for your Desktop, Desktop Clock's border is always visible. If somebody knows how to set transparent background for DrDialog controls, please let me know.
:i2 refid=800.Background color
:pt.:hp2.Background color:ehp2.
:pd.
Desktop Clock reads background color from OS2.INI file and uses it as Desktop Clock's background color (trying to do "seamless" integration with background.
If this color does not match with real background color on your Desktop, open Settings dialog (press :hp9.F9:ehp9. key) and change background color.
.br
To get correct values for RGB components, open Desktop's Settings notebook, select Background page, press :hp9.Change color:ehp9. button and read red, green and blue values of background color.
Select identical values in Desktop Clock's Settings dialog for it's background color (select :hp9.Back:ehp9. radio button).
:i2 refid=800.Size
:pt.:hp2.Size (width and height, font size):ehp2.
:pd.
Desktop Clock keeps itself at the bottom of all the windows on the screen.
The desktop icons are part of the Desktop, and if you maximize Desktop Clock's width and height (to the screen width and height),
whole Desktop (and icons!) will be hidden.
.br
:hp5.Suggestion&colon.:ehp5. sort desktop icons and set Desktop Clock's size smaller than screen size to keep desktop icons visible.
If you want to set Desktop Clock's size to screen size, add your favorite folders and programs to LaunchPad (called Toolbar in Warp 4). It will be above Desktop Clock.
:nt.
DO NOT use Desktop Clock and "wallpaper" programs at the same time, because both attempt to remain on the Desktop.
:ent.
:pt.:hp2.Refresh time and "flashing":ehp2.
:pd.
Desktop Clock updates time display every second. If you see annoying "flash", increase refresh rate (up to 59 seconds) and/or unselect seconds display.
:i2 refid=800.New fonts
:pt.:hp2.New fonts:ehp2.
:pd.
Here are three predefined fonts&colon.
:font facename=Courier size=18x10.Courier,
:font facename=Helv size=18x10.Helvetica
and
:font facename='Tms Rmn' size=18x10.Times New Roman.
.br
:font facename=default size=0x0.
To add new font, exit Desktop Clock (if it is running), edit DESKCLK.INI file, Application&colon. DeskClock, Key&colon. Fonts, and add new font name.
Font names must be separated with space, and spaces within font name must be changed with _ character
(like Times_New_Roman in predefined fonts).
.br
Next time you start Desktop Clock, there will be new font in the list and you can select it.
:nt.
Don't add system fonts (like System Proportional or WarpSans) to Font list - you won't be able to select font size you want.
:ent.
:eparml.
.*
.* Panel definition : About
.*
:h1 id=900  res=900 x=0% y=0% width=100% height=100%  group=1.About
:i1 id=900.About
:i2 refid=900.Author
:dl compact tsize=15.
:dthd.:hp2.Author:ehp2.
:ddhd.Goran Ivankovic
:dt.:hp2.Address:ehp2.
:dd.Ulica Josipa Poduje 8
:dt.
:dd.HR-52100 Pula
:dt.
:dd.Croatia
:dt.:hp2.email:ehp2.
:dd.:link reftype=launch object='netscape.exe' data='mailto:duga1@pu.tel.hr?subject=Desktop Clock .90'.duga1@pu.tel.hr:elink.
:dt.:hp2.Home page:ehp2.
:dd.:link reftype=launch object='Netscape.exe' data='http://Goran_Ivankovic.tripod.com/'.http&colon.//Goran_Ivankovic.tripod.com/:elink.
:edl.
:p.
:i2 refid=900.License
This program is provided free under the terms of the GPL. You can use it, modify it and distribute it.
If you modify or distribute it the new source must accompany the distribution.
I would appreciate a copy of any changes.
.br
You may not distribute :hp2.Desktop Clock 1.00:ehp2. in any way which leads to your making a profit from it.
:p.
:i2 refid=900.Disclaimer
The author makes no representations about the accuracy or suitability of
this material for any purpose. It is provided "as is", without any
express or implied warranties. The author will assume no liability for
damages either from the direct use of this product or as a consequence of
the use of this product.
:parml compact tsize=5.
:pt.:hp2.Thanks to people who tested Desktop Clock and helped me with their comments and suggestions&colon.:ehp2.
:pd.
David Coward
.br
Brian Crook
.br
Kaare Thor Olsen
.br
Klaus Staedtler - special thanks for Desktop Clock's icon &colon.)
:eparml.
:p.
Ideas, comments, corrections, suggestions and bug reports are welcome.
:ul compact.
:li.OS/2 is Trademark of International Bussines Machines Corporation
:li.DrDialog is Copyright of International Bussines Machines Corporation
:li.FastIni.dll is Copyright of Dennis Bareis - OS/2 Developer in Australia
:eul.
:euserdoc.

