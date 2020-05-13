docker build --pull --rm -f "Dockerfile" -t jwt-api-test "."
docker run --env-file env_file -p 80:8080 jwt-api-test