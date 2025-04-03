# Script para remover referências a favicon e manifest dos arquivos HTML
Write-Host "Removendo referências a favicon e manifest de todos os arquivos HTML..."

# Função para processar um arquivo HTML
function ProcessHtmlFile {
    param(
        [string]$filePath
    )
    
    Write-Host "Processando $filePath..."
    
    # Ler o conteúdo do arquivo
    $content = Get-Content -Path $filePath -Raw
    
    # Remover as referências ao favicon
    $content = $content -replace '<link rel="icon"[^>]*>', ''
    $content = $content -replace '<link rel="apple-touch-icon"[^>]*>', ''
    
    # Remover as referências ao manifest
    $content = $content -replace '<link rel="manifest"[^>]*>', ''
    
    # Salvar o arquivo modificado
    $content | Set-Content -Path $filePath -NoNewline
    
    Write-Host "Referências removidas de $filePath"
}

# Processa o arquivo index.html
$indexPath = "index.html"
if (Test-Path $indexPath) {
    ProcessHtmlFile -filePath $indexPath
}

# Processa todos os arquivos HTML na pasta pages
$pagesFiles = Get-ChildItem -Path "pages" -Filter "*.html" -Recurse
foreach ($file in $pagesFiles) {
    ProcessHtmlFile -filePath $file.FullName
}

Write-Host "Processo concluído!" 