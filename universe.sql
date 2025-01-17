--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_galaxies integer,
    size integer,
    distance numeric
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_stars_in_billion integer,
    year_of_discovery integer,
    distance_in_million_light_years numeric,
    constellation text,
    has_life boolean,
    visited boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_sister_moons integer,
    year_of_discovery integer,
    distance numeric,
    father_planet text,
    has_life boolean,
    visited boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_moons integer,
    year_of_discovery integer,
    distance numeric,
    type text,
    has_life boolean,
    visited boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_planets integer,
    year_of_discovery integer,
    distance numeric,
    type text,
    has_life boolean,
    visited boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Proxima', 1000, 10000, 500.1);
INSERT INTO public.cluster VALUES (2, 'Maxima', 99999, 99999, 9999.9);
INSERT INTO public.cluster VALUES (3, 'Minima', 1, 1, 1.0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 1610, 0, 'N/A', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, 964, 2537, 'Andromeda', false, false);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 10000, 1785, 45, 'Corvus', false, false);
INSERT INTO public.galaxy VALUES (4, 'Backward', 1000, 1990, 111, 'Centaurus', false, false);
INSERT INTO public.galaxy VALUES (5, 'Bear Paw', 100, 1894, 17, 'Lynx', false, false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 100, 1779, 17, 'Coma Berenices', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Abydos', 0, 1994, 1000, 'P3X-595', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Arda', 1, 1937, 1000, 'Ea', true, true, 1);
INSERT INTO public.moon VALUES (3, 'Caladan', 2, 1965, 1000, 'Ecaz', true, true, 1);
INSERT INTO public.moon VALUES (4, 'Dantooine', 0, 1977, 39, 'Oseon', false, false, 1);
INSERT INTO public.moon VALUES (5, 'Endor', 9, 1983, 4.37, 'Forest Moon of Endor', false, true, 1);
INSERT INTO public.moon VALUES (6, 'Europa', 0, 1610, 628000, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (7, 'Hyperion', 0, 1848, 1500000, 'Saturn', false, false, 1);
INSERT INTO public.moon VALUES (8, 'Io', 0, 1610, 628, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (9, 'Janus', 0, 1999, 1000, 'P3X-774', true, false, 1);
INSERT INTO public.moon VALUES (10, 'Luna', 0, 0, 0.238, 'Earth', false, true, 1);
INSERT INTO public.moon VALUES (11, 'Mimas', 0, 1789, 792000, 'Saturn', false, false, 1);
INSERT INTO public.moon VALUES (12, 'Pandora', 3, 2009, 4.37, 'Polyphemus', true, true, 1);
INSERT INTO public.moon VALUES (13, 'Phobos', 0, 1877, 34.8, 'Mars', false, false, 1);
INSERT INTO public.moon VALUES (14, 'Rhea', 0, 1672, 949000, 'Saturn', false, false, 1);
INSERT INTO public.moon VALUES (15, 'Titan', 0, 1655, 759000, 'Saturn', false, false, 1);
INSERT INTO public.moon VALUES (16, 'Triton', 0, 1846, 2700, 'Neptune', false, false, 1);
INSERT INTO public.moon VALUES (17, 'Umbriel', 0, 1851, 1266, 'Uranus', false, false, 1);
INSERT INTO public.moon VALUES (18, 'Yavin IV', 26, 1977, 10000, 'Yavin', false, false, 1);
INSERT INTO public.moon VALUES (19, 'Zhadum', 0, 1994, 1000, 'Epsilon Eridani', false, false, 1);
INSERT INTO public.moon VALUES (20, 'Kharax', 0, 1999, 1000, 'P3X-774', true, true, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Arrakis', 2, 1965, 1000, 'Desert', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Cybertron', 2, 1984, 4000, 'Gaseous', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Gallifrey', 2, 1969, 250000, 'Rocky', true, false, 1);
INSERT INTO public.planet VALUES (4, 'Hoth', 3, 1980, 1000, 'Ice', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Krypton', 2, 1938, 27.1, 'Rocky', true, false, 1);
INSERT INTO public.planet VALUES (6, 'LV-426', 1, 1979, 39, 'Rocky', false, false, 1);
INSERT INTO public.planet VALUES (7, 'Pandora', 3, 2009, 4.37, 'Forest', true, true, 1);
INSERT INTO public.planet VALUES (8, 'Tatooine', 3, 1977, 49.9, 'Desert', true, true, 1);
INSERT INTO public.planet VALUES (9, 'Tralfamadore', 1, 1969, 1000, 'Gaseous', false, false, 1);
INSERT INTO public.planet VALUES (10, 'Vulcan', 0, 1966, 1000, 'Rocky', true, true, 1);
INSERT INTO public.planet VALUES (11, 'Yavin', 26, 1977, 1000, 'Forest', true, true, 1);
INSERT INTO public.planet VALUES (12, 'Zog', 1, 1936, 1000, 'Gaseous', true, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 1, 2016, 4.24, 'M5.5Ve', false, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 2016, 4.37, 'G2V', false, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 2016, 4.37, 'K0V', false, false, 1);
INSERT INTO public.star VALUES (4, 'Barnards Star', 0, 1916, 5.96, 'M4V', false, false, 1);
INSERT INTO public.star VALUES (5, 'Wolf 359', 0, 1917, 7.78, 'M6.5V', false, false, 1);
INSERT INTO public.star VALUES (6, 'Lalande 21185', 0, 1801, 8.29, 'M2V', false, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: cluster cluster_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_cluster_id_key UNIQUE (cluster_id);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon planetfkd; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planetfkd FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
