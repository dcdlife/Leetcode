"""
232. 用栈实现队列
简单
https://leetcode-cn.com/problems/implement-queue-using-stacks/
"""


# 36 ms	    85.00%
# 13.7 MB   11.11%
class MyQueue:

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.inStack = []
        self.outStack = []


    def push(self, x: int) -> None:
        """
        Push element x to the back of queue.
        """
        self.inStack.append(x)


    def pop(self) -> int:
        """
        Removes the element from in front of queue and returns that element.
        """
        if len(self.outStack):
            return self.outStack.pop(0)
        else:
            while len(self.inStack):
                self.outStack.append(self.inStack.pop(0))
            return self.outStack.pop(0)

    def peek(self) -> int:
        """
        Get the front element.
        """
        if len(self.outStack):
            return self.outStack[0]
        else:
            while len(self.inStack):
                self.outStack.append(self.inStack.pop(0))
            return self.outStack[0]

    def empty(self) -> bool:
        """
        Returns whether the queue is empty.
        """
        return len(self.inStack) == 0 and len(self.outStack) == 0



# Your MyQueue object will be instantiated and called as such:
obj = MyQueue()
# obj.push(1)
# obj.push(2)
# param_2 = obj.pop()
# param_3 = obj.peek()
print(obj.empty())