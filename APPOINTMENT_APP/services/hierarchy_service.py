"""
Created By : <Auto generated code>
Created On :
Reviewed By :
Reviewed On :
Version :
"""

from APPOINTMENT_APP.repository.hierarchy_repository import hierarchyRepo
from APPOINTMENT_APP.services.base_service import BaseService
from APPOINTMENT_APP.utils.exception_handling.exception import FileUploadException, AppointmentException
from APPOINTMENT_APP.utils.helpers.file_helper import FileHelper
from APPOINTMENT_APP.utils.helpers.request_helper import ParamsObject


class HierarchyService(BaseService):

    def __init__(self, ext_params={}, is_transaction_owner=True, event_type=None):
        BaseService.__init__(self, ext_params, is_transaction_owner, event_type)

    def pre_add(self, object):
        pass

    def add_data(self, object):
        hierarchy_repo: hierarchyRepo = hierarchyRepo()
        return hierarchy_repo.add_data(object)

    def post_add(self, object):
        return object

    def pre_update(self, object):
        pass

    def update_data(self, object):
        hierarchy_repo: hierarchyRepo = hierarchyRepo()
        return hierarchy_repo.update_data(object)

    def post_update(self, object):
        return object

    def pre_delete(self, object):
        pass

    def delete_data(self, object):
        hierarchy_repo: hierarchyRepo = hierarchyRepo()
        return hierarchy_repo.delete_data(object)

    def post_delete(self, object):
        return object

    def pre_get(self, params):
        pass

    def get_data(self, params):
        hierarchy_repo: hierarchyRepo = hierarchyRepo()
        return hierarchy_repo.get_data(params)

    def post_get(self, object):
        return object

    def pre_get_list(self, params):
        pass

    def get_data_list(self, params):
        hierarchy_repo: hierarchyRepo = hierarchyRepo()
        return hierarchy_repo.get_data_list(params)

    def post_get_list(self, object):
        return object

    def pre_get_object(self, params):
        pass

    def get_data_object(self, params):
        hierarchy_repo: hierarchyRepo = hierarchyRepo()
        return hierarchy_repo.get_data_object(params)

    def post_get_object(self, object):
        return object

    def pre_get_list_object(self, params):
        pass

    def get_data_list_object(self, params):
        hierarchy_repo: hierarchyRepo = hierarchyRepo()
        return hierarchy_repo.get_data_list_object(params)

    def post_get_list_object(self, object):
        return object

    def pre_get_list_object_paginated(self, params):
        pass

    def get_data_list_object_paginated(self, params):
        hierarchy_repo: hierarchyRepo = hierarchyRepo()
        return hierarchy_repo.get_data_list_object_paginated(params)

    def post_get_list_object_paginated(self, object):
        return object

    def get_data_list_object_any(self, sp_name, params: ParamsObject):
        hierarchy_repo: hierarchyRepo = hierarchyRepo()
        return hierarchy_repo.get_data_list_object_any(sp_name, params)

    def get_data_list_object_any_paginated(self, sp_name, params: ParamsObject):
        hierarchy_repo: hierarchyRepo = hierarchyRepo()
        return hierarchy_repo.get_data_list_object_any_paginated(sp_name, params)
