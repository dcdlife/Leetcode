"""
面试题 16.18. 模式匹配
中等
https://leetcode-cn.com/problems/pattern-matching-lcci/
"""

class Solution:
    def patternMatching(self, pattern: str, value: str) -> bool:
        if not pattern and not value:
            return True

        if not pattern and value:
            return False

        lengthOfValue = len(value)

        numberOfA = 0
        numberOfB = 0
        for i in pattern:
            if i == 'a':
                numberOfA += 1
            else:
                numberOfB += 1
        
        if not value and pattern:
            if numberOfA == 0 or numberOfB == 0:
                return True
            else:
                return False
        
        matching = True
        if numberOfA == 0 or numberOfB == 0:
            number = numberOfA if numberOfB == 0 else numberOfB
            if number != 0 and lengthOfValue % number == 0:
                number = lengthOfValue // number
                singleValue = value[:number]
                for begin in range(number, lengthOfValue, number):
                    temp = value[begin : begin + number]
                    if singleValue != temp:
                        matching = False
            else:
                matching = False
            return matching

        matching == True
        number = numberOfA
        if number != 0 and lengthOfValue % number == 0:
            number = lengthOfValue // number
            singleValue = value[:number]
            for begin in range(number, lengthOfValue, number):
                temp = value[begin : begin + number]
                if singleValue != temp:
                    matching = False
        else:
            matching = False

        if matching == True:
            return True

        matching == True
        number = numberOfB
        if number != 0 and lengthOfValue % number == 0:
            number = lengthOfValue // number
            singleValue = value[:number]
            for begin in range(number, lengthOfValue, number):
                temp = value[begin : begin + number]
                if singleValue != temp:
                    matching = False
        else:
            matching = False
                    
        if matching == True:
            return True

        for i in range(1, (lengthOfValue - numberOfB) // numberOfA + 1):
            matching = True
            lengthA = i
            lengthB = (lengthOfValue - lengthA * numberOfA) // numberOfB
            strA = ''
            strB = ''
            begin = 0
            print('lengthA', lengthA, 'lengthB', lengthA)
            for char in pattern:
                if char == 'a':
                    if begin + lengthA > lengthOfValue:
                        matching = False
                        break

                    if strA == '':
                        strA = value[begin: begin + lengthA]
                    else:
                        other = value[begin: begin + lengthA]
                        if strA != other:
                            matching = False
                            break
                    begin = begin + lengthA
                else:
                    if begin + lengthB > lengthOfValue:
                        matching = False
                        break

                    if strB == '':
                        strB = value[begin: begin + lengthB]
                    else:
                        other = value[begin: begin + lengthB]
                        if strB != other:
                            matching = False
                            break
                    begin = begin + lengthB

            if matching and strA != strB:
                return True
        
        return False

if __name__ == "__main__":
    su = Solution()
    # print(su.patternMatching('', ''))
    # print(su.patternMatching('aaa', ''))
    # print(su.patternMatching('aaab', ''))
    # print(su.patternMatching('', 'sdafa'))
    # print(su.patternMatching('aaa', 'aaa'))
    # print(su.patternMatching('aaa', 'aaab'))
    # print(su.patternMatching('aaa', 'aaabbb'))
    # print(su.patternMatching(pattern = "abba", value = "dogcatcatdog"))
    # print(su.patternMatching(pattern = "abba", value = "dogcatcatfish"))
    # print(su.patternMatching(pattern = "aaaa", value = "dogcatcatdog"))
    # print(su.patternMatching(pattern = "abba", value = "dogdogdogdog"))
    print(su.patternMatching("aaaaab", "xahnxdxyaahnxdxyaahnxdxyaahnxdxyaauxuhuo")) # leetcoce 错误
