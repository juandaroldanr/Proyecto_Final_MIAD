# Proyecto_Final_MIAD - Documentación del proyecto

## Descripción

Este proyecto está diseñado para automatizar la detección de anomalías en los datos de consumo eléctrico de clientes de Electro Dunas. Utiliza técnicas avanzadas de aprendizaje automático y análisis estadístico para identificar comportamientos inusuales en los consumos eléctricos que podrían indicar problemas como errores de medición, fraudes o mal funcionamiento de equipos.
El script procesa datos de consumo eléctrico almacenados en archivos Excel, limpia los datos eliminando registros con valores negativos o incorrectos, y calcula métricas energéticas clave. Posteriormente, utiliza el algoritmo HDBSCAN y el de análisis de rangos intercuartílicos para identificar clusters y detectar outliers, complementando este análisis con un estudio de rangos intercuartílicos para detectar y clasificar anomalías tanto ordinarias como críticas.

## Instalación

Instrucciones paso a paso sobre cómo configurar y ejecutar el script:

1. Descargar y extraer el paquete del proyecto.
2. Abrir la carpeta del proyecto en el Explorador de Windows.
3. Colocar el consolidado de datos reciente de los consumos eléctricos de Electro Dunas en un archivo de Excel, siguiendo el siguiente formato de columnas/dimensiones: Source.Name, Fecha, Active_energy, Reactive_energy, Voltaje_FA, Voltaje_FC, CLIENTE, Proper, Sector Económico:.4. Hacer doble clic en `setup.bat` para configurar el entorno y ejecutar el script automáticamente, este instalará miniconda que es una distribución mínima del software Conda que incluye solo Conda, sus dependencias y Python, luego instalará las librerías necesarias para instalación y ejecutará el script app.py que contiene el preprocesamiento y limpieza de datos, ejecución de algoritmos de HDBSCAN, generación de datos eléctricos de consumo para Electro Dunas y ejecución de algoritmo de análisis de rangos intercuartílicos con la exportación de sus respectivos archivos en formato de archivos separados por comas (CSV)

## Requerimientos

- Acceso a Internet para la instalación de paquetes.
- Archivo en Excel con los últimos consumos energéticos acorde al formato descrito.
- Computador con un sistema operativo basado en Windows.

## Uso

Funcionalidad del Script
El script app.py realiza las siguientes funciones principales:

Carga y Limpieza de Datos:

Carga los datos desde un archivo Excel.
Elimina registros con energía activa o reactiva negativa y valores de voltaje negativos.
Renombra columnas para estandarizar nombres y facilitar su manejo.
Cálculo de Métricas Energéticas:

Calcula la potencia aparente y la eficiencia energética.
Determina la energía total consumida y el factor de potencia.
Mide la desviación de voltaje entre fases.
Detección de Anomalías con HDBSCAN:

Normaliza las características para preparar los datos para el análisis de clustering.
Aplica HDBSCAN para identificar clusters y detectar outliers.
Establece un umbral para identificar las anomalías críticas basadas en los scores de outlier.
Análisis de Rangos Intercuartílicos (IQR):

Calcula el rango intercuartílico para cada métrica energética.
Identifica y clasifica anomalías en dos niveles: normales y críticas, basadas en desviaciones de hasta 1.5 y 8 veces el IQR, respectivamente.
Exportación de Resultados:

El script generará los siguientes archivos CSV en la carpeta `output`:

- `energy_metrics.csv`: Contiene métricas de energía calculadas.
- `hdbscan_final.csv`: Resultados del análisis de clustering.
- `iqr_final.csv`: Resultados del análisis de rangos intercuartílicos.

Estos archivos deben ser utilizados en Power BI para la visualización de datos.

## Contribuir

Instrucciones para quienes deseen contribuir al proyecto:

Si deseas contribuir a este proyecto, por favor fork el repositorio y envía un pull request con tus mejoras.

## Licencia

Este proyecto será licenciado bajo una licencia de código abierto, permitiendo modificaciones, distribuciones y uso en proyectos derivados. 
