"""
225. 用队列实现栈
简单
https://leetcode-cn.com/problems/implement-stack-using-queues/
"""

# 方法一: 两个队列切换
# 36 ms	    84.23%
# 13.8 MB   12.50%
class MyStack:

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.inQueue = []
        self.outQueue = []

    def push(self, x: int) -> None:
        """
        Push element x onto stack.
        """
        self.inQueue.append(x)


    def pop(self) -> int:
        """
        Removes the element on top of the stack and returns that element.
        """
        while len(self.inQueue) != 1:
            self.outQueue.append(self.inQueue.pop(0))
        res = self.inQueue.pop()
        self.inQueue = self.outQueue
        self.outQueue = []
        return res


    def top(self) -> int:
        """
        Get the top element.
        """
        while len(self.inQueue) != 1:
            self.outQueue.append(self.inQueue.pop(0))
        res = self.inQueue[0]
        self.outQueue.append(res)
        self.inQueue = self.outQueue
        self.outQueue = []
        return res

    def empty(self) -> bool:
        """
        Returns whether the stack is empty.
        """
        return len(self.inQueue) == 0


# Your MyStack object will be instantiated and called as such:
# obj = MyStack()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()