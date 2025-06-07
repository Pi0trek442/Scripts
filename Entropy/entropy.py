import math
import string

def get_charset_size(password):
    charset = 0
    if any(c.islower() for c in password):
        charset += 26
    if any(c.isupper() for c in password):
        charset += 26
    if any(c.isdigit() for c in password):
        charset += 10
    if any(c in string.punctuation for c in password):
        charset += len(string.punctuation)
    if any(c.isspace() for c in password):
        charset += 1  # compte l'espace

    return charset

def entropy(password):
    if not password:
        return 0
    charset_size = get_charset_size(password)
    return len(password) * math.log2(charset_size)

# Exemple d'utilisation
if __name__ == "__main__":
    pwd = input("Entrez votre mot de passe : ")
    e = entropy(pwd)
    print(f"Entropie : {e:.2f} bits")
