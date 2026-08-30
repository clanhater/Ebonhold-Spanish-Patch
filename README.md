# 🇪🇸 Project Ebonhold — Parche de Localización al Español (WoW 3.3.5)

[![Version](https://img.shields.io/badge/Cliente-WoW_3.3.5a_(enUS)-blue.svg)](#requisitos)
[![Idioma](https://img.shields.io/badge/Idioma-Espa%C3%B1ol_(esES)-green.svg)](#contenido-traducido)
[![Actualizaciones](https://img.shields.io/badge/Actualizaciones-Diarias_Autom%C3%A1ticas-orange.svg)](#instalación)
[![Descarga](https://img.shields.io/badge/Descargar-patch--Z.mpq-brightgreen.svg)](https://github.com/clanhater/Ebonhold-Spanish-Patch/releases/latest/download/patch-Z.mpq)

Traducción y adaptación completa al español oficial de Blizzard (**esES**) para los sistemas, interfaces, mecánicas personalizadas y contenido de **Project Ebonhold**.

Este parche está optimizado para funcionar directamente sobre el cliente en inglés (`enUS`), permitiendo jugar con todo el contenido en español sin alterar la compatibilidad con el servidor.

---

## 📥 Enlace de Descarga Directa

> ### 🚀 [**Descargar patch-Z.mpq (Última Versión)**](https://github.com/clanhater/Ebonhold-Spanish-Patch/releases/latest/download/patch-Z.mpq)
> *(El enlace anterior siempre descarga automáticamente la versión más reciente).*

---

## 🎮 Contenido Traducido

El parche cubre tanto las bases de datos (`DBC`) como los módulos personalizados de interfaz (`Lua` / `XML`):

* **🔮 Sistema de Ecos y Builds (Roguelite):** Diario de Ecos, tiradas al subir de nivel (*draws*), bloqueo de ranuras permanentes, tomos de habilidades, orbes de recuerdos y gestor de builds.
* **🌳 Árbol de Habilidades y Prestigio:** Descripciones completas de los nodos de talentos, talentos ápice, acumulación de Cenizas de alma, multiplicadores e hitos de reinicio de prestigio.
* **👗 Colecciones y Transfiguración (ezCollections):** Ropero completo de apariencias, probador, catálogo con trasfondo de monturas, compañeros, biblioteca y juguetes.
* **💀 Modo Hardcore e Intensidad:** Niveles de dificultad (Hardcore I a V), modificadores de criaturas, aumentos de botín, afijos de corrupción y mecánicas de supervivencia/resurrección.
* **⚔️ Clases, Hechizos y Objetos:** Base de datos de `Spell.dbc`, encantamientos de armas, conjuntos de armadura (Tiers y Arenas) e información de objetos.
* **⚙️ Calidad de Vida (QoL):** Venta automática de chatarra, configuración avanzada de cámaras y renderizado, personalización de placas de nombre (*Nameplates*), visor de waypoints y soporte.

---

## 🛠️ Requisitos de Instalación

1. **Cliente de World of Warcraft:** Versión **3.3.5a (12340)**.
2. **Idioma del cliente base:** **Inglés (`enUS`)**.

---

## 🚀 Guía de Instalación (Paso a Paso)

### Método 1: Instalación Manual (Recomendado)
1. Descarga el archivo [**patch-Z.mpq**](https://github.com/clanhater/Ebonhold-Spanish-Patch/releases/latest/download/patch-Z.mpq).
2. Abre la carpeta donde tienes instalado tu juego.
3. Entra en la subcarpeta **`Data/`** (ejemplo: `World of Warcraft/Data/`).
4. Pega el archivo `patch-Z.mpq` en esa carpeta.
5. Inicia el juego normalmente.

---

### Método 2: Auto-Actualizador en 1 Clic (Windows)
Si deseas actualizar el parche sin entrar al navegador cada día:
1. Crea un archivo de texto en la carpeta principal de tu juego y renómbralo a **`Actualizar_Parche_ES.bat`**.
2. Ábrelo con el bloc de notas y pega el siguiente código:
```bat
@echo off
title Actualizador del Parche en Espanol
echo Descargando la version mas reciente del parche...
curl -L -o "Data\patch-Z.mpq" "https://github.com/clanhater/Ebonhold-Spanish-Patch/releases/latest/download/patch-Z.mpq"
echo.
echo Parche actualizado con exito.
pause
```
3. Cada vez que quieras actualizar, solo haz doble clic en ese archivo `.bat`.

---

## ❓ Preguntas Frecuentes (FAQ)

#### ¿Por qué el parche se llama `patch-Z.mpq`?
En el cliente 3.3.5a, el motor del juego carga los parches en orden alfabético (`patch.mpq` -> `patch-2.mpq` -> `patch-Z.mpq`). La letra **Z** garantiza que este parche tenga la máxima prioridad de carga y sobreescriba correctamente los textos en inglés.

#### ¿Es compatible con otros parches del servidor?
Sí. El parche solo reemplaza cadenas de localización y archivos de interfaz gráfica, sin alterar archivos de modelos, mapas ni ejecutables.

#### ¿Con qué frecuencia se actualiza?
El parche se compila y actualiza **a diario** mediante integración continua, sincronizándose con las actualizaciones y cambios que realiza el equipo de desarrollo de Project Ebonhold.

---

## 💬 Reportes y Sugerencias
Si encuentras alguna errata, texto sin traducir o error de interfaz, puedes abrir un **Issue** en este repositorio o ponerte en contacto a través de la comunidad de Discord.