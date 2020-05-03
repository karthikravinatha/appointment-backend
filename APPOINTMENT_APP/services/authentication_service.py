"""
Created By : Nikesh
Created On : 
Reviewed By :
Reviewed On :
Version :
"""
import threading

from django.http import HttpRequest

from APPOINTMENT_APP.models.loginlog import LoginLogModel
from APPOINTMENT_APP.services.base_service import BaseService
from APPOINTMENT_APP.services.loginlog_service import LoginLogService
# from APPOINTMENT_APP.services.user_role_service import UserRoleService
from APPOINTMENT_APP.utils.constants.constants import ErrorCodes, AppConstants
from APPOINTMENT_APP.utils.exception_handling.exception import PermissionDeniedException
from APPOINTMENT_APP.utils.helpers.request_helper import ParamsObject
from APPOINTMENT_APP.utils.helpers.session_helper import JWTManager
from datetime import datetime, timezone
from datetime import timedelta


class AuthenticationService(BaseService):

    def __init__(self, ext_params={}, is_transaction_owner=True, event_type=None):
        BaseService.__init__(self, ext_params, is_transaction_owner, event_type)
        self.expire_hours = 4

    def __add_login_log(self, request, user_id, other_detail):
        login_log_model: LoginLogModel = LoginLogModel()
        login_log_model.user_id = user_id
        login_log_model.other_detail = other_detail
        login_log_model.user_agent = request.META.get("HTTP_USER_AGENT", None)
        LoginLogService(self.ext_params).add(login_log_model)

        return True

    def authenticate(self, params: ParamsObject, request: HttpRequest):

        data = self.get_direct("sAuthenticateUser", params, False, "")
        if data is not None:
            if type(data) is list:
                if len(data) < 1:
                    raise PermissionDeniedException(ErrorCodes.PERMISSION_DENIED, 'Permission Denied',
                                                    None)
            elif type(data) is dict:
                if len(data.keys()) < 1:
                    raise PermissionDeniedException(ErrorCodes.PERMISSION_DENIED, 'Permission Denied',
                                                    None)

            cur = datetime.now(tz=timezone.utc).strftime(AppConstants.TOKEN_EXPIRY_DATETIME_FORMAT)
            expire = datetime.strptime(cur, AppConstants.TOKEN_EXPIRY_DATETIME_FORMAT) + timedelta(
                hours=self.expire_hours)
            # expire = datetime.strptime(cur, AppConstants.TOKEN_EXPIRY_DATETIME_FORMAT) + timedelta(
            #     seconds=60)

            data[0]["expires_on"] = str(expire)

            user_roles = 1

            data[0]['cs'] = JWTManager.get_checksum(data[0])

            token = JWTManager.generate_token(data[0])

            user_access = 1

            token_dict = {"token": str(token), "data": data[0]}

            t1 = threading.Thread(target=self.__add_login_log, args=(request, data[0]['user_id'], data[0]))
            t1.start()

            return token_dict
        else:
            raise PermissionDeniedException(ErrorCodes.PERMISSION_DENIED, 'Permission Denied', None)

    # def get_user_role(self, user_id):
    #     user_role_service: UserRoleService = UserRoleService()
    #     params: ParamsObject = ParamsObject()
    #     params.set_params_list([str(user_id)])
    #     user_roles = user_role_service.get_list(params)
    #
    #     user_roles_list = []
    #     if user_roles is not None:
    #         for user_role in user_roles:
    #             role_dict = {'role_id': user_role.role_id}
    #             user_roles_list.append(role_dict)
    #
    #     return user_roles_list
    #
    # def get_user_access(self, user_id):
    #     params: ParamsObject = ParamsObject()
    #     params.set_params_list([user_id])
    #     params.set_params_dict({"user_id": user_id})
    #     user_access_data = self.get_direct("sUserAccessForUserGet", params, False, "")
    #
    #     field_user_access_data = self.get_user_field_access(user_id)
    #
    #     # Process object and field data and create and object and return
    #
    #     if user_access_data is not None:
    #         if len(user_access_data) > 0:
    #             for access_object in user_access_data:
    #                 access_object["field_access"] = []
    #                 if field_user_access_data is not None:
    #                     if len(field_user_access_data) > 0:
    #                         for field_object in field_user_access_data:
    #                             if int(field_object["object_id"]) == int(access_object["object_id"]):
    #                                 access_object["field_access"].append(field_object)
    #
    #     return user_access_data
    #
    # def get_user_field_access(self, user_id):
    #     params: ParamsObject = ParamsObject()
    #     params.set_params_list([user_id])
    #     params.set_params_dict({"user_id": user_id})
    #     user_field_access_data = self.get_direct("sFieldAccessForUserGet", params, False, "")
    #     return user_field_access_data
