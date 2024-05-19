@echo off

echo Descargando Miniconda...
powershell -command "& {Invoke-WebRequest -Uri https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe -OutFile MinicondaInstaller.exe}"

echo Instalando Miniconda...
start /wait MinicondaInstaller.exe /InstallationType=JustMe /RegisterPython=1 /S /D=%UserProfile%\Miniconda3

echo Configurando el entorno de Conda...
call %UserProfile%\Miniconda3\Scripts\activate.bat
call conda create --name myenv python=3.10 -y

echo Activando el entorno virtual...
call activate myenv

echo Instalando dependencias...
call conda install numpy=1.25.2 pandas=2.0.3 scikit-learn=1.2.2 openpyxl -y
call conda install -c conda-forge hdbscan=0.8.33 -y

echo Ejecutando el script de Python...
call python app.py

echo Desactivando el entorno virtual...
call conda deactivate

echo Proceso completado.
pause
