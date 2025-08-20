Clear-Host
Import-Module AuditoriaBasica

Write-Host "===Auditoria basica de usuarios y servicios==="
Write-Host "1.- Mostrar Usuarios Inactivos"
Write-Host "2.- Mostrar Servicios externos Activos"

$Opcion = Read-Host "Selecciona una opcion (1 o 2)"

switch ($Opcion){
    
    "1" { 

        $usuarios = Obtener-UsuariosInactivos 

        $usuarios | Format-Table Name, Enabled, LastLogon -AutoSize 

        $usuarios | Export-Csv -Path "$env:USERPROFILE\Desktop\users_inac.csv" -NoTypeInformation 

        Write-Host "`n📄 Reporte generado: ussers_inac.csv" 

    } 

    "2" { 

        $servicios = Obtener-ServiciosExternos 

        $servicios | Format-Table DisplayName, Status, StartType -AutoSize 

        $servicios | ConvertTo-Html | Out-File "$env:USERPROFILE\Desktop\serv_e.html" 

        Write-Host "`n📄 Reporte generado: serv_e.html" 

    } 

    default { 

        Write-Host "Opción no válida." 

    } 

}