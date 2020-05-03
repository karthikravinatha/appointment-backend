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
from APPOINTMENT_APP.models.user import UserModel
from APPOINTMENT_APP.services.user_service import userService
from APPOINTMENT_APP.utils.constants.constants import DataTypes, HttpMethodType, AppConstants
from APPOINTMENT_APP.utils.helpers.general_helper import IntHelper, FloatHelper
from APPOINTMENT_APP.utils.helpers.request_helper import RequestConfig, ParamsObject


class user(BaseController):

    def __init__(self, request):
        BaseController.__init__(self, request)

    def add(self, request: HttpRequest):
        user_json = json.loads(request.POST.get("user_json"))
        ext_params = self.get_entity_user_ext_params()

        user_object: UserModel = UserModel()
        user_object.user_name = user_json.get("user_name")
        user_object.mobile_number = user_json.get("mobile_number")
        user_object.landline_number = user_json.get("landline_number")
        user_object.email = user_json.get("email")
        user_object.user_password = user_json.get("user_password")
        user_object.parent_id = user_json.get("parent_id")
        user_object.designation = user_json.get("designation")
        user_object.files = user_json.get("files")

        user_service: userService = userService(ext_params)
        user_object = user_service.add(user_object)

        return self.send_response(user_object)

    def update(self, request: HttpRequest):
        user_json = json.loads(request.POST.get("user_json"))

        user_object: UserModel = UserModel()
        user_object.created_on = user_json.get("created_on")
        user_object.mobile_number = user_json.get("mobile_number")
        user_object.designation = user_json.get("designation")
        user_object.parent_id = user_json.get("parent_id")
        user_object.email = user_json.get("email")
        user_object.photo = user_json.get("photo")
        user_object.is_delete = user_json.get("is_delete")
        user_object.status = user_json.get("status")
        user_object.is_primary = user_json.get("is_primary")
        user_object.user_id = user_json.get("user_id")
        user_object.landline_number = user_json.get("landline_number")
        user_object.user_name = user_json.get("user_name")
        user_object.last_updated_by = user_json.get("last_updated_by")
        user_object.user_password = user_json.get("user_password")
        user_object.created_by = user_json.get("created_by")
        user_object.last_updated_on = user_json.get("last_updated_on")

        user_service: userService = userService()
        user_object = user_service.update(user_object)

        return self.send_response(user_object)

    def delete(self, request: HttpRequest):
        user_json = json.loads(request.POST.get("user_json"))

        user_object: UserModel = UserModel()
        user_object.created_on = user_json.get("created_on")
        user_object.mobile_number = user_json.get("mobile_number")
        user_object.designation = user_json.get("designation")
        user_object.parent_id = user_json.get("parent_id")
        user_object.email = user_json.get("email")
        user_object.photo = user_json.get("photo")
        user_object.is_delete = user_json.get("is_delete")
        user_object.status = user_json.get("status")
        user_object.is_primary = user_json.get("is_primary")
        user_object.user_id = user_json.get("user_id")
        user_object.landline_number = user_json.get("landline_number")
        user_object.user_name = user_json.get("user_name")
        user_object.last_updated_by = user_json.get("last_updated_by")
        user_object.user_password = user_json.get("user_password")
        user_object.created_by = user_json.get("created_by")
        user_object.last_updated_on = user_json.get("last_updated_on")

        user_service: userService = userService()
        user_object = user_service.delete(user_object)

        return self.send_response(user_object)

    def get(self, request: HttpRequest):
        params = [
            {"id": RequestConfig(from_session=False, nullable=False, datatype=DataTypes.INT)}
        ]
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        user_service: userService = userService()
        data = user_service.get(params)
        return self.send_response(data)

    def get_list(self, request: HttpRequest):
        params = [
            {"ids": RequestConfig(from_session=False, nullable=False, datatype=DataTypes.STRING, default='')}
        ]
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        user_service: userService = userService()
        data = user_service.get_list(params)
        return self.send_response(data)

    def get_object(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        user_service: userService = userService()
        data = user_service.get_object(params)
        return self.send_response(data)

    def get_list_object(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        user_service: userService = userService()
        data = user_service.get_list_object(params)
        return self.send_response(data)

    def get_list_object_page(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        user_service: userService = userService()
        data = user_service.get_list_object_paginated(params)
        return self.send_response(data)
