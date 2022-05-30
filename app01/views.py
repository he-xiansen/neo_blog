from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse
import json
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

def login(request):
    if request.method == 'POST':
        # data = request.body # 请求体
        # json.loads(data,encoding='utf8')  # 将数据转为字典
        # return JsonResponse(request.POST)
        data = request.data
        return JsonResponse(data)  #传回前端
    return render(request,'login.html')
def sign(request):
    return render(request,'sign.html')