@ECHO OFF
SETLOCAL EnableDelayedExpansion

IF NOT EXIST input ECHO input folder not found
IF NOT EXIST output MD output
CD input


FOR /R %%a IN (*.pdf) DO (
SET filepath=%%~a
SET filedir=%%~dpa
SET filedrive=%%~da
SET filename=%%~na
SET fileextension=%%~xa

SET OUT_FILE=!filepath:input=output!
SET OUT_PATH=!filedir:input=output!
IF NOT EXIST !OUT_PATH! MD !OUT_PATH!
gswin32 -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dColorConversionStrategy=/LeaveColorUnchanged -dNOPAUSE -dQUIET -dBATCH -sOutputFile=!OUT_FILE! %%~a

)
