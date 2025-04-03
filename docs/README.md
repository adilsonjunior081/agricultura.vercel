# Site da Secretaria de Agricultura de Gravatá

Este é o repositório do site oficial da Secretaria de Agricultura e Desenvolvimento Rural do município de Gravatá, Pernambuco.

## Estrutura do Projeto

```
projeto/
├── assets/
│   └── img/        # Imagens e recursos visuais
├── config/         # Arquivos de configuração
├── css/            # Folhas de estilo
├── docs/           # Documentação
├── js/             # Scripts JavaScript
├── pages/          # Páginas HTML das culturas
├── .htaccess       # Configurações do servidor Apache
├── fix-headers.ps1 # Script para correção de headers
├── fix-paths.ps1   # Script para correção de caminhos
├── index.html      # Página inicial
├── robots.txt      # Instruções para crawlers
├── site.webmanifest # Configurações para PWA
├── sitemap.xml     # Mapa do site para SEO
└── vercel.json     # Configuração para deploy no Vercel
```

## Segurança Implementada

O site implementa as seguintes medidas de segurança:

- **X-Frame-Options**: Configurado via header HTTP como "SAMEORIGIN"
- **X-XSS-Protection**: Proteção contra ataques XSS
- **X-Content-Type-Options**: Prevenção contra MIME type sniffing
- **Content-Security-Policy**: Política de segurança de conteúdo
- **Referrer-Policy**: Controle sobre informações de referência

## Culturas Representadas

O site apresenta informações detalhadas sobre as principais culturas agrícolas de Gravatá:

1. Abacaxi
2. Banana da Terra
3. Cará São Tomé
4. Chuchu
5. Goiaba
6. Orgânicos
7. Flores

## Manutenção

Para atualizações e manutenção do site:

1. Novos recursos devem seguir a estrutura de pastas existente
2. Imagens devem ser armazenadas em `assets/img/`
3. As páginas de culturas devem ser adicionadas em `pages/`
4. Atualizações no mapa do site devem refletir em `sitemap.xml`

## Publicação no Vercel

Para publicar o site no Vercel a partir de um repositório GitHub:

1. **Prepare os caminhos de arquivo**: Execute o script `fix-paths-vercel.ps1` antes de enviar para o GitHub
2. **Configuração do Vercel**: O arquivo `vercel.json` já está configurado com:
   - Headers de segurança
   - Configuração de rotas
   - Limpeza de URLs

3. **Passos para deploy**:
   - Crie um repositório no GitHub e envie o código
   - Crie uma conta no Vercel (https://vercel.com)
   - Inicie um novo projeto no Vercel e conecte ao repositório do GitHub
   - O Vercel detectará automaticamente o arquivo `vercel.json` e aplicará as configurações

4. **Dicas para solução de problemas**:
   - Se o CSS não carregar, verifique se todos os caminhos começam com `/` (ex: `/css/style.css`)
   - Para páginas em subdiretórios, verifique se os caminhos relativos estão corretos
   - Use a aba Network do DevTools do navegador para identificar recursos que não estão carregando

## Desenvolvido por

Secretaria de Agricultura e Desenvolvimento Rural de Gravatá 