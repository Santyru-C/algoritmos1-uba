def pertenece(s: [int], e: int) -> bool:
    for i in s:
        if i == e:
            return True
        
    else:
        return False

    
print(pertenece([1,2,3,4,5], 5))
print(pertenece([], 1))