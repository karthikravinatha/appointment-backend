"""
Created By : Nikesh
Created On :
Reviewed By :
Reviewed On :
Version :
"""

from .url_mapping import user_mapping
from django.urls import path

urlpatterns = [
    path("add", user_mapping.add),
    path("update", user_mapping.update),
    path("delete", user_mapping.delete),
    path("get", user_mapping.get),
    path("get-list", user_mapping.get_list),
    path("get-object", user_mapping.get_object),
    path("get-list-object", user_mapping.get_list_object),
    path("get-list-object-page", user_mapping.get_list_object_page),
]
