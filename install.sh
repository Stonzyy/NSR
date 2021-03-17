sudo apt-get install golang 
cd ~/Desktop
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
cd ~/go/bin; sudo cp subfinder /usr/bin

go get github.com/tomnomnom/waybackurls; 
cd ~/go/bin; sudo cp waybackurls /usr/bin/


cd ~/Desktop
git clone https://github.com/projectdiscovery/httpx.git; cd httpx/cmd/httpx; go build;sudo mv httpx /usr/bin

sudo apt-get install gobuster

