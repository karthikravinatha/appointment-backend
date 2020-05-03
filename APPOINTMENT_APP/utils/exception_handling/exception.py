"""
Created By : Nikesh
Created On : sss
Reviewed By :
Reviewed On :
Version :
"""


class AppointmentException(Exception):

    def __init__(self, error_code, error_message, error_object):
        self.error_code = error_code
        self.error_message = error_message
        self.error_object = error_object


class GeneralException(AppointmentException):

    def __init__(self, error_code, error_message, error_object):
        AppointmentException.__init__(self, error_code, error_message, error_object)


class DatabaseException(AppointmentException):

    def __init__(self, error_code, error_message, error_object):
        AppointmentException.__init__(self, error_code, error_message, error_object)


class PermissionDeniedException(AppointmentException):

    def __init__(self, error_code, error_message, error_object):
        AppointmentException.__init__(self, error_code, error_message, error_object)


class CacheException(AppointmentException):

    def __init__(self, error_code, error_message, error_object):
        AppointmentException.__init__(self, error_code, error_message, error_object)


class FileUploadException(AppointmentException):

    def __init__(self, error_code, error_message, error_object):
        AppointmentException.__init__(self, error_code, error_message, error_object)


class ValidationException(AppointmentException):

    def __init__(self, error_code, error_message, error_object):
        AppointmentException.__init__(self, error_code, error_message, error_object)
