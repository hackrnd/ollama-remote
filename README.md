

## Objective

Ollama allows to run LLMs locally. But to run LLMs effectively, strong hardware with GPU is needed. We can connect local installation of ollama with a remote host with GPU such as Google colab. 


## Steps 
Create a new colab project. Default runtime type is CPU, change it to T4 GPU. 

Install ollama: 
```
!curl https://ollama.ai/install.sh | sh 
```

Use CLI or Python based approach to setup and run Ollama on colab. 

### CLI approach 
Install ngrok: 
```
!curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok 
```
Get auth token from ngrok.com and configure it: 
```
ngrok config add-authtoken <auth-token>
```
Upload `init.sh` file to the project. 

Give the necessary permissions to run it: 
```
!chmod +x init.sh
```
Run the script which starts ollama and tunnel it using ngrok: 
```
!sh init.sh 
```

### Python approach 
Install python libraries: 
```
!pip install aiohttp pyngrok
```
Execute the code in `init.py` to start ollama and tunnel it using ngrok. 

### Connect to remote Ollama server from local: 
Ngrok exposes a url, which you have to export as OLLAMA_HOST
```
export OLLAMA_HOST=https://fd90-34-125-15-193.ngrok.io/
```
Pull LLM: 
```
ollama pull llama3.2
```
Run LLM: 
```
ollama run llama3.2
```

## Alternate tools
### Colab alternatives 
There are other providers which give generous time-bound GPU usage: 
- Saturn Cloud - provides 30 hours of free compute per month
- Kaggle Notebooks - limits GPU usage to 30 hours per week  

### Ngrok alternatives
Ngrok [free plan](https://ngrok.com/pricing) has some restrictions and it will start throttling after sustained usage. Below are some alternatives: 
- [zrok.io](https://zrok.io/) - higher monthly limits, fixed URL which does not change on restart, supports HTTP/HTTPS, TCP/UDP tunnels, file shares
- Cloudflare tunnel - free usage 