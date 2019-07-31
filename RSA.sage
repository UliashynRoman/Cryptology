import random

bite = 256 #input dla random.generat default


def Func_for_PQ(): #utworzenie p i q
	#Pętla dla p oraz q
    p = random.getrandbits(bits)
    while(not is_prime(p)): #dopóki nie są one liczabami pierwszymi
        p = random.getrandbits(bits)

    q = random.getrandbits(bits)
    while(not is_prime(q)):
        q = random.getrandbits(bits)

    while(p == q):
        p, q = Func_for_PQ()

    return p, q


def Generacja_Kluczow(p, q): #generacja 
    if not (is_prime(p) and is_prime(q)):
        raise ValueError('p and q numbers must be prime')

    elif p == q:
        raise ValueError('p and q numbers cannot be equal')

    n = p * q
    phi = (p-1) * (q-1)

    e = random.randrange(1, phi) #mod(e,phi) = 1
    g = gcd(e, phi)

    while g != 1:
        e = random.randrange(1, phi)
        g = gcd(e, phi)


    d = inverse_mod(e, phi) #inversja modularna

    return ((e, n), (d, n))

def Enc_Func(pk, message): #szyfrowanie
    key, n = pk 

    text = [pow(ord(char),key, n) for char in message] #Szyfrowanie znaków po koleji

    return text # = byte[]

def Dec_Func(pk, message): #deszyfrowanie
    key, n = pk #parsowanie klucza

    text = [chr(pow(char,key, n)) for char in message] #Deszyfrowanie znaków po koleji

    return ''.join(text) # = byte[] w postaci tekstu

#Main()- Printing
if __name__ == '__main__':

    print("|------------------------------------------|")
    print("                 Topic:")    
    print("  Encryption and Decryption by RSA")
    print("|------------------------------------------|")
    print("            Workplace: Sage")
    print("             Subject: SKR")    
    print("|------------------------------------------|")
    print("          Enter the byte size ")
    byte = raw_input() #reading the byte size
    print("|------------------------------------------|")

    print("         Creating P i Q variables;")
    p, q = Func_for_PQ()
    print("      Creating Public and Private key")
    print("       #p and q is equal Func_for_PQ#")
    print("|------------------------------------------|")
    
    public, private = Generacja_Kluczow(p, q)  

    print("  Let`s create an message, write it above: ")
    message = raw_input() #reading the message
    encrypted = Enc_Func(public, message)#encrypting
    print("              Encrypted : ")
    print(''.join(map(lambda x: str(x), encrypted)))

    print("        Message after encrypting : ")
    print(        Dec_Func(private, encrypted))
    print("|-----------------THE END------------------|")
