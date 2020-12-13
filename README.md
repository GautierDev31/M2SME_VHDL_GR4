# Projet de developpement de FPGA en VHDL
Réalisé dans le cadre du master 2 SME de l'université Paul Sabatier.

## Avancement TP au 26/11
#### F1 Amémonètre : Fonction terminée et testé avec SOPC

#### F7 Commande barreur : 
- Schéma fonctionnel terminé
- Fonction compteur BP terminée et simmulé
- Fonction Synchro presque terminée

##### A faire :
- Cabler et tester compteur BP
- Terminer la machine à état complète de la fonction synchro 
- Faire passer "conde fonction" dans le bus avalon

La machine a état n'a pas été completement terminée afin de tester la fonction compteur BP 
qui détecte si le FPGA reçois un appuis cours ou long.

## Projet Barre Franche :

### F1 Anemometre :

Analyse fonctionelle :  

![Analyse fonctionelle F1](images/AF_F1.PNG)

### F7 Commande barreur :

Analyse fonctionelle :  

![Analyse fonctionelle F1](images/AF_F7.PNG)

## TP de bases :
Découverte du language VHDL.  
TB_Base -> Réalisation d'un compteur avec afficheur 7 segments  
PWM -> Réalisation d'un PWM avec 4 découpage possible de la fréquence

![PWM](images/PWM1.PNG)