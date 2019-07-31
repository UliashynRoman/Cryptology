import random 
                
if __name__ == '__main__':
    
    print("|------------------------------------------|")
    print("                 Topic:")    
    print(" Implementation of Diffie-Helmman algorythm")
    print("|------------------------------------------|")
    print("            Workplace: Sage")
    print("             Subject: SKR")    
    print("|------------------------------------------|")

    print(" Generation p/g for Alicji i Boba:")
    
    new_p = random.getrandbits(10) 
    while not is_prime(new_p):
        new_p = random.getrandbits(10)

    print("             P is equal " + str(new_p))

    G = Zmod(p) #Grupa multyplikatywna
    g = G.multiplicative_generator() 
    print("             G is equal " + str(g))
    print("|------------------------------------------|")

    secret_a = random.randrange(1,new_p-1) 
    b = random.randrange(1,new_p-1) 

    print("     Alicji - Secret variable  : a = " + str(secret_a))
    print("     Bob - Secret variable     : b = " + str(b))
    print("|------------------------------------------|")
    
    A = pow(g,secret_a,new_p) #(g^secret_a)modp
    B = pow(g,b,new_p) #(g^b)modp

    print("        Alicja Public Key      : A = " + str(A))
    print("        Bob Public Key         : B = " + str(B))
    print("|------------------------------------------|")

    Ka = pow(B,secret_a,new_p)
    Kb = pow(A,secret_a,new_p)

    print("        Alicja Prywatny klucz : Ka = " + str(Ka))
    print("        Bob Private Key       : Kb = " + str(Kb))
    print("|------------------------------------------|")
