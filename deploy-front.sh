#!/usr/bin/env bash
set -euo pipefail

PROJECT_ID="calculadora-princing-simulador"
REGION="southamerica-east1"
REPO="calculadora-yaman-repo"
IMAGE_NAME="calculadora-yaman-front"
SERVICE_NAME="calculadora-yaman-front"

TAG="${1:-}"
if [[ -z "$TAG" ]]; then
  echo "Uso: ./deploy-front.sh 2.0.0"
  exit 1
fi

cd "/Users/felipeclemente/Documents/workspace/front-calculadora-yaman"

IMAGE="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO}/${IMAGE_NAME}:${TAG}"

echo ">>> Build: $IMAGE"
docker buildx build --platform linux/amd64 -t "$IMAGE" .

echo ">>> Push: $IMAGE"
docker push "$IMAGE"

echo ">>> Deploy Cloud Run: $SERVICE_NAME"
gcloud run deploy "$SERVICE_NAME" --image "$IMAGE"

URL="$(gcloud run services describe "$SERVICE_NAME" --format='value(status.url)')"
echo ">>> URL: $URL"

echo ">>> Check:"
curl -I "$URL"