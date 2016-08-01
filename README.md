# LineSpaceForTextView
给textView设置placeholder，字体颜色和行间距


博客链接地址：http://blog.csdn.net/CodingFire/article/details/52083237

1.在用UITextView的时候一直很苦恼placeholder的设置，最开始是通过添加label，后来觉得麻烦，就通过UITextView本身的一些特性来进行模拟。

2.UITextView的行间距设置方法网上很容易搜的到，但是运用中却发现直接设置根本不行，原因是textView一开始必需要有内容
（个中原因，不深究，估计是系统级的），但是有又很奇怪，所以想到个主意，一开始就给textView内容，输入时删除，这样就
有了1中的placeholder效果，可谓一举两得。

3.做出了placeholder的效果，颜色也需要区别，发现这句：

        _textView.textColor = [UIColor redColor];
完全没有作用，所以也需要通过属性来设置了，具体的要实现以上内容的代码请看Demo。

