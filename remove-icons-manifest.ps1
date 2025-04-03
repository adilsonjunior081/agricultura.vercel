# Script para remover os ícones do manifest
Write-Host "Removendo ícones do site.webmanifest..."

$manifestPath = "site.webmanifest"

if (Test-Path $manifestPath) {
    # Ler o conteúdo do arquivo
    $content = Get-Content -Path $manifestPath -Raw | ConvertFrom-Json
    
    # Remover a seção de ícones completamente
    $content.PSObject.Properties.Remove('icons')
    
    # Salvar o arquivo modificado
    $content | ConvertTo-Json -Depth 5 | Set-Content -Path $manifestPath -NoNewline
    
    Write-Host "Ícones removidos do site.webmanifest."
} else {
    Write-Host "Arquivo $manifestPath não encontrado."
}

Write-Host "Processo concluído!" 