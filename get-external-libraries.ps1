#Script to grab external libraries for building these samples
#will require PS5 to unzip - if it fails, you can just unzip by hand to the toolkit directory

$FreeGlut_Package_url = "https://www.transmissionzero.co.uk/files/software/development/GLUT/freeglut-MSVC.zip"
$Cinecoder_Package_url = "https://www.nuget.org/api/v2/package/Cinecoder/3.31.4.14758"

$FreeGlutPackageName =  Split-Path -Path $FreeGlut_Package_url -Leaf
$CinecoderPackageName = "Cinecoder-" + (Split-Path -Path $Cinecoder_Package_url -Leaf) + ".zip"

$OpenALSoftPackageName = "OpenALSoft-1.18.2.zip"

# if (Test-Path "./_toolkits/freeglut/include/GL/freeglut.h") { 
	# Write-Host "Toolkit for FreeGlut already exists" 
# }
# else
# {
	# Write-Host "Downloading ZIP with FreeGlut package... please be patient"
	# New-Item -Path ./_toolkits/freeglut -ItemType Directory -Force
	# Invoke-WebRequest -ContentType "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36" -Uri $FreeGlut_Package_url -OutFile ./_toolkits/freeglut/$FreeGlutPackageName
	# Expand-Archive ./_toolkits/freeglut/$FreeGlutPackageName ./_toolkits/ -force
# }

if (Test-Path "./_toolkits/freeglut/include/GL/freeglut.h") { 
	Write-Host "Toolkit for FreeGlut already exists" 
}
else
{
	Expand-Archive ./_toolkits/freeglut/$FreeGlutPackageName ./_toolkits/ -force
}

if (Test-Path "./_toolkits/OpenALSoft/include/al.h") { 
	Write-Host "Toolkit for OpenALSoft already exists" 
}
else
{
	Expand-Archive ./_toolkits/OpenALSoft/$OpenALSoftPackageName ./_toolkits/OpenALSoft -force
}

# if ($PSVersionTable.PSEdition -eq "Core" -And $($PSVersionTable.OS).StartsWith("Darwin"))
# {
	# if (Test-Path "./_toolkits/cinecoder/$CinecoderPackageName") { 
		# Write-Host "Toolkit for Cinecoder already exists" 
	# }
	# else
	# {
		# try { Remove-Item -Path ./_toolkits/cinecoder -Force -Recurse }
		# catch{}

		# Write-Host "Downloading ZIP with Cinecoder package... please be patient"
		# New-Item -Path ./_toolkits/cinecoder -ItemType Directory -Force
		# Invoke-WebRequest -ContentType "application/octet-stream" -Uri $Cinecoder_Package_url -OutFile ./_toolkits/cinecoder/$CinecoderPackageName
		# Expand-Archive ./_toolkits/cinecoder/$CinecoderPackageName ./_toolkits/cinecoder/ -force
	# }
# }
