# 需要用到PIL
# pip install pillow

from PIL import Image

# 此时如果要创建文字，需要创建画布
from PIL import ImageDraw   # 引入画布类
from PIL import ImageFont   #引入字体类

import string   # 获取字符类
import random  # 用来在字符集中随机获取字符
from io import BytesIO   #使用这个将图片存到内存中，而不是存到文件中。

# 随机颜色函数
def random_color():
    return (random.randint(0,255),random.randint(0,255),random.randint(0,255))

str_all = string.digits+string.ascii_letters  # 数字+大小写

# 封装成验证码函数
def random_code(size=(200,40),length=4,point_num=100,line_num=10):    # 将宽高以元组方式传入，且默认200*40  # 将验证码位数传入，默认4位，点，线数也是。
    width,height = size

    # 生成200*40的白色背景图片，背景模式RGB，颜色：color
    img = Image.new('RGB',(width,height),color=(255,255,255))

    draw = ImageDraw.Draw(img)   # 创建画布,以背景图片（img）为基础。

    # 生成字体对象
    # font = ImageFont.truetype(font='./font/MexicanTequila.ttf', size=32)
    font = ImageFont.truetype(font='static/my/font/MexicanTequila.ttf',size=32)   #参数1 字体  参数2 像素

    # 书写文字
    valid_code = ''   #通过valid_code获取到完整的验证码字符串。
    for i in range(length):   #这里验证码长度由传入的参数决定
        random_char= random.choice(str_all)  # 用到了random方法取随机数。
        # draw.text方法(书写文字)  参数1 xy轴起始位置  参数2 字符 参数3 字体颜色:黑色 参数4 字体指定
        draw.text((40*i+20,10),random_char,(0,0,0),font=font)
        valid_code += random_char
    print(valid_code)

    # 通过for循环，随机生成多个点
    for i in range(point_num):
        x,y = random.randint(0,width),random.randint(0,height)       #注意random.choice和random.randint的区别。

        draw.point((x,y),random_color())                # draw.text撰写文字  draw.point撰写点 参数1 坐标  参数2 随机颜色函数random_color()
    # 随机生成线
    for i in range(line_num):
        x1, y1 = random.randint(0, width), random.randint(0, height)
        x2, y2 = random.randint(0, width), random.randint(0, height)
        draw.line((x1,y1,x2,y2),fill=random_color())   # 参数 起始，结束坐标


    # 创建一个内存句柄
    f = BytesIO()

    # 将图片存到内存句柄中
    img.save(f,'PNG')

    # 读取内存句柄
    data = f.getvalue()
    return (data,valid_code)   #返回验证码图片和验证码

    #保存图片
    # img.save('new_img.png','PNG')

if __name__ == '__main__':
    random_code()