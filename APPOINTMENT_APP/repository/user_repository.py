"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.user import UserModel
from APPOINTMENT_APP.repository.base_repository import BaseRepository
from APPOINTMENT_APP.utils.constants.constants import AppConstants
from APPOINTMENT_APP.utils.helpers.general_helper import IntHelper, StringHelper, FloatHelper
from APPOINTMENT_APP.utils.helpers.request_helper import ParamsObject


class userRepo(BaseRepository):

    def __init__(self, ext_params={}):
        BaseRepository.__init__(self, ext_params)

    def pre_add(self, object):
        self.sp_name = "suserAdd"
        user_object: UserModel = object
        list_params = []
        list_params.append(user_object.user_name)
        list_params.append(user_object.mobile_number)
        list_params.append(user_object.landline_number)
        list_params.append(user_object.email)
        list_params.append(user_object.user_password)
        list_params.append(user_object.photo)
        if user_object.is_primary is None:
            list_params.append(None)
        else:
            list_params.append(int(user_object.is_primary))
        list_params.append(user_object.parent_id)
        list_params.append(user_object.designation)

        self.params_list = list_params

    def post_add(self, object, returned_dict):
        user_model: UserModel = object
        user_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return user_model

    def pre_update(self, object: UserModel):
        self.sp_name = "suserUpdate"
        list_params = [object.created_on, object.mobile_number, object.designation, object.parent_id, object.email,
                       object.photo, object.is_delete, object.status, object.is_primary, object.user_id,
                       object.landline_number, object.user_name, object.last_updated_by, object.user_password,
                       object.created_by, object.last_updated_on]
        self.params_list = list_params

    def post_update(self, object, returned_dict):
        user_model: UserModel = object
        user_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return user_model

    def pre_delete(self, object: UserModel):
        self.sp_name = "suserDelete"
        list_params = [object.created_on, object.mobile_number, object.designation, object.parent_id, object.email,
                       object.photo, object.is_delete, object.status, object.is_primary, object.user_id,
                       object.landline_number, object.user_name, object.last_updated_by, object.user_password,
                       object.created_by, object.last_updated_on]
        self.params_list = list_params

    def post_delete(self, object, returned_dict):
        user_model: UserModel = object
        user_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return user_model

    def pre_get(self, params):
        self.sp_name = "suserGet"
        self.params_list = params.get_params_list()

    def post_get(self, cursor_object):
        if len(cursor_object.get_data()) > 0:
            user_model: UserModel = UserModel()
            for each_tuple in cursor_object.get_data():
                user_model.created_on = each_tuple[0]
                user_model.mobile_number = each_tuple[1]
                user_model.designation = each_tuple[2]
                user_model.parent_id = each_tuple[3]
                user_model.email = each_tuple[4]
                user_model.photo = each_tuple[5]
                user_model.is_delete = each_tuple[6]
                user_model.status = each_tuple[7]
                user_model.is_primary = each_tuple[8]
                user_model.user_id = each_tuple[9]
                user_model.landline_number = each_tuple[10]
                user_model.user_name = each_tuple[11]
                user_model.last_updated_by = each_tuple[12]
                user_model.user_password = each_tuple[13]
                user_model.created_by = each_tuple[14]
                user_model.last_updated_on = each_tuple[15]

            return user_model
        else:
            return None

    def pre_get_list(self, params):
        self.sp_name = "suserGetList"
        self.params_list = params.get_params_list()

    def post_get_list(self, cursor_object):
        list_data = []
        if len(cursor_object.get_data()) > 0:
            for each_tuple in cursor_object.get_data():
                user_model: UserModel = UserModel()
                user_model.created_on = each_tuple[0]
                user_model.mobile_number = each_tuple[1]
                user_model.designation = each_tuple[2]
                user_model.parent_id = each_tuple[3]
                user_model.email = each_tuple[4]
                user_model.photo = each_tuple[5]
                user_model.is_delete = each_tuple[6]
                user_model.status = each_tuple[7]
                user_model.is_primary = each_tuple[8]
                user_model.user_id = each_tuple[9]
                user_model.landline_number = each_tuple[10]
                user_model.user_name = each_tuple[11]
                user_model.last_updated_by = each_tuple[12]
                user_model.user_password = each_tuple[13]
                user_model.created_by = each_tuple[14]
                user_model.last_updated_on = each_tuple[15]

                list_data.append(user_model)

            return list_data
        else:
            return None

    def pre_get_object(self, params):
        self.sp_name = "suserObjectGet"
        self.params_list = params.get_params_list()

    def post_get_object(self, cursor_object):
        return self.post_get(cursor_object)

    def pre_get_list_object(self, params: ParamsObject):
        self.sp_name = "suserObjectGetList"
        self.params_list = params.get_params_list()

    def post_get_list_object(self, cursor_object):
        return self.post_get_list(cursor_object)

    def pre_get_data_list_object_paginated(self, params):
        self.sp_name = "suserObjectGetListPage"
        self.params_list = params.get_params_list()

    def post_get_data_list_object_paginated(self, list_cursor_object):
        if len(list_cursor_object) > 0:
            object_list = self.post_get_list(list_cursor_object[1])
            return self.build_paginated_result(list_cursor_object[0], object_list)
        else:
            return None
