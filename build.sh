#!/bin/bash

# Navega a la subcarpeta donde está tu proyecto
cd java/backend

# Ejecuta Maven para construir el proyecto
mvn clean install

# Mueve el artefacto construido y otros archivos necesarios a la raíz del proyecto
mv target/*.jar ../../

# Opcional: Copia cualquier otro archivo o directorio que Heroku necesite para ejecutar tu aplicación
# cp -r src/main/resources ../../resources
