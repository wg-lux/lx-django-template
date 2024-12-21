import os

DEBUG = False

# get DB vars and allowed hosts from environment; set defaults
DB_USER = os.getenv("DB_USER", "aglnet")
DB_PWD = os.getenv("DB_PWD", "aglnet")
ALLOWED_HOSTS = os.getenv("ALLOWED_HOSTS", "*").split(",")
DEBUG = os.getenv("DEBUG", "True") == "True"

DATABASES = {
    "default": {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'aglnet_base',
        'USER': DB_USER,
        'PASSWORD': DB_PWD,  # Use the loaded password
        'HOST': '172.16.255.1',  # Set to 'localhost' if the server is local
        'PORT': '5432',       # Default PostgreSQL port
    }
}