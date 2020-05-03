"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.doctors import doctorsModel
from APPOINTMENT_APP.repository.base_repository import BaseRepository
from APPOINTMENT_APP.utils.constants.constants import AppConstants
from APPOINTMENT_APP.utils.helpers.general_helper import IntHelper, StringHelper, FloatHelper
from APPOINTMENT_APP.utils.helpers.request_helper import ParamsObject


class doctorsRepo(BaseRepository):

    def __init__(self, ext_params={}):
        BaseRepository.__init__(self, ext_params)

    def pre_add(self, object: doctorsModel):
        self.sp_name = "sdoctorsAdd"
        list_params = [object.name, object.mobile_number, object.password,
                       object.specalisation_id, object.clinic_name,
                       object.qualification]
        self.params_list = list_params

    def post_add(self, object, returned_dict):
        doctors_model: doctorsModel = object
        doctors_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return doctors_model

    def pre_update(self, object: doctorsModel):
        self.sp_name = "sdoctorsUpdate"
        list_params = [object.id, object.name, object.qualification, object.rating, object.specalisation_id,
                       object.clinic_name]
        self.params_list = list_params

    def post_update(self, object, returned_dict):
        doctors_model: doctorsModel = object
        doctors_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return doctors_model

    def pre_delete(self, object: doctorsModel):
        self.sp_name = "sdoctorsDelete"
        list_params = [object.id, object.name, object.qualification, object.rating, object.specalisation_id,
                       object.clinic_name]
        self.params_list = list_params

    def post_delete(self, object, returned_dict):
        doctors_model: doctorsModel = object
        doctors_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return doctors_model

    def pre_get(self, params):
        self.sp_name = "sdoctorsGet"
        self.params_list = params.get_params_list()

    def post_get(self, cursor_object):
        if len(cursor_object.get_data()) > 0:
            doctors_model: doctorsModel = doctorsModel()
            for each_tuple in cursor_object.get_data():
                doctors_model.id = each_tuple[0]
                doctors_model.name = each_tuple[1]
                doctors_model.qualification = each_tuple[2]
                doctors_model.rating = each_tuple[3]
                doctors_model.specalisation_id = each_tuple[4]
                doctors_model.clinic_name = each_tuple[5]

            return doctors_model
        else:
            return None

    def pre_get_list(self, params):
        self.sp_name = "sdoctorsGetList"
        self.params_list = params.get_params_list()

    def post_get_list(self, cursor_object):
        list_data = []
        if len(cursor_object.get_data()) > 0:
            for each_tuple in cursor_object.get_data():
                doctors_model: doctorsModel = doctorsModel()
                doctors_model.id = each_tuple[0]
                doctors_model.name = each_tuple[1]
                doctors_model.qualification = each_tuple[2]
                doctors_model.rating = each_tuple[3]
                doctors_model.specalisation_id = each_tuple[4]
                doctors_model.clinic_name = each_tuple[5]

                list_data.append(doctors_model)

            return list_data
        else:
            return None

    def pre_get_object(self, params):
        self.sp_name = "sdoctorsObjectGet"
        self.params_list = params.get_params_list()

    def post_get_object(self, cursor_object):
        return self.post_get(cursor_object)

    def pre_get_list_object(self, params: ParamsObject):
        self.sp_name = "sdoctorsObjectGetList"
        self.params_list = params.get_params_list()

    def post_get_list_object(self, cursor_object):
        return self.post_get_list(cursor_object)

    def pre_get_data_list_object_paginated(self, params):
        self.sp_name = "sdoctorsObjectGetListPage"
        self.params_list = params.get_params_list()

    def post_get_data_list_object_paginated(self, list_cursor_object):
        if len(list_cursor_object) > 0:
            object_list = self.post_get_list(list_cursor_object[1])
            return self.build_paginated_result(list_cursor_object[0], object_list)
        else:
            return None
