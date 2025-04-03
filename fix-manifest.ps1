# Script para corrigir os caminhos dos ícones no site.webmanifest
Write-Host "Corrigindo caminhos no site.webmanifest..."

$baseUrl = "https://agricultura-vercel.vercel.app"

# Ler o conteúdo do arquivo
$manifestPath = "site.webmanifest"
$content = Get-Content -Path $manifestPath -Raw | ConvertFrom-Json

# Atualizar os caminhos dos ícones com URL absoluta
$content.icons[0].src = "$baseUrl/$($content.icons[0].src)"
$content.icons[1].src = "$baseUrl/$($content.icons[1].src)"

# Salvar o arquivo modificado
$content | ConvertTo-Json -Depth 5 | Set-Content -Path $manifestPath -NoNewline

Write-Host "✓ Arquivo site.webmanifest atualizado com URLs absolutas."

# Criar uma cópia do arquivo na pasta pages
$pagesPath = "pages/site.webmanifest"
$pagesContent = $content | ConvertTo-Json -Depth 5
$pagesContent | Set-Content -Path $pagesPath -NoNewline

Write-Host "✓ Cópia do site.webmanifest criada na pasta pages."

Write-Host "Processo concluído!" 