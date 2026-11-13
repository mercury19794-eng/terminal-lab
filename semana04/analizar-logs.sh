#!/bin/bash
# analizar-logs.sh - Procesa acceso.log y genera un reporte de 4 secciones
# Autor: Quiroz Ramos Marco
# Fecha: 2026-11-13
# Uso: ./analizar-logs.sh
# Descripcion: lee acceso.log (en esta misma carpeta) y resume IPs, estados,
# errores 500 y hora pico usando tuberias.

LOG="acceso.log"

echo "=== Top 5 IP con mas peticiones ==="
# awk: imprime la columna 1 (la IP) | sort: junta las iguales
# uniq -c: cuenta cada grupo | sort -nr: de mayor a menor | head: las 5 primeras
awk '{print $1}' "$LOG" | sort | uniq -c | sort -nr | head -n 5

echo ""
echo "=== Conteo por codigo de estado ==="
# El estado es la columna 9 en el formato Apache usado aqui
# sort -n: el estado menos frecuente aparece primero
awk '{print $9}' "$LOG" | sort | uniq -c | sort -n
