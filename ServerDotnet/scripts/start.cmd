docker run --name nginx -p 8080:8080 -d nginxdocker

start "linkso1" /d ..\WebApi\ dotnet run --no-build --urls http://*:5001
start "linkso2" /d ..\WebApi\ dotnet run --no-build --urls http://*:5002

