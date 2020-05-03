from .base import *

DEBUG = True


SECRET_KEY = '26f@h0mga2*cx+gzpl(u=h7f8wb=u*_q5oki1^4d-lyz8=w*o3'
TOKEN_SECRETE = "K@r0Sambhav"

ALLOWED_HOSTS = ['*']


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'hospital',
        'USER': 'root',
        'PASSWORD': 'root',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}