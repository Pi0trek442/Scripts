# Set your path to the folder containing *.xml
$folderPath = "C:\xxxx\rrrrr\"

# Read all *.xml files in a folder
foreach ($file in Get-ChildItem -Path $folderPath -Filter *.xml) {
    # The command to import profile
    Invoke-Expression "netsh wlan add profile filename='$($file.FullName)' user=all"
}
