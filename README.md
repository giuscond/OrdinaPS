# OrdinaPS, a Windows Powershell script
It sorts all your files each in a folder named as its extension. For example, it moves all jpg files in jpg folder. Files without extension remain in the main folder.

[Example video #1](https://giuscond.com/blog/ordinaps/)
[Example video #2](https://www.reddit.com/r/windows/comments/tm33ti/i_made_a_simple_powershell_script_to_organize/)
[Example video #3](https://giuscond.com/blog/videos/ordinaps-demo.mp4)

Inspired by [this reddit thread](https://www.reddit.com/r/unixporn/comments/tks369/oc_wrote_a_simple_python_script_to_organize_messy/)

## Installation
You can use it as a simple PowerShell script.
Alternatively you can integrate it on Windows ontext menu:
1. Move OrdinaPS.ps1 in a script folder
2. Set an Enviroment Variable named "Scripts" (a googled tutorial [here](https://turbolab.it/windows-10/guida-windows-10-come-modificare-variabile-sistema-path-aggiungere-cartella-percorso-directory-variabile-ambiente-2560))
3. Open Add-to-context-menu.reg file 
4. Customize the config file if you want custom folder names

Enjoy!

## Config
There are a configuration file called `ordinaps.ini`.
You can customize behavior of OrdinaPS.
In blacklist section you can choose specific file type that script should ignore. Every extension should be separate by a comma `,`

In Custom folder name sections you can choose a name for specific file type. Yuo can also use same folder name for differente extension.

### Blacklist example
>blacklist=ini,ps1,zip

It move all file except *ini* files, *ps1* and *zip* files.

### Custom folder name example
>pptx=Presentations<br>
>ppt=Presentations<br>
>docx=Word Docs

In this case, every docx files will go in a folder called *"Word Docs"* instead the basic *"docx"* folder. Furthermore, pptx and ppt files will go in the same *"Presentations"* folder.


## Changelog
- 0.3.1
    - Fix square brackets in file name bug (*Issue [#3](https://github.com/giuscond/OrdinaPS/issues/3)*) (thanks to *laurinschubert*)
- 0.3
    - Added custom folder name for specific extensions (thanks to *Xyphyn*)
    - Change configuration file structure
    - Change configuration file type in *.ini
    - Update README with config instructions
- 0.2
    - Improved sintax (thanks to *123456IcanCount*)
    - Removed `-Force option` (so if a file alredy exists, do not overwrite)
    - Added config file for blacklisted extension
    - Added Remove from contex menu option.
- 0.1
    - First Release

## Know Bugs
- If there is a file called *.blacklist, you should change extension before use the script
-----
Made by giuscond - https://giuscond.com