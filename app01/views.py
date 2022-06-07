from django.shortcuts import render,HttpResponse

# Create your views here.
from django.http import JsonResponse
import json
from app01.utils.random_code import random_code  # 引入生成验证码模块

from django import forms    #引入表单类用于登录验证。


def index(request):
    # img_list = [
    #     "http://192.168.42.13:8000/media/site_bg/20.jpg",
    #     "http://192.168.42.13:8000/media/site_bg/21.jpg",
    #     "http://192.168.42.13:8000/media/site_bg/22.jpg",
    # ]
    # return render(request,'index.html',{'img_list':img_list})
    return render(request, 'index.html' )

def news(request):
    return render(request,'news.html')

class LoginForm(forms.Form):
    name = forms.CharField(error_messages={'required':'请输入用户名'})  #将原来的‘这个字段是必需的改为对应的错误信息’
    pwd = forms.CharField(error_messages={'required':'请输入密码'})
    code = forms.CharField(error_messages={'required':'请输入验证码'})

def login(request):
    if request.method == 'POST':
        res = {
            'code':425,     # 0 成功，非0失败
            'msg':"登陆成功",
            'self':None      #self 表示错误的是哪一个，没有错误时是none。
        }
        data = request.data # 请求体

        form = LoginForm(data)
        # print(form.is_valid())    # 加入用户名，密码，code有一个内容为空，则为false
        if not form.is_valid():
            # 验证不通过
            err_dict:dict = form.errors
            # 拿到所有错误字段的名字，使用字典的取字段方法
            err_valid = list(err_dict.keys())[0]  # 其中err_dict.keys()是伪列表，使用list将其变为真列表。
            # 拿到第一个字段的第一个错误信息。
            err_msg = err_dict[err_valid][0]
            res['msg'] = err_msg
            res['self'] = err_valid
            return JsonResponse(res)

        # name = data.get('name')
        # if not name:
        #     res['msg'] = '请输入用户名'
        #     res['self'] = 'name'
        #     return JsonResponse(res)
        # pwd = data.get('pwd')
        # if not pwd:
        #     res['msg'] = '请输入密码'
        #     res['self'] = 'pwd'
        #     return JsonResponse(res)
        # code = data.get('code')
        # if not code:
        #     res['msg'] = '请输入验证码'
        #     res['self'] = 'code'
        #     return JsonResponse(res)

        # valid_code:str = request.session.get('valid_code') # 从session中取验证码
        #
        # if valid_code.upper() != code.upper():
        #
        #     res['msg'] = '验证码输入错误'
        #     res['self'] = 'code'
        #     return JsonResponse(res)
        # # 校验用户名和密码
        # if name != 'fengfeng' or pwd != '1234':
        #     res['msg'] = '用户名或密码输入错误'
        #     res['self'] = 'pwd'
        #     return JsonResponse(res)
        res['code'] = 0    #当错误的都未发生，则code=0
        return JsonResponse(res)  #传回前端
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