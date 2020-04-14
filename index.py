import os
import sys
def visitdir(path):
    li = os.listdir(path)
    for p in li :
        pathname = os.path.join(path,p)
        if not os.path.isfile(pathname):
            visitdir(pathname)
        else:
            print (pathname)
            
def visitdir2(path):
    for root,dirs,files in os.walk(path):
        for filepath in files:
            print(filepath)
            print(os.path.join(root,filepath))
            if os.path.normcase(os.path.join(root,filepath)) == os.path.normcase("/Users/weiqi/Desktop/nightFish/nightFish/en.lproj/Localizable.strings"):
                print("相同")


if __name__ == "__main__":
    path = r"/Users/weiqi/Desktop/nightFish"
    # visitdir(path)
    visitdir2(path)
