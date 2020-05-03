"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
import json
from django.http import HttpRequest
from APPOINTMENT_APP.api.base_controller import BaseController
from APPOINTMENT_APP.models.hierarchy import hierarchyModel
from APPOINTMENT_APP.services.hierarchy_service import hierarchyService
from APPOINTMENT_APP.utils.constants.constants import DataTypes, HttpMethodType, AppConstants
from APPOINTMENT_APP.utils.helpers.general_helper import IntHelper, FloatHelper
from APPOINTMENT_APP.utils.helpers.request_helper import RequestConfig, ParamsObject


class hierarchy(BaseController):

    def __init__(self, request):
        BaseController.__init__(self, request)

    def add(self, request: HttpRequest):
        hierarchy_json = json.loads(request.POST.get("hierarchy_json"))

        hierarchy_object: hierarchyModel = hierarchyModel()
        hierarchy_object.left_node = hierarchy_json.get("left_node")
        hierarchy_object.right_node = hierarchy_json.get("right_node")
        hierarchy_object.type = hierarchy_json.get("type")
        hierarchy_object.user_or_entity_id = hierarchy_json.get("user_or_entity_id")
        hierarchy_object._id = hierarchy_json.get("_id")

        hierarchy_service: hierarchyService = hierarchyService()
        hierarchy_object = hierarchy_service.add(hierarchy_object)

        return self.send_response(hierarchy_object)

    def update(self, request: HttpRequest):
        hierarchy_json = json.loads(request.POST.get("hierarchy_json"))

        hierarchy_object: hierarchyModel = hierarchyModel()
        hierarchy_object.left_node = hierarchy_json.get("left_node")
        hierarchy_object.right_node = hierarchy_json.get("right_node")
        hierarchy_object.type = hierarchy_json.get("type")
        hierarchy_object.user_or_entity_id = hierarchy_json.get("user_or_entity_id")
        hierarchy_object._id = hierarchy_json.get("_id")

        hierarchy_service: hierarchyService = hierarchyService()
        hierarchy_object = hierarchy_service.update(hierarchy_object)

        return self.send_response(hierarchy_object)

    def delete(self, request: HttpRequest):
        hierarchy_json = json.loads(request.POST.get("hierarchy_json"))

        hierarchy_object: hierarchyModel = hierarchyModel()
        hierarchy_object.left_node = hierarchy_json.get("left_node")
        hierarchy_object.right_node = hierarchy_json.get("right_node")
        hierarchy_object.type = hierarchy_json.get("type")
        hierarchy_object.user_or_entity_id = hierarchy_json.get("user_or_entity_id")
        hierarchy_object._id = hierarchy_json.get("_id")

        hierarchy_service: hierarchyService = hierarchyService()
        hierarchy_object = hierarchy_service.delete(hierarchy_object)

        return self.send_response(hierarchy_object)

    def get(self, request: HttpRequest):
        params = [
            {"id": RequestConfig(from_session=False, nullable=False, datatype=DataTypes.INT)}
        ]
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        hierarchy_service: hierarchyService = hierarchyService()
        data = hierarchy_service.get(params)
        return self.send_response(data)

    def get_list(self, request: HttpRequest):
        params = [
            {"ids": RequestConfig(from_session=False, nullable=False, datatype=DataTypes.STRING, default='')}
        ]
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        hierarchy_service: hierarchyService = hierarchyService()
        data = hierarchy_service.get_list(params)
        return self.send_response(data)

    def get_object(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        hierarchy_service: hierarchyService = hierarchyService()
        data = hierarchy_service.get_object(params)
        return self.send_response(data)

    def get_list_object(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        hierarchy_service: hierarchyService = hierarchyService()
        data = hierarchy_service.get_list_object(params)
        return self.send_response(data)

    def get_list_object_page(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        hierarchy_service: hierarchyService = hierarchyService()
        data = hierarchy_service.get_list_object_paginated(params)
        return self.send_response(data)
