# OrdinaPS, a Windows Powershell script
# It sorts your files each in a folder named as its ext
#
# Made by giuscond
#
# https://giuscond.com
#

# get the current path where you'll execute the script
$dir="$PWD"

$nametable = @{
    pptx='Presentations';
    docx='Word Docs';
    txt='Text Files';
    mp4='MP4 Video Files';
    mp3='MP3 Audio Files';
    wav='WAV Audio Files';
}

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

            $tmp=''

            if ($nametable.ContainsKey($ext))
            {
                $tmp = $nametable.$ext
            }
            else
            {
                $tmp = $ext
            }
            

            # create the dir with ext as dir name
			mkdir -p "$PWD\$tmp" -Force

            # move the file in that directory
			mv $f "$PWD\$tmp" -Force
		}
	}


}