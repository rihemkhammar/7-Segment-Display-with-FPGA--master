
# Projet FPGA DE10-Lite - Compteur 7 Segments

Ce projet implémente un compteur 7 segments sur une **carte FPGA DE10-Lite** en utilisant VHDL. Le compteur affiche un chiffre de 0 à 9 sur un affichage 7 segments, avec une fréquence de mise à jour de 1 Hz. Le projet utilise un diviseur d'horloge pour générer un signal de 1 Hz à partir de l'horloge de 50 MHz de la carte.

## Table des matières

- [Description du projet](#description-du-projet)
- [Prérequis](#prérequis)
- [Installation et Configuration](#installation-et-configuration)
- [Compilation et Programmation](#compilation-et-programmation)
- [Structure des fichiers](#structure-des-fichiers)
- [Dépannage](#dépannage)
- [Auteurs](#auteurs)
- [Licences](#licences)

## Description du projet

Ce projet implémente un compteur qui :
- Utilise un diviseur d'horloge pour créer un signal de fréquence 1 Hz.
- Incrémente un compteur de 0 à 9.
- Affiche les chiffres sur un affichage 7 segments.
- Utilise un bouton poussoir pour réinitialiser le compteur à 0.

L'objectif est de fournir un exemple simple de l'utilisation d'un FPGA pour réaliser un affichage numérique en temps réel.

## Prérequis

Avant de commencer, vous aurez besoin des éléments suivants :

- **Carte FPGA DE10-Lite**.
- **Quartus Prime** (version 20.1 ou plus récente).
- **Modem de programmation USB-Blaster** pour connecter le FPGA à votre PC.
- **VHDL** pour coder le comportement du compteur et de l'affichage 7 segments.

## Installation et Configuration

1. **Télécharger et installer Quartus Prime :**
   Si ce n'est pas déjà fait, téléchargez [Quartus Prime](https://www.intel.com/content/www/us/en/programmable/downloads/download-center.html) et installez-le sur votre machine.

2. **Cloner ce dépôt GitHub :**
   Clonez ce projet sur votre machine locale en utilisant Git :
   ```bash
   git clone https://github.com/yourusername/fpga-counter-7seg.git
   ```

3. **Configurer le projet dans Quartus Prime :**
   - Ouvrez **Quartus Prime** et chargez le projet `.qpf` :
     ```bash
     counter7seg.qpf
     ```
   - Vérifiez les assignations des broches dans le fichier `counter7seg.qsf` pour vous assurer que les broches du FPGA sont correctement mappées aux segments de l'affichage 7 segments et au bouton poussoir pour la réinitialisation.

## Compilation et Programmation

1. **Compiler le projet :**
   - Lancez la compilation dans Quartus Prime pour générer le fichier de configuration du FPGA (.sof).

2. **Programmer le FPGA :**
   - Une fois la compilation terminée, ouvrez l'outil **Quartus Programmer**.
   - Connectez votre carte DE10-Lite au PC via le câble USB-Blaster.
   - Sélectionnez le fichier `.sof` généré et programmez le FPGA.

3. **Vérification :**
   - Une fois le FPGA programmé, le compteur devrait commencer à s'incrémenter toutes les secondes.
   - Le bouton poussoir devrait réinitialiser le compteur à 0.

## Structure des fichiers

Voici une description des principaux fichiers de ce projet :

- **`counter7seg.qpf`** : Fichier de projet Quartus contenant la configuration du projet.
- **`counter7seg.qsf`** : Fichier d'assignation des broches, où les broches FPGA sont mappées aux segments de l'affichage 7 segments et au bouton poussoir de réinitialisation.
- **`counter7seg.vhd`** : Code VHDL du projet implémentant le comportement du compteur et de l'affichage 7 segments.
- **`counter7seg.vhd.bak`** : Sauvegarde du fichier `counter7seg.vhd` au cas où une modification aurait été effectuée.

## Dépannage

- **Le compteur ne s'incrémente pas :**
  - Vérifiez la configuration du diviseur d'horloge. Assurez-vous que le diviseur fonctionne correctement avec l'horloge de 50 MHz de la carte.
  - Vérifiez les assignations des broches dans le fichier `.qsf`.
  
- **Affichage incorrect sur l'écran 7 segments :**
  - Assurez-vous que les broches de l'affichage 7 segments sont correctement mappées dans le fichier `.qsf`.
  - Vérifiez que les segments sont câblés correctement sur votre carte DE10-Lite.

- **Le bouton poussoir de réinitialisation ne fonctionne pas :**
  - Vérifiez l'assignation de la broche pour le bouton poussoir dans le fichier `.qsf`.
  - Assurez-vous que le signal de réinitialisation (`rst`) est correctement connecté et que la logique de réinitialisation dans le code VHDL est correcte.

## Licences

Ce projet est sous licence [MIT License](LICENSE).
