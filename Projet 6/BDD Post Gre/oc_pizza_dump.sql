--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2018-03-30 16:02:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 17165)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom character varying(50) NOT NULL,
    prenom character varying(50) NOT NULL,
    adresse character varying(200) NOT NULL,
    code_postal integer NOT NULL,
    ville character varying(200) NOT NULL,
    telephone integer NOT NULL,
    email character varying(200) NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17163)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_client_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_client_seq OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 201
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 204 (class 1259 OID 17176)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    id_client integer NOT NULL,
    numero_commande integer NOT NULL,
    quantite integer NOT NULL,
    pizza_choisie integer NOT NULL
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17174)
-- Name: commande_numero_commande_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commande_numero_commande_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commande_numero_commande_seq OWNER TO postgres;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 203
-- Name: commande_numero_commande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commande_numero_commande_seq OWNED BY public.commande.numero_commande;


--
-- TOC entry 208 (class 1259 OID 17202)
-- Name: commentaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commentaire (
    id_commentaire integer NOT NULL,
    avis character varying(500) NOT NULL,
    note integer NOT NULL,
    id_client integer NOT NULL,
    numero_commande integer NOT NULL
);


ALTER TABLE public.commentaire OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17200)
-- Name: commentaire_id_commentaire_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commentaire_id_commentaire_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commentaire_id_commentaire_seq OWNER TO postgres;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 207
-- Name: commentaire_id_commentaire_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commentaire_id_commentaire_seq OWNED BY public.commentaire.id_commentaire;


--
-- TOC entry 199 (class 1259 OID 17152)
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredients (
    id_ingredients integer NOT NULL,
    nom character varying(100) NOT NULL,
    id_pizza integer NOT NULL
);


ALTER TABLE public.ingredients OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17150)
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO postgres;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 198
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id_ingredients;


--
-- TOC entry 209 (class 1259 OID 17211)
-- Name: paiement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paiement (
    id_client integer NOT NULL,
    numero_commande integer NOT NULL,
    moyenpaiement character varying(50) NOT NULL,
    paye character varying(3) NOT NULL,
    totalht real NOT NULL,
    totalttc real NOT NULL
);


ALTER TABLE public.paiement OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 17144)
-- Name: pizza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza (
    id_pizza integer NOT NULL,
    disponible character varying(3) NOT NULL,
    nom character varying(100) NOT NULL,
    prix real NOT NULL
);


ALTER TABLE public.pizza OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17142)
-- Name: pizza_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizza_id_seq OWNER TO postgres;

--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 196
-- Name: pizza_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id_pizza;


--
-- TOC entry 206 (class 1259 OID 17192)
-- Name: reclamation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reclamation (
    id_client integer NOT NULL,
    nature character varying(500) NOT NULL,
    numero_commande integer NOT NULL
);


ALTER TABLE public.reclamation OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17187)
-- Name: statutcommande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statutcommande (
    id_client integer NOT NULL,
    numero_commande integer NOT NULL,
    statut_pizza character varying(50) NOT NULL,
    statut_paiement character varying(50) NOT NULL
);


ALTER TABLE public.statutcommande OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17158)
-- Name: stockingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stockingredients (
    id_stock_ingredients integer NOT NULL,
    quantite integer NOT NULL
);


ALTER TABLE public.stockingredients OWNER TO postgres;

--
-- TOC entry 2715 (class 2604 OID 17168)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 2716 (class 2604 OID 17179)
-- Name: commande numero_commande; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande ALTER COLUMN numero_commande SET DEFAULT nextval('public.commande_numero_commande_seq'::regclass);


--
-- TOC entry 2717 (class 2604 OID 17205)
-- Name: commentaire id_commentaire; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire ALTER COLUMN id_commentaire SET DEFAULT nextval('public.commentaire_id_commentaire_seq'::regclass);


--
-- TOC entry 2714 (class 2604 OID 17155)
-- Name: ingredients id_ingredients; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id_ingredients SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- TOC entry 2713 (class 2604 OID 17147)
-- Name: pizza id_pizza; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza ALTER COLUMN id_pizza SET DEFAULT nextval('public.pizza_id_seq'::regclass);


--
-- TOC entry 2872 (class 0 OID 17165)
-- Dependencies: 202
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id_client, nom, prenom, adresse, code_postal, ville, telephone, email) FROM stdin;
1	Gaucher	Martin	Le bourg	61700	La Haute chapelle	233382052	gaucher_martin@yahoo.fr
2	Nédélec	Stéphane	115 rue Vaugirard	95740	Paris	652431475	nedelec.s@ocr.fr
3	Mollet	Robin	52 rue Auteuil	41000	Blois	65874259	mollet.robin@gmail.com
4	Foubert	Erwan	rue église	61050	Alençonnay	258965741	foubert_teacher@ac_caen.fr
5	Roulleaux	Rémi	le frêne	61700	Domfront en Poiraie	68586952	roulleaux.compresseur@yahoo.fr
\.


--
-- TOC entry 2874 (class 0 OID 17176)
-- Dependencies: 204
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande (id_client, numero_commande, quantite, pizza_choisie) FROM stdin;
1	1	1	7
2	2	1	1
2	3	1	4
3	4	2	2
3	5	1	1
3	6	3	6
4	7	1	8
5	8	2	8
\.


--
-- TOC entry 2878 (class 0 OID 17202)
-- Dependencies: 208
-- Data for Name: commentaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commentaire (id_commentaire, avis, note, id_client, numero_commande) FROM stdin;
1	Excellentes pizza !	5	1	1
2	Timing commande et réception correct, de bonnes pizzas	4	3	4
3	Pizzas moyennes	3	2	2
\.


--
-- TOC entry 2869 (class 0 OID 17152)
-- Dependencies: 199
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients (id_ingredients, nom, id_pizza) FROM stdin;
1	Sauce tomate	1
2	Sauce tomate	2
3	Sauce tomate	3
4	Sauce tomate	4
5	Sauce tomate	5
6	Sauce tomate	6
7	Sauce tomate	7
8	Sauce tomate	8
9	Olives entières	1
10	Olives entières	2
11	Olives entières	3
12	Olives entières	4
13	Olives entières	5
14	Olives entières	6
15	Olives entières	7
16	Olives entières	8
17	Anchoix	1
18	Gruyère	1
19	Gruyère	2
20	Gruyère	3
21	Gruyère	4
22	Gruyère	5
23	Gruyère	6
24	Gruyère	7
25	Gruyère	8
26	Oignons	2
27	Oignons	5
28	Oignons	6
29	Andouille de guéméné	2
30	Moutarde ancienne	2
31	Champignons	3
32	Champignons	6
33	Chèvre	4
34	Chèvre	7
35	Poitrine fumée	4
36	Origan	4
37	Origan	7
38	Chorizo	5
39	Lardons	6
40	Crème fraîche	6
41	Roquefort	7
42	Mozarella	7
\.


--
-- TOC entry 2879 (class 0 OID 17211)
-- Dependencies: 209
-- Data for Name: paiement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paiement (id_client, numero_commande, moyenpaiement, paye, totalht, totalttc) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 17144)
-- Dependencies: 197
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizza (id_pizza, disponible, nom, prix) FROM stdin;
1	Oui	Pizza aux anchois	5.80000019
2	Oui	Andouille	7.80000019
3	Oui	Champignon	5.80000019
4	Oui	Chèvre	7.80000019
5	Oui	Chorizo	6.0999999
6	Oui	Forestière	7.80000019
7	Oui	4 fromages	7.80000019
8	Non	Jambon	5.80000019
\.


--
-- TOC entry 2876 (class 0 OID 17192)
-- Dependencies: 206
-- Data for Name: reclamation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reclamation (id_client, nature, numero_commande) FROM stdin;
4	Je ne peux pas payer ne ligne avec ma carte bancaire.	7
\.


--
-- TOC entry 2875 (class 0 OID 17187)
-- Dependencies: 205
-- Data for Name: statutcommande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statutcommande (id_client, numero_commande, statut_pizza, statut_paiement) FROM stdin;
1	1	Terminé	Payé
3	4	En cours	Payé en ligne
3	5	En cours	Payé en ligne
3	6	En cours	Payé en ligne
2	2	Terminé	Paiement à la réception
2	3	Terminé	Paiement à la réception
4	7	Annulation	Paiement annulé
5	8	Modification demandée	Paiement en ligne
\.


--
-- TOC entry 2870 (class 0 OID 17158)
-- Dependencies: 200
-- Data for Name: stockingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stockingredients (id_stock_ingredients, quantite) FROM stdin;
1	150
2	150
3	150
4	150
5	150
6	150
7	150
8	150
9	200
10	200
11	200
12	200
13	200
14	200
15	200
16	200
17	20
18	25
19	25
20	25
21	25
22	25
23	25
24	25
25	25
26	10
27	10
28	10
29	5
30	3
31	4
32	4
33	5
34	5
35	7
36	3
37	3
38	20
39	20
40	30
41	5
42	3
\.


--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 201
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_client_seq', 5, true);


--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 203
-- Name: commande_numero_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commande_numero_commande_seq', 8, true);


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 207
-- Name: commentaire_id_commentaire_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commentaire_id_commentaire_seq', 3, true);


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 198
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 42, true);


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 196
-- Name: pizza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizza_id_seq', 8, true);


--
-- TOC entry 2725 (class 2606 OID 17173)
-- Name: client client_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (id_client);


--
-- TOC entry 2727 (class 2606 OID 17181)
-- Name: commande commande_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (id_client, numero_commande);


--
-- TOC entry 2733 (class 2606 OID 17210)
-- Name: commentaire commentaire_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_pk PRIMARY KEY (id_commentaire);


--
-- TOC entry 2721 (class 2606 OID 17157)
-- Name: ingredients ingredients_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pk PRIMARY KEY (id_ingredients);


--
-- TOC entry 2735 (class 2606 OID 17215)
-- Name: paiement paiement_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT paiement_pk PRIMARY KEY (id_client, numero_commande);


--
-- TOC entry 2719 (class 2606 OID 17149)
-- Name: pizza pizza_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pk PRIMARY KEY (id_pizza);


--
-- TOC entry 2731 (class 2606 OID 17199)
-- Name: reclamation reclamation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reclamation
    ADD CONSTRAINT reclamation_pk PRIMARY KEY (id_client);


--
-- TOC entry 2729 (class 2606 OID 17191)
-- Name: statutcommande statutcommande_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statutcommande
    ADD CONSTRAINT statutcommande_pk PRIMARY KEY (id_client, numero_commande);


--
-- TOC entry 2723 (class 2606 OID 17162)
-- Name: stockingredients stockingredients_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockingredients
    ADD CONSTRAINT stockingredients_pk PRIMARY KEY (id_stock_ingredients);


--
-- TOC entry 2739 (class 2606 OID 17231)
-- Name: commande client_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT client_commande_fk FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 2741 (class 2606 OID 17236)
-- Name: reclamation client_reportbug_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reclamation
    ADD CONSTRAINT client_reportbug_fk FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 2743 (class 2606 OID 17246)
-- Name: commentaire commande_commentaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commande_commentaire_fk FOREIGN KEY (numero_commande, id_client) REFERENCES public.commande(numero_commande, id_client);


--
-- TOC entry 2744 (class 2606 OID 17241)
-- Name: paiement commande_paiement_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT commande_paiement_fk FOREIGN KEY (id_client, numero_commande) REFERENCES public.commande(id_client, numero_commande);


--
-- TOC entry 2742 (class 2606 OID 17251)
-- Name: reclamation commande_reclamation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reclamation
    ADD CONSTRAINT commande_reclamation_fk FOREIGN KEY (id_client, numero_commande) REFERENCES public.commande(id_client, numero_commande);


--
-- TOC entry 2740 (class 2606 OID 17256)
-- Name: statutcommande commande_statutcommande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statutcommande
    ADD CONSTRAINT commande_statutcommande_fk FOREIGN KEY (id_client, numero_commande) REFERENCES public.commande(id_client, numero_commande);


--
-- TOC entry 2737 (class 2606 OID 17226)
-- Name: stockingredients ingredients_stockingredients_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stockingredients
    ADD CONSTRAINT ingredients_stockingredients_fk FOREIGN KEY (id_stock_ingredients) REFERENCES public.ingredients(id_ingredients);


--
-- TOC entry 2738 (class 2606 OID 17216)
-- Name: commande pizza_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT pizza_commande_fk FOREIGN KEY (pizza_choisie) REFERENCES public.pizza(id_pizza);


--
-- TOC entry 2736 (class 2606 OID 17221)
-- Name: ingredients pizza_ingredients_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT pizza_ingredients_fk FOREIGN KEY (id_pizza) REFERENCES public.pizza(id_pizza);


-- Completed on 2018-03-30 16:02:49

--
-- PostgreSQL database dump complete
--

