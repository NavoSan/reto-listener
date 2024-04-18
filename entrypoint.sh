#!/bin/bash
# Script para clonar o actualizar el repositorio Git

# Directorio donde el repositorio será clonado
REPO_DIR="/app/repo"

# Verifica si el directorio ya existe y contiene un repositorio git
if [ -d "$REPO_DIR/.git" ]; then
    echo "Actualizando el repositorio existente..."
    git -C "$REPO_DIR" pull
else
    echo "Clonando el repositorio..."
    git clone "$GIT_URL" "$REPO_DIR"
fi

# Ejecuta el comando original de CMD en Dockerfile
exec "$@"
