"""
Created By : Nikesh
Created On :
Reviewed By :
Reviewed On :
Version :
"""

from .url_mapping import doctors_mapping
from django.urls import path

urlpatterns = [
    path("add", doctors_mapping.add),
    path("update", doctors_mapping.update),
    path("delete", doctors_mapping.delete),
    path("get", doctors_mapping.get),
    path("get-list", doctors_mapping.get_list),
    path("get-object", doctors_mapping.get_object),
    path("get-list-object", doctors_mapping.get_list_object),
    path("get-list-object-page", doctors_mapping.get_list_object_page),
]
