# Script para atualizar as meta tags OG:image em todos os arquivos HTML do projeto
Write-Host "Atualizando meta tags OG:image em todos os arquivos HTML..."

# Caminho para o diretório raiz
$rootDir = Get-Location

# URL pública da imagem no Imgur
$newImageUrl = "https://i.imgur.com/Wxo1jZR.jpg"

# Processar arquivos na raiz
$indexFiles = Get-ChildItem -Path $rootDir -Filter "*.html"
foreach ($file in $indexFiles) {
    Write-Host "Processando $($file.Name)..."
    
    # Ler conteúdo do arquivo
    $content = Get-Content -Path $file.FullName -Raw
    
    # Substituir URLs de imagens nos meta tags OG e Twitter
    $newContent = $content -replace '<meta property="og:image" content="[^"]*"', "<meta property=""og:image"" content=""$newImageUrl"""
    $newContent = $newContent -replace '<meta name="twitter:image" content="[^"]*"', "<meta name=""twitter:image"" content=""$newImageUrl"""
    
    # Salvar arquivo modificado
    $newContent | Set-Content -Path $file.FullName -NoNewline
    Write-Host "  ✓ Atualizado $($file.Name)"
}

# Processar arquivos na pasta pages
$pagesDir = Join-Path -Path $rootDir -ChildPath "pages"
if (Test-Path $pagesDir) {
    $pagesFiles = Get-ChildItem -Path $pagesDir -Filter "*.html"
    foreach ($file in $pagesFiles) {
        Write-Host "Processando pages/$($file.Name)..."
        
        # Ler conteúdo do arquivo
        $content = Get-Content -Path $file.FullName -Raw
        
        # Substituir URLs de imagens nos meta tags OG e Twitter
        $newContent = $content -replace '<meta property="og:image" content="[^"]*"', "<meta property=""og:image"" content=""$newImageUrl"""
        $newContent = $newContent -replace '<meta name="twitter:image" content="[^"]*"', "<meta name=""twitter:image"" content=""$newImageUrl"""
        
        # Salvar arquivo modificado
        $newContent | Set-Content -Path $file.FullName -NoNewline
        Write-Host "  ✓ Atualizado pages/$($file.Name)"
    }
}

Write-Host "Todos os arquivos HTML foram atualizados com sucesso!" 