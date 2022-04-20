# 实验要求

**1、** 整数划分问题。编程序求某一个正整数的所有划分数，要求输出不能重复。如输入6，则输出：

6 = 5+1

6 = 4+2

6 = 4+1+1

6 = 3+3

6 = 3+2+1

6 = 3+1+1+1

6 = 2+2+2

6 = 2+2+1+1

6 = 2+1+1+1+1

6 = 1+1+1+1+1+1

 

**2、** 编程实现：从键盘读入一行文本，并把这行文本中的英文单词转换成Pig Latin。

Pig Latin是按照如下简单规则转换每个英文单词的一种自发明语言：

1） 如果单词以辅音字母开头，那么把起始辅音字符串（即直到第一个元音字母前的所有字母）前面加上-，从单词开始移到单词尾部，并加上后缀ay。

2） 如果单词以元音字母开始，则加后缀-way。

3） 其他的单词(不含元音字母)或字符维持原样不变。

**【例】**

**输入：**

This is an example of Pig Latin. As you can see, it's silly, but lots of fun for children.

**输出：**

is-Thay is-way an-way example-way of-way ig-Pay atin-Lay. As-way ou-yay an-cay ee-say, it-way's illy-say, ut-bay ots-lay of-way un-fay or-fay ildren-chay.

 

**【要求】**

1、请采用模块化程序设计方法，自顶向下，逐步求精，函数实现。
