echo @off
docker buildx build --platform linux/amd64,linux/arm64 --push -t valluzzi/gdal .
git add .
git commit -m "some fix"
git push 
pause