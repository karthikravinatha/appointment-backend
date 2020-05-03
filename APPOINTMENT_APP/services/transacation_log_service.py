"""
Created By : Nikesh
Created On : 
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.repository.transaction_log_repository import TransactionLogRepo
from APPOINTMENT_APP.services.base_service import BaseService


class TransactionLogService(BaseService):

    def __init__(self, ext_params={}, is_transaction_owner=True):
        BaseService.__init__(self, ext_params, is_transaction_owner)

    def pre_add(self, object):
        pass

    def add_data(self, object):
        transaction_log_repo: TransactionLogRepo = TransactionLogRepo(ext_params=self.ext_params)
        return transaction_log_repo.add_data(object)

    def post_add(self, object):
        return object
