from django.urls import path, include, re_path

from APPOINTMENT_APP.urls.url_mapping import external_mapping

urlpatterns = [
    # path('user/', include('APPOINTMENT_APP.urls.user')),

    # path('update_creator/', include('APPOINTMENT_APP.urls.update_creator')),
    path('authentication/', include('APPOINTMENT_APP.urls.authentication')),
    path('user/', include('APPOINTMENT_APP.urls.user')),
    path('code-gen/', include('APPOINTMENT_APP.urls.code_gen')),
    path('sign-up/', include('APPOINTMENT_APP.urls.doctors')),

    # re_path(r'^masters/*', external_mapping.masters),
]
