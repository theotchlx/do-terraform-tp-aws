# Etape 1: Déclarer une resource pour générer un nombre aléatoire entre 1 et 1000
resource "random_integer" "random_number" {
  min = 1
  max = 1000
}

# Etape 2: Faire un output de la valeur générée
output "random_number_output" {
  value = random_integer.random_number.result
}