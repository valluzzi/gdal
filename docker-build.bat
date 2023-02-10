echo @off
docker buildx build --platform linux/amd64,linux/arm64 --push -t valluzzi/gdal .
::docker build -t valluzzi/gdal .
