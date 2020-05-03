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
from APPOINTMENT_APP.models.doctors import doctorsModel
from APPOINTMENT_APP.services.doctors_service import doctorsService
from APPOINTMENT_APP.utils.constants.constants import DataTypes, HttpMethodType, AppConstants
from APPOINTMENT_APP.utils.helpers.general_helper import IntHelper, FloatHelper
from APPOINTMENT_APP.utils.helpers.request_helper import RequestConfig, ParamsObject


class doctors(BaseController):

    def __init__(self, request):
        BaseController.__init__(self, request)

    def add(self, request: HttpRequest):
        doctors_json = json.loads(request.POST.get("doctors_json"))
        ext_params = self.get_entity_user_ext_params()

        doctors_object: doctorsModel = doctorsModel()
        doctors_object.name = doctors_json.get("name")
        doctors_object.mobile_number = doctors_json.get("mobile_no")
        doctors_object.password = doctors_json.get("password")
        doctors_object.qualification = doctors_json.get("qualification")
        doctors_object.specalisation_id = doctors_json.get("specalisation_id")
        doctors_object.clinic_name = doctors_json.get("clinic_name")

        doctors_service: doctorsService = doctorsService(ext_params)
        doctors_object = doctors_service.add(doctors_object)

        return self.send_response(doctors_object)

    def update(self, request: HttpRequest):
        doctors_json = json.loads(request.POST.get("doctors_json"))

        doctors_object: doctorsModel = doctorsModel()
        doctors_object.id = doctors_json.get("id")
        doctors_object.name = doctors_json.get("name")
        doctors_object.qualification = doctors_json.get("qualification")
        doctors_object.rating = doctors_json.get("rating")
        doctors_object.specalisation_id = doctors_json.get("specalisation_id")
        doctors_object.clinic_name = doctors_json.get("clinic_name")

        doctors_service: doctorsService = doctorsService()
        doctors_object = doctors_service.update(doctors_object)

        return self.send_response(doctors_object)

    def delete(self, request: HttpRequest):
        doctors_json = json.loads(request.POST.get("doctors_json"))

        doctors_object: doctorsModel = doctorsModel()
        doctors_object.id = doctors_json.get("id")
        doctors_object.name = doctors_json.get("name")
        doctors_object.qualification = doctors_json.get("qualification")
        doctors_object.rating = doctors_json.get("rating")
        doctors_object.specalisation_id = doctors_json.get("specalisation_id")
        doctors_object.clinic_name = doctors_json.get("clinic_name")

        doctors_service: doctorsService = doctorsService()
        doctors_object = doctors_service.delete(doctors_object)

        return self.send_response(doctors_object)

    def get(self, request: HttpRequest):
        params = [
            {"id": RequestConfig(from_session=False, nullable=False, datatype=DataTypes.INT)}
        ]
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        doctors_service: doctorsService = doctorsService()
        data = doctors_service.get(params)
        return self.send_response(data)

    def get_list(self, request: HttpRequest):
        params = [
            {"ids": RequestConfig(from_session=False, nullable=False, datatype=DataTypes.STRING, default='')}
        ]
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        doctors_service: doctorsService = doctorsService()
        data = doctors_service.get_list(params)
        return self.send_response(data)

    def get_object(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        doctors_service: doctorsService = doctorsService()
        data = doctors_service.get_object(params)
        return self.send_response(data)

    def get_list_object(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        doctors_service: doctorsService = doctorsService()
        data = doctors_service.get_list_object(params)
        return self.send_response(data)

    def get_list_object_page(self, request: HttpRequest):
        params = []
        params: ParamsObject = self.convert_params(request, HttpMethodType.get, params)
        doctors_service: doctorsService = doctorsService()
        data = doctors_service.get_list_object_paginated(params)
        return self.send_response(data)
