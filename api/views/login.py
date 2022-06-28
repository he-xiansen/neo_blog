from django import forms
from django.contrib import auth
from app01.models import UserInfo
from django.views import View
from django.http import JsonResponse


class LoginBaseForm(forms.Form):
    name = forms.CharField(error_messages={'required': '请输入用户名'})  # 将原来的‘这个字段是必需的改为对应的错误信息’
    pwd = forms.CharField(error_messages={'required': '请输入密码'})
    code = forms.CharField(error_messages={'required': '请输入验证码'})
    # 重写init方法
    def __init__(self, *args, **kwargs):
        # 做自己想做的事
        self.request = kwargs.pop('request', None)  # pop弹出  self.request将requst对象绑定到self对象中，此时在局部钩子中可以打印出self.request

        super().__init__(*args, **kwargs)  # 使用super调用父类的init方法，即不影响原来父类的运行。

    # 局部钩子
    def clean_code(self):
        code: str = self.cleaned_data.get('code')
        valid_code: str = self.request.session.get('valid_code')
        # print(code,valid_code)   # 这里可以获取到前端输入的code,和后端的验证码
        if code.upper() != valid_code.upper():
            self.add_error('code', '验证码输入错误')
        # 但是要如何获取到后端生成的验证码code呢？重写form的init方法。
        return self.cleaned_data
# 登陆的字段验证
class LoginForm(LoginBaseForm):
    # name = forms.CharField(error_messages={'required':'请输入用户名'})  #将原来的‘这个字段是必需的改为对应的错误信息’
    # pwd = forms.CharField(error_messages={'required':'请输入密码'})
    # code = forms.CharField(error_messages={'required':'请输入验证码'})





    # 全局钩子
    def clean(self):
        name = self.cleaned_data.get('name')
        pwd = self.cleaned_data.get('pwd')

        # 引入auth模块,使用其认证接口,如果认证通过会返回一个用户对象，不通过返回none。
        user = auth.authenticate(username=name,password=pwd)
        # print(user)    # 打印一下验证一下。
        if not user:
            # 表示失败了，给字段添加错误信息
            self.add_error('name','用户名或密码错误')
            return self.cleaned_data
        # if name != 'neone' or pwd != '1234':
        #     # 为我们的字段添加错误信息
        #     self.add_error('name','用户名或密码错误') # 为字段添加一个错误信息。

        # 把用户对象放到cleaned_data中，即字典多加一个键值对。
        self.cleaned_data['user'] = user
        return self.cleaned_data


# 注册的字段验证
class SignForm(LoginBaseForm):   # 这里一样继承forms.Form
    # name = forms.CharField(error_messages={'required': '请输入用户名'})  # 将原来的‘这个字段是必需的改为对应的错误信息’
    # pwd = forms.CharField(error_messages={'required': '请输入密码'})
    re_pwd = forms.CharField(error_messages={'required': '请输入确认密码'})
    # code = forms.CharField(error_messages={'required': '请输入验证码'})



    def clean(self):  # 设置全局钩子来验证密码和确认密码
        pwd = self.cleaned_data.get('pwd')
        re_pwd = self.cleaned_data.get('re_pwd')
        if pwd != re_pwd:
            self.add_error('re_pwd','两次密码不一致！')
        return self.cleaned_data

    def clean_name(self):
        name = self.cleaned_data.get('name')
        user_query = UserInfo.objects.filter(username=name) # 如果能过滤到说明此用户已经有了。
        if user_query:
            self.add_error('name','用户已经存在')
        return self.cleaned_data


# 登陆失败的的可复用代码
def clean_form(form):
    # 验证不通过
    err_dict: dict = form.errors
    # 拿到所有错误字段的名字，使用字典的取字段方法
    err_valid = list(err_dict.keys())[0]  # 其中err_dict.keys()是伪列表，使用list将其变为真列表。
    # 拿到第一个字段的第一个错误信息。
    err_msg = err_dict[err_valid][0]
    return err_valid,err_msg #这里返回两个字段是为了别人调用时可以获取到这两个字段。

# 采用CBV模式来开发
class LoginView(View):
    def post(self,request):
        res = {
            'code': 425,  # 0 成功，非0失败
            'msg': "登陆成功",
            'self': None  # self 表示错误的是哪一个，没有错误时是none。
        }
        # data = request.data # 请求体

        form = LoginForm(request.data, request=request)
        # print(form.is_valid())    # 加入用户名，密码，code有一个内容为空，则为false
        if not form.is_valid():
            # 验证不通过
            res['self'], res['msg'] = clean_form(form)  # 调用clean_form函数
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
        # 执行登陆操作   #
        user = form.cleaned_data.get('user')
        # 登陆操作,还是使用auth模块
        auth.login(request, user)
        res['code'] = 0  # 当错误的都未发生，则code=0
        return JsonResponse(res)  # 传回前端

class SignView(View):
    def post(self,request):
        res = {
            'code': 425,  # 0 成功，非0失败
            'msg': "注册成功",
            'self': None  # self 表示错误的是哪一个，没有错误时是none。
        }
        form = SignForm(request.data, request=request)
        if not form.is_valid():
            # 验证不通过
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)
        # 注册成功的代码
        ## 将注册成功的用户名和密码写入数据库
        user = UserInfo.objects.create_user(
            username=request.data.get('name'),
            password=request.data.get('pwd')
        )
        ## 注册之后直接登录
        auth.login(request, user)
        res['code'] = 0
        print(request.data)
        return JsonResponse(res)