"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.base_model import BaseModel
from APPOINTMENT_APP.utils.helpers.general_helper import Validation


class UserModel(BaseModel):
    def __init__(self, created_on=None,mobile_number=None,designation=None,parent_id=None,email=None,photo=None,is_delete=None,status=None,is_primary=None,user_id=None,landline_number=None,user_name=None,last_updated_by=None,user_password=None,created_by=None,last_updated_on=None):
        self.created_on = created_on
        self.mobile_number = mobile_number
        self.designation = designation
        self.parent_id = parent_id
        self.email = email
        self.photo = photo
        self.is_delete = is_delete
        self.status = status
        self.is_primary = is_primary
        self.user_id = user_id
        self.landline_number = landline_number
        self.user_name = user_name
        self.last_updated_by = last_updated_by
        self.user_password = user_password
        self.created_by = created_by
        self.last_updated_on = last_updated_on


    def get_id(self):
        return None

    def is_valid(self, type, event_type=None):
        return Validation()
