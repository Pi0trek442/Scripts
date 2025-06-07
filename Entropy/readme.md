## Formule d'entropie d'un mot de passe

**Entropie (en bits)** :  
\[ \text{Entropie} = L \cdot \log_2(N) \]

- **L** : longueur du mot de passe  
- **N** : taille de l’alphabet utilisé :

  | Alphabet utilisé                      | Taille (N) |
  |--------------------------------------|------------|
  | Lettres minuscules                   | 26         |
  | Lettres majuscules + minuscules      | 52         |
  | Lettres (majuscules & minuscules) + chiffres | 62         |
  | Caractères imprimables ASCII         | 95         |

---

### Exemple

Mot de passe de **10 caractères**, utilisant **lettres majuscules/minuscules + chiffres** :

\[
\text{Entropie} = 10 \cdot \log_2(62) \approx 10 \cdot 5.95 = 59.5 \text{ bits}
\]
