from django.urls import path,re_path
from api.views import login

urlpatterns = [
    path('login/',login.LoginView.as_view()),
    path('sign/',login.LoginView.as_view()),

]