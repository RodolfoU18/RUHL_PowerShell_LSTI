function Obtener-UsuariosInactivos {
<#
.SYNOPSIS
Obtiene usuarios locales habilitados que nunca han iniciado sesión

.Descripción
Esta funcion busca cuentas locales habilitadas que no tienen fecha de ultimo inicio de sesión

.Example
Get-UnactiveUsers

.Notes
Puede ayudar a detectar cuentas incesesarias o riesgosas en auditorias básicas.
#>
    Get-LocalUser | Where-Object { $_.Enabled -eq $true -and -not $_.LastLogon}
}

function Obtener-ServiciosExternos {
<#
.SYNOPSIS
Obtiene servicios en ejecución que no pertenecen explicitamente a Windows 

.Descripción
Filtra servicios activos cuyo nombre descriptivo no contiene el término "Windows"

.Example
Obtener-ServiciosExternos

.Notes
Util para detectar softwares de terceros en segundo plano
#>
    Get-Service | Where-Object { $_.Status -eq "Running" -and $_.DisplayName -notmatch "Windows"}
}