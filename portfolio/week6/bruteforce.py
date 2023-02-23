import itertools #generates permutations
import hashlib #used to hash permutations

#the minlen/maxlen are purely limit how long the script will: for testing

#the function then iterates over all possible lengths of permutations between the minimum and maximum values entered by the user

def print_perms():
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" #defines the range of permutations
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
            perm_strHASH = hashlib.sha256(perm_str.encode("utf-8")).hexdigest() #hashes the permutation
            num_perms += 1 #simple counter
            if perm_strHASH == match_str:
                found_match = True
                break
            last_perm = perm_str
    if found_match:
        print("Match found in permutation:", last_perm)
    else:
        print("Match not found in", num_perms, "permutations.")
            
print_perms()