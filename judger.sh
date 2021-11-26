(docker stop $(docker ps -a -q --filter ancestor=amirhamza05/judger:latest --format="{{.ID}}"))
docker pull amirhamza05/judger:latest
docker run -p 80:80 -d amirhamza05/judger:latest
docker run -p 81:80 -d amirhamza05/judger:latest
docker run -p 82:80 -d amirhamza05/judger:latest
