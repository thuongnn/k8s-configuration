sudo gitlab-runner register -n \
  --url https://gitlab.com/ \
  --registration-token 5k9MB4QieemhqaMusogV \
  --executor docker \
  --description "My Docker Runner" \
  --docker-image "docker:19.03.12" \
  --docker-volumes /var/run/docker.sock:/var/run/docker.sock

kubectl expose deployment book-service --type LoadBalancer \
--port 80 --target-port 8080 --external-ip=27.71.230.189