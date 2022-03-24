# OrdinaPS, a Windows Powershell script
# It sorts your files each in a folder named as its extension
#
# v0.2
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
if (Test-Path -Path $scriptpath\ordineps.conf -PathType Leaf)
{
	# store config data
    $config=Get-Content -Path $scriptpath\ordineps.conf
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
			
			# check each extension in config file
			ForEach ($c in $config)
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

				# create the dir with ext as dir name
				mkdir -p "$PWD\$ext" -ErrorAction SilentlyContinue

				# move the file in that directory
				Move-Item $f "$PWD\$ext" -ErrorAction SilentlyContinue
			}				
			$black=0			
		}
	}
}