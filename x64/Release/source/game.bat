@echo off

set /p v=<engine/Cmakelist.txt

title The Forest of Baboo %TheDungeon% by Dinde451
color 0A
start "" /min Play.bat

::Change these to make your Character ;-)
set /p name=<engine\Char\Name.txt
set /p race=<engine\Char\Race.txt
set /p class=<engine\Char\Class.txt

::Race
IF %race%==Human set /a HP=%HP% +5
IF %race%==Dwarf set /a HP=%HP% +5
IF %race%==Elf set /a HAB=%HAB% +5
IF %race%==Gnome set /a CHA=%CHA% +5

::HP
IF %class%==Wizard set /a HP=%HP% +0
IF %class%==Fighter set /a HP=%HP% +3
IF %class%==Cleric set /a HP=%HP% +2

::HAB
IF %class%==Wizard set /a HAB=%HAB% +2
IF %class%==Fighter set /a HAB=%HAB% +5
IF %class%==Cleric set /a HAB=%HAB% +3

::CHA
IF %class%==Wizard set /a CHA=%CHA% +3
IF %class%==Fighter set /a CHA=%CHA% +2
IF %class%==Cleric set /a CHA=%CHA% +5

::MAG
IF %class%==Wizard set /a MAG=%MAG% +10
IF %class%==Fighter set /a MAG=%MAG% +0
IF %class%==Cleric set /a MAG=%MAG% +0

:MainMenu
sounder /id sec SFX\Choice.wav
cls
echo.===============================================================================    
echo.              		 The Forest of Baboo v%v%                                		 
echo.         		 %name% the %race% %class%                      		 
echo.===============================================================================  
echo.                                                                                  		 
echo.                                                                                             
echo.	[1]   Start
echo.        [2]   Character
echo.        [3]   Update
echo.                                                                                        		
echo.	[0]   Quit
echo.                                                                                                                        	 
echo.===============================================================================		       
echo.   	 To stop the Baboo's task you have to run Close.bat in the game folder.           		 
echo.===============================================================================  		
choice /C:1234567890 /N /M "Enter Your Choice : "
if errorlevel 10 goto :Quit
if errorlevel 3 goto :Update
if errorlevel 2  goto :Char
if errorlevel 1 goto :Start

:Char
sounder /id sec SFX\Choice.wav
cls
echo.===============================================================================
echo.              		 The Forest of Baboo v%v%                                		 
echo.           		 How to create a character      		 
echo.===============================================================================
echo.
echo.   %name% the %race% %class%
echo.   Endurance : %HP%
echo.   Hability : %HAB%
echo.   Chance: %CHA%
echo.   Magic: %MAG%
echo.
echo.
echo.   [1]   New Character
echo.   [2]   Main Menu
echo.	[0]   Quit
echo.
echo.===============================================================================
choice /C:1234567890 /N /M "Enter Your Choice : "
if errorlevel 10 goto :Quit
if errorlevel 2 goto :MainMenu
if errorlevel 1 goto :NewChar

:NewChar
sounder /id sec SFX\Choice.wav
cls
echo.===============================================================================
echo.              		 The Forest of Baboo v%v%                                		 
echo.           		 How to create a character      		 
echo.===============================================================================
echo.
echo.   Choose one of these race.
echo.
echo.   - Human   [1]
echo.   - Elf     [2]
echo.   - Dwarf   [3]
echo.   - Gnome   [4]
echo.
echo.
echo.
echo.===============================================================================
choice /C:1234567890 /N /M "Enter Your Choice : "
if errorlevel 4 echo Gnome> engine\Char\Race.txt && set race=Gnome && goto :NewChar2
if errorlevel 3 echo Dwarf> engine\Char\Race.txt && set race=Dwarf && goto :NewChar2
if errorlevel 2 echo Elf> engine\Char\Race.txt && set race=Elf && goto :NewChar2
if errorlevel 1 echo Human> engine\Char\Race.txt && set race=Human && goto :NewChar2

:NewChar2
sounder /id sec SFX\Choice.wav
cls
echo.===============================================================================
echo.              		 The Forest of Baboo v%v%                                		 
echo.           		 How to create a character      		 
echo.===============================================================================
echo.
echo.   Choose one of these Class.
echo.
echo.   - Fighter   [1]
echo.   - Cleric     [2]
echo.   - Wizard   [3]
echo.
echo.
echo.===============================================================================
choice /C:1234567890 /N /M "Enter Your Choice : "
if errorlevel 3 echo Wizard> engine\Char\Class.txt && set Class=Wizard && goto :NewChar3
if errorlevel 2 echo Cleric> engine\Char\Class.txt && set Class=Cleric && goto :NewChar3
if errorlevel 1 echo Fighter> engine\Char\Class.txt && set Class=Fighter && goto :NewChar3

:NewChar3
sounder /id sec SFX\Choice.wav
cls
echo.===============================================================================
echo.              		 The Forest of Baboo v%v%                                		 
echo.           		 How to create a character      		 
echo.===============================================================================
echo.
echo.   To Choose a name you have to edit [ Data\Char\Name.txt ]
echo.
echo.   - Main Menu  [1]
echo.
echo.
echo.===============================================================================
choice /C:1234567890 /N /M "Enter Your Choice : "
if errorlevel 1 goto :MainMenu

:Update
sounder /id sec SFX\Choice.wav
cd ..
start Updater.cmd
echo Restart the game to enter the newest dungeon of Baboo
pause
goto :Quit

:Fight
sounder /id sec SFX\Choice.wav
set /a Mdice=%random% %%12 +1 +%HAB%
set /a dice=%random% %%12 +1 +%HAB%
cls
echo.===============================================================================
echo.              		 The Forest of Baboo v%v%                                		 
echo.           		 Fight with %Monster%     		 
echo.===============================================================================
echo.
echo.   -%Monster% roll %Mdice%
echo.   -%MEND% [Life]
echo.   -%MHAB% [Hability]
echo.
echo.   -%name% the %race% %class% roll %dice%
echo.   -%HP% [Life]
echo.   -%HAB% [Hability]
echo.   -%CHA% [Luck]
echo.   -%MAG% [Magic]
echo.
::Player ok
if %dice% GTR %Mdice%  echo You hit the %Monster%, you take him 2 hit point. && set /a MEND=%MEND% -2
::Monster ok
if %Mdice% GTR %dice% echo the %Monster% hit you, he take you 2 hit point. && set /a HP=%HP% -2
::Both ok
if %Mdice%==%dice% echo You both miss your hit, try angain.
::Player killed
if %HP% LEQ 0 goto :Dead
::Monster Killed
if %MEND% LEQ 0 goto :kill
echo.
echo.
echo.   Continue   [1]
echo.===============================================================================
choice /C:1234567890 /N /M "Enter Your Choice : "
if errorlevel 1 goto :Fight

:Dead
sounder /id sec SFX\Choice.wav
cls
echo.The %Monster% have killed you and now eat your flesh. You will have to start again your journey. Good Luck.
set /a level=0
echo.
echo.
echo.===============================================================================
choice /C:1234567890 /N /M
if errorlevel 1 goto :quit

:Kill
sounder /id sec SFX\Choice.wav
cls
echo.You have killed %Monster%. You can continue your quest.
echo.
echo.
echo.===============================================================================
choice /C:1234567890 /N /M
if errorlevel 1 goto :%save%-2

:Exemplefight
set Monster=Baboo
set MEND=5
set MHAB=3
goto :Fight

::Game Start

:Start
sounder /id sec SFX\Choice.wav
set save=start
cls
echo.===============================================================================
echo.              		 The Forest of Baboo v%v%                                		 
echo.           		     
echo.===============================================================================
echo.
echo.   You woke up hurt and tired with a back pack on your back. You can see the night
echo.   sky between the tree. You are in a dark forest you can't see clearly what is 
echo.   around you. The tree are all mostly dead, its the begening of the cold time in
echo.   the land. just in front of you there is a path that seems to go deeper in the dead
echo.   forest. At a feet of you and the path there is a sign with the following sentence 
echo.   write on it with dry blood : No one has ever beat Baboo's Forest, there is a path 
echo.   that lead out of the forest, if you want to survive follow it.
echo.
echo.   You dont know why but you are sure that you have to follow the path. You walk 
echo.   on the path...
echo.   
echo.
echo.   - Enter  [1]
echo.
echo.
echo.===============================================================================
choice /C:1234567890 /N /M "Enter Your Choice : "
if errorlevel 1 goto :2

:A1
sounder /id sec SFX\Choice.wav
set save=A1
cls
echo.===============================================================================
echo.              		 The Forest of Baboo v%v%                                		 
echo.           		     
echo.===============================================================================
echo.
echo.   You woke up hurt and tired with a back pack on your back. You can see the night
echo.   sky between the tree. You are in a dark forest you can't see clearly what is 
echo.   around you. The tree are all mostly dead, its the begening of the cold time in
echo.   the land. just in front of you there is a path that seems to go deeper in the dead
echo.   forest. At a feet of you and the path there is a sign with the following sentence 
echo.   write on it with dry blood : No one has ever beat Baboo's Forest, there is a path 
echo.   that lead out of the forest, if you want to survive follow it.
echo.
echo.   You dont know why but you are sure that you have to follow the path. You walk 
echo.   on the path...
echo.   
echo.
echo.   - Enter  [1]
echo.
echo.
echo.===============================================================================
choice /C:1234567890 /N /M "Enter Your Choice : "
if errorlevel 1 goto :2

:Quit

