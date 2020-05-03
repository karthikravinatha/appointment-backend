"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
import json
from django.http import HttpRequest
from KAROAPP.api.base_controller import BaseController
from KAROAPP.models.user_role import UserRoleModel
from KAROAPP.services.user_role_service import UserRoleService
from KAROAPP.utils.constants.constants import DataTypes, HttpMethodType, AppConstants
from KAROAPP.utils.helpers.general_helper import IntHelper, FloatHelper
from KAROAPP.utils.helpers.request_helper import RequestConfig, ParamsObject


class UserRole(BaseController):

    def __init__(self, request):
        BaseController.__init__(self, request)

    def add(self, request: HttpRequest):
        user_role_json = json.loads(request.POST.get("user_role_json"))
        ext_params =self.get_entity_user_ext_params()
        for i in range(len(user_role_json)):
            user_role_object: UserRoleModel = UserRoleModel()
            user_role_object.user_id = user_role_json[i].get("user_id")
            user_role_object.role_id = user_role_json[i].get("role_id")
            type = user_role_json[i].get("type")

            user_role_service: UserRoleService = UserRoleService(ext_params)
            if type == 'ADD':
                user_role_object = user_role_service.add(user_role_object)
            else:
                user_role_object = user_role_service.delete(user_role_object)

        self.add_log(ext_params,ext_params.get('user_id'),user_role_object.user_id,user_role_object.OBJECT_TYPE,
                     'ADD',user_role_object)
        return self.send_response(user_role_object)

    def update(self, request: HttpRequest):
        user_role_json = json.loads(request.POST.get("user_role_json"))
        ext_params = self.get_entity_user_ext_params()

        user_role_object: UserRoleModel = UserRoleModel()
        user_role_object.user_id = user_role_json.get("user_id")
        user_role_object.role_id = user_role_json.get("role_id")

        user_role_service: UserRoleService = UserRoleService()
        user_role_object = user_role_service.update(user_role_object)

        self.add_log(ext_params, ext_params.get('user_id'), user_role_object.user_id, user_role_object.OBJECT_TYPE,
                     'UPDATE', user_role_object)
        return self.send_response(user_role_object)

    def delete(self, request: HttpRequest):
        user_role_json = json.loads(request.POST.get("user_role_json"))
        ext_params = self.get_entity_user_ext_params()

        user_role_object: UserRoleModel = UserRoleModel()
        user_role_object.user_id = user_role_json.get("user_role_id")
        user_role_object.role_id = user_role_json.get("role_id")

        user_role_service: UserRoleService = UserRoleService()
        user_role_object = user_role_service.delete(user_role_object)

        self.add_log(ext_params, ext_params.get('user_id'), user_role_object.user_id, user_role_object.OBJECT_TYPE,
                     'DELETE', user_role_object)
        return self.send_response(user_role_object)

    def get(self, request: HttpRequest):
        params = [
            {"id": RequestConfig(from_session=False, nullable=False, datatype=DataTypes.INT)}
        ]
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        user_role_service: UserRoleService = UserRoleService()
        data = user_role_service.get(params)
        return self.send_response(data)

    def get_list(self, request: HttpRequest):
        params = [
            {"ids": RequestConfig(from_session=False, nullable=False, datatype=DataTypes.STRING, default='')}
        ]
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        user_role_service: UserRoleService = UserRoleService()
        data = user_role_service.get_list(params)
        return self.send_response(data)

    def get_object(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        user_role_service: UserRoleService = UserRoleService()
        data = user_role_service.get_object(params)
        return self.send_response(data)

    def get_list_object(self, request: HttpRequest):
        params = [
            {"entity_id": RequestConfig(from_session=True, nullable=False, datatype= DataTypes.INT, default=None)},
            {"user_id": RequestConfig(from_session=True, nullable=False,datatype=DataTypes.INT, default=None)},
            {"role_user_id": RequestConfig(from_session=False,nullable=False,datatype=DataTypes.INT, default=None)},
            {"role_id": RequestConfig(from_session=False,nullable=False,datatype=DataTypes.INT,default=None)}
        ]
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        user_role_service: UserRoleService = UserRoleService()
        data = user_role_service.get_list_object(params)
        return self.send_response(data)

    def get_list_object_page(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        user_role_service: UserRoleService = UserRoleService()
        data = user_role_service.get_list_object_paginated(params)
        return self.send_response(data)

    def upload(self, request: HttpRequest):
        user_role_service: UserRoleService = UserRoleService()
        uploaded_files = user_role_service.upload(request)
        return self.send_response_raw_json(uploaded_files)
