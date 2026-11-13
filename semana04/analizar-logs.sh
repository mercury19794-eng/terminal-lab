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

echo ""
echo "=== Lineas con error 500 ==="
# Los espacios alrededor de 500 evitan coincidir con tamanos o rutas
# || ejecuta lo de la derecha solo si grep no encuentra nada
grep " 500 " "$LOG" || echo "(ninguna)"

echo ""
echo "=== Hora pico (hora con mas peticiones) ==="
# cut -d'[' -f2: se queda con lo que viene despues del corchete (fecha y hora)
# cut -d':' -f2: toma el segundo campo, que es la hora
# sort | uniq -c | sort -nr | head: agrupa, cuenta, ordena y deja la primera
cut -d'[' -f2 "$LOG" | cut -d':' -f2 | sort | uniq -c | sort -nr | head -n 1

echo ""
echo "Analisis completado."
