"""
Created By : Nikesh
Created On : 
Reviewed By :
Reviewed On :
Version :
"""
import json
import os
import traceback

from django.core.serializers.json import DjangoJSONEncoder
from django.http import HttpRequest, HttpResponse

from APPOINTMENT_APP.api.base_controller import BaseController
from APPOINTMENT_APP.services.authentication_service import AuthenticationService
from APPOINTMENT_APP.utils.constants.constants import DataTypes, HttpMethodType
from APPOINTMENT_APP.utils.helpers.request_helper import RequestConfig, ParamsObject, ResponseObject

from PIL import Image


def convert_to_dict(obj):
    return obj.__dict__


class Authentication(BaseController):

    def __init__(self, request):
        BaseController.__init__(self, request)

    def check_session(self, request):
        pass

    def authenticate(self, request: HttpRequest):
        params = [
            {"mobile_number": RequestConfig(from_session=True, nullable=False, datatype=DataTypes.INT, default=None)},
            {"password": RequestConfig(from_session=True, nullable=False, datatype=DataTypes.STRING, default=None)},
        ]

        params: ParamsObject = self.convert_params(request, HttpMethodType.post, params)

        authentication_service: AuthenticationService = AuthenticationService()

        data = authentication_service.authenticate(params, request)

        obj = ResponseObject("Success", data, 200, None)
        json_object = json.dumps(obj, default=convert_to_dict, indent=2, cls=DjangoJSONEncoder)
        resp = HttpResponse(json_object, content_type='application/json', status=200)
        resp['Authorization'] = 'Bearer ' + data['token']

        return resp

        # return self.send_response(data)

    def logout(self, request: HttpRequest):
        pass

    def test(self, request: HttpRequest):

        try:
            file_path = os.path.join("C:/", "Users", "Nikesh", "Desktop", "Img")

            im = Image.open(os.path.join(file_path, "1.jpg"))
            # im = Image.open(os.path.join("C:/", "Users", "Nikesh", "Desktop", "bike_insurance.pdf"))

            im.save(os.path.join(file_path, "2_70.jpg"), format=im.format, quality=70)
            im.save(os.path.join("C:/", "Users", "Nikesh", "Desktop", "Img", "2_50.jpg"), format=im.format, quality=50)
            im.save(os.path.join("C:/", "Users", "Nikesh", "Desktop", "Img", "2_30.jpg"), format=im.format, quality=30)
            im.save(os.path.join("C:/", "Users", "Nikesh", "Desktop", "Img", "2_20.jpg"), format=im.format, quality=20)

            return self.send_response(None)
        except OSError as err:
            tb = traceback.format_exc()
            print(tb)