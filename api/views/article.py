from django.views import View
from django.http import JsonResponse
from markdown import markdown
from pyquery import PyQuery

class ArticleView(View):
    def post(self,request):
        res = {
            'msg':'文章发布成功',
            'code':412,
        }
        data:dict = request.data

        title = data.get('title')
        if not title:
            res['msg'] = '请输入文章标题'
            return JsonResponse(res)

        content = data.get('content')
        recommend = data.get('recommend')
        if not content:
            res['msg'] = '请输入文章内容'
            return JsonResponse(res)
        extra = {
            'title':title,
            'content':content,
            'recommend':recommend,
        }

        # 解析文本内容
        abstract = data.get('abstract')
        if not abstract:
            doc = PyQuery(markdown(content)).text()[:30]
        extra['abstract'] = abstract

        category = data.get('category_id')
        if category:
            extra['category'] = category

        # 文章封面id判断
        cover_id = data.get('cover_id')
        if cover_id:
            extra['cover_id'] = cover_id
        else:
            extra['cover_id'] = 9

        # 判断密码
        pwd = data.get('pwd')
        if pwd:
            extra['pwd'] = pwd

        return JsonResponse(extra)
