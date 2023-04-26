#################################################
#             Universite Quisqueya              #
#                                               #
# Nom & Prenom : Bertilus Raplh Oly             #
# Code : BE195639                               #
# Devoir - Statistiques                         #
#################################################


# Charger la bibliothèque tidyverse
library(tidyverse)

# Importer les données à partir du fichier CSV
credit_data <- read.csv("CreditBancaire.csv")


# Calculer la moyenne du crédit
credit_mean <- mean(credit_data$Credit)

# Afficher le résultat
cat("La moyenne du crédit est de:", credit_mean, "\n")



# Calculer la moyenne du nombre de jours de retard de paiement des clients par type de crédit
days_late_mean <- credit_data %>%
  group_by(Type) %>%
  summarise(mean_days_late = mean(Jours))

# Afficher le résultat
print(days_late_mean)


# Créer le graphique en bâton
ggplot(days_late_mean, aes(x = Type, y = mean_days_late, fill = Type)) +
  geom_bar(stat = "identity") +
  labs(x = "Type de crédit", y = "Moyenne des jours de retard de paiement", title = "Moyenne des jours de retard de paiement par type de crédit")
