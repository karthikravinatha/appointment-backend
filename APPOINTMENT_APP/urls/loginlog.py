"""
Created By : Nikesh
Created On :
Reviewed By :
Reviewed On :
Version :
"""

from .url_mapping import loginlog_mapping
from django.urls import path

urlpatterns = [
    path("add", loginlog_mapping.add),
    path("update", loginlog_mapping.update),
    path("delete", loginlog_mapping.delete),
    path("get", loginlog_mapping.get),
    path("get-list", loginlog_mapping.get_list),
    path("get-object", loginlog_mapping.get_object),
    path("get-list-object", loginlog_mapping.get_list_object),
    path("get-list-object-page", loginlog_mapping.get_list_object_page),
]
