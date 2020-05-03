"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.base_model import BaseModel
from APPOINTMENT_APP.utils.helpers.general_helper import Validation


class HierarchyModel(BaseModel):
    def __init__(self, left_node=None,right_node=None,type=None,user_or_entity_id=None,_id=None):
        self.left_node = left_node
        self.right_node = right_node
        self.type = type
        self.user_or_entity_id = user_or_entity_id
        self._id = _id


    def get_id(self):
        return None

    def is_valid(self, type, event_type=None):
        return Validation()
