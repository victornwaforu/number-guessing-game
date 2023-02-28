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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    games_id integer NOT NULL,
    number_of_guesses integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_games_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_games_id_seq OWNER TO freecodecamp;

--
-- Name: games_games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_games_id_seq OWNED BY public.games.games_id;


--
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Name: usernames_users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usernames_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usernames_users_id_seq OWNER TO freecodecamp;

--
-- Name: usernames_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usernames_users_id_seq OWNED BY public.usernames.user_id;


--
-- Name: games games_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN games_id SET DEFAULT nextval('public.games_games_id_seq'::regclass);


--
-- Name: usernames user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames ALTER COLUMN user_id SET DEFAULT nextval('public.usernames_users_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 17, 5);
INSERT INTO public.games VALUES (2, 10, 6);
INSERT INTO public.games VALUES (3, 8, 6);
INSERT INTO public.games VALUES (4, 190, 7);
INSERT INTO public.games VALUES (5, 554, 7);
INSERT INTO public.games VALUES (6, 456, 8);
INSERT INTO public.games VALUES (7, 707, 8);
INSERT INTO public.games VALUES (8, 732, 7);
INSERT INTO public.games VALUES (9, 19, 7);
INSERT INTO public.games VALUES (10, 991, 7);
INSERT INTO public.games VALUES (11, 368, 9);
INSERT INTO public.games VALUES (12, 130, 9);
INSERT INTO public.games VALUES (13, 188, 10);
INSERT INTO public.games VALUES (14, 696, 10);
INSERT INTO public.games VALUES (15, 714, 9);
INSERT INTO public.games VALUES (16, 35, 9);
INSERT INTO public.games VALUES (17, 59, 9);
INSERT INTO public.games VALUES (18, 11, 3);
INSERT INTO public.games VALUES (19, 294, 11);
INSERT INTO public.games VALUES (20, 979, 11);
INSERT INTO public.games VALUES (21, 667, 12);
INSERT INTO public.games VALUES (22, 988, 12);
INSERT INTO public.games VALUES (23, 17, 11);
INSERT INTO public.games VALUES (24, 629, 11);
INSERT INTO public.games VALUES (25, 855, 11);


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES (1, 'user_1677587660453');
INSERT INTO public.usernames VALUES (2, 'user_1677587660452');
INSERT INTO public.usernames VALUES (3, 'Victor');
INSERT INTO public.usernames VALUES (4, 'Ugo');
INSERT INTO public.usernames VALUES (5, 'bob');
INSERT INTO public.usernames VALUES (6, 'Nwafor');
INSERT INTO public.usernames VALUES (7, 'user_1677591287957');
INSERT INTO public.usernames VALUES (8, 'user_1677591287956');
INSERT INTO public.usernames VALUES (9, 'user_1677591474717');
INSERT INTO public.usernames VALUES (10, 'user_1677591474716');
INSERT INTO public.usernames VALUES (11, 'user_1677592159299');
INSERT INTO public.usernames VALUES (12, 'user_1677592159298');


--
-- Name: games_games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_games_id_seq', 25, true);


--
-- Name: usernames_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usernames_users_id_seq', 12, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (games_id);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.usernames(user_id);


--
-- PostgreSQL database dump complete
--

