# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.

    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.

def ModGroup(Input, size):
    output = []
    for Item in Input:
        output.append(Item % size)
    return output

def PrintPairArray(Array1,Array2):
    i=0
    BiggerLent = len(Array1) if len(Array1)>len(Array2) else len(Array2)

    while i < BiggerLent:

        print(str(Array1[i])+", "+str(Array2[i]))
        i+=1

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')
    Input = [34, 29, 53, 44, 120, 39, 45, 40]
    PrintPairArray(Input,ModGroup(Input,11))

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
