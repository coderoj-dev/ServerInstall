# Server Install

`bash <(curl -s https://raw.githubusercontent.com/coderoj-dev/ServerInstall/main/setup.sh)`

# Command

|  Command  | Details |
| ------------------ | ------------- |
| `./judger install`  | Install docker and run judger docker container in all default port  |
| `./judger docker_install`  |  Install docker  |
| `./judger test`  |  Test judger for check judger is working  |
| `./judger port run {port_no}`  |  Running  judger docker container in this port number  |
| `./judger port stop {port_no}`  |  Stop judger docker container in this port number  |
| `./judger port reset {port_no}`  |  Reset judger docker container in this port number  |
| `./judger port list`  |  List all judger docker running port number  |
| `./judger default run`  |  Running  judger docker container in all default port numbers which is defined by judger owner  |
| `./judger default stop`  |  Stop judger docker container in all default port numbers  |
| `./judger default reset`  |  Reset judger docker container in all default port numbers  |
| `./judger default hard_reset`  |  Pull docker image and Reset judger docker container in all default port numbers  |



