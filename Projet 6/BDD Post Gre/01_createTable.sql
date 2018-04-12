
CREATE SEQUENCE public.pizza_id_seq;

CREATE TABLE public.pizza (
                id_pizza INTEGER NOT NULL DEFAULT nextval('public.pizza_id_seq'),
                disponible VARCHAR(3) NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prix REAL NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id_pizza)
);


ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id_pizza;

CREATE SEQUENCE public.ingredients_id_seq;

CREATE TABLE public.ingredients (
                id_ingredients INTEGER NOT NULL DEFAULT nextval('public.ingredients_id_seq'),
                nom VARCHAR(100) NOT NULL,
                id_pizza INTEGER NOT NULL,
                CONSTRAINT ingredients_pk PRIMARY KEY (id_ingredients)
);


ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id_ingredients;

CREATE TABLE public.stockIngredients (
                id_stock_ingredients INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT stockingredients_pk PRIMARY KEY (id_stock_ingredients)
);


CREATE SEQUENCE public.client_id_client_seq;

CREATE TABLE public.client (
                id_client INTEGER NOT NULL DEFAULT nextval('public.client_id_client_seq'),
                nom VARCHAR(50) NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                telephone VARCHAR NOT NULL,
                email VARCHAR(200) NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (id_client)
);


ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;

CREATE SEQUENCE public.adresse_id_adresse_seq;

CREATE TABLE public.adresse (
                id_adresse INTEGER NOT NULL DEFAULT nextval('public.adresse_id_adresse_seq'),
                id_client INTEGER NOT NULL,
                adresse_description VARCHAR NOT NULL,
                code_postal INTEGER NOT NULL,
                ville VARCHAR NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (id_adresse, id_client)
);


ALTER SEQUENCE public.adresse_id_adresse_seq OWNED BY public.adresse.id_adresse;

CREATE SEQUENCE public.commande_numero_commande_seq;

CREATE TABLE public.commande (
                id_client INTEGER NOT NULL,
                numero_commande INTEGER NOT NULL DEFAULT nextval('public.commande_numero_commande_seq'),
                quantite INTEGER NOT NULL,
                pizza_choisie INTEGER NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (id_client, numero_commande)
);


ALTER SEQUENCE public.commande_numero_commande_seq OWNED BY public.commande.numero_commande;

CREATE TABLE public.statutCommande (
                id_client INTEGER NOT NULL,
                numero_commande INTEGER NOT NULL,
                statut_pizza VARCHAR(50) NOT NULL,
                statut_paiement VARCHAR(50) NOT NULL,
                CONSTRAINT statutcommande_pk PRIMARY KEY (id_client, numero_commande)
);


CREATE TABLE public.reclamation (
                id_client INTEGER NOT NULL,
                nature VARCHAR(500) NOT NULL,
                numero_commande INTEGER NOT NULL,
                CONSTRAINT reclamation_pk PRIMARY KEY (id_client)
);


CREATE SEQUENCE public.commentaire_id_commentaire_seq;

CREATE TABLE public.commentaire (
                id_commentaire INTEGER NOT NULL DEFAULT nextval('public.commentaire_id_commentaire_seq'),
                avis VARCHAR(500) NOT NULL,
                note INTEGER NOT NULL,
                id_client INTEGER NOT NULL,
                numero_commande INTEGER NOT NULL,
                CONSTRAINT commentaire_pk PRIMARY KEY (id_commentaire)
);


ALTER SEQUENCE public.commentaire_id_commentaire_seq OWNED BY public.commentaire.id_commentaire;

CREATE TABLE public.paiement (
                id_client INTEGER NOT NULL,
                numero_commande INTEGER NOT NULL,
                moyenPaiement VARCHAR(50) NOT NULL,
                paye VARCHAR(3) NOT NULL,
                totalHT REAL NOT NULL,
                totalTTC REAL NOT NULL,
                CONSTRAINT paiement_pk PRIMARY KEY (id_client, numero_commande)
);


ALTER TABLE public.commande ADD CONSTRAINT pizza_commande_fk
FOREIGN KEY (pizza_choisie)
REFERENCES public.pizza (id_pizza)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ingredients ADD CONSTRAINT pizza_ingredients_fk
FOREIGN KEY (id_pizza)
REFERENCES public.pizza (id_pizza)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stockIngredients ADD CONSTRAINT ingredients_stockingredients_fk
FOREIGN KEY (id_stock_ingredients)
REFERENCES public.ingredients (id_ingredients)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (id_client)
REFERENCES public.client (id_client)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reclamation ADD CONSTRAINT client_reportbug_fk
FOREIGN KEY (id_client)
REFERENCES public.client (id_client)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (id_client)
REFERENCES public.client (id_client)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.paiement ADD CONSTRAINT commande_paiement_fk
FOREIGN KEY (id_client, numero_commande)
REFERENCES public.commande (id_client, numero_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commentaire ADD CONSTRAINT commande_commentaire_fk
FOREIGN KEY (numero_commande, id_client)
REFERENCES public.commande (numero_commande, id_client)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reclamation ADD CONSTRAINT commande_reclamation_fk
FOREIGN KEY (id_client, numero_commande)
REFERENCES public.commande (id_client, numero_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.statutCommande ADD CONSTRAINT commande_statutcommande_fk
FOREIGN KEY (id_client, numero_commande)
REFERENCES public.commande (id_client, numero_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
