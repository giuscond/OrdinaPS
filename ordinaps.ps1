# OrdinaPS, a Windows Powershell script
# It sorts your files each in a folder named as its extension
#
# v0.3
#
# Made by giuscond
# https://giuscond.com
#


# store all filenames in the folder in an array
$file_list=Get-ChildItem $pwd

# set initial state for blacklist variable
$black=0

# store script path wheren config file is located
$scriptpath = Split-Path $MyInvocation.MyCommand.Path
# check if config file exist
if (Test-Path -Path $scriptpath\ordineps.ini -PathType Leaf)
{
	# read config data
	# exclude [headers] and commented # lines
	Get-Content -Path $scriptpath\ordineps.ini | foreach-object -begin {$config=@{}} -process { $k = [regex]::split($_,'='); if(($k[0].CompareTo("") -ne 0) -and ($k[0].StartsWith("[") -ne $True)-and ($k[0].StartsWith("#") -ne $True)) { $config.Add($k[0], $k[1]) } }
	# extract blacklist
	$blacklist=$config.Get_Item("blacklist")
	# convert blacklist in array
	$blacklist=$blacklist.Split(",")
}

# iterate through the array
ForEach ($f in $file_list)
{
	# check if f is a file or directory
	# proceed if it's a file
	if (Test-Path -Path $f -PathType Leaf )
	{
        # check if file has extension
		If ([bool]$f.Extension -eq $True)
		{
            # get the extension
			$ext=$f.Extension -replace '^.'
			
			# check each extension in blacklist config
			ForEach ($c in $blacklist)
			{
				# check if ext is in the blacklist
				if ($ext -eq $c)
				{
					# founded a file with extension blacklisted
					$black=1
				}
			}
			# if is not blacklisted, do the job
			if ($black -eq 0)
			{
				# check if there is a custom folder name
				$folder=''
				if ($config.ContainsKey($ext))
				{
					# use custom folder name instead extension name
					$folder = $config.$ext
				}
				else
				{
					# use extension name
					$folder = $ext
				}

				# create the dir with ext as dir name
				mkdir -p "$PWD\$folder" -ErrorAction SilentlyContinue

				# move the file in that directory
				Move-Item $f "$PWD\$folder" -ErrorAction SilentlyContinue
			}				
			$black=0			
		}
	}
}