# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.

"""
IT-1025, 3
IT-1050, 3
IT-1150, 3
IT-2310, 3
IT-2320, 4
IT-2351, 4
IT-2650, 4
IT-2660, 4
IT-2030, 4
"""
# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')
    BaseText = """
'IT-1025', 3
'IT-1050', 3
'IT-1150', 3
'IT-2310', 3
'IT-2320', 4
'IT-2351', 4
'IT-2650', 4
'IT-2660', 4
'IT-2030', 4
"""
    ArrayBased = BaseText.splitlines()
    ArrayBased2 = []
    print(ArrayBased)
    for Item in ArrayBased:
        ArrayBased2.append("creditHours.put("+Item+");")
    for item in ArrayBased2:
        print(item)
    #print(ArrayBased2)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
