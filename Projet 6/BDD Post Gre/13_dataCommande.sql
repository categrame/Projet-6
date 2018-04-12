--
-- TOC entry 2887 (class 0 OID 24943)
-- Dependencies: 206
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.commande VALUES (1, 1, 1, 7);
INSERT INTO public.commande VALUES (2, 2, 1, 1);
INSERT INTO public.commande VALUES (2, 3, 1, 4);
INSERT INTO public.commande VALUES (3, 4, 2, 2);
INSERT INTO public.commande VALUES (3, 5, 1, 1);
INSERT INTO public.commande VALUES (3, 6, 3, 6);
INSERT INTO public.commande VALUES (4, 7, 1, 8);
INSERT INTO public.commande VALUES (5, 8, 2, 8);

--
-- TOC entry 2888 (class 0 OID 24949)
-- Dependencies: 207
-- Data for Name: statutcommande; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.statutcommande VALUES (1, 1, 'Terminé', 'Payé');
INSERT INTO public.statutcommande VALUES (3, 4, 'En cours', 'Payé en ligne');
INSERT INTO public.statutcommande VALUES (3, 5, 'En cours', 'Payé en ligne');
INSERT INTO public.statutcommande VALUES (3, 6, 'En cours', 'Payé en ligne');
INSERT INTO public.statutcommande VALUES (2, 2, 'Terminé', 'Paiement à la réception');
INSERT INTO public.statutcommande VALUES (2, 3, 'Terminé', 'Paiement à la réception');
INSERT INTO public.statutcommande VALUES (4, 7, 'Annulation', 'Paiement annulé');
INSERT INTO public.statutcommande VALUES (5, 8, 'Modification demandée', 'Paiement en ligne');

