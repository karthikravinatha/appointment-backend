"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.base_model import BaseModel
from APPOINTMENT_APP.utils.helpers.general_helper import Validation


class TransactionLogModel(BaseModel):
    def __init__(self, _id=None, log_date=None, user_id=None, transaction_id=None, transaction_type=None,
                 transaction_action=None, data=None):
        self._id = _id
        self.log_date = log_date
        self.user_id = user_id
        self.transaction_id = transaction_id
        self.transaction_type = transaction_type
        self.transaction_action = transaction_action
        self.data = data

    def get_id(self):
        return self._id

    def is_valid(self, type, event_type=None):
        return Validation()
