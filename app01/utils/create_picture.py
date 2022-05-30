# 需要用到PIL
# pip install pillow

from PIL import Image

# 生成200*40的图片，背景模式RGB，颜色：color
img = Image.new('RGB',(200,40),color=(255,255,255))
#保存图片
img.save('new_img.png','PNG')