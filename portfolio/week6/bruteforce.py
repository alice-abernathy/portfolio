import itertools 
import hashlib

def print_perms(chars): 
    minlen = int(input("Enter the minimum length of the permutation: "))
    maxlen = int(input("Enter the maximum length of the permutation: "))
    match_str = input("Enter the string to match against the permutations: ")
    found_match = False
    num_perms = 0
    last_perm = ""
    for n in range(minlen, maxlen+1): 
        if found_match:
            break
        for i, perm in enumerate(itertools.product(chars, repeat=n), 1): 
            perm_str = ''.join(perm)
            perm_strHASH = hashlib.sha256(perm_str.encode("utf-8")).hexdigest()
            num_perms += 1
            if perm_strHASH == match_str:
                found_match = True
                break
            last_perm = perm_str
    print("Number of permutations generated:", num_perms)
    print("Last permutation generated:", last_perm)
            
print_perms("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
