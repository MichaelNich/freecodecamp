--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: player; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.player OWNER TO freecodecamp;

--
-- Name: player_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_user_id_seq OWNER TO freecodecamp;

--
-- Name: player_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_user_id_seq OWNED BY public.player.user_id;


--
-- Name: player user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player ALTER COLUMN user_id SET DEFAULT nextval('public.player_user_id_seq'::regclass);


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player VALUES (1, 'Blue', 1, 12);
INSERT INTO public.player VALUES (2, 'user_1682836022051', 1, 442);
INSERT INTO public.player VALUES (3, 'user_1682836022050', 1, 126);
INSERT INTO public.player VALUES (4, 'Jonas', 1, 10);
INSERT INTO public.player VALUES (5, 'user_1682836107709', 1, 969);
INSERT INTO public.player VALUES (6, 'user_1682836107708', 1, 406);
INSERT INTO public.player VALUES (7, 'user_1682841426309', 1, 60);
INSERT INTO public.player VALUES (8, 'user_1682841426308', 1, 257);
INSERT INTO public.player VALUES (9, 'user_1682842735660', 1, 91);
INSERT INTO public.player VALUES (10, 'user_1682842735659', 1, 527);
INSERT INTO public.player VALUES (11, 'user_1682842765836', 1, 463);
INSERT INTO public.player VALUES (12, 'user_1682842765835', 1, 638);
INSERT INTO public.player VALUES (13, 'user_1682843067519', 1, 9);
INSERT INTO public.player VALUES (14, 'user_1682843067518', 1, 235);
INSERT INTO public.player VALUES (15, 'user_1682843289462', 1, 935);
INSERT INTO public.player VALUES (16, 'user_1682843289461', 1, 596);
INSERT INTO public.player VALUES (17, 'user_1682843298113', 1, 553);
INSERT INTO public.player VALUES (18, 'user_1682843298112', 1, 369);
INSERT INTO public.player VALUES (19, 'user_1682843302486', 1, 856);
INSERT INTO public.player VALUES (20, 'user_1682843302485', 1, 677);
INSERT INTO public.player VALUES (21, 'user_1682843307542', 1, 550);
INSERT INTO public.player VALUES (22, 'user_1682843307541', 1, 398);
INSERT INTO public.player VALUES (23, 'user_1682843311568', 1, 791);
INSERT INTO public.player VALUES (24, 'user_1682843311567', 1, 271);
INSERT INTO public.player VALUES (25, 'user_1682843449898', 1, 590);
INSERT INTO public.player VALUES (26, 'user_1682843449897', 1, 568);
INSERT INTO public.player VALUES (27, 'billy', 1, 15);
INSERT INTO public.player VALUES (29, 'user_1682843869206', 1, 267);
INSERT INTO public.player VALUES (30, 'user_1682843869205', 1, 431);
INSERT INTO public.player VALUES (31, 'user_1682844041909', 1, 499);
INSERT INTO public.player VALUES (32, 'user_1682844041908', 1, 846);
INSERT INTO public.player VALUES (33, 'user_1682844061849', 1, 286);
INSERT INTO public.player VALUES (34, 'user_1682844061848', 1, 27);
INSERT INTO public.player VALUES (35, 'user_1682844745416', 1, 818);
INSERT INTO public.player VALUES (36, 'user_1682844745415', 1, 667);
INSERT INTO public.player VALUES (37, 'user_1682844844228', 1, 778);
INSERT INTO public.player VALUES (38, 'user_1682844844227', 1, 865);
INSERT INTO public.player VALUES (39, 'fgdfg', 1, 12);
INSERT INTO public.player VALUES (40, 'user_1682845107830', 1, 600);
INSERT INTO public.player VALUES (41, 'user_1682845107829', 1, 132);
INSERT INTO public.player VALUES (42, 'user_1682846154001', 1, 503);
INSERT INTO public.player VALUES (43, 'user_1682846154000', 1, 74);
INSERT INTO public.player VALUES (44, 'user_1682848529602', 1, 455);
INSERT INTO public.player VALUES (45, 'user_1682848529601', 1, 775);
INSERT INTO public.player VALUES (46, 'user_1682848597691', 1, 211);
INSERT INTO public.player VALUES (47, 'user_1682848597690', 1, 654);
INSERT INTO public.player VALUES (48, '', 1, 9);
INSERT INTO public.player VALUES (66, 'user_1682852502784', 2, 820);
INSERT INTO public.player VALUES (50, 'user_1682851230603', 2, 2);
INSERT INTO public.player VALUES (65, 'user_1682852502785', 5, 109);
INSERT INTO public.player VALUES (49, 'user_1682851230604', 5, 3);
INSERT INTO public.player VALUES (52, 'user_1682851251162', 2, 95);
INSERT INTO public.player VALUES (68, 'user_1682852529154', 2, 231);
INSERT INTO public.player VALUES (51, 'user_1682851251163', 5, 246);
INSERT INTO public.player VALUES (67, 'user_1682852529155', 5, 563);
INSERT INTO public.player VALUES (54, 'user_1682851296136', 2, 41);
INSERT INTO public.player VALUES (53, 'user_1682851296137', 5, 46);
INSERT INTO public.player VALUES (56, 'user_1682851701583', 2, 381);
INSERT INTO public.player VALUES (70, 'user_1682852578309', 2, 41);
INSERT INTO public.player VALUES (55, 'user_1682851701584', 5, 20);
INSERT INTO public.player VALUES (58, 'user_1682851893787', 2, 485);
INSERT INTO public.player VALUES (69, 'user_1682852578310', 5, 56);
INSERT INTO public.player VALUES (57, 'user_1682851893788', 5, 117);
INSERT INTO public.player VALUES (60, 'user_1682852330466', 2, 595);
INSERT INTO public.player VALUES (72, 'user_1682852631106', 2, 668);
INSERT INTO public.player VALUES (59, 'user_1682852330467', 5, 115);
INSERT INTO public.player VALUES (71, 'user_1682852631107', 5, 395);
INSERT INTO public.player VALUES (62, 'user_1682852396726', 2, 210);
INSERT INTO public.player VALUES (28, 'Michael', 3, 1);
INSERT INTO public.player VALUES (61, 'user_1682852396727', 5, 137);
INSERT INTO public.player VALUES (64, 'user_1682852495006', 2, 151);
INSERT INTO public.player VALUES (63, 'user_1682852495007', 5, 41);


--
-- Name: player_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_user_id_seq', 72, true);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (user_id);


--
-- Name: player player_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

