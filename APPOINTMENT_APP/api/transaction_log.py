"""
Created By : Nikesh
Created On : 
Reviewed By :
Reviewed On :
Version :
"""
import json

from django.core.serializers.json import DjangoJSONEncoder

from APPOINTMENT_APP.models.transaction_log import TransactionLogModel
from APPOINTMENT_APP.services.transacation_log_service import TransactionLogService


def convert_to_dict(obj):
    return obj.__dict__


class TransactionLog:

    def __init__(self, ext_params={}):
        self.ext_params = ext_params

    def add(self, user_id, transaction_id, transaction_type, transaction_action, data_object):
        try:
            json_object = json.dumps(data_object, default=convert_to_dict, indent=2, cls=DjangoJSONEncoder)
            transaction_log_model: TransactionLogModel = TransactionLogModel()
            transaction_log_model.user_id = user_id
            transaction_log_model.transaction_id = transaction_id
            transaction_log_model.transaction_type = transaction_type
            transaction_log_model.transaction_action = transaction_action
            transaction_log_model.data = json_object

            transaction_log_service: TransactionLogService = TransactionLogService(self.ext_params)
            transaction_log_service.add(transaction_log_model)
            return True
        except Exception as ex:
            return True
