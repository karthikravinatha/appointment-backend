"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.base_model import BaseModel
from APPOINTMENT_APP.utils.helpers.general_helper import Validation


class LoginLogModel(BaseModel):
    def __init__(self, device_id=None,device_type=None,logged_in_time=None,other_detail=None,user_agent=None,user_id=None,_id=None):

        self._id = _id
        self.user_id = user_id
        self.logged_in_time = logged_in_time
        self.user_agent = user_agent
        self.device_id = device_id
        self.device_type = device_type
        self.other_detail = other_detail





    def get_id(self):
        return None

    def is_valid(self, type, event_type=None):
        return Validation()
