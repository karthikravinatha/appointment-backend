"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.transaction_log import TransactionLogModel
from APPOINTMENT_APP.repository.base_repository import BaseRepository
from APPOINTMENT_APP.utils.constants.constants import AppConstants
from APPOINTMENT_APP.utils.helpers.general_helper import IntHelper, StringHelper, FloatHelper
from APPOINTMENT_APP.utils.helpers.request_helper import ParamsObject


class TransactionLogRepo(BaseRepository):

    def __init__(self, ext_params={}):
        BaseRepository.__init__(self, ext_params)

    def pre_add(self, object: TransactionLogModel):
        self.sp_name = "sTransactionLogAdd"
        list_params = [
            object.user_id,
            object.transaction_id,
            object.transaction_type,
            object.transaction_action,
            object.data
        ]
        self.params_list = list_params

    def post_add(self, object, returned_dict):
        transaction_log_model: TransactionLogModel = object
        transaction_log_model._id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return transaction_log_model

    def pre_update(self, object: TransactionLogModel):
        self.sp_name = "sTransactionLogUpdate"
        list_params = [object._id, object.log_date, object.user_id, object.transaction_id, object.transaction_type,
                       object.transaction_action, object.data]
        self.params_list = list_params

    def post_update(self, object, returned_dict):
        transaction_log_model: TransactionLogModel = object
        transaction_log_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return transaction_log_model

    def pre_delete(self, object: TransactionLogModel):
        self.sp_name = "sTransactionLogDelete"
        list_params = [object._id, object.log_date, object.user_id, object.transaction_id, object.transaction_type,
                       object.transaction_action, object.data]
        self.params_list = list_params

    def post_delete(self, object, returned_dict):
        transaction_log_model: TransactionLogModel = object
        transaction_log_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return transaction_log_model

    def pre_get(self, params):
        self.sp_name = "sTransactionLogGet"
        self.params_list = params.get_params_list()

    def post_get(self, cursor_object):
        if len(cursor_object.get_data()) > 0:
            transaction_log_model: TransactionLogModel = TransactionLogModel()
            for each_tuple in cursor_object.get_data():
                transaction_log_model._id = each_tuple[0]
                transaction_log_model.log_date = each_tuple[1]
                transaction_log_model.user_id = each_tuple[2]
                transaction_log_model.transaction_id = each_tuple[3]
                transaction_log_model.transaction_type = each_tuple[4]
                transaction_log_model.transaction_action = each_tuple[5]
                transaction_log_model.data = each_tuple[6]

            return transaction_log_model
        else:
            return None

    def pre_get_list(self, params):
        self.sp_name = "sTransactionLogGetList"
        self.params_list = params.get_params_list()

    def post_get_list(self, cursor_object):
        list_data = []
        if len(cursor_object.get_data()) > 0:
            for each_tuple in cursor_object.get_data():
                transaction_log_model: TransactionLogModel = TransactionLogModel()
                transaction_log_model._id = each_tuple[0]
                transaction_log_model.log_date = each_tuple[1]
                transaction_log_model.user_id = each_tuple[2]
                transaction_log_model.transaction_id = each_tuple[3]
                transaction_log_model.transaction_type = each_tuple[4]
                transaction_log_model.transaction_action = each_tuple[5]
                transaction_log_model.data = each_tuple[6]

                list_data.append(transaction_log_model)

            return list_data
        else:
            return None

    def pre_get_object(self, params):
        self.sp_name = "sTransactionLogObjectGet"
        self.params_list = params.get_params_list()

    def post_get_object(self, cursor_object):
        return self.post_get(cursor_object)

    def pre_get_list_object(self, params: ParamsObject):
        self.sp_name = "sTransactionLogObjectGetList"
        self.params_list = params.get_params_list()

    def post_get_list_object(self, cursor_object):
        return self.post_get_list(cursor_object)

    def pre_get_data_list_object_paginated(self, params):
        self.sp_name = "sTransactionLogObjectGetListPage"
        self.params_list = params.get_params_list()

    def post_get_data_list_object_paginated(self, list_cursor_object):
        if len(list_cursor_object) > 0:
            object_list = self.post_get_list(list_cursor_object[1])
            return self.build_paginated_result(list_cursor_object[0], object_list)
        else:
            return None
