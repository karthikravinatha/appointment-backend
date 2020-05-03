"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.base_model import BaseModel
from APPOINTMENT_APP.utils.helpers.general_helper import Validation


class doctorsModel(BaseModel):
    def __init__(self, id=None,name=None,mobile_number=None,password=None,qualification=None,rating=None,specalisation_id=None,clinic_name=None):
        self.id = id
        self.name = name
        self.mobile_number = mobile_number
        self.password = password
        self.qualification = qualification
        self.rating = rating
        self.specalisation_id = specalisation_id
        self.clinic_name = clinic_name


    def get_id(self):
        return None

    def is_valid(self, type, event_type=None):
        return Validation()
