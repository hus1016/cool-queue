# cool-queue
这是一个基于 COOL 语言实现的数据结构项目，旨在通过 COOL 代码实现队列功能，包含入队（enqueue）、出队（dequeue）等基本操作
操作系统为Ubuntu 64位系统，依赖工具为COOL 编译器（`coolc`）、SPIM 模拟器（`spim`）
本项目通过cool语言实现了一个队列功能，分别构建了三个类为QueueNode节点类型，Queue队列类型，Main类写在同一个文件中queue.cl
命令行输入coolc queue.cl后在同目录下生成queue.s汇编文件
命令行再次输入spim queue.s 执行文件中指令并且输出程序运行结果
