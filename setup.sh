export PROJ_DIR=`pwd`

# create virtual envinroment
cd $PROJ_DIR
echo $PROJ_DIR
# python
sudo apt-get update
sudo apt-get upgrade python3
sudo apt-get install python3

sudo apt-get install jq

sudo apt-get install build-essential libssl-dev libffi-dev python-dev
sudo apt install python3-pip
sudo apt install -y python3-venv  # If needed
python3 -m venv env
source env/bin/activate

# install dependencies for project
pip3 install --upgrade pip
pip3 install wheel
pip3 install pep8
pip3 install pylint
pip3 install -r requirements.txt


# run development server
export JWT_SECRET='myjwtsecret'
export LOG_LEVEL=DEBUG

python main.py