"""
Created By : Nikesh
Created On : 
Reviewed By :
Reviewed On :
Version :
"""

from .url_mapping import authentication_mapping
from django.urls import path

urlpatterns = [
    path("authenticate", authentication_mapping.authenticate),
    path("logout", authentication_mapping.logout),
    path("test", authentication_mapping.test),

]
