# Script para copiar ícones para a raiz
Write-Host "Verificando e copiando ícones para a raiz..."

# Lista de ícones que precisam estar na raiz
$icons = @(
    "android-chrome-192x192.png",
    "android-chrome-512x512.png",
    "apple-touch-icon.png",
    "favicon-16x16.png",
    "favicon-32x32.png",
    "favicon.svg"
)

foreach ($icon in $icons) {
    $sourcePath = "assets/img/$icon"
    $destPath = "$icon"
    
    if (Test-Path $sourcePath) {
        if (-not (Test-Path $destPath)) {
            Copy-Item -Path $sourcePath -Destination $destPath
            Write-Host "Copiado $icon para a raiz"
        } else {
            Write-Host "O arquivo $icon já existe na raiz"
        }
    } else {
        Write-Host "Arquivo de origem $sourcePath não encontrado"
    }
}

# Atualizar o manifest para usar ícones na raiz
$manifestPath = "site.webmanifest"
$content = Get-Content -Path $manifestPath -Raw | ConvertFrom-Json

# Atualizar os caminhos dos ícones para a raiz com URL absoluta
$baseUrl = "https://agricultura-vercel.vercel.app"
$content.icons[0].src = "$baseUrl/android-chrome-192x192.png"
$content.icons[1].src = "$baseUrl/android-chrome-512x512.png"

# Salvar o arquivo modificado
$content | ConvertTo-Json -Depth 5 | Set-Content -Path $manifestPath -NoNewline

Write-Host "Arquivo site.webmanifest atualizado com URLs absolutas na raiz."

Write-Host "Processo concluido!" 