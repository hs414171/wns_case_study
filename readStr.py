def evenPos(string:str) -> str:
    result = ""
    for i in range(0, len(string), 2):
        result += string[i]
    return result

if __name__ == "__main__":
    str = input("Enter a string: ")
    string = evenPos(str)
    print("The string without even posistions are : ",string)
