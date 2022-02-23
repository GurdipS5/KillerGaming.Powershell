﻿<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2022 v5.8.197
	 Created on:   	28/01/2022 00:17
	 Created by:   	Administrator
	 Organization: 	
	 Filename:     	Get-HypervHealth.p1.ps1
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

foreach ($hypervHost in $hypervHosts)
{
	$TestPath = Test-Path "\\$Server\c$"
	
	If ($TestPath -match "True")
	{
		
		New-PSSession -ComputerName $hypervHost
	}
	
	# Check service status
	Get-Service HyperV | %{ if ($_.Status -eq "Stopped") {  } }
	
	# Get memory free
	$os = Get-Ciminstance Win32_OperatingSystem
	$pctFree = [math]::Round(($os.FreePhysicalMemory/$os.TotalVisibleMemorySize) * 100, 2)
	
	
	
}