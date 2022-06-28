from django.utils.deprecation import MiddlewareMixin
import json

# 解析POST请求
class Md1(MiddlewareMixin):   #继承MiddlewareMixin
    #请求中间件
    def process_request(self,request):
        if request.method == 'POST' and request.META.get('CONTENT_TYPE') == 'application/json':
            data = json.loads(request.body,encoding='utf8') # 解析
            request.data = data   # 将解析过的数据放到request.data中


    # 响应中间件
    def process_response(self,request,response):
        return response

