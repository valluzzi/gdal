echo @off
docker build --file .\Dockerfile-m2 -t m2/gdal .
git add .
git commit -m "some fix"
git push 
pause