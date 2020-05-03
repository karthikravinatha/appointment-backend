"""
Created By : Nikesh
Created On : 
Reviewed By :
Reviewed On :
Version :
"""
from APPOINTMENT_APP.api.code_gen import CodeGenerator
from APPOINTMENT_APP.urls.url_mapping import base_url_mapping
from APPOINTMENT_APP.utils.constants.constants import ErrorCodes
from APPOINTMENT_APP.utils.exception_handling.exception import PermissionDeniedException, AppointmentException


def generate_code(request):
    try:
        return CodeGenerator(request).generate_code(request)
    except PermissionDeniedException as ex:
        return base_url_mapping.send_response(ex.error_object, ex.error_message, 401, ex.error_code)
    except AppointmentException as ex:
        return base_url_mapping.send_response(ex.error_object, ex.error_message, 500, ex.error_code)
    except Exception as ex:
        return base_url_mapping.send_response(None, str(ex), 500, ErrorCodes.GENERAL_ERROR)
