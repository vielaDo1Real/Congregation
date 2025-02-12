#!/bin/bash

# Diretório de entrada e saída
DOCS_DIR="./docs"
OUTPUT_DIR="./docs/converted"

# Itera sobre todas as subpastas em $DOCS_DIR
for dir in "$DOCS_DIR"/*/; do
    # Verifica se é um diretório
    if [ -d "$dir" ]; then
        # Itera sobre todos os arquivos .md na subpasta
        for file in "$dir"/*.md; do
            # Verifica se o arquivo existe (pode haver pastas sem arquivos .md)
            if [ -f "$file" ]; then
                filename=$(basename "$file" .md)
                # Cria o diretório de saída se não existir
                mkdir -p "$OUTPUT_DIR/$(basename "$dir")"
                # Converte para HTML
                pandoc "$file" -o "$OUTPUT_DIR/$(basename "$dir")/$filename.html"
                # Converte para PDF
                pandoc "$file" -o "$OUTPUT_DIR/$(basename "$dir")/$filename.pdf"
                echo "Convertido: $file → $OUTPUT_DIR/$(basename "$dir")/$filename.[html|pdf]"
            fi
        done
    fi
done