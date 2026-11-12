#!/bin/bash
# explorar-sistema.sh - Recorre la jerarquia del sistema y la documenta
# Autor: Tu Nombre
# Fecha: 2026-11-12
# Uso: ./explorar-sistema.sh
# Descripcion: recorre /etc, /var, /home, /bin, /tmp y /proc y documenta su funcion

# Linea separadora que se imprime al final de cada seccion
SEP="--------------------------------------------------"

# Bloque 1: /etc guarda la configuracion del sistema
echo "=== /etc ==="
echo "/etc guarda archivos de configuracion del sistema en texto plano."
ls -l /etc | head -n 20
echo "$SEP"
echo ""

# Bloque 2: /var guarda datos que cambian durante la operacion
echo "=== /var ==="
echo "/var guarda datos que cambian: registros, colas y caches."
ls -lh /var | head -n 20
echo "$SEP"
echo ""

# Bloque 3: /home contiene un subdirectorio por usuario
echo "=== /home ==="
echo "/home contiene un subdirectorio por usuario con sus archivos personales."
ls -l /home
echo "$SEP"
echo ""

# Bloque 4: /bin contiene los programas esenciales
echo "=== /bin ==="
echo "/bin contiene programas esenciales disponibles para todo usuario."
ls -l /bin | head -n 20
echo "$SEP"
echo ""

# Bloque 5: /tmp contiene archivos temporales
echo "=== /tmp ==="
echo "/tmp contiene archivos temporales que se vacian al reiniciar."
ls -lh /tmp | head -n 20
echo "$SEP"
echo ""

# Bloque 6: /proc es un sistema virtual que fabrica el kernel
echo "=== /proc ==="
echo "/proc es un sistema virtual: el kernel genera su contenido al leerlo."
ls -l /proc | head -n 20
echo "$SEP"
echo ""

# Mensaje final que marca el cierre del reporte
echo "Exploracion completada."
