--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    galaxy_type character varying(20),
    distance_from_earth integer,
    number_of_stars integer
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
    name character varying(30),
    planet_id integer NOT NULL,
    discovery_year integer,
    mass_in_kg numeric,
    distance_from_planet double precision
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
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
    position_from_sun integer NOT NULL,
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constallation character varying(50),
    spectral_type character varying(20),
    age_years integer,
    galaxy_id integer NOT NULL
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 10000, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 3, 100);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Sprial', 30000000, 500);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Eliptical', 56, 30000);
INSERT INTO public.galaxy VALUES (5, 'Large Megalenic cloud', 'Irregular', 163000, 100);
INSERT INTO public.galaxy VALUES (6, 'Small Megallenic Cloud', 'Irregular', 20000, 400);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, NULL, 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Moon', 3, 1000, 73500000000000000000000, 384400);
INSERT INTO public.moon VALUES (5, 'Phobos', 4, 1877, 7300000000000, 9376);
INSERT INTO public.moon VALUES (6, 'Deinmos', 4, 1877, 10000000000000000000000, 8773);
INSERT INTO public.moon VALUES (7, 'Io', 5, 1990, 0, 1688);
INSERT INTO public.moon VALUES (8, 'Europa', 5, 1990, 0, 1822);
INSERT INTO public.moon VALUES (9, 'Ganymede', 5, 1990, 0, 1823);
INSERT INTO public.moon VALUES (10, 'Callisto', 5, 1990, 0, 1834);
INSERT INTO public.moon VALUES (11, 'Titan', 6, 2001, 110, 1773);
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, 2003, 0, 1783);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 2003, 0, 1883);
INSERT INTO public.moon VALUES (14, 'Rhea', 6, 2001, 201444444, 1500);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 1988, 0, 1655);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 1987, 201444444, 1600);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1988, 0, 1865);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1988, 2014448, 1900);
INSERT INTO public.moon VALUES (19, 'Charon', 9, 1691, 0, 1778);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1589, 1000000000000, 16689);
INSERT INTO public.moon VALUES (21, 'Hydra', 9, 2004, 0, 1888);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 'Fartherst planet from the sun', 8, 5);
INSERT INTO public.planet VALUES (9, 'Pluto', false, false, 'A dwarf planet located at the kubier belt', 9, 5);
INSERT INTO public.planet VALUES (10, 'Ceres', false, false, 'The largest object in the asteroid belt', 10, 5);
INSERT INTO public.planet VALUES (11, 'Haumea', false, false, 'A dwarf planet located beyond neptune', 11, 5);
INSERT INTO public.planet VALUES (12, 'Makemake', false, false, 'A planet discovered in 2005', 12, 5);
INSERT INTO public.planet VALUES (1, 'Mercury', false, false, 'Smalllest and closet to the sun. Extreme temperature variation', 1, 5);
INSERT INTO public.planet VALUES (2, 'Venus', false, true, 'Often called earth sisterdue to it similar size and composition', 2, 5);
INSERT INTO public.planet VALUES (4, 'Mars', false, true, 'Often called the red planet due to its redish appearance', 4, 5);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 'Known as the largest planet in the solar system', 5, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 'Known for its prominent ring system', 6, 5);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 'Unusual rotational axis', 7, 5);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 'The only planet that supports life', 3, 5);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 1);
INSERT INTO public.planet_types VALUES (2, 'Terrestrial', 2);
INSERT INTO public.planet_types VALUES (3, 'Terrestrial', 3);
INSERT INTO public.planet_types VALUES (4, 'Terrestrial', 4);
INSERT INTO public.planet_types VALUES (5, 'Gas Giant', 5);
INSERT INTO public.planet_types VALUES (6, 'Gas Giant', 6);
INSERT INTO public.planet_types VALUES (7, 'Ice Giant', 7);
INSERT INTO public.planet_types VALUES (8, 'Ice Giant', 8);
INSERT INTO public.planet_types VALUES (9, 'Dwarf', 9);
INSERT INTO public.planet_types VALUES (10, 'Dwarf', 10);
INSERT INTO public.planet_types VALUES (11, 'Dwarf', 11);
INSERT INTO public.planet_types VALUES (12, 'Dwarf', 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'Sun', 'N/A', 'G2V', 5, 1);
INSERT INTO public.star VALUES (6, 'Sirius', 'Canis Major', 'A1V', 3, 1);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 'Centaurus', 'G2V', 6, 1);
INSERT INTO public.star VALUES (8, 'Alpha Centauris B', 'Centaur', 'KOV', 6, 1);
INSERT INTO public.star VALUES (9, 'Beltelguese', 'Gvv', 'M1_2Ia', 5, 1);
INSERT INTO public.star VALUES (10, 'Roxima Centuri', 'Canis', 'M5.5VE', 4, 1);
INSERT INTO public.star VALUES (11, 'Alpha Centauri C', 'Centos', 'M1V', 2, 1);
INSERT INTO public.star VALUES (12, 'Benard Star', 'Orion', 'M4V', 9, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: moon distance_from_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT distance_from_planet UNIQUE (distance_from_planet);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_types name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT name UNIQUE (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_position_from_sun_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_position_from_sun_key UNIQUE (position_from_sun);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_constallation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constallation_key UNIQUE (constallation);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: planet_types planet_types_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

