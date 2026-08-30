@echo off
title Subir Cambios a GitHub
cd /d "%~dp0"
echo ============================================
echo   Subiendo traducciones a la nube...
echo ============================================
git add .
git commit -m "Actualizacion diaria de traducciones"
git push origin main
echo ============================================
echo   ¡Listo! GitHub Actions esta empaquetando
echo   el patch-Z.mpq en la nube ahora mismo.
echo ============================================
pause