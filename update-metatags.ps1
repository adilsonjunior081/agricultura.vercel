# Script para atualizar as meta tags de todos os arquivos HTML
Write-Host "Atualizando meta tags de imagem e descricao em todos os arquivos HTML..."

$baseUrl = "https://agricultura-atualizado.vercel.app"
$title = "Agricultura de Gravata - Secretaria de Agricultura"
$description = "Conheca as riquezas agricolas de Gravata, a 'Suica Pernambucana'."
$imagePath = "$baseUrl/compartilhamento.jpg"

# Obter todos os arquivos HTML no projeto
$htmlFiles = Get-ChildItem -Path "." -Include "*.html" -Recurse

foreach ($file in $htmlFiles) {
    Write-Host "Processando $($file.Name)..."
    
    # Ler o conteudo do arquivo
    $content = Get-Content -Path $file.FullName -Raw
    
    # Criar os novos valores de meta tags
    $ogTitle = "<meta property=`"og:title`" content=`"$title`">"
    $ogDesc = "<meta property=`"og:description`" content=`"$description`">"
    $ogImage = "<meta property=`"og:image`" content=`"$imagePath`">"
    
    $twTitle = "<meta name=`"twitter:title`" content=`"$title`">"
    $twDesc = "<meta name=`"twitter:description`" content=`"$description`">"
    $twImage = "<meta name=`"twitter:image`" content=`"$imagePath`">"
    
    # Substituir as meta tags existentes
    $content = $content -replace '<meta property="og:title" content="[^"]*">', $ogTitle
    $content = $content -replace '<meta property="og:description" content="[^"]*">', $ogDesc
    $content = $content -replace '<meta property="og:image" content="[^"]*">', $ogImage
    
    $content = $content -replace '<meta name="twitter:title" content="[^"]*">', $twTitle
    $content = $content -replace '<meta name="twitter:description" content="[^"]*">', $twDesc
    $content = $content -replace '<meta name="twitter:image" content="[^"]*">', $twImage
    
    # Salvar o arquivo modificado
    $content | Set-Content -Path $file.FullName -NoNewline
    Write-Host "Atualizado $($file.Name)"
}

Write-Host "Processo concluido!" 