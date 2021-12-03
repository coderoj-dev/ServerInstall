#include<bits/stdc++.h>
#define IMAGE (string)"amirhamza05/judger:latest"
using namespace std;

int exec(string cmd) {
    return system(cmd.c_str());
}

struct Port {

    int portNo;

    Port() {}

    Port(int portNo) {
        this->portNo = portNo;
    }

    void list() {
        string cmd = "docker container ls --format \"{{.Names}}\" -a";
        exec(cmd);
    }

    string getPortName() {
        return "port_" + to_string(this->portNo);
    }

    /*
    - docker run -p --name port_name port_no:80 -d amirhamza05/judger:latest
    */
    void run() {
        string cmd = "docker run --name "+ this->getPortName() +" -p " + to_string(this->portNo) + ":80 --privileged -d " + IMAGE;
        exec(cmd);
    }

    /*
    - docker run port_name | xargs docker rm
    */
    void stop() {
        string cmd = "docker stop "+ this->getPortName() + "| xargs docker rm";
        exec(cmd);
    }
    /*
    - docker run -p --name port_name port_no:80 -d amirhamza05/judger:latest && docker run port_name | xargs docker rm
    */
    void reset() {
        this->stop();
        this->run();
    }
};

struct Docker{

    void install(){
        string cmd = "sudo apt-get update && apt install -y docker.io";
        exec(cmd);
    }
};

struct DockerImage {
    DockerImage() {}

    void build() {
        string cmd = "docker build -t " + IMAGE;
        exec(cmd);
    }

    void pull() {
        string cmd = "docker pull " + IMAGE;
        exec(cmd);
    }

};

struct DefaultPort {
    vector<int>portsNo;

    DefaultPort() {
        portsNo = {81,82,83,84};
    }

    void run() {
        for(auto portNo: portsNo) {
            Port p(portNo);
            p.run();
            cout << "Port run " << portNo << "\n";
        }
    }

    void reset() {
        for(auto portNo: portsNo) {
            Port p(portNo);
            p.reset();
            cout << "Port reset " << portNo << "\n";
        }
    }

    void hardReset() {
        DockerImage dockerImage;
        dockerImage.pull();

        for(auto portNo: portsNo) {
            Port p(portNo);
            p.reset();
            cout << "Port herd reset " << portNo << "\n";
        }
    }

    void stop() {
        for(auto portNo: portsNo) {
            Port p(portNo);
            p.stop();
            cout << "Port stop " << portNo << "\n";
        }
    }
};


int main(int argc, char* argv[]) {

    string test;
    vector<string>args;
    for(int i=0; i<argc; i++)
        args.push_back((string)argv[i]);


    if(args[1] == "port") {
        if(args[2] == "list") {
            Port p;
            p.list();
        } else {
            int portNo = stoi(args[3]);
            if(portNo >= 80 && portNo <= 100) {
                Port p(portNo);

                if(args[2] == "run") p.run();
                else if(args[2] == "stop") p.stop();
                else if(args[2] == "reset") p.reset();
            }
        }
    } else if(args[1] == "default") {
        DefaultPort defaultPort;
        if(args[2] == "run") defaultPort.run();
        else if(args[2] == "stop") defaultPort.stop();
        else if(args[2] == "reset") defaultPort.reset();
        else if(args[2] == "hard_reset") defaultPort.hardReset();
    } else if(args[1] == "docker_install"){
        Docker docker;
        docker.install();
    } else if(args[1] == "install"){
        Docker docker;
        docker.install();
        DefaultPort defaultPort;
        defaultPort.run();
    } else if(args[1] == "test"){
        cout << "Working Judger Install System\n";
    }


    return 0;
}
