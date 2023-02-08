echo @off
docker buildx build --file Dockerfile-m2 --platform linux/amd64,linux/arm64 --push -t m2/gdal .
git add .
git commit -m "some fix"
git push 
pause