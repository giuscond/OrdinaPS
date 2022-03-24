# OrdinaPS, a Windows Powershell script
# It sorts your files each in a folder named as its ext
#
# Made by giuscond
#
# https://giuscond.com
#

# get the current path where you'll execute the script
$dir="$PWD"

# store all filenames in an array
$file_list=( $(ls $dir) )

# iterate through the array
ForEach ($f in $file_list)
{

	# check if f is a file or directory
	# proceed if it's a file
	if (Test-Path -Path $f -PathType Leaf )
	{
        # check if file has extension
		if ($f -Like "*.*")
		{
            # get the extension
			$ext=	((Split-Path "$f.Extension" -Leaf).Split('.'))[1]

            # create the dir with ext as dir name
			mkdir -p "$PWD\$ext" -Force

            # move the file in that directory
			mv $f "$PWD\$ext" -Force
		}
	}


}