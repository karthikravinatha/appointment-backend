"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.hierarchy import HierarchyModel
from APPOINTMENT_APP.repository.base_repository import BaseRepository
from APPOINTMENT_APP.utils.constants.constants import AppConstants
from APPOINTMENT_APP.utils.helpers.general_helper import IntHelper, StringHelper, FloatHelper
from APPOINTMENT_APP.utils.helpers.request_helper import ParamsObject


class hierarchyRepo(BaseRepository):

    def __init__(self, ext_params={}, event_type=None):
        BaseRepository.__init__(self, ext_params, event_type)

    def pre_add(self, object: HierarchyModel):
        self.sp_name = "shierarchyAdd"
        list_params = [self.ext_params.get("entity_id", None),
                       self.ext_params.get("user_id", None),
                       self.ext_params.get("node_id", None),
                       self.ext_params.get("node_type", None),
                       self.ext_params.get("parent_id", None),
                       self.ext_params.get("parent_type", None)
                       ]
        self.params_list = list_params

    def post_add(self, object, returned_dict):
        hierarchy_model: HierarchyModel = object
        hierarchy_model.user_or_entity_id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return hierarchy_model

    def pre_update(self, object: HierarchyModel):
        self.sp_name = "shierarchyUpdate"
        list_params = [object.left_node, object.right_node, object.type, object.user_or_entity_id, object._id]
        self.params_list = list_params

    def post_update(self, object, returned_dict):
        hierarchy_model: HierarchyModel = object
        hierarchy_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return hierarchy_model

    def pre_delete(self, object: HierarchyModel):
        self.sp_name = "shierarchyDelete"
        list_params = [object.left_node, object.right_node, object.type, object.user_or_entity_id, object._id]
        self.params_list = list_params

    def post_delete(self, object, returned_dict):
        hierarchy_model: HierarchyModel = object
        hierarchy_model.id = int(returned_dict.get(AppConstants.DB_TRANSACTION_ID_KEY))

        return hierarchy_model

    def pre_get(self, params):
        self.sp_name = "shierarchyGet"
        self.params_list = params.get_params_list()

    def post_get(self, cursor_object):
        if len(cursor_object.get_data()) > 0:
            hierarchy_model: HierarchyModel = HierarchyModel()
            for each_tuple in cursor_object.get_data():
                hierarchy_model.left_node = each_tuple[0]
                hierarchy_model.right_node = each_tuple[1]
                hierarchy_model.type = each_tuple[2]
                hierarchy_model.user_or_entity_id = each_tuple[3]
                hierarchy_model._id = each_tuple[4]

            return hierarchy_model
        else:
            return None

    def pre_get_list(self, params):
        self.sp_name = "shierarchyGetList"
        self.params_list = params.get_params_list()

    def post_get_list(self, cursor_object):
        list_data = []
        if len(cursor_object.get_data()) > 0:
            for each_tuple in cursor_object.get_data():
                hierarchy_model: HierarchyModel = HierarchyModel()
                hierarchy_model.left_node = each_tuple[0]
                hierarchy_model.right_node = each_tuple[1]
                hierarchy_model.type = each_tuple[2]
                hierarchy_model.user_or_entity_id = each_tuple[3]
                hierarchy_model._id = each_tuple[4]

                list_data.append(hierarchy_model)

            return list_data
        else:
            return None

    def pre_get_object(self, params):
        self.sp_name = "shierarchyObjectGet"
        self.params_list = params.get_params_list()

    def post_get_object(self, cursor_object):
        return self.post_get(cursor_object)

    def pre_get_list_object(self, params: ParamsObject):
        self.sp_name = "shierarchyObjectGetList"
        self.params_list = params.get_params_list()

    def post_get_list_object(self, cursor_object):
        return self.post_get_list(cursor_object)

    def pre_get_data_list_object_paginated(self, params):
        self.sp_name = "shierarchyObjectGetListPage"
        self.params_list = params.get_params_list()

    def post_get_data_list_object_paginated(self, list_cursor_object):
        if len(list_cursor_object) > 0:
            object_list = self.post_get_list(list_cursor_object[1])
            return self.build_paginated_result(list_cursor_object[0], object_list)
        else:
            return None
