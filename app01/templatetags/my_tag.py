from django import template

#注册
register = template.Library()

#自定义标签
# @register.filter
# def add1(item):
#     return int(item)+1

@register.inclusion_tag('my_tag/headers.html')
def banner(menu_name,article=None):
    img_list = [
        "http://192.168.42.13:8000/media/site_bg/10.jpg",
        "http://192.168.42.13:8000/media/site_bg/11.jpg",
        "http://192.168.42.13:8000/media/site_bg/17.jpg",
    ]
    if article:
        #说明是文章详情页面
        # 拿到文章的封面
        cover = article.cover.url.url
        img_list = [cover]
        pass
    return {'img_list': img_list}
