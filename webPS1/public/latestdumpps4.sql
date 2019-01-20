--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE deploy;
ALTER ROLE deploy WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE st119978;
ALTER ROLE st119978 WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS;






--
-- Database creation
--

CREATE DATABASE clinicapp_production WITH TEMPLATE = template0 OWNER = deploy;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;
CREATE DATABASE clinicapp_development WITH TEMPLATE = template0 OWNER = st119978;
CREATE DATABASE "clinicapp_production" WITH TEMPLATE = template0 OWNER = st119978;
CREATE DATABASE clinicapp_test WITH TEMPLATE = template0 OWNER = st119978;
CREATE DATABASE "webPS1_development" WITH TEMPLATE = template0 OWNER = st119978;
CREATE DATABASE "webPS1_production" WITH TEMPLATE = template0 OWNER = st119978;
CREATE DATABASE "webPS1_test" WITH TEMPLATE = template0 OWNER = st119978;


\connect clinicapp_production

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.admins (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO deploy;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO deploy;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO deploy;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO deploy;

--
-- Name: users; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying,
    role bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_hash character varying,
    password_salt character varying,
    email character varying,
    ban boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO deploy;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO deploy;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: deploy
--

COPY public.admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: deploy
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2018-10-29 05:32:54.366116	2018-10-29 05:32:54.366116
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: deploy
--

COPY public.schema_migrations (version) FROM stdin;
20181027102955
20181027104807
20181027160801
20181027160917
20181027161156
20181027161809
20181027184101
20181027193804
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: deploy
--

COPY public.users (id, username, role, created_at, updated_at, password_hash, password_salt, email, ban) FROM stdin;
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: deploy
--

CREATE UNIQUE INDEX index_admins_on_email ON public.admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: deploy
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON public.admins USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--
\connect clinicapp_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.admins (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO st119978;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: st119978
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO st119978;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st119978
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO st119978;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO st119978;

--
-- Name: users; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying,
    role bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_hash character varying,
    password_salt character varying,
    email character varying,
    ban boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO st119978;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: st119978
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO st119978;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st119978
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
1	admin@example.com	$2a$11$KgGVYSyyUb4h3kEADPEx3.7ePSJeDNJOwcNV19Y2wif/IpJpLufzq	\N	\N	\N	2018-10-28 03:15:35.374714	2018-10-28 03:15:35.374714
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-10-28 03:14:16.493349	2018-10-28 03:14:16.493349
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.schema_migrations (version) FROM stdin;
20181027102955
20181027104807
20181027160801
20181027160917
20181027161156
20181027161809
20181027184101
20181027193804
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.users (id, username, role, created_at, updated_at, password_hash, password_salt, email, ban) FROM stdin;
1	st119978	2	2018-10-28 03:16:26.877014	2018-10-28 03:16:26.877014	$2a$10$yLmxe4AinEjDfInUi.hhHemWzgkRiFyJJsDOyzI.saioH65t2qwP.	$2a$10$yLmxe4AinEjDfInUi.hhHe	st119978@outlook.com	f
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st119978
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st119978
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: st119978
--

CREATE UNIQUE INDEX index_admins_on_email ON public.admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: st119978
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON public.admins USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

\connect clinicapp_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


--
-- PostgreSQL database dump complete
--

\connect "webPS1_development"

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO st119978;

--
-- Name: ps1s; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.ps1s (
    id bigint NOT NULL,
    name character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ps1s OWNER TO st119978;

--
-- Name: ps1s_id_seq; Type: SEQUENCE; Schema: public; Owner: st119978
--

CREATE SEQUENCE public.ps1s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ps1s_id_seq OWNER TO st119978;

--
-- Name: ps1s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st119978
--

ALTER SEQUENCE public.ps1s_id_seq OWNED BY public.ps1s.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO st119978;

--
-- Name: ps1s id; Type: DEFAULT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.ps1s ALTER COLUMN id SET DEFAULT nextval('public.ps1s_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-08-30 06:30:22.912823	2018-08-30 06:30:22.912823
\.


--
-- Data for Name: ps1s; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.ps1s (id, name, url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.schema_migrations (version) FROM stdin;
20180827164709
\.


--
-- Name: ps1s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st119978
--

SELECT pg_catalog.setval('public.ps1s_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


-- Name: ps1s ps1s_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.ps1s
    ADD CONSTRAINT ps1s_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
--


--
-- PostgreSQL database dump complete
--

\connect "webPS1_production"

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

--

--
-- Name: portfolio_value(); Type: FUNCTION; Schema: public; Owner: st119978
--

CREATE FUNCTION public.portfolio_value() RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  stocks_cursor CURSOR FOR select *
       from my_stocks CROSS JOIN stock_price
       where my_stocks.symbol = stock_price.symbol;
  row  RECORD;
  aggregate_value bigint := 0;
BEGIN
  OPEN stocks_cursor;
  LOOP
    FETCH FROM stocks_cursor INTO row;
    EXIT WHEN NOT FOUND;
    aggregate_value = aggregate_value + (row.n_shares * row.price);
  END LOOP;
  return aggregate_value;
END; $$;


ALTER FUNCTION public.portfolio_value() OWNER TO st119978;

--
-- Name: valuing_stock(character varying); Type: FUNCTION; Schema: public; Owner: st119978
--

CREATE FUNCTION public.valuing_stock(character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE
  symbol ALIAS FOR $1;
  price integer := 0;
BEGIN
  FOR i IN 1 .. LENGTH(symbol) LOOP
    price = price + ASCII(SUBSTRING (symbol, i, 1));
  END LOOP;
  RETURN price;
END; $_$;


ALTER FUNCTION public.valuing_stock(character varying) OWNER TO st119978;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO st119978;

--
-- Name: my_stocks; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.my_stocks (
    symbol character varying(20) NOT NULL,
    n_shares integer NOT NULL,
    date_acquired date NOT NULL
);


ALTER TABLE public.my_stocks OWNER TO st119978;

--
-- Name: ps1s; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.ps1s (
    id bigint NOT NULL,
    name character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ps1s OWNER TO st119978;

--
-- Name: ps1s_id_seq; Type: SEQUENCE; Schema: public; Owner: st119978
--

CREATE SEQUENCE public.ps1s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ps1s_id_seq OWNER TO st119978;

--
-- Name: ps1s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st119978
--

ALTER SEQUENCE public.ps1s_id_seq OWNED BY public.ps1s.id;


--
-- Name: quotations; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.quotations (
    id bigint NOT NULL,
    author_name character varying,
    category character varying,
    quote text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quotations OWNER TO st119978;

--
-- Name: quotations_id_seq; Type: SEQUENCE; Schema: public; Owner: st119978
--

CREATE SEQUENCE public.quotations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotations_id_seq OWNER TO st119978;

--
-- Name: quotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st119978
--

ALTER SEQUENCE public.quotations_id_seq OWNED BY public.quotations.id;


--
-- Name: quote_dbs; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.quote_dbs (
    id bigint NOT NULL,
    quote text,
    author character varying,
    category character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quote_dbs OWNER TO st119978;

--
-- Name: quote_dbs_id_seq; Type: SEQUENCE; Schema: public; Owner: st119978
--

CREATE SEQUENCE public.quote_dbs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quote_dbs_id_seq OWNER TO st119978;

--
-- Name: quote_dbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: st119978
--

ALTER SEQUENCE public.quote_dbs_id_seq OWNED BY public.quote_dbs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO st119978;

--
-- Name: stock_price; Type: TABLE; Schema: public; Owner: st119978
--

CREATE TABLE public.stock_price (
    symbol character varying(20),
    quote_date date,
    price numeric
);


ALTER TABLE public.stock_price OWNER TO st119978;

--
-- Name: ps1s id; Type: DEFAULT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.ps1s ALTER COLUMN id SET DEFAULT nextval('public.ps1s_id_seq'::regclass);


--
-- Name: quotations id; Type: DEFAULT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.quotations ALTER COLUMN id SET DEFAULT nextval('public.quotations_id_seq'::regclass);


--
-- Name: quote_dbs id; Type: DEFAULT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.quote_dbs ALTER COLUMN id SET DEFAULT nextval('public.quote_dbs_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2018-09-14 15:51:30.372029	2018-09-14 15:51:30.372029
\.


--
-- Data for Name: my_stocks; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.my_stocks (symbol, n_shares, date_acquired) FROM stdin;
MSFT	500	2016-12-21
INTU	480	2017-04-06
CRM	450	2017-07-14
SHOP  	100	2016-02-26
NFLX	98	2017-09-13
FLIPKART	390	2017-10-15
MSFT	500	2018-09-14
INTU	480	2018-09-14
SHOP  	100	2018-09-14
NFLX	98	2018-09-14
\.


--
-- Data for Name: ps1s; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.ps1s (id, name, url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: quotations; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.quotations (id, author_name, category, quote, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: quote_dbs; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.quote_dbs (id, quote, author, category, created_at, updated_at) FROM stdin;
1	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38.949076	2018-09-14 15:55:38.949076
2	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01.677251	2018-09-14 15:57:12.970018
3	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\r\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine		2018-09-14 15:57:43.949557	2018-09-14 15:57:43.949557
4	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
5	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
6	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
7	A woman needs four animals in her life. A mink in the closet. A jaguar in the garage. A tiger\r\nin bed. And an ass to pay for it all	Anne Slater	Querky 	2018-09-14 16:14:04.671246	2018-09-14 16:14:04.671246
8	An editor should have a pimp for a brother, so he’d have someone to look up to.	Gene Fowler	Computers	2018-09-14 16:14:45.147361	2018-09-14 16:14:45.147361
9	Egotism is the anesthetic that dulls the pain of stupidity.	Frank Leahy	wisdom	2018-09-14 16:16:31.311969	2018-09-14 16:16:31.311969
10	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
11	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
12	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
13	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
14	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
15	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
16	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
17	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
18	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
19	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
20	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
21	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
22	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
23	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
24	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
25	A woman needs four animals in her life. A mink in the closet. A jaguar in the garage. A tiger\nin bed. And an ass to pay for it all	Anne Slater	Querky 	2018-09-14 16:14:04	2018-09-14 16:14:04
26	An editor should have a pimp for a brother, so he’d have someone to look up to.	Gene Fowler	Computers	2018-09-14 16:14:45	2018-09-14 16:14:45
27	Egotism is the anesthetic that dulls the pain of stupidity.	Frank Leahy	wisdom	2018-09-14 16:16:31	2018-09-14 16:16:31
28	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
29	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
30	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
31	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
32	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
33	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
34	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
35	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
36	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
37	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
38	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
39	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
40	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
41	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
42	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
43	A woman needs four animals in her life. A mink in the closet. A jaguar in the garage. A tiger\nin bed. And an ass to pay for it all	Anne Slater	Querky 	2018-09-14 16:14:04	2018-09-14 16:14:04
44	An editor should have a pimp for a brother, so he’d have someone to look up to.	Gene Fowler	Computers	2018-09-14 16:14:45	2018-09-14 16:14:45
45	Egotism is the anesthetic that dulls the pain of stupidity.	Frank Leahy	wisdom	2018-09-14 16:16:31	2018-09-14 16:16:31
46	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
47	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
48	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
49	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
50	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
51	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
52	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
53	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
54	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
55	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
56	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
57	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
58	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
59	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
60	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
61	A woman needs four animals in her life. A mink in the closet. A jaguar in the garage. A tiger\nin bed. And an ass to pay for it all	Anne Slater	Querky 	2018-09-14 16:14:04	2018-09-14 16:14:04
62	An editor should have a pimp for a brother, so he’d have someone to look up to.	Gene Fowler	Computers	2018-09-14 16:14:45	2018-09-14 16:14:45
63	Egotism is the anesthetic that dulls the pain of stupidity.	Frank Leahy	wisdom	2018-09-14 16:16:31	2018-09-14 16:16:31
64	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
65	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
66	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
67	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
68	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
69	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
70	I feel like those Jewish people in Germany in 1942.	Ted Turner	TV	2018-09-14 15:55:38	2018-09-14 15:55:38
71	If a man speaks in the forest and there is no woman there to hear him, is he still wrong?	Unknown Heroine	TV	2018-09-14 15:57:01	2018-09-14 15:57:12
72	Men are like a fine wine. They all start out like grapes, and it’s our job to stomp on them and\nkeep them in the dark where they will mature into something you’d want to have dinner with.	Unknown Heroine	\N	2018-09-14 15:57:43	2018-09-14 15:57:43
73	""	John Doe	Unknown	2018-09-27 16:21:38.417431	2018-09-27 16:21:38.417431
74	""	Unknown	Unknown	2018-09-14 15:55:38	2018-09-14 15:55:38
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.schema_migrations (version) FROM stdin;
20180827164709
20180908191118
20180913180616
\.


--
-- Data for Name: stock_price; Type: TABLE DATA; Schema: public; Owner: st119978
--

COPY public.stock_price (symbol, quote_date, price) FROM stdin;
MSFT	2018-09-14	314
INTU	2018-09-14	320
CRM	2018-09-14	226
SHOP  	2018-09-14	378
NFLX	2018-09-14	312
\.


--
-- Name: ps1s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st119978
--

SELECT pg_catalog.setval('public.ps1s_id_seq', 1, false);


--
-- Name: quotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st119978
--

SELECT pg_catalog.setval('public.quotations_id_seq', 1, false);


--
-- Name: quote_dbs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: st119978
--

SELECT pg_catalog.setval('public.quote_dbs_id_seq', 74, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: ps1s ps1s_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.ps1s
    ADD CONSTRAINT ps1s_pkey PRIMARY KEY (id);


--
-- Name: quotations quotations_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT quotations_pkey PRIMARY KEY (id);


--
-- Name: quote_dbs quote_dbs_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.quote_dbs
    ADD CONSTRAINT quote_dbs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: st119978
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--

\connect "webPS1_test"

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

