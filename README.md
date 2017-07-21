# 生成php项目cscope索引文件
##### 1. 在php项目中创建cscope文件夹
##### 2. 把这个脚本放到cscope文件夹中,并把次脚本变成可执行 sudo chmod +x cscope.sh
##### 3. 执行脚本 ./cscope.sh
##### 5. cs add cscope/
##### 6. cs f f command.php //查找command.php文件


```
vim支持8种cscope的查询功能，如下：

s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方（包括头文件）
g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能（比如有可能只在头文件处）
d: 查找本函数调用的函数
c: 查找调用本函数的函数
t: 查找指定的字符串
e: 查找egrep模式，相当于egrep功能，但查找速度快多了
f: 查找并打开文件，类似vim的find功能
i: 查找包含本文件的文件
其他功能可输入：help cscope查看
```
