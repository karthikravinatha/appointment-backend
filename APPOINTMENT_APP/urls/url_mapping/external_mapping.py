"""
Created By : Nikesh
Created On : 
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.api.external import External
from APPOINTMENT_APP.utils.exception_handling.exception import PermissionDeniedException, AppointmentException
from . import base_url_mapping


def masters(request):
    try:
        return External(request).masters(request)
    except PermissionDeniedException as ex:
        return base_url_mapping.send_response(None, ex.error_message, 401, ex.error_code)
    except AppointmentException as ex:
        return base_url_mapping.send_response(None, ex.error_message, 500, ex.error_code)
    except Exception as ex:
        return base_url_mapping.send_response(None, str(ex), 500, "ERROR001")
