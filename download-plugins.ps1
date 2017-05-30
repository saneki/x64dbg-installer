$downloadPath = "files\plugins"

function Get-PluginArchiveName($plugin) {
	$name = $plugin[0]
	$ext = [System.IO.Path]::GetExtension($plugin[2])
	return ("{0}{1}" -f $name, $ext)
}

function Get-PluginArchivePath($plugin) {
	$archiveName = Get-PluginArchiveName -Plugin $plugin
	return Join-Path $downloadPath -ChildPath $archiveName
}

function Unpack-Plugin($plugin, $archivePath, $itemPath) {
	$newName = $plugin[0]
	# Rename and extract using 7zip
	7z.exe rn $archivePath $itemPath $newName -y
	7z.exe x $archivePath $newName "-o$downloadPath" -y
	Remove-Item $archivePath
}

function Unpack-ScyllaHide($plugin) {
	Unpack-Plugin $plugin (Get-PluginArchivePath $plugin) "Release"
}

function Unpack-SwissArmyKnife($plugin) {
	Unpack-Plugin $plugin (Get-PluginArchivePath $plugin) "release"
}

function Unpack-TitanHide($plugin) {
	$archivePath = (Get-PluginArchivePath $plugin)
	$zipName = "TitanHide_0014.zip"
	$zipPath = "$($downloadPath)\$($zipname)"
	7z.exe x $archivePath $zipName "-o$downloadPath" "-pTitanHide" -y
	7z.exe x $zipPath "-o$(Join-Path $downloadPath -ChildPath $plugin[0])" -y
	Remove-Item ($archivePath, $zipPath)
}

$plugins = @(
	("ScyllaHide",
	 "2017.3.3",
	 "https://github.com/x64dbg/ScyllaHide/releases/download/snapshot/ScyllaHide_2017-03-03_15-29.7z",
	 (Get-Item function:Unpack-ScyllaHide)
	),
	("SwissArmyKnife",
	 "2016.10.11",
	 "https://github.com/Nukem9/SwissArmyKnife/releases/download/3/Release-10-11-2016.zip",
	 (Get-Item function:Unpack-SwissArmyKnife)
	),
	("TitanHide",
	 "0.0.1.4",
	 "https://github.com/mrexodia/TitanHide/releases/download/V0014/TitanHide_archive.rar",
	 (Get-Item function:Unpack-TitanHide)
	)
)

New-Item -Path $downloadPath -Type Directory -Force
foreach ($p in $plugins) {
	$dlPath = Get-PluginArchivePath $p
	Write-Host ("Downloading to {1}: {0}" -f $p[2], $dlPath)
	Invoke-WebRequest $p[2] -OutFile $dlPath -MaximumRedirection 1
	& $p[3] $p
}
