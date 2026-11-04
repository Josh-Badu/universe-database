--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: celestial; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial (
    celestial_id integer NOT NULL,
    name character varying(30) NOT NULL,
    object_category text NOT NULL,
    host_name text,
    host_category text
);


ALTER TABLE public.celestial OWNER TO freecodecamp;

--
-- Name: celestial_celestial_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_celestial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_celestial_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_celestial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_celestial_id_seq OWNED BY public.celestial.celestial_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    stellar_population text,
    star_formation text,
    galaxy_type character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbit text,
    moon_group character varying(30),
    number_of_moon_per_planet integer,
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
    planet_types text,
    star_the_planet_orbits character varying(30),
    has_life boolean,
    is_spherical boolean,
    distance_from_earth_in_km integer,
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
    star_types character varying(30),
    galaxy_of_star text,
    notable_properties text,
    age numeric,
    galaxy_id character varying(30)
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
-- Name: celestial celestial_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial ALTER COLUMN celestial_id SET DEFAULT nextval('public.celestial_celestial_id_seq'::regclass);


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
-- Data for Name: celestial; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial VALUES (1, 'Milky Way', 'galaxy', NULL, NULL);
INSERT INTO public.celestial VALUES (2, 'Andromeda', 'galaxy', 'Local Group', 'galaxy group');
INSERT INTO public.celestial VALUES (3, 'Sun', 'star', 'Milky Way', 'galaxy');
INSERT INTO public.celestial VALUES (4, 'Proxima Centauri', 'star', 'Milky Way', 'galaxy');
INSERT INTO public.celestial VALUES (5, 'M31-V1', 'star', 'Andromeda', 'galaxy');
INSERT INTO public.celestial VALUES (6, 'Earth', 'planet', 'Sun', 'star');
INSERT INTO public.celestial VALUES (7, 'Jupiter', 'planet', 'Sun', 'star');
INSERT INTO public.celestial VALUES (8, 'Proxima Centauri b', 'planet', 'Proxima Centauri', 'star');
INSERT INTO public.celestial VALUES (9, 'Moon', 'moon', 'Earth', 'planet');
INSERT INTO public.celestial VALUES (10, 'Phobos', 'moon', 'Mars', 'planet');
INSERT INTO public.celestial VALUES (11, 'Europa', 'moon', 'Jupiter', 'planet');
INSERT INTO public.celestial VALUES (12, 'Titan', 'moon', 'Saturn', 'planet');
INSERT INTO public.celestial VALUES (13, 'Charon', 'moon', 'Pluto', 'dwarf planet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('G_MW', 'Milky Way', 14, 'A mixture of young and old stars; older stars are common in the central bulge and halo.', 'New stars form in gas-rich regions, including the spiral arms.', 'barred spiral');
INSERT INTO public.galaxy VALUES ('G_M31', 'Andromeda', NULL, 'Contains stars of many ages, including older stars in its central region.', 'Star formation continues in parts of its disk.', 'spiral');
INSERT INTO public.galaxy VALUES ('G_M33', 'Triangulum', NULL, 'Contains young and old stars.', 'Star formation occurs in its spiral arms.', 'spiral');
INSERT INTO public.galaxy VALUES ('G_M51', 'Whirlpool', NULL, 'Contains older stars and young, hot stars in its spiral arms.', 'Active star-forming regions occur in its arms.', 'spiral');
INSERT INTO public.galaxy VALUES ('G_N1300', 'NGC 1300', NULL, 'Contains stars of different ages in its bar and arms.', 'New stars form in some disk and arm regions.', 'barred spiral');
INSERT INTO public.galaxy VALUES ('G_M87', 'M87', NULL, 'Dominated by older stars.', 'Little current star formation compared with spiral galaxies.', 'elliptical');
INSERT INTO public.galaxy VALUES ('G_M32', 'M32', NULL, 'Mostly older stars.', 'Little current star formation.', 'elliptical');
INSERT INTO public.galaxy VALUES ('G_M60', 'Messier 60', NULL, 'Mostly older stars.', 'Little current star formation.', 'elliptical');
INSERT INTO public.galaxy VALUES ('G_SOMB', 'Sombrero Galaxy', NULL, 'Many older stars, especially in its central bulge.', 'Relatively limited star formation.', 'lenticular');
INSERT INTO public.galaxy VALUES ('G_LMC', 'Large Magellanic Cloud', NULL, 'A mixture of old stars and young, massive stars.', 'Active star-forming regions are present.', 'irregular');
INSERT INTO public.galaxy VALUES ('G_SMC', 'Small Magellanic Cloud', NULL, 'A mixture of old and young stars.', 'New stars form in gas-rich regions.', 'irregular');
INSERT INTO public.galaxy VALUES ('G_M101', 'Pinwheel Galaxy', NULL, 'Contains stars of many ages.', 'Active star formation occurs in its spiral arms.', 'spiral');
INSERT INTO public.galaxy VALUES ('G_N6946', 'NGC 6946', NULL, 'Contains stars of many ages.', 'Star formation occurs in its spiral arms.', 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', '27.32 days around Earth', 'rocky', 1, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', '0.32 days around Mars', 'irregular', 2, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', '1.26 days around Mars', 'irregular', 2, 4);
INSERT INTO public.moon VALUES (4, 'Io', '1.77 days around Jupiter', 'volcanic', 115, 5);
INSERT INTO public.moon VALUES (5, 'Europa', '3.55 days around Jupiter', 'icy ocean world', 115, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', '7.15 days around Jupiter', 'rock and ice', 115, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', '16.69 days around Jupiter', 'rock and ice', 115, 5);
INSERT INTO public.moon VALUES (8, 'Titan', '15.95 days around Saturn', 'icy; thick atmosphere', 293, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', '1.37 days around Saturn', 'icy ocean world', 293, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', '4.52 days around Saturn', 'icy', 293, 6);
INSERT INTO public.moon VALUES (11, 'Iapetus', '79.32 days around Saturn', 'icy', 293, 6);
INSERT INTO public.moon VALUES (12, 'Miranda', '1.41 days around Uranus', 'icy', 29, 7);
INSERT INTO public.moon VALUES (13, 'Ariel', '2.52 days around Uranus', 'icy', 29, 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', '4.14 days around Uranus', 'icy', 29, 7);
INSERT INTO public.moon VALUES (15, 'Titania', '8.71 days around Uranus', 'icy', 29, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', '13.46 days around Uranus', 'icy', 29, 7);
INSERT INTO public.moon VALUES (17, 'Triton', '5.88 days around Neptune', 'icy; captured-moon candidate', 16, 8);
INSERT INTO public.moon VALUES (18, 'Proteus', '1.12 days around Neptune', 'irregular', 16, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', '360.13 days around Neptune', 'irregular', 16, 8);
INSERT INTO public.moon VALUES (20, 'Larissa', '0.55 days around Neptune', 'irregular', 16, 8);
INSERT INTO public.moon VALUES (21, 'Charon', '6.39 days around Pluto', 'icy', 5, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial / rocky', 'Sun', NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial / rocky', 'Sun', NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial / rocky', 'Sun', true, true, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial / rocky', 'Sun', NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas giant', 'Sun', NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gas giant', 'Sun', NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'ice giant', 'Sun', NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'ice giant', 'Sun', NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'dwarf planet', 'Sun', NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'super-Earth; likely rocky', 'Proxima Centauri', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 'small terrestrial-mass planet', 'Proxima Centauri', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri c', 'unconfirmed planet candidate', 'Proxima Centauri', NULL, NULL, NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2 V yellow dwarf', 'Milky Way', 'Surface temperature about 5772 K; approximately one solar mass and radius.', 4600, 'G_MW');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M-type red dwarf', 'Milky Way', 'Nearby small, cool, faint star; age estimate is uncertain.', NULL, 'G_MW');
INSERT INTO public.star VALUES (3, 'Sirius A', 'A-type main sequence', 'Milky Way', 'Brightest star in Earth''s night sky; approximate system age 225-250 million years.', 240, 'G_MW');
INSERT INTO public.star VALUES (4, 'Sirius B', 'white dwarf', 'Milky Way', 'Dense, hot white dwarf companion to Sirius A; cooling age about 125 million years.', 125, 'G_MW');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'red supergiant', 'Milky Way', 'Very large, relatively cool star; approximate surface temperature 3300-3600 K.', 10, 'G_MW');
INSERT INTO public.star VALUES (6, 'Rigel', 'blue supergiant', 'Milky Way', 'Very luminous and hot; approximate surface temperature around 11000 K.', 8, 'G_MW');
INSERT INTO public.star VALUES (7, 'M31-V1', 'Cepheid variable', 'Andromeda', 'Pulsates in brightness; helped establish Andromeda''s distance.', NULL, 'G_M31');
INSERT INTO public.star VALUES (8, 'Sanduleak -69 202', 'blue supergiant progenitor', 'Large Magellanic Cloud', 'Progenitor of Supernova 1987A; exploded and is no longer an ordinary star.', 10, 'G_LMC');
INSERT INTO public.star VALUES (9, 'R136a1', 'Wolf-Rayet star', 'Large Magellanic Cloud', 'Extremely massive, hot star in the R136 cluster; age approximately 1-2 million years.', 1.5, 'G_LMC');
INSERT INTO public.star VALUES (10, 'N6946-BH1', 'red supergiant candidate', 'NGC 6946', 'Massive star that faded dramatically; possible failed-supernova/black-hole candidate.', NULL, 'G_N6946');


--
-- Name: celestial_celestial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_celestial_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 2, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: celestial celestial_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial
    ADD CONSTRAINT celestial_name_key UNIQUE (name);


--
-- Name: celestial celestial_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial
    ADD CONSTRAINT celestial_pkey PRIMARY KEY (celestial_id);


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
-- Name: star galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

