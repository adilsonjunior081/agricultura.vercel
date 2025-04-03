# Script para remover arquivos desnecessários
Write-Host "Removendo arquivos de ícones desnecessários..."

$filesToRemove = @(
    "site.webmanifest",
    "android-chrome-192x192.png",
    "android-chrome-512x512.png",
    "apple-touch-icon.png",
    "favicon-16x16.png",
    "favicon-32x32.png"
)

foreach ($file in $filesToRemove) {
    if (Test-Path $file) {
        Remove-Item -Path $file -Force
        Write-Host "Removido $file"
    } else {
        Write-Host "$file não encontrado"
    }
}

# Verificar arquivos na pasta assets/img
$imgFolder = "assets/img"
if (Test-Path $imgFolder) {
    $imgFiles = @(
        "android-chrome-192x192.png",
        "android-chrome-512x512.png",
        "apple-touch-icon.png",
        "favicon-16x16.png",
        "favicon-32x32.png"
    )
    
    foreach ($file in $imgFiles) {
        $imgFile = "$imgFolder/$file"
        if (Test-Path $imgFile) {
            Remove-Item -Path $imgFile -Force
            Write-Host "Removido $imgFile"
        }
    }
}

# Verificar pasta pages
$pagesFolder = "pages"
if (Test-Path "$pagesFolder/site.webmanifest") {
    Remove-Item -Path "$pagesFolder/site.webmanifest" -Force
    Write-Host "Removido $pagesFolder/site.webmanifest"
}

Write-Host "Processo concluído!" 