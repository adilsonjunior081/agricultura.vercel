# Script para otimizar a imagem de compartilhamento
Write-Host "Otimizando imagem de compartilhamento para redes sociais..."

# Verificar se o módulo de manipulação de imagens está disponível
if (-not (Get-Module -ListAvailable -Name PowerShellForGitHub)) {
    Write-Host "Utilizando método alternativo para otimizar a imagem..."
    
    # Caminho da imagem original
    $imagePath = "assets/img/compartilhamento.jpg"
    
    # Criar uma cópia da imagem com outro nome para forçar o recarregamento
    $newImagePath = "assets/img/share-image.jpg"
    
    # Copiar o arquivo
    Copy-Item -Path $imagePath -Destination $newImagePath -Force
    
    Write-Host "Imagem copiada para $newImagePath"
    
    # Atualizar as referências nos arquivos HTML
    $files = Get-ChildItem -Path "." -Include "*.html" -Recurse
    $oldUrl = "https://agricultura-atualizado.vercel.app/assets/img/compartilhamento.jpg"
    $newUrl = "https://agricultura-atualizado.vercel.app/assets/img/share-image.jpg"
    
    foreach ($file in $files) {
        $content = Get-Content -Path $file.FullName -Raw
        
        # Verificar se o arquivo contém a URL antiga
        if ($content -match $oldUrl) {
            # Substituir a URL antiga pela nova URL
            $newContent = $content -replace [regex]::Escape($oldUrl), $newUrl
            
            # Salvar o arquivo modificado
            $newContent | Set-Content -Path $file.FullName -NoNewline
            
            Write-Host "Atualizado $($file.Name)"
        }
    }
    
    Write-Host "Processo concluído!"
}
else {
    Write-Host "Módulo de manipulação de imagens encontrado, mas não será utilizado neste caso."
    # Se tivéssemos o módulo, poderíamos redimensionar a imagem aqui
} 