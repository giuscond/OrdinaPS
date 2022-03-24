# OrdinaPS, a Windows Powershell script
It sorts all your files each in a folder named as its extension. For example, it moves all jpg files in jpg folder. Files without extension remain in the main folder.

[Example video](https://www.reddit.com/r/windows/comments/tm33ti/i_made_a_simple_powershell_script_to_organize/)

Inspired by [this reddit thread](https://www.reddit.com/r/unixporn/comments/tks369/oc_wrote_a_simple_python_script_to_organize_messy/)

## Installation
You can use it as a simple PowerShell script.
Alternatively you can integrate it on Windows ontext menu:
1. Move OrdinaPS.ps1 in a script folder
2. Set an Enviroment Variable named "Scripts" (a googled tutorial [here](https://turbolab.it/windows-10/guida-windows-10-come-modificare-variabile-sistema-path-aggiungere-cartella-percorso-directory-variabile-ambiente-2560))
3. Open Add-to-context-menu.reg file 

Enjoy!

## Config
In the last version I add a configuration file called `ordinaps.conf`. It's a simple text file (you can edit it with notepad); you can write each line a file extension that you want blacklisted.

For example, if I have this ordinaps.conf:
>bmp <br>
>rar<br>
>zip

In this case, OrdinaPS doesn't touch files with extension *bmp, rar or zip*.


## Changelog
- 0.1
    - First Release
- 0.2
    - Improved sintax (thanks to 123456IcanCount)
    - Removed `-Force option` (so if a file alredy exists, do not overwrite)
    - Added config file for blacklisted extension
    - Added Remove from contex menu option.

-----
Made by giuscond - https://giuscond.com