REPO_DIR="C/Citi/RepoPoC-Rafa/1640-LOCAL-ORDER-ADMI/"

# Cambia al directorio del repositorio
cd "$REPO_DIR" || exit

EXCLUDE_DIRS=(".git" ".vscode")
EXCLUDE_FILES=(".gitignore")

EXCLUDE_PATTERNS=("jenkins*" "Jenkins*")

# Genera la lista de exclusión para el comando find

EXCLUDE_PARAMS=""
for dir in "${EXCLUDE_DIRS[@]}"; do
    EXCLUDE_PARAMS+=" -path ./$dir -prune -o"
done
for file in "${EXCLUDE_FILES[@]}"; do
    EXCLUDE_PARAMS+=" -name $file -o"
done
for pattern in "${EXCLUDE_PATTERNS[@]}"; do
    EXCLUDE_PARAMS+=" -name '$pattern' -o"
done


# Encuentra todos los archivos sin extensión excluyendo las carpetas, archivos y patrones especificados
#eval "find . $EXCLUDE_PARAMS -type f ! -name '*.*' -print" | while read -r file; do
    # Verifica si el archivo es un archivo COBOL
#    if file "$file" | grep -q 'COBOL'; then
        # Renombra el archivo para agregar la extensión .cbl
#        mv "$file" "$file.cbl"
#        echo "Renombrado: $file -> $file.cbl"
#    fi
#done
SEARCH_TEXT="DIVISON."

# Encuentra todos los archivos en el directorio
find . -type f | while read -r file; do
    # Verifica si el archivo contiene el texto buscado
    if grep -q "$SEARCH_TEXT" "$file"; then
        echo "El texto '$SEARCH_TEXT' fue encontrado en el archivo: $file"
    fi
done