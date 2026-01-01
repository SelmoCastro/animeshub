@echo off
echo Building Docker image...
docker-compose build

echo Starting container...
docker-compose up -d

echo App running at http://localhost:8080
pause
