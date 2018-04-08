#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Artisan
#------------------------------------------------------------

CREATE TABLE Artisan(
        ID_Artisan Varchar (20) NOT NULL ,
        PRIMARY KEY (ID_Artisan )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Vente
#------------------------------------------------------------

CREATE TABLE Vente(
        V_Quantite  Int NOT NULL ,
        ID_Vente    int (11) Auto_increment  NOT NULL ,
        V_Oo        Int ,
        V_Oa        Int ,
        V_Of        Int ,
        ID_Objet    Int NOT NULL ,
        V_Annee     Varchar (4) NOT NULL ,
        V_Jour      Varchar (3) NOT NULL ,
        V_Mois      Char (15) NOT NULL ,
        ID_Province Char (20) NOT NULL ,
        ID_Pouvoir  Varchar (32) ,
        ID_Cite     Char (20) ,
        PRIMARY KEY (ID_Vente )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Objet
#------------------------------------------------------------

CREATE TABLE Objet(
        ID_Objet int (11) Auto_increment  NOT NULL ,
        O_Objet  Varchar (32) NOT NULL ,
        PRIMARY KEY (ID_Objet )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Décoration
#------------------------------------------------------------

CREATE TABLE Decoration(
        ID_Decoration Varchar (32) NOT NULL ,
        PRIMARY KEY (ID_Decoration )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Lieu
#------------------------------------------------------------

CREATE TABLE Lieu(
        ID_Province Char (20) NOT NULL ,
        P_enGuerre  Varchar (160) ,
        PRIMARY KEY (ID_Province )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Pouvoir
#------------------------------------------------------------

CREATE TABLE Pouvoir(
        ID_Pouvoir Varchar (32) NOT NULL ,
        PRIMARY KEY (ID_Pouvoir )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Mois
#------------------------------------------------------------

CREATE TABLE Mois(
        V_Mois      Char (15) NOT NULL ,
        ID_Divinite Char (32) NOT NULL ,
        PRIMARY KEY (V_Mois )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ville
#------------------------------------------------------------

CREATE TABLE Ville(
        ID_Cite     Char (20) NOT NULL ,
        P_enGuerre  Varchar (160) ,
        ID_Province Char (20) NOT NULL ,
        PRIMARY KEY (ID_Cite )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Divinite
#------------------------------------------------------------

CREATE TABLE Divinite(
        ID_Divinite Char (32) NOT NULL ,
        PRIMARY KEY (ID_Divinite )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Monnaie
#------------------------------------------------------------

CREATE TABLE Monnaie(
        M_ID    Varchar (5) NOT NULL ,
        M_Nom   Varchar (25) NOT NULL ,
        M_Value Int NOT NULL ,
        PRIMARY KEY (M_ID )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Detenir
#------------------------------------------------------------

CREATE TABLE Detenir(
        ID_Decoration Varchar (32) NOT NULL ,
        ID_Vente      Int NOT NULL ,
        PRIMARY KEY (ID_Decoration ,ID_Vente )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Creer
#------------------------------------------------------------

CREATE TABLE Creer(
        ID_Artisan Varchar (20) NOT NULL ,
        ID_Vente   Int NOT NULL ,
        PRIMARY KEY (ID_Artisan ,ID_Vente )
)ENGINE=InnoDB;

ALTER TABLE Vente ADD CONSTRAINT FK_Vente_ID_Objet FOREIGN KEY (ID_Objet) REFERENCES Objet(ID_Objet);
ALTER TABLE Vente ADD CONSTRAINT FK_Vente_V_Mois FOREIGN KEY (V_Mois) REFERENCES Mois(V_Mois);
ALTER TABLE Vente ADD CONSTRAINT FK_Vente_ID_Province FOREIGN KEY (ID_Province) REFERENCES Lieu(ID_Province);
ALTER TABLE Vente ADD CONSTRAINT FK_Vente_ID_Pouvoir FOREIGN KEY (ID_Pouvoir) REFERENCES Pouvoir(ID_Pouvoir);
ALTER TABLE Vente ADD CONSTRAINT FK_Vente_ID_Cite FOREIGN KEY (ID_Cite) REFERENCES Ville(ID_Cite);
ALTER TABLE Mois ADD CONSTRAINT FK_Mois_ID_Divinite FOREIGN KEY (ID_Divinite) REFERENCES Divinite(ID_Divinite);
ALTER TABLE Ville ADD CONSTRAINT FK_Ville_ID_Province FOREIGN KEY (ID_Province) REFERENCES Lieu(ID_Province);
ALTER TABLE Detenir ADD CONSTRAINT FK_Detenir_ID_Decoration FOREIGN KEY (ID_Decoration) REFERENCES Decoration(ID_Decoration);
ALTER TABLE Detenir ADD CONSTRAINT FK_Detenir_ID_Vente FOREIGN KEY (ID_Vente) REFERENCES Vente(ID_Vente);
ALTER TABLE Creer ADD CONSTRAINT FK_Creer_ID_Artisan FOREIGN KEY (ID_Artisan) REFERENCES Artisan(ID_Artisan);
ALTER TABLE Creer ADD CONSTRAINT FK_Creer_ID_Vente FOREIGN KEY (ID_Vente) REFERENCES Vente(ID_Vente);
