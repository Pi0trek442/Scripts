import os

# Structure de l'arborescence mise à jour
arborescence = {
    "Comptabilité": {
        "Factures": ["facture_juin_2024", "facture_juillet_2024", "facture_aout_2024"],
        "Salaires": ["paie_juin_2024", "paie_juillet_2024", "paie_aout_2024"],
        "Déclarations": ["déclaration_2024_01", "déclaration_2024_02", "déclaration_2024_03"]
    },
    "Administration": {
        "Contrats": ["contrat_employé_001", "contrat_employé_002", "contrat_employé_003"],
        "Documents": ["doc_règlement_intérieur", "doc_procédure_rh", "doc_politique_sécurité"],
        "Procès-verbaux": ["pv_réunion_juin", "pv_réunion_juillet", "pv_réunion_aout"]
    },
    "Communication": {
        "Campagnes": ["campagne_email_01", "campagne_email_02", "campagne_email_03"],
        "Réseaux": ["post_facebook_juin", "post_instagram_juillet", "post_linkedin_aout"],
        "Partenaires": ["partenaires_2024_01", "partenaires_2024_02", "partenaires_2024_03"]
    },
    "Ressources Humaines": {
        "Recrutement": ["annonce_poste_001", "cv_candidat_001", "cv_candidat_002"],
        "Formations": ["formation_cybersécurité", "formation_management", "formation_bien-être"],
        "Dossiers Employés": ["dossier_employé_001", "dossier_employé_002", "dossier_employé_003"]
    },
    "Projets": {
        "En cours": ["projet_alpha_planification", "projet_beta_budget", "projet_gamma_avancement"],
        "Terminés": ["rapport_final_projet_omega", "présentation_projet_delta", "projet_theta_revue"],
        "Archives": ["projet_archivé_2023_01", "projet_archivé_2022_05", "projet_archivé_2021_11"]
    },
    "IT (Informatique et Télécoms)": {
        "Infrastructure": ["plan_réseau", "configuration_firewall", "guide_sécurité"],
        "Applications": ["documentation_crm", "roadmap_dev_2024", "manuel_utilisateur"],
        "Support": ["ticket_001", "ticket_002", "ticket_003"]
    }
}

# Fonction pour créer les fichiers
def create_arborescence(base_dir, structure):
    os.makedirs(base_dir, exist_ok=True)
    for folder, subfolders in structure.items():
        folder_path = os.path.join(base_dir, folder)
        os.makedirs(folder_path, exist_ok=True)
        for subfolder, files in subfolders.items():
            subfolder_path = os.path.join(folder_path, subfolder)
            os.makedirs(subfolder_path, exist_ok=True)
            for file_name in files:
                file_path = os.path.join(subfolder_path, f"{file_name}.txt")
                with open(file_path, "w") as f:
                    pass  # Crée un fichier vide

# Chemin du dossier parent
base_dir = "Data"

# Génération de l'arborescence
create_arborescence(base_dir, arborescence)
