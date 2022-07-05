from django.shortcuts import render,HttpResponse,redirect

# Create your views here.
from django.http import JsonResponse
import json
from app01.utils.random_code import random_code  # 引入生成验证码模块

from django import forms    # 引入表单用于登陆验证

# from django.core.exceptions import NON_FIELD_ERRORS, ValidationError  # 用来抛出指定异常。

from django.contrib import auth   #引入auth模块

from app01.models import UserInfo  # 引入userinfo用于验证
from app01.models import Articles

def index(request):
    # img_list = [
    #     "http://192.168.42.13:8000/media/site_bg/20.jpg",
    #     "http://192.168.42.13:8000/media/site_bg/21.jpg",
    #     "http://192.168.42.13:8000/media/site_bg/22.jpg",
    # ]
    # return render(request,'index.html',{'img_list':img_list})
    return render(request, 'index.html',{'request':request})

def article(request,nid):
    article_query = Articles.objects.filter(nid=nid)

    if not article_query:
        return redirect('/')
    article = article_query.first()
    print(article.content)  #测试是否能获得文章描述
    return render(request,'article.html',locals())

def news(request):
    return render(request,'news.html')

##  原有登录注册字段验证位置。



# 登录视图
def login(request):

    return render(request,'login.html')

# 获取随机验证码
def get_random_code(request):
    # fp = open(r'/opt/project2/app01/utils/new_img.png','rb')  # 以文件的形式传给前端
    data,valid_code = random_code()   #这里调用函数，使用生成验证码默认参数,获取到图片和验证码数据
    request.session['valid_code'] = valid_code  #存入session中。
    # 引入httpresponse将图片返回前端。
    return HttpResponse(data)

def sign(request):

    return render(request,'sign.html')

def logout(request):
    auth.logout(request)   # 使用auth登出，此时后台
    return redirect('/')

def backend(request):
    return render(request,'backend/backend.html')