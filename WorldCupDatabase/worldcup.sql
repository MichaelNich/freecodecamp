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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (195, 2018, 'Final', 4, 2, 931, 932);
INSERT INTO public.games VALUES (196, 2018, 'Third Place', 2, 0, 933, 934);
INSERT INTO public.games VALUES (197, 2018, 'Semi-Final', 2, 1, 932, 934);
INSERT INTO public.games VALUES (198, 2018, 'Semi-Final', 1, 0, 931, 933);
INSERT INTO public.games VALUES (199, 2018, 'Quarter-Final', 3, 2, 932, 940);
INSERT INTO public.games VALUES (200, 2018, 'Quarter-Final', 2, 0, 934, 942);
INSERT INTO public.games VALUES (201, 2018, 'Quarter-Final', 2, 1, 933, 944);
INSERT INTO public.games VALUES (202, 2018, 'Quarter-Final', 2, 0, 931, 946);
INSERT INTO public.games VALUES (203, 2018, 'Eighth-Final', 2, 1, 934, 948);
INSERT INTO public.games VALUES (204, 2018, 'Eighth-Final', 1, 0, 942, 950);
INSERT INTO public.games VALUES (205, 2018, 'Eighth-Final', 3, 2, 933, 952);
INSERT INTO public.games VALUES (206, 2018, 'Eighth-Final', 2, 0, 944, 954);
INSERT INTO public.games VALUES (207, 2018, 'Eighth-Final', 2, 1, 932, 956);
INSERT INTO public.games VALUES (208, 2018, 'Eighth-Final', 2, 1, 940, 958);
INSERT INTO public.games VALUES (209, 2018, 'Eighth-Final', 2, 1, 946, 960);
INSERT INTO public.games VALUES (210, 2018, 'Eighth-Final', 4, 3, 931, 962);
INSERT INTO public.games VALUES (211, 2014, 'Final', 1, 0, 963, 962);
INSERT INTO public.games VALUES (212, 2014, 'Third Place', 3, 0, 965, 944);
INSERT INTO public.games VALUES (213, 2014, 'Semi-Final', 1, 0, 962, 965);
INSERT INTO public.games VALUES (214, 2014, 'Semi-Final', 7, 1, 963, 944);
INSERT INTO public.games VALUES (215, 2014, 'Quarter-Final', 1, 0, 965, 972);
INSERT INTO public.games VALUES (216, 2014, 'Quarter-Final', 1, 0, 962, 933);
INSERT INTO public.games VALUES (217, 2014, 'Quarter-Final', 2, 1, 944, 948);
INSERT INTO public.games VALUES (218, 2014, 'Quarter-Final', 1, 0, 963, 931);
INSERT INTO public.games VALUES (219, 2014, 'Eighth-Final', 2, 1, 944, 980);
INSERT INTO public.games VALUES (220, 2014, 'Eighth-Final', 2, 0, 948, 946);
INSERT INTO public.games VALUES (221, 2014, 'Eighth-Final', 2, 0, 931, 984);
INSERT INTO public.games VALUES (222, 2014, 'Eighth-Final', 2, 1, 963, 986);
INSERT INTO public.games VALUES (223, 2014, 'Eighth-Final', 2, 1, 965, 954);
INSERT INTO public.games VALUES (224, 2014, 'Eighth-Final', 2, 1, 972, 990);
INSERT INTO public.games VALUES (225, 2014, 'Eighth-Final', 1, 0, 962, 950);
INSERT INTO public.games VALUES (226, 2014, 'Eighth-Final', 2, 1, 933, 994);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (931, 'France');
INSERT INTO public.teams VALUES (932, 'Croatia');
INSERT INTO public.teams VALUES (933, 'Belgium');
INSERT INTO public.teams VALUES (934, 'England');
INSERT INTO public.teams VALUES (940, 'Russia');
INSERT INTO public.teams VALUES (942, 'Sweden');
INSERT INTO public.teams VALUES (944, 'Brazil');
INSERT INTO public.teams VALUES (946, 'Uruguay');
INSERT INTO public.teams VALUES (948, 'Colombia');
INSERT INTO public.teams VALUES (950, 'Switzerland');
INSERT INTO public.teams VALUES (952, 'Japan');
INSERT INTO public.teams VALUES (954, 'Mexico');
INSERT INTO public.teams VALUES (956, 'Denmark');
INSERT INTO public.teams VALUES (958, 'Spain');
INSERT INTO public.teams VALUES (960, 'Portugal');
INSERT INTO public.teams VALUES (962, 'Argentina');
INSERT INTO public.teams VALUES (963, 'Germany');
INSERT INTO public.teams VALUES (965, 'Netherlands');
INSERT INTO public.teams VALUES (972, 'Costa Rica');
INSERT INTO public.teams VALUES (980, 'Chile');
INSERT INTO public.teams VALUES (984, 'Nigeria');
INSERT INTO public.teams VALUES (986, 'Algeria');
INSERT INTO public.teams VALUES (990, 'Greece');
INSERT INTO public.teams VALUES (994, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 226, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 994, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

