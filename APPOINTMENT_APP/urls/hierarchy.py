"""
Created By : Nikesh
Created On :
Reviewed By :
Reviewed On :
Version :
"""

from .url_mapping import hierarchy_mapping
from django.urls import path

urlpatterns = [
    path("add", hierarchy_mapping.add),
    path("update", hierarchy_mapping.update),
    path("delete", hierarchy_mapping.delete),
    path("get", hierarchy_mapping.get),
    path("get-list", hierarchy_mapping.get_list),
    path("get-object", hierarchy_mapping.get_object),
    path("get-list-object", hierarchy_mapping.get_list_object),
    path("get-list-object-page", hierarchy_mapping.get_list_object_page),
]
