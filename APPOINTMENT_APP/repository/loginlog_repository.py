"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.loginlog import LoginLogModel
from APPOINTMENT_APP.repository.base_repository import BaseRepository
from APPOINTMENT_APP.utils.constants.constants import AppConstants
from APPOINTMENT_APP.utils.helpers.general_helper import IntHelper, StringHelper, FloatHelper
from APPOINTMENT_APP.utils.helpers.request_helper import ParamsObject


class loginlogRepo(BaseRepository):

    def __init__(self, ext_params={}):
        BaseRepository.__init__(self, ext_params)

    def pre_add(self, object: LoginLogModel):
        self.sp_name = "sloginlogAdd"
        list_params = [
            object.user_id,
            object.user_agent,
            object.device_id,
            object.device_type,
            object.other_detail,
        ]
        self.params_list = list_params

    def post_add(self, object, returned_dict):
        loginlog_model: LoginLogModel = object
        loginlog_model._id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return loginlog_model

    def pre_update(self, object: LoginLogModel):
        self.sp_name = "sloginlogUpdate"
        list_params = [object.device_id, object.device_type, object.logged_in_time, object.other_detail,
                       object.user_agent, object.user_id, object._id]
        self.params_list = list_params

    def post_update(self, object, returned_dict):
        loginlog_model: LoginLogModel = object
        loginlog_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return loginlog_model

    def pre_delete(self, object: LoginLogModel):
        self.sp_name = "sloginlogDelete"
        list_params = [object.device_id, object.device_type, object.logged_in_time, object.other_detail,
                       object.user_agent, object.user_id, object._id]
        self.params_list = list_params

    def post_delete(self, object, returned_dict):
        loginlog_model: LoginLogModel = object
        loginlog_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return loginlog_model

    def pre_get(self, params):
        self.sp_name = "sloginlogGet"
        self.params_list = params.get_params_list()

    def post_get(self, cursor_object):
        if len(cursor_object.get_data()) > 0:
            loginlog_model: LoginLogModel = LoginLogModel()
            for each_tuple in cursor_object.get_data():
                loginlog_model.device_id = each_tuple[0]
                loginlog_model.device_type = each_tuple[1]
                loginlog_model.logged_in_time = each_tuple[2]
                loginlog_model.other_detail = each_tuple[3]
                loginlog_model.user_agent = each_tuple[4]
                loginlog_model.user_id = each_tuple[5]
                loginlog_model._id = each_tuple[6]

            return loginlog_model
        else:
            return None

    def pre_get_list(self, params):
        self.sp_name = "sloginlogGetList"
        self.params_list = params.get_params_list()

    def post_get_list(self, cursor_object):
        list_data = []
        if len(cursor_object.get_data()) > 0:
            for each_tuple in cursor_object.get_data():
                loginlog_model: LoginLogModel = LoginLogModel()
                loginlog_model.device_id = each_tuple[0]
                loginlog_model.device_type = each_tuple[1]
                loginlog_model.logged_in_time = each_tuple[2]
                loginlog_model.other_detail = each_tuple[3]
                loginlog_model.user_agent = each_tuple[4]
                loginlog_model.user_id = each_tuple[5]
                loginlog_model._id = each_tuple[6]

                list_data.append(loginlog_model)

            return list_data
        else:
            return None

    def pre_get_object(self, params):
        self.sp_name = "sloginlogObjectGet"
        self.params_list = params.get_params_list()

    def post_get_object(self, cursor_object):
        return self.post_get(cursor_object)

    def pre_get_list_object(self, params: ParamsObject):
        self.sp_name = "sloginlogObjectGetList"
        self.params_list = params.get_params_list()

    def post_get_list_object(self, cursor_object):
        return self.post_get_list(cursor_object)

    def pre_get_data_list_object_paginated(self, params):
        self.sp_name = "sloginlogObjectGetListPage"
        self.params_list = params.get_params_list()

    def post_get_data_list_object_paginated(self, list_cursor_object):
        if len(list_cursor_object) > 0:
            object_list = self.post_get_list(list_cursor_object[1])
            return self.build_paginated_result(list_cursor_object[0], object_list)
        else:
            return None
