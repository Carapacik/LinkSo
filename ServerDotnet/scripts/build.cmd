cd ..\WebApi\ & dotnet build

cd ..\nginx\conf\ & docker build -t nginxdocker -f Dockerfile .

cd ..\..\scripts\