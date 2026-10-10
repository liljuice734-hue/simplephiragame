@echo off
setlocal
set "APP_HOME=%~dp0"
if defined JAVA_HOME (
  set "JAVA_EXE=%JAVA_HOME%\bin\java.exe"
) else (
  set "JAVA_EXE=java.exe"
)
"%JAVA_EXE%" -Xmx64m -classpath "%APP_HOME%gradle\wrapper\gradle-wrapper-main-9.7.1.jar;%APP_HOME%gradle\wrapper\gradle-wrapper-shared-9.7.1.jar" org.gradle.wrapper.GradleWrapperMain %*
endlocal
