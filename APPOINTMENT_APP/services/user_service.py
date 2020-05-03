"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.models.hierarchy import HierarchyModel
from APPOINTMENT_APP.repository.user_repository import userRepo
from APPOINTMENT_APP.services.base_service import BaseService
from APPOINTMENT_APP.services.hierarchy_service import HierarchyService

from APPOINTMENT_APP.utils.exception_handling.exception import FileUploadException, AppointmentException
from APPOINTMENT_APP.utils.helpers.file_helper import FileHelper
from APPOINTMENT_APP.utils.helpers.request_helper import ParamsObject


class userService(BaseService):

    def __init__(self, ext_params={}, is_transaction_owner=True):
        BaseService.__init__(self, ext_params, is_transaction_owner)

    def pre_add(self, object):
        pass

    def add_data(self, object):
        user_repo: userRepo = userRepo(self.ext_params)
        return user_repo.add_data(object)

    def post_add(self, object):
        # Add Hierarchy
        _ext_params = {}
        if self.ext_params.get("is_primary", False) == True:
            _ext_params["entity_id"] = self.ext_params.get("entity_id", None)
            _ext_params["user_id"] = self.ext_params.get("user_id", None)
            _ext_params["node_id"] = object.get_id()
            _ext_params["node_type"] = 'USER'
            _ext_params["parent_id"] = self.ext_params.get("entity_id")
            _ext_params["parent_type_type"] = 'ENTITY'
        else:
            _ext_params["entity_id"] = self.ext_params.get("entity_id", None)
            _ext_params["user_id"] = self.ext_params.get("user_id", None)
            _ext_params["node_id"] = object.get_id()
            _ext_params["node_type"] = 'USER'
            _ext_params["parent_id"] = object.parent_id
            _ext_params["parent_type_type"] = 'USER'

        hierarchy_service: HierarchyService = HierarchyService(ext_params=_ext_params, is_transaction_owner=False)
        hierarchy_service.add(HierarchyModel())
        return object

    def pre_update(self, object):
        pass

    def update_data(self, object):
        user_repo: userRepo = userRepo()
        return user_repo.update_data(object)

    def post_update(self, object):
        return object

    def pre_delete(self, object):
        pass

    def delete_data(self, object):
        user_repo: userRepo = userRepo()
        return user_repo.delete_data(object)

    def post_delete(self, object):
        return object

    def pre_get(self, params):
        pass

    def get_data(self, params):
        user_repo: userRepo = userRepo()
        return user_repo.get_data(params)

    def post_get(self, object):
        return object

    def pre_get_list(self, params):
        pass

    def get_data_list(self, params):
        user_repo: userRepo = userRepo()
        return user_repo.get_data_list(params)

    def post_get_list(self, object):
        return object

    def pre_get_object(self, params):
        pass

    def get_data_object(self, params):
        user_repo: userRepo = userRepo()
        return user_repo.get_data_object(params)

    def post_get_object(self, object):
        return object

    def pre_get_list_object(self, params):
        pass

    def get_data_list_object(self, params):
        user_repo: userRepo = userRepo()
        return user_repo.get_data_list_object(params)

    def post_get_list_object(self, object):
        return object

    def pre_get_list_object_paginated(self, params):
        pass

    def get_data_list_object_paginated(self, params):
        user_repo: userRepo = userRepo()
        return user_repo.get_data_list_object_paginated(params)

    def post_get_list_object_paginated(self, object):
        return object

    def get_data_list_object_any(self, sp_name, params: ParamsObject):
        user_repo: userRepo = userRepo()
        return user_repo.get_data_list_object_any(sp_name, params)

    def get_data_list_object_any_paginated(self, sp_name, params: ParamsObject):
        user_repo: userRepo = userRepo()
        return user_repo.get_data_list_object_any_paginated(sp_name, params)
