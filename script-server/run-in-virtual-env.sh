rm -rf  -- !(run-in-virtual-env.sh)
wget `curl -s https://api.github.com/repos/bugy/script-server/releases/latest | grep browser_download_url | cut -d '"' -f 4`
unzip script-server.zip
python3 -m venv virtual_env
virtual_env/bin/pip install wheel 
wget https://github.com/bugy/script-server/raw/master/requirements.txt
virtual_env/bin/pip install -r requirements.txt
virtual_env/bin/python3 launcher.py
