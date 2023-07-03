
# 开发语言

使用C++和WTL库进行开发。

# 项目管理

|      名称     |         工具          |
|:-------------:|:--------------------:|
|    版本控制    | Git, GitHub, fossil  |
|    持续集成    |   Jenkins,Appveyor   |
|    构建工具    |     CMake,QMake      |
|    规范检查    |       cpplint        |
|    静态分析    |       cppcheck       |
|   复杂度分析   |       cppncss        |
| 单元测试覆盖率 | OpenCppCoverage,gcov |

可考虑配置Phabricator。

# 具体实现

1. 软件框架

	软件整体采用MVVM的模式框架，达到多人高效协同的效果。

1. 绘图

	绘图部分采用WTL库的Windows DC技术。

1. 线路规划

	公交的路线规划算法采用优化的Dijkstra算法，对抽象的公交站点地图运用Dijkstra算法，
	并根据总站点数、换乘次数等计算得到不同的公交方案。
