"""myblog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin

from django.urls import path,re_path,include

from django.conf import settings      # media
from django.views.static import serve # media

from app01 import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',views.index),      #主页
    #media配置
    re_path(r'media/(?P<path>.*)$',serve,{'document_root': settings.MEDIA_ROOT}),
    path('news/',views.news),      #新闻
    path('login/',views.login),    #登录视图
    path('login/random_code/',views.get_random_code), # 生成验证码视图
    path('sign/',views.sign),   #注册视图
    path('logout/',views.logout),  # 注销登录视图
    path('backend/',views.backend),  # 后台视图
    path('backend/add_article/',views.add_article),   # 后台添加文章
    path('backend/edit_avatar/',views.edit_avatar),
    path('backend/reset_password/',views.reset_password),
    re_path(r'^article/(?P<nid>\d+)/',views.article),  #文章详情页

    re_path(r'^api/',include('api.urls')),   # 路由分发，将所有api开头的请求分发到api这个urls.py中
]
