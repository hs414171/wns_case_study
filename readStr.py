def evenPos(string:str) -> str:
    result = ""
    for i in range(0, len(string), 2):
        result += string[i]
    return result

print(evenPos("Alphabet"))