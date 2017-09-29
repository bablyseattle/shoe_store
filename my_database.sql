--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: bably
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO bably;

--
-- Name: brands; Type: TABLE; Schema: public; Owner: bably
--

CREATE TABLE brands (
    id bigint NOT NULL,
    name character varying,
    price integer
);


ALTER TABLE brands OWNER TO bably;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: bably
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brands_id_seq OWNER TO bably;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bably
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: brands_stores; Type: TABLE; Schema: public; Owner: bably
--

CREATE TABLE brands_stores (
    id bigint NOT NULL,
    store_id integer,
    brand_id integer
);


ALTER TABLE brands_stores OWNER TO bably;

--
-- Name: brands_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: bably
--

CREATE SEQUENCE brands_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brands_stores_id_seq OWNER TO bably;

--
-- Name: brands_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bably
--

ALTER SEQUENCE brands_stores_id_seq OWNED BY brands_stores.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: bably
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO bably;

--
-- Name: stores; Type: TABLE; Schema: public; Owner: bably
--

CREATE TABLE stores (
    id bigint NOT NULL,
    name character varying
);


ALTER TABLE stores OWNER TO bably;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: bably
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stores_id_seq OWNER TO bably;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bably
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: bably
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: brands_stores id; Type: DEFAULT; Schema: public; Owner: bably
--

ALTER TABLE ONLY brands_stores ALTER COLUMN id SET DEFAULT nextval('brands_stores_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: bably
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: bably
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2017-09-29 15:34:47.88421	2017-09-29 15:34:47.88421
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: bably
--

COPY brands (id, name, price) FROM stdin;
37	NIKE	100
38	PUMA	50
39	ROADSTER	200
40	SUN	90
41	CLARK	140
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bably
--

SELECT pg_catalog.setval('brands_id_seq', 41, true);


--
-- Data for Name: brands_stores; Type: TABLE DATA; Schema: public; Owner: bably
--

COPY brands_stores (id, store_id, brand_id) FROM stdin;
12	13	20
13	12	2
14	12	17
15	12	11
16	12	13
17	12	1
18	12	3
19	12	6
20	13	1
21	13	1
23	20	13
24	20	14
25	17	7
26	17	13
27	17	3
28	17	6
29	17	34
30	17	13
32	18	23
33	18	29
34	23	37
35	23	39
36	27	39
37	27	41
38	25	40
39	24	37
40	24	41
41	27	39
\.


--
-- Name: brands_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bably
--

SELECT pg_catalog.setval('brands_stores_id_seq', 41, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: bably
--

COPY schema_migrations (version) FROM stdin;
20170929152529
20170929152607
20170929154400
20170929183719
20170929183831
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: bably
--

COPY stores (id, name) FROM stdin;
23	SHINE
25	KING
26	MACY
27	PAMPER YOUR FEET
24	INORBIT
\.


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bably
--

SELECT pg_catalog.setval('stores_id_seq', 27, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: bably
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: bably
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: brands_stores brands_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: bably
--

ALTER TABLE ONLY brands_stores
    ADD CONSTRAINT brands_stores_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bably
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: bably
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

