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
-- Name: discoverer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoverer (
    discoverer_id integer NOT NULL,
    name character varying(255) NOT NULL,
    affiliation character varying(255),
    discovery_count integer DEFAULT 0,
    awards_count integer DEFAULT 0,
    is_active boolean NOT NULL,
    has_multiple_discoveries boolean NOT NULL,
    last_discovery_date date,
    iq numeric,
    bmi numeric,
    notes text,
    CONSTRAINT discoverer_bmi_check CHECK ((bmi >= (0)::numeric)),
    CONSTRAINT discoverer_iq_check CHECK ((iq >= (0)::numeric))
);


ALTER TABLE public.discoverer OWNER TO freecodecamp;

--
-- Name: discoverer_discoverer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discoverer_discoverer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discoverer_discoverer_id_seq OWNER TO freecodecamp;

--
-- Name: discoverer_discoverer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discoverer_discoverer_id_seq OWNED BY public.discoverer.discoverer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    discoverer_id integer,
    name character varying(255) NOT NULL,
    type character varying(50),
    distance numeric,
    mass numeric,
    diameter double precision,
    redshift double precision,
    number_of_stars integer,
    age integer,
    discovery_date date,
    notes text,
    is_visible boolean NOT NULL,
    has_supermassive_black_hole boolean NOT NULL
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
    discoverer_id integer,
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance numeric,
    mass numeric,
    diameter double precision,
    elevation integer,
    orbital_period integer,
    discovery_date date,
    notes text,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL
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
    discoverer_id integer,
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance numeric,
    mass numeric,
    diameter double precision,
    number_of_moons integer,
    age_in_millions_of_years integer,
    discovery_date date,
    notes text,
    has_life boolean NOT NULL,
    has_water boolean NOT NULL
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
    galaxy_id integer NOT NULL,
    discoverer_id integer,
    name character varying(255) NOT NULL,
    distance numeric,
    mass numeric,
    diameter double precision,
    number_of_planets integer,
    age integer,
    discovery_date date,
    notes text,
    is_visible boolean NOT NULL,
    has_millions_of_ages boolean NOT NULL
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
-- Name: discoverer discoverer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer ALTER COLUMN discoverer_id SET DEFAULT nextval('public.discoverer_discoverer_id_seq'::regclass);


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
-- Data for Name: discoverer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoverer VALUES (1, 'Dr. Alice Smith', 'NASA', 10, 2, true, true, '2023-05-01', 140, 22.5, 'Known for exoplanet discoveries.');
INSERT INTO public.discoverer VALUES (2, 'Prof. John Doe', 'Harvard University', 5, 1, true, false, '2022-11-15', 130, 25.0, 'Specializes in astrobiology.');
INSERT INTO public.discoverer VALUES (3, 'Dr. Emily White', 'MIT', 8, 3, true, true, '2023-01-10', 145, 21.0, 'Pioneer in exoplanet atmospheres.');
INSERT INTO public.discoverer VALUES (4, 'Dr. Robert Brown', 'Caltech', 4, 2, false, false, '2020-06-20', 135, 23.5, 'Researches stellar evolution.');
INSERT INTO public.discoverer VALUES (5, 'Prof. Sarah Green', 'Oxford University', 12, 4, true, true, '2023-03-15', 150, 24.0, 'Focuses on galaxy formation.');
INSERT INTO public.discoverer VALUES (6, 'Dr. Michael Johnson', 'SpaceX', 3, 1, true, false, '2021-12-01', 125, 26.0, 'Works on Mars colonization projects.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'Milky Way', 'Spiral', 0, 1.5, 100000, 0.002, 100000000, 13000, '1920-01-01', 'Contains our solar system.', true, true);
INSERT INTO public.galaxy VALUES (2, 2, 'Andromeda', 'Spiral', 2537000, 1.2, 220000, 0.001, 1000000000, 10000, '1785-01-01', 'Nearest large galaxy.', true, true);
INSERT INTO public.galaxy VALUES (3, 3, 'Triangulum', 'Spiral', 3000000, 0.5, 60000, 0.003, 40000000, 10000, '1850-01-01', 'Third-largest member of the Local Group.', true, true);
INSERT INTO public.galaxy VALUES (4, 4, 'Whirlpool', 'Spiral', 23000000, 1.0, 150000, 0.04, 100000000, 10000, '1773-01-01', 'Famous for its spiral structure.', true, true);
INSERT INTO public.galaxy VALUES (5, 5, 'Sombrero', 'Spiral', 28000000, 1.0, 50000, 0.03, 80000000, 10000, '1781-01-01', 'Known for its bright nucleus.', true, true);
INSERT INTO public.galaxy VALUES (6, 6, 'Cartwheel', 'Ring', 50000000, 0.5, 150000, 0.05, 20000000, 20000, '1941-01-01', 'Unique ring structure.', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 1, 'Moon', 384400, 0.073, 3474.8, 1737, 27, '1969-07-20', 'Earth''s only moon.', true, false);
INSERT INTO public.moon VALUES (2, 2, 2, 'Phobos', 9376, 0.011, 22.4, 0, 0, '1877-01-01', 'One of Mars''s moons.', true, false);
INSERT INTO public.moon VALUES (3, 3, 3, 'Deimos', 23460, 0.006, 12.4, 0, 1, '1877-01-01', 'Second moon of Mars.', true, false);
INSERT INTO public.moon VALUES (4, 4, 4, 'Io', 421700, 0.15, 3642.6, 1822, 2, '1610-01-01', 'Most volcanically active body in the solar system.', true, false);
INSERT INTO public.moon VALUES (5, 5, 5, 'Europa', 670900, 0.01, 3121.6, 0, 4, '1610-01-01', 'May have a subsurface ocean.', true, true);
INSERT INTO public.moon VALUES (6, 6, 6, 'Ganymede', 1070400, 0.15, 5268.2, 0, 7, '1610-01-01', 'Largest moon in the solar system.', true, false);
INSERT INTO public.moon VALUES (7, 1, 1, 'Titan', 1222000, 0.135, 5150, 0, 16, '1655-01-01', 'Largest moon of Saturn.', true, true);
INSERT INTO public.moon VALUES (8, 2, 2, 'Rhea', 527600, 0.023, 1528, 0, 5, '1672-01-01', 'Second-largest moon of Saturn.', true, false);
INSERT INTO public.moon VALUES (9, 3, 3, 'Callisto', 1883000, 0.18, 4821.6, 0, 17, '1610-01-01', 'Third-largest moon of Jupiter.', true, false);
INSERT INTO public.moon VALUES (10, 4, 4, 'Triton', 354800, 0.013, 2706, 0, 6, '1846-01-01', 'Largest moon of Neptune.', true, false);
INSERT INTO public.moon VALUES (11, 5, 5, 'Enceladus', 238000, 0.012, 504.2, 0, 1, '1789-01-01', 'Known for its geysers.', true, true);
INSERT INTO public.moon VALUES (12, 6, 6, 'Miranda', 129900, 0.0003, 471.6, 0, 1, '1948-01-01', 'One of Uranus''s moons.', true, false);
INSERT INTO public.moon VALUES (13, 1, 1, 'Luna', 384400, 0.073, 3474.8, 1737, 27, '1969-07-20', 'Another name for Earth''s moon.', true, false);
INSERT INTO public.moon VALUES (14, 2, 2, 'Daphnis', 136000, 0.0001, 8.4, 0, 1, '2005-01-01', 'Moon of Saturn.', true, false);
INSERT INTO public.moon VALUES (15, 3, 3, 'Hyperion', 1480000, 0.0003, 270.6, 0, 21, '1848-01-01', 'Irregular moon of Saturn.', true, false);
INSERT INTO public.moon VALUES (16, 4, 4, 'Phoebe', 1300000, 0.0005, 220.2, 0, 25, '1898-01-01', 'Moon of Saturn.', true, false);
INSERT INTO public.moon VALUES (17, 5, 5, 'Nereid', 550000, 0.0002, 340, 0, 12, '1949-01-01', 'Moon of Neptune.', true, false);
INSERT INTO public.moon VALUES (18, 6, 6, 'Thalassa', 49000, 0.0001, 40, 0, 2, '1989-01-01', 'Moon of Neptune.', true, false);
INSERT INTO public.moon VALUES (19, 1, 1, 'S/2003 J 2', 1000000, 0.0001, 10, 0, 0, '2003-01-01', 'Moon of Jupiter.', true, false);
INSERT INTO public.moon VALUES (20, 2, 2, 'S/2003 J 3', 1200000, 0.0001, 11, 0, 0, '2003-01-01', 'Moon of Jupiter.', true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 1, 'Earth', 1, 1, 12756, 1, 4500, '2023-01-01', 'Home planet of humanity.', true, true);
INSERT INTO public.planet VALUES (2, 1, 1, 'Mars', 1.52, 0.11, 6779, 2, 4500, '1877-01-01', 'Known as the Red Planet.', false, true);
INSERT INTO public.planet VALUES (3, 2, 2, 'Jupiter', 5.2, 317.8, 139822, 79, 4600, '1610-01-01', 'Largest planet in the solar system.', false, true);
INSERT INTO public.planet VALUES (4, 3, 3, 'Saturn', 9.58, 95.2, 116464, 82, 4500, '1610-01-01', 'Known for its rings.', false, true);
INSERT INTO public.planet VALUES (5, 4, 4, 'Neptune', 30.07, 17.1, 49528, 14, 4500, '1846-01-01', 'Farthest planet from the Sun.', false, true);
INSERT INTO public.planet VALUES (6, 5, 5, 'Mercury', 0.39, 0.055, 4879, 0, 4500, '1600-01-01', 'Closest planet to the Sun.', false, false);
INSERT INTO public.planet VALUES (7, 1, 1, 'Venus', 0.72, 0.815, 12104, 0, 4500, '1610-01-01', 'Earth''s twin.', false, false);
INSERT INTO public.planet VALUES (8, 2, 2, 'Uranus', 19.22, 14.5, 50724, 27, 4500, '1781-01-01', 'Ice giant with a unique tilt.', false, true);
INSERT INTO public.planet VALUES (9, 3, 3, 'Pluto', 39.48, 0.012, 2376.6, 5, 4600, '1930-01-01', 'Dwarf planet in the Kuiper Belt.', false, false);
INSERT INTO public.planet VALUES (10, 4, 4, 'Eris', 96.3, 0.016, 2326.6, 1, 4600, '2005-01-01', 'Second-largest known dwarf planet.', false, false);
INSERT INTO public.planet VALUES (11, 5, 5, 'Haumea', 43.3, 0.004, 1960, 2, 4600, '2004-01-01', 'Known for its elongated shape.', false, false);
INSERT INTO public.planet VALUES (12, 6, 6, 'Makemake', 45.8, 0.003, 1424, 0, 4600, '2005-01-01', 'Another dwarf planet in the Kuiper Belt.', false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 1, 'Sun', 0, 1, 139.6, 8, 46000000, '2023-01-01', 'The star at the center of our solar system.', true, true);
INSERT INTO public.star VALUES (2, 2, 2, 'Proxima Centauri', 4.24, 0.12, 1.5, 3, 45000000, '1915-01-01', 'Closest star to the Sun.', true, false);
INSERT INTO public.star VALUES (3, 3, 3, 'Sirius', 8.6, 2.1, 1.71, 0, 2000000, '1862-01-01', 'Brightest star in the night sky.', true, true);
INSERT INTO public.star VALUES (4, 4, 4, 'Betelgeuse', 642.5, 20, 887, 0, 1000, '1836-01-01', 'Red supergiant star.', true, true);
INSERT INTO public.star VALUES (5, 5, 5, 'Alpha Centauri A', 4.37, 1.1, 1.23, 5, 6000000, '1836-01-01', 'Part of the Alpha Centauri system.', true, true);
INSERT INTO public.star VALUES (6, 6, 6, 'Vega', 25.04, 2.1, 2.26, 0, 45500, '1850-01-01', 'Fifth-brightest star in the sky.', true, false);


--
-- Name: discoverer_discoverer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discoverer_discoverer_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: discoverer discoverer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_name_key UNIQUE (name);


--
-- Name: discoverer discoverer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_pkey PRIMARY KEY (discoverer_id);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_discoverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_discoverer_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id) ON DELETE SET NULL;


--
-- Name: moon moon_discoverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_discoverer_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_discoverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_discoverer_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_discoverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_discoverer_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

