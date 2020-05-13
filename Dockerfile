# Source image
FROM  python:stretch 

# working app directory
COPY . /app
WORKDIR /app

# install requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# declare entry point
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]