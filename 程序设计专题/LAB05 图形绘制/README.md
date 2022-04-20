# 实验要求

**1、** 画房子：写程序画出下面的房子之一：

![image](https://user-images.githubusercontent.com/96508983/164162488-1516c359-0259-4e9d-b69f-c75907a3e7c3.png)

**2、** 在现有的graphics库的基础上，设计一个新图形绘制系统。

    除了已有的笔的概念（有当前位置）之外，再增加一个表示当前角度的全局变量，初始值为0，表示坐标轴的横轴方向（正东）。

    然后实现以下三个函数：

    void forward(double distance); /*沿当前方向画线，长度为distance，当distance为负数时后退*/

    void turn (double angle);  /*顺时针旋转角度angle，角度单位为DEG，当angle为负数时逆时针旋转*/

    void move(double distance); /*沿当前方向移动笔（不画线），长度为distance，当distance为负数时后退*/

    在实现以上全局变量和函数的基础上，用以上函数画出下面的图形：

![image](https://user-images.githubusercontent.com/96508983/164162553-a8d9f361-2d12-462a-8ad8-7ae5a4842ba0.png)
