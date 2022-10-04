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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_type text,
    diameter_in_light_years numeric(9,2),
    age_in_millions_of_years integer
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
    name character varying(20) NOT NULL,
    radius_in_km integer,
    planet_id integer NOT NULL,
    distance_from_planet integer
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
    name character varying(20) NOT NULL,
    has_life boolean,
    star_id integer NOT NULL,
    radius_in_km integer,
    has_moon boolean
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
-- Name: special_celestial_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.special_celestial_bodies (
    special_celestial_bodies_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type text
);


ALTER TABLE public.special_celestial_bodies OWNER TO freecodecamp;

--
-- Name: special_celestial_bodies_special_celestial_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.special_celestial_bodies_special_celestial_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.special_celestial_bodies_special_celestial_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: special_celestial_bodies_special_celestial_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.special_celestial_bodies_special_celestial_bodies_id_seq OWNED BY public.special_celestial_bodies.special_celestial_bodies_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    radius_in_km integer,
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_type text
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
-- Name: special_celestial_bodies special_celestial_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.special_celestial_bodies ALTER COLUMN special_celestial_bodies_id SET DEFAULT nextval('public.special_celestial_bodies_special_celestial_bodies_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'spiral', 110000.00, 10010000);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'irregular', 25.50, 215);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'elliptical', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Maffei I', 'elliptical', 75000.00, 10000);
INSERT INTO public.galaxy VALUES (5, 'Milky Way', 'spiral', 105700.00, 13610000);
INSERT INTO public.galaxy VALUES (6, 'Virgo A', 'supergiant elliptical', 7500000.00, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 1, 384400);
INSERT INTO public.moon VALUES (2, 'Deimos', 15, 4, 23458);
INSERT INTO public.moon VALUES (3, 'Phobos', 26, 4, 9378);
INSERT INTO public.moon VALUES (4, 'Amalthea', 262, 5, 181000);
INSERT INTO public.moon VALUES (5, 'Callisto', 4800, 5, 1883000);
INSERT INTO public.moon VALUES (6, 'Europa', 3130, 5, 671000);
INSERT INTO public.moon VALUES (7, 'Ganymede', 5270, 5, 1070000);
INSERT INTO public.moon VALUES (8, 'Io', 3640, 5, 422000);
INSERT INTO public.moon VALUES (9, 'Dione', 1120, 6, 377400);
INSERT INTO public.moon VALUES (10, 'Enceladus', 500, 6, 238020);
INSERT INTO public.moon VALUES (11, 'Hyperion', 370, 6, 1481100);
INSERT INTO public.moon VALUES (12, 'Iapetus', 718, 6, 3561300);
INSERT INTO public.moon VALUES (13, 'Mimas', 400, 6, 185520);
INSERT INTO public.moon VALUES (14, 'Phoebe', 210, 6, 12952000);
INSERT INTO public.moon VALUES (15, 'Rhea', 1528, 6, 527040);
INSERT INTO public.moon VALUES (16, 'Tethys', 1066, 6, 294660);
INSERT INTO public.moon VALUES (17, 'Titan', 5150, 6, 1221850);
INSERT INTO public.moon VALUES (18, 'Ariel', 1160, 7, 190900);
INSERT INTO public.moon VALUES (19, 'Miranda', 470, 7, 129800);
INSERT INTO public.moon VALUES (20, 'Oberon', 1522, 7, 582600);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 7, 6371, true);
INSERT INTO public.planet VALUES (2, 'Mercury', false, 7, 4878, false);
INSERT INTO public.planet VALUES (3, 'Venus', false, 7, 12104, false);
INSERT INTO public.planet VALUES (4, 'Mars', false, 7, 6787, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 7, 139822, true);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 7, 120500, true);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 7, 51120, true);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 7, 49530, true);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 7, 2301, true);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri B', false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Wolf 359', false, 1, 1350000, NULL);
INSERT INTO public.planet VALUES (12, 'Epsilon Eridani b', false, 3, 264000000, true);


--
-- Data for Name: special_celestial_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.special_celestial_bodies VALUES (1, 'NGC1023', 'Black hole');
INSERT INTO public.special_celestial_bodies VALUES (2, 'PJ352-15', 'Quasar');
INSERT INTO public.special_celestial_bodies VALUES (3, 'Chicxulub', 'Meteorite');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1877850, 'Alpheratz', 1, 1, 'B');
INSERT INTO public.star VALUES (69570, 'Mirach', 2, 1, 'M0 III');
INSERT INTO public.star VALUES (1190300, 'Sirius A', 3, 2, 'A0');
INSERT INTO public.star VALUES (9670200, 'Adhara', 4, 2, 'B2 II');
INSERT INTO public.star VALUES (141230000, 'Deneb', 5, 3, 'A2 Ia');
INSERT INTO public.star VALUES (43121000, 'Albireo', 6, 3, 'K2 II');
INSERT INTO public.star VALUES (696340, 'Sun', 7, 5, 'Yellow Dwarf');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: special_celestial_bodies_special_celestial_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.special_celestial_bodies_special_celestial_bodies_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: special_celestial_bodies special_celestial_bodies_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.special_celestial_bodies
    ADD CONSTRAINT special_celestial_bodies_id PRIMARY KEY (special_celestial_bodies_id);


--
-- Name: special_celestial_bodies special_celestial_bodies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.special_celestial_bodies
    ADD CONSTRAINT special_celestial_bodies_name_key UNIQUE (name);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

