echo "building my-web-server image"

docker build -t gcr.io/gcp0tohero/my-web-server:v1 .

echo "Pushing my-web-server image to GCR"

gcloud docker -- push gcr.io/gcp0tohero/my-web-server:v1

