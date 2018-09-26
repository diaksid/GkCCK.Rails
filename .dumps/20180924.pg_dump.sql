--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-1.pgdg16.04+1)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-1.pgdg16.04+1)

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
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO vps;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO vps;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    index integer DEFAULT 0
);


ALTER TABLE public.active_storage_attachments OWNER TO vps;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO vps;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO vps;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO vps;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.activities (
    id bigint NOT NULL,
    published boolean DEFAULT false,
    navigated boolean DEFAULT false,
    name character varying NOT NULL,
    header character varying,
    annotation text,
    content text,
    partial boolean DEFAULT false,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    index integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ancestry character varying,
    ancestry_depth integer DEFAULT 0
);


ALTER TABLE public.activities OWNER TO vps;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO vps;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vps;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.areas (
    id bigint NOT NULL,
    active boolean DEFAULT false,
    name character varying NOT NULL,
    index integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.areas OWNER TO vps;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO vps;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: areas_throughs; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.areas_throughs (
    id bigint NOT NULL,
    resource_type character varying,
    resource_id bigint,
    area_id bigint
);


ALTER TABLE public.areas_throughs OWNER TO vps;

--
-- Name: areas_throughs_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.areas_throughs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_throughs_id_seq OWNER TO vps;

--
-- Name: areas_throughs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.areas_throughs_id_seq OWNED BY public.areas_throughs.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.articles (
    id bigint NOT NULL,
    published boolean DEFAULT false,
    navigated boolean DEFAULT false,
    published_at date,
    header character varying NOT NULL,
    annotation text,
    content text NOT NULL,
    partial boolean DEFAULT false,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    source character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.articles OWNER TO vps;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO vps;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.feedbacks (
    id bigint NOT NULL,
    published boolean DEFAULT false,
    navigated boolean DEFAULT false,
    published_at date,
    header character varying NOT NULL,
    content text,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    partner_id bigint,
    partner_as character varying,
    source character varying,
    index integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.feedbacks OWNER TO vps;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedbacks_id_seq OWNER TO vps;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.partners (
    id bigint NOT NULL,
    published boolean DEFAULT false,
    navigated boolean DEFAULT false,
    active boolean DEFAULT false,
    affiliate boolean DEFAULT false,
    name character varying NOT NULL,
    content text,
    email character varying,
    phone character varying,
    address character varying,
    geo character varying,
    website character varying,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    index integer DEFAULT 0,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.partners OWNER TO vps;

--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partners_id_seq OWNER TO vps;

--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;


--
-- Name: permits; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.permits (
    id bigint NOT NULL,
    published boolean DEFAULT false,
    navigated boolean DEFAULT false,
    name character varying NOT NULL,
    header character varying,
    number character varying NOT NULL,
    provider character varying NOT NULL,
    issue_at date NOT NULL,
    onset_at date,
    end_at date,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    index integer DEFAULT 0,
    partner_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.permits OWNER TO vps;

--
-- Name: permits_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.permits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permits_id_seq OWNER TO vps;

--
-- Name: permits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.permits_id_seq OWNED BY public.permits.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vps;

--
-- Name: targets; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.targets (
    id bigint NOT NULL,
    published boolean DEFAULT false,
    navigated boolean DEFAULT false,
    importance integer DEFAULT 0,
    start_at date,
    finish_at date,
    name character varying NOT NULL,
    header character varying,
    content text,
    address character varying,
    geo character varying,
    website character varying,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    index integer DEFAULT 0,
    partner_id bigint,
    partner_as character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.targets OWNER TO vps;

--
-- Name: targets_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targets_id_seq OWNER TO vps;

--
-- Name: targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.targets_id_seq OWNED BY public.targets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vps
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_admin boolean DEFAULT false,
    in_staff boolean DEFAULT false,
    name character varying,
    phone character varying,
    address character varying
);


ALTER TABLE public.users OWNER TO vps;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vps
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO vps;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vps
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: areas_throughs id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.areas_throughs ALTER COLUMN id SET DEFAULT nextval('public.areas_throughs_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: permits id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.permits ALTER COLUMN id SET DEFAULT nextval('public.permits_id_seq'::regclass);


--
-- Name: targets id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.targets ALTER COLUMN id SET DEFAULT nextval('public.targets_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: vps
--



--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (90, 'images', 'Activity', 6, 90, '2018-08-28 01:51:59.659108', 3);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (14, 'image', 'Partner', 7, 14, '2018-08-22 15:59:05.847087', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (8, 'image', 'Partner', 1, 8, '2018-08-22 15:56:43.154772', 7);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (85, 'images', 'Activity', 1, 85, '2018-08-28 01:50:17.034074', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (91, 'images', 'Activity', 1, 91, '2018-08-28 01:52:16.943936', 5);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (92, 'images', 'Activity', 1, 92, '2018-08-28 01:52:16.992707', 6);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (1, 'image', 'User', 1, 1, '2018-08-22 15:50:50.923667', 7);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (74, 'images', 'Permit', 2, 74, '2018-08-22 16:22:10.791307', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (75, 'images', 'Permit', 2, 75, '2018-08-22 16:22:10.838766', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (29, 'images', 'Target', 7, 29, '2018-08-22 16:04:56.166727', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (30, 'images', 'Target', 7, 30, '2018-08-22 16:04:56.203372', 2);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (31, 'images', 'Target', 8, 31, '2018-08-22 16:05:18.838862', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (32, 'images', 'Target', 8, 32, '2018-08-22 16:05:18.894324', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (33, 'images', 'Target', 9, 33, '2018-08-22 16:05:38.362513', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (34, 'images', 'Target', 9, 34, '2018-08-22 16:05:38.396771', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (35, 'images', 'Target', 10, 35, '2018-08-22 16:08:38.913282', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (36, 'images', 'Target', 10, 36, '2018-08-22 16:08:38.961054', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (37, 'images', 'Target', 11, 37, '2018-08-22 16:09:01.496772', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (38, 'images', 'Target', 11, 38, '2018-08-22 16:09:01.570009', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (39, 'images', 'Target', 12, 39, '2018-08-22 16:09:25.910069', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (40, 'images', 'Target', 13, 40, '2018-08-22 16:09:49.702779', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (41, 'images', 'Target', 13, 41, '2018-08-22 16:09:49.741141', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (42, 'images', 'Target', 14, 42, '2018-08-22 16:10:09.16966', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (43, 'images', 'Target', 15, 43, '2018-08-22 16:10:31.610966', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (44, 'images', 'Target', 16, 44, '2018-08-22 16:10:52.214657', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (45, 'images', 'Target', 17, 45, '2018-08-22 16:11:18.320866', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (46, 'images', 'Target', 17, 46, '2018-08-22 16:11:18.380196', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (47, 'images', 'Target', 18, 47, '2018-08-22 16:11:38.788706', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (48, 'images', 'Target', 19, 48, '2018-08-22 16:12:01.093506', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (49, 'images', 'Target', 20, 49, '2018-08-22 16:12:20.394363', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (50, 'images', 'Target', 20, 50, '2018-08-22 16:12:20.440302', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (51, 'images', 'Target', 21, 51, '2018-08-22 16:12:41.616452', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (52, 'images', 'Target', 21, 52, '2018-08-22 16:12:41.67438', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (53, 'images', 'Target', 22, 53, '2018-08-22 16:13:01.394174', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (54, 'images', 'Target', 22, 54, '2018-08-22 16:13:01.432123', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (55, 'images', 'Target', 23, 55, '2018-08-22 16:13:28.075254', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (56, 'images', 'Target', 24, 56, '2018-08-22 16:13:52.65851', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (57, 'images', 'Target', 24, 57, '2018-08-22 16:13:52.699835', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (58, 'images', 'Target', 25, 58, '2018-08-22 16:14:16.420654', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (59, 'images', 'Target', 25, 59, '2018-08-22 16:14:16.529211', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (60, 'images', 'Target', 26, 60, '2018-08-22 16:14:36.758723', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (61, 'images', 'Target', 26, 61, '2018-08-22 16:14:36.810196', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (66, 'images', 'Target', 28, 66, '2018-08-22 16:15:40.625431', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (67, 'images', 'Target', 28, 67, '2018-08-22 16:15:40.676505', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (68, 'images', 'Target', 29, 68, '2018-08-22 16:15:59.738259', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (69, 'images', 'Target', 29, 69, '2018-08-22 16:15:59.820761', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (64, 'images', 'Target', 27, 64, '2018-08-22 16:15:19.000609', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (65, 'images', 'Target', 27, 65, '2018-08-22 16:15:19.095068', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (76, 'images', 'Permit', 2, 76, '2018-08-22 16:22:10.878661', 2);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (89, 'images', 'Activity', 5, 89, '2018-08-28 01:51:44.542397', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (12, 'image', 'Partner', 5, 12, '2018-08-22 15:58:37.762288', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (25, 'images', 'Target', 5, 25, '2018-08-22 16:04:03.26111', 2);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (26, 'images', 'Target', 5, 26, '2018-08-22 16:04:03.310335', 3);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (77, 'images', 'Permit', 2, 77, '2018-08-22 16:22:10.931758', 3);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (79, 'images', 'Permit', 3, 79, '2018-08-22 16:22:31.187754', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (80, 'images', 'Permit', 3, 80, '2018-08-22 16:22:31.225887', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (87, 'images', 'Activity', 3, 87, '2018-08-28 01:51:03.085441', 2);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (10, 'image', 'Partner', 3, 10, '2018-08-22 15:57:40.508269', 3);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (19, 'images', 'Target', 3, 19, '2018-08-22 16:03:24.606411', 4);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (20, 'images', 'Target', 3, 20, '2018-08-22 16:03:24.640981', 5);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (81, 'images', 'Permit', 4, 81, '2018-08-22 16:22:49.757056', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (82, 'images', 'Permit', 4, 82, '2018-08-22 16:22:49.80353', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (83, 'images', 'Permit', 4, 83, '2018-08-22 16:22:49.834299', 2);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (13, 'image', 'Partner', 6, 13, '2018-08-22 15:58:53.398782', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (27, 'images', 'Target', 6, 27, '2018-08-22 16:04:26.237191', 1);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (28, 'images', 'Target', 6, 28, '2018-08-22 16:04:26.273151', 2);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (84, 'images', 'Permit', 4, 84, '2018-08-22 16:22:49.875096', 3);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (88, 'images', 'Activity', 4, 88, '2018-08-28 01:51:15.462296', 4);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (11, 'image', 'Partner', 4, 11, '2018-08-22 15:58:08.26657', 7);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (21, 'images', 'Target', 4, 21, '2018-08-22 16:03:47.26635', 5);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (22, 'images', 'Target', 4, 22, '2018-08-22 16:03:47.296599', 6);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (15, 'images', 'Target', 1, 15, '2018-08-22 16:02:39.049817', 8);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (16, 'images', 'Target', 1, 16, '2018-08-22 16:02:39.087076', 9);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (70, 'images', 'Permit', 1, 70, '2018-08-22 16:21:45.237095', 0);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (71, 'images', 'Permit', 1, 71, '2018-08-22 16:21:45.36596', 2);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (72, 'images', 'Permit', 1, 72, '2018-08-22 16:21:45.441521', 3);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (73, 'images', 'Permit', 1, 73, '2018-08-22 16:21:45.526192', 4);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (78, 'images', 'Permit', 2, 78, '2018-08-22 16:22:10.978117', 4);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (86, 'images', 'Activity', 2, 86, '2018-08-28 01:50:36.75376', 5);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (9, 'image', 'Partner', 2, 9, '2018-08-22 15:57:28.79222', 6);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (17, 'images', 'Target', 2, 17, '2018-08-22 16:02:58.316296', 7);
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at, index) VALUES (18, 'images', 'Target', 2, 18, '2018-08-22 16:02:58.360262', 8);


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (1, 'HgkkrCMZbR2CaUJYaJSKKK6U', 'avatar.png', 'image/png', '{"identified":true,"width":400,"height":360,"analyzed":true}', 32302, 'qPs9c+HuLfC2Maf7j/uT/Q==', '2018-08-22 15:50:50.893256');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (8, 'gisqfXx769JTuqBo7BqxxaYh', 'cck.png', 'image/png', '{"identified":true,"width":600,"height":600,"analyzed":true}', 19186, 'yr7n1PjjhmZ4hJTButn1ug==', '2018-08-22 15:56:43.136838');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (9, 'p7HdszXaSMsETYownYGPLiF8', 'cck.png', 'image/png', '{"identified":true,"width":600,"height":600,"analyzed":true}', 19186, 'yr7n1PjjhmZ4hJTButn1ug==', '2018-08-22 15:57:28.768374');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (10, 'iZrWZ82Byma4ffmznnGQcj8q', 'cck.png', 'image/png', '{"identified":true,"width":600,"height":600,"analyzed":true}', 19186, 'yr7n1PjjhmZ4hJTButn1ug==', '2018-08-22 15:57:40.498697');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (11, 'M3L49SdLN3WrwuQXgD3qJKYx', 'cck.png', 'image/png', '{"identified":true,"width":600,"height":600,"analyzed":true}', 19186, 'yr7n1PjjhmZ4hJTButn1ug==', '2018-08-22 15:58:08.234094');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (12, '6ZMeUfajbrgwFr5brDqQSsxk', 'cck.png', 'image/png', '{"identified":true,"width":600,"height":600,"analyzed":true}', 19186, 'yr7n1PjjhmZ4hJTButn1ug==', '2018-08-22 15:58:37.746338');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (13, 'cfeYSFbkuAKL3rNuDxABt5ck', 'donstroy.jpg', 'image/jpeg', '{"identified":true,"width":192,"height":192,"analyzed":true}', 4987, 'WcX4g5Sepo7mXQsEta0cFQ==', '2018-08-22 15:58:53.38497');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (14, 'TmGdxBHi5ZTcfYCuFJdVRBSK', 'mr-group.jpg', 'image/jpeg', '{"identified":true,"width":192,"height":192,"analyzed":true}', 5835, 'tmg/D3uVZsySJQFMNDpVmQ==', '2018-08-22 15:59:05.833653');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (15, 'vRYi1v7KTCAk5bNkbft4AaLZ', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 199050, '2CR3hpXCRqcTPqL84YgJyA==', '2018-08-22 16:02:39.015243');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (16, 'R9AnecjK4kPgpWqwKsEzWre3', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 144339, 'ENOffIeoDVkCP3X67JlPZQ==', '2018-08-22 16:02:39.075241');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (17, 'jKgU9AR4aYMtNDwByfAm7Xsf', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 191327, 'N5dNU2yUH1hzsFjznofp2g==', '2018-08-22 16:02:58.26452');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (18, 'SRpPUFpkT6574EAqUS9uYeVM', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 147359, 'bFTko2AA/aVGgpPmTk2kqg==', '2018-08-22 16:02:58.346982');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (19, '5HqSdMGnqFUpSjcNyQjobxNb', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 132040, 'UzpgoN8VvZL84dHAPhGRmA==', '2018-08-22 16:03:24.578857');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (20, 'USvTsktL7iuZ6VGwC5dqvadC', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 113774, 'RDBb1utE/XMZNGHiqcxZwg==', '2018-08-22 16:03:24.631511');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (21, 'FJCepDMfXJmTKuswVaVYRFMs', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 164077, 'J1Ge4ePmuKFyxuv2kFKS+w==', '2018-08-22 16:03:47.228452');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (22, 'aRBcGubevU71sfPBCNRxWo8o', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 134333, 'ahmzljTucfPZ2b1hxypu8Q==', '2018-08-22 16:03:47.286715');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (25, 'qs2UP6rnLvk26zR5y7PCK7GT', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 103904, 'hqfKskTjD2fb6yeadV/EFg==', '2018-08-22 16:04:03.227489');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (26, 'KWFLihrtyHQjuMbvH4aUGuhD', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 99806, 'vGvAQQfSMDznkqBfJx0hBA==', '2018-08-22 16:04:03.298385');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (27, '3apevJT6uNo19VyiSWP8RQR7', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 160656, 'PLdAG2ptIHuOX1GbSWZhaQ==', '2018-08-22 16:04:26.220619');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (28, 'eaMeFMzuWuSKzMn9zeBunFN1', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 108753, '6M2UZZUUW/aDGlCbOTgP5Q==', '2018-08-22 16:04:26.260403');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (29, 'n2V3xeh8n6qyzUvYtxViUjDv', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 102611, 'sBz2CMFh5qNV6L727DxNQQ==', '2018-08-22 16:04:56.145608');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (30, 'apEpwYjWTyz1AxEMkutkVwiF', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 96320, 'n+XpHTw7/aaO7d5hP1SAgg==', '2018-08-22 16:04:56.188729');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (31, 'PJ8BkGmxUapLBwgh8KCwgqJx', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 141590, 'Y53U8apYovPNl4AXcduuKQ==', '2018-08-22 16:05:18.808478');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (32, 'FAs68SBWpLLAfPTZjjqTgwoR', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 183304, 'nnse5pQgDXHNw9eHf5JiEA==', '2018-08-22 16:05:18.879905');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (33, 'n7eTniLd4hQrz8poyZCGy9eT', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 129395, '+1o9++OWm6Mck3Tka6R7Uw==', '2018-08-22 16:05:38.349316');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (34, 'i9gLsFXBExxdafL7TEAEqcMS', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 152181, 'g3bG9HKUWDi63aHIdjzRIQ==', '2018-08-22 16:05:38.387336');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (35, 'gTmPWE2vP2pmYKRK8hVMzaYj', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 110502, 'x9t/Vy5r8LKsVFLWStzDsw==', '2018-08-22 16:08:38.879002');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (36, 'u8pFrWyRpNmRUEVPvPPUmCti', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 161028, 'EbrdWzcBSE0bSPkxLWN3QA==', '2018-08-22 16:08:38.948865');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (37, 'GW89nBrao6aZRaEDwGhWA8jE', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 107114, 'PzK0okyl3iFtpg6KwAf95Q==', '2018-08-22 16:09:01.47405');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (38, 'aaUwNATuSUFXoLfm1MkdPKhi', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 156016, '++my5cM8uqBisZwcXA0+Jw==', '2018-08-22 16:09:01.546131');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (39, 'LabZg8HyFJWA1HdT8dnbb6X4', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 159098, 'OypHp2jqV6H7X2qzVfN4IA==', '2018-08-22 16:09:25.894351');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (40, 'QHSruPw8suxqKH5ZKhPeWniv', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 158481, '4cw+cJpR00o8R3+AB+Y1RA==', '2018-08-22 16:09:49.67204');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (42, 'u5593iwgjWuMEpBwF52ULBnW', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 113732, '3VshP2lWCB7J/2YjF2vSLw==', '2018-08-22 16:10:09.141033');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (41, '3QqZKH7kh5TFeXcF5Uk5K6h1', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 135541, '1dPHEcSblOzcV8I1CtC2iA==', '2018-08-22 16:09:49.730479');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (43, 'FSGFAcJR2QT3oRghmyF18pjF', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 132124, 'TpXzINYvblyzpibLjrCo8A==', '2018-08-22 16:10:31.589158');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (44, 'Godh9RHmSEL8qARPUeSKnMZZ', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 101154, 'X2d4Pmtq8xkd86l6ROTbKA==', '2018-08-22 16:10:52.181606');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (45, 'KUof8w4AQt7cDL6PvHNxm7aa', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 131968, 'R4dCiORR6vwP9KPjVNfifw==', '2018-08-22 16:11:18.304741');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (46, 'YRSQeEK5pWbVHdbmNnPf4KKG', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 118517, 'BxwM7vX5OJTlrEp4UgHMVg==', '2018-08-22 16:11:18.370743');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (47, '1aH9gAw91HpaQowFxjrb26Sh', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 72759, 'nGupJ8Bl2EVRCY2Ej0lJhA==', '2018-08-22 16:11:38.747656');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (48, '9gx5HijoCZqyqPMsJVRG168v', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 123032, 'Bo8KDSRWQdOhJ1LXoFFTuQ==', '2018-08-22 16:12:01.060498');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (49, 'RbXcozbNz5Wg8uvo2Zzrhmqn', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 153269, 'B5S/uJYP2SfgyddeD7np+Q==', '2018-08-22 16:12:20.382646');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (51, 'Xvfc3dGzjE614Z5JcQKURs6d', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 88039, 'RBu6sDNj4I6WehNprFTNEQ==', '2018-08-22 16:12:41.602411');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (52, 'sUEFPY1MpFgv85SnUbhFg2Lw', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 93352, 'i5nH/NeEKD8sEEji1G1XvQ==', '2018-08-22 16:12:41.664223');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (53, 'UEDEfuVk5qmYGctVAGkgYBmk', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 99051, 'nysBzBCjKWHipdYDuCXhAg==', '2018-08-22 16:13:01.378187');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (55, 'ZvVqz1DiPuJMRKp9rUUQxiB5', '00.jpg', 'image/jpeg', '{"identified":true,"width":1024,"height":687,"analyzed":true}', 752760, 'XKi8a7eUtPdWpZg60OHlng==', '2018-08-22 16:13:28.053382');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (56, 'VyWupaQnc1sHScPVQqpLFbnt', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 110868, 'aYazmqCXxmsqaEy57l5P6Q==', '2018-08-22 16:13:52.619577');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (57, 'apeuu6VxKA481LBjjrUauYhw', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 99722, 'D44z9MnNoXv7sjd6M+AT1w==', '2018-08-22 16:13:52.689903');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (58, 'K8GtefSQVgwNzQ7KkooN29HS', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 93926, 'yGe7EeIV6inwiLjpD93YsA==', '2018-08-22 16:14:16.387287');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (59, 'Y8VQzh1J3GaHAGYgYPyEhDmv', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 95561, '0H6cNyHwG7IaUjy04/CqRA==', '2018-08-22 16:14:16.516744');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (50, 'CZ8AcoHUbRLjUsidPSmvLnkn', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 129639, 'JaVhMDi+boPssTFsjlySNg==', '2018-08-22 16:12:20.431346');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (54, 'HqpACWJUrDNm8XNTcbGBJWsg', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 157343, 'PGO1/qcNIgyIT2fDIgYK3Q==', '2018-08-22 16:13:01.420696');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (60, 'h1Wt88YHU6ZY6KqoK5rxaTXu', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 98821, '+idxz+ApmriJrm8UI67azA==', '2018-08-22 16:14:36.746627');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (61, 'HLfjY3oczqRieDuuXVQgKJAZ', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 99347, 'DDTLBq1Fxeq93I/sA9cbgA==', '2018-08-22 16:14:36.793119');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (64, 'xQiryrs3hr817pHNaXvHogPf', '10.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 179601, 'zqFRHhUJfvtJUJYXRLFnOw==', '2018-08-22 16:15:18.990951');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (65, 'JM9dGsSxYA45DsJZG1M4rmSq', '11.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 145319, 'wdjWRQVxxtjF9olvxH4R+Q==', '2018-08-22 16:15:19.083034');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (66, 'ykgsE7SL6ThBwUmBzLYAdYH8', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 104466, 'wHR6oniiqKst/oQeotH0iw==', '2018-08-22 16:15:40.593443');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (67, 'i8naZ4bAb91UQKhyANDYgsFS', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 97158, 'Z52n/YJkuieSaU2C8u94nA==', '2018-08-22 16:15:40.656255');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (68, 'PA5ajFUm1PPCinb1mVXBaAaA', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 101316, 'prmRH7f6JSTfKkdPg+7s1Q==', '2018-08-22 16:15:59.702584');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (69, '5j8aHUdJRXR7P75Eio4TRk17', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 77824, 'dK2T/xvt6Kq8VLlRfmLSTw==', '2018-08-22 16:15:59.809273');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (70, 'J8s63S4ketU2neXKdNDEzZQt', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1109,"analyzed":true}', 195769, 'gFOPw4hCvVuA68bsY3AA9w==', '2018-08-22 16:21:45.179153');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (71, 'Daf2TTMQojbSCG97kb6Y5rfi', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1109,"analyzed":true}', 206991, 'PBbmW2fp3wpuLEJvJpvZPQ==', '2018-08-22 16:21:45.347633');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (72, 'h1uQQgtGtXVaKgiWQRnWEH4p', '02.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1109,"analyzed":true}', 161126, 'JyAL4/0p2W5GPsSktiqarA==', '2018-08-22 16:21:45.42052');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (73, 'MdfpjKSK6TWX12ND1jMXsaMu', '03.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1109,"analyzed":true}', 113374, 'Tt9FAweN8hkVqjlujtRiSA==', '2018-08-22 16:21:45.480338');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (74, 'vYVwd53xziyZewigwHZ2E9o1', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1141,"analyzed":true}', 247517, '1bQVpmwfBakeHfV+QSGrpw==', '2018-08-22 16:22:10.772711');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (75, 'accAd6tUMTxMEMo5TaBShRxE', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1141,"analyzed":true}', 251522, 'k1ulToR4wabQFFoVNUTv/A==', '2018-08-22 16:22:10.825189');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (76, '15m2AXgPnjTTKr7VM3pD7n8U', '02.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1141,"analyzed":true}', 268121, 'NXKrQ8vL+H4PpbF7aJh8Yw==', '2018-08-22 16:22:10.865398');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (78, '7US4wyTzb57o721TYquTjVF5', '04.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1141,"analyzed":true}', 127560, 'nnBmxPGg3kQQMG2SKfFnBA==', '2018-08-22 16:22:10.963494');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (77, 'hrCvBGw369JEE2WnMr9Y9mFS', '03.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1141,"analyzed":true}', 273167, 'hgVP0S5DDYRU39MgLPBaEQ==', '2018-08-22 16:22:10.907178');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (79, 'fpvfw7gb6SA3u2KiJHZ8VvQb', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1100,"analyzed":true}', 266569, 'iG0DFNI8s52SpCbPlL+40g==', '2018-08-22 16:22:31.147566');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (80, 'WQazz3T9cuvA5z7qpV42Ermj', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1100,"analyzed":true}', 149060, 'q2Tk1q97XaaO78c6bPlyqg==', '2018-08-22 16:22:31.214592');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (81, 'ThfK1KeJDDgrhB8DyaQQUW6f', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1039,"analyzed":true}', 202078, '6nWpoipautJeRxcD4eibIA==', '2018-08-22 16:22:49.73281');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (82, '3iF1kAwNG7itLQY6ZcAiKDrR', '01.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1039,"analyzed":true}', 230525, 'Lc3Twf14lsET1l3nfotZtw==', '2018-08-22 16:22:49.790614');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (83, 'dxyLdr6YdBqUZbNEARGsfu3q', '02.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1039,"analyzed":true}', 190709, '+ZWj3+7I8jriIGhRVhw8tQ==', '2018-08-22 16:22:49.825741');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (84, 'v4KREQN8haCgMGgYY3b9mjDz', '03.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":1039,"analyzed":true}', 148243, 'FY3vN4cdQjYlyhgR12yZ7g==', '2018-08-22 16:22:49.859301');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (85, 'uHSN2a4Dtn3EEv7WbcVLBaSV', '00001.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 69237, 'Jjn3uuoRLaNh+CNjkk4KnA==', '2018-08-28 01:50:17.010701');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (86, 'QkEiW9npgFxFrfJc2vMoRm7q', '00002.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 87037, 'bXLPpOktmZ4jLBhuhnW1bA==', '2018-08-28 01:50:36.73867');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (87, 'UnuJ4HikVBD7kchy5nyXvydd', '00003.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 116041, 'wDyWlEy5r6zBCrY2qvmCrg==', '2018-08-28 01:51:03.067796');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (88, 'RGVaTWGP8f6pb9VpM1VH1vpc', '00004.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 82540, 'XnP/DZ3spZlgSvcf3NThxg==', '2018-08-28 01:51:15.437029');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (89, 'uCHYSxLPRunr5QaDxRYFKymz', '00005.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 93145, 'q44p5Yp/Om6/816/LJFYRA==', '2018-08-28 01:51:44.488966');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (90, 'yUyTsxNB4oj6GmSmGWjheBGR', '00006.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":600,"analyzed":true}', 122811, 'Qx46rpM8ndz2Rb0if7xBeQ==', '2018-08-28 01:51:59.641347');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (91, '28CLSPB4YNhVXAfAcaBmHH9D', '00.jpg', 'image/jpeg', '{"identified":true,"width":800,"height":611,"analyzed":true}', 79950, '/GJ1Pw+flqdvC3delj1vKg==', '2018-08-28 01:52:16.929809');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) VALUES (92, 'MGBLDuaJLafNciyripYMCQdC', '01.jpg', 'image/jpeg', '{"identified":true,"width":752,"height":570,"analyzed":true}', 99234, 'KNDiJ9VClq4qj+Y7wytIIA==', '2018-08-28 01:52:16.97339');


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.activities (id, published, navigated, name, header, annotation, content, partial, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) VALUES (7, true, true, 'Порядок проведения строительного контроля', 'Строительный контроль <small>порядок проведения мероприятий</small>', NULL, NULL, false, 'Порядок проведения мероприятий строительного контроля', 'строительный контроль', 'Порядок проведения мероприятий строительного контроля и строительного надзора на крупных жилых и нежилых объектах недвижимости Москвы и Московской области', NULL, NULL, 6, '2018-08-22 15:49:07.621338', '2018-08-22 15:49:07.621338', '1', 1);
INSERT INTO public.activities (id, published, navigated, name, header, annotation, content, partial, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) VALUES (8, true, true, 'Строительный контроль конкретных видов работ', 'Строительный контроль <small>при осуществлении конкретных видов работ</small>', NULL, NULL, false, 'Строительный контроль при осуществлении конкретных видов работ', 'строительный контроль', 'Перечень основных требований строительного контроля при осуществлении конкретных видов работ на крупных жилых и нежилых объектах недвижимости Москвы и Московской области', NULL, NULL, 7, '2018-08-22 15:49:07.652472', '2018-08-22 15:49:07.652472', '1', 1);
INSERT INTO public.activities (id, published, navigated, name, header, annotation, content, partial, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) VALUES (9, true, true, 'Строительный контроль при монолитных работах', 'Строительный контроль <small>при монолитных работах</small>', NULL, NULL, false, 'Строительный контроль при монолитных работах', 'строительный контроль, монолитные работы', 'Перечень основных требований строительного контроля при осуществлении монолитных работ на крупных жилых и нежилых объектах недвижимости Москвы и Московской области', NULL, NULL, 8, '2018-08-22 15:49:07.679993', '2018-08-22 15:49:07.679993', '1', 1);
INSERT INTO public.activities (id, published, navigated, name, header, annotation, content, partial, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) VALUES (10, true, true, 'Строительный контроль при земляных работах', 'Строительный контроль <small>при производстве земляных работ</small>', NULL, NULL, false, 'Строительный контроль при производстве земляных работ', 'строительный контроль, земляные работы', 'Перечень основных требований строительного контроля при производстве земляных работ на крупных жилых и нежилых объектах недвижимости Москвы и Московской области', NULL, NULL, 9, '2018-08-22 15:49:07.706965', '2018-08-22 15:49:07.706965', '1', 1);
INSERT INTO public.activities (id, published, navigated, name, header, annotation, content, partial, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) VALUES (2, true, true, 'Научно-исследовательская деятельность', '', '<ul class="h-push">
    <li>контроль качества строительно-монтажных работ;</li>
    <li>обследование зданий, сооружений и отдельных конструкций;</li>
    <li>контроль качества (дефектоскопия) выполненных работ;</li>
    <li>испытание строительных материалов, конструкций и изделий;</li>
    <li>разработка рекомендаций (проектных решений) по усилению (санации) конструкций;</li>
    <li>мониторинг за возводимыми и существующими зданиями, попадающими в зону влияния нового строительства.</li>
</ul>', '<p class="h-push">Научно-исследовательский центр <b>ГК&nbsp;«ССК»</b> создан на базе кафедры технологического проектирования Московского Государственного Строительного Университета. Компетентность <b>«Научно-исследовательской испытательной лаборатории ССК-проект»</b> подтверждают органы по аккредитации «МОССТРОЙСЕРТИФИКАЦИЯ» и «СИСТЕМА АКСЕКО».</p>

<h4 class="mb-2">Основные направления научной деятельности:</h4>

<div class="h-overflow--x">
    <ul class="list-icon h-push mb-3">
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            контроль качества строительно-монтажных работ;
        </li>
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            обследование зданий, сооружений и отдельных конструкций;
        </li>
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            контроль качества (дефектоскопия) выполненных работ;
        </li>
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            испытание строительных материалов, конструкций и изделий;
        </li>
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            разработка рекомендаций (проектных решений) по усилению (санации) конструкций;
        </li>
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            мониторинг за возводимыми и существующими зданиями, попадающими в зону влияния нового строительства.
        </li>
    </ul>
</div>

<div class="card lead text-justify border-success">
    <div class="card-body">
        <p class="card-text">Специалисты <b>ГК&nbsp;«ССК»</b> обладают полным набором современного оборудования, необходимого для комплексного обследования зданий и сооружений, имеют допуск на работы по обследованию строительных конструкций зданий и сооружений на особо опасных, технически сложных, а также уникальных объектах.</p>
    </div>
</div>', false, 'Научно-исследовательская деятельность', 'контроль качества, обследование зданий', 'Организация проведения научно-исследовательских мероприятий на крупных жилых и нежилых объектах недвижимости Москвы и Московской области', '', '', 1, '2018-08-22 15:49:07.463483', '2018-08-29 04:38:27.562653', NULL, 0);
INSERT INTO public.activities (id, published, navigated, name, header, annotation, content, partial, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) VALUES (3, true, true, 'Проектирование', 'Проектные работы', '<ul class="h-push">
    <li>архитектурное проектирование;</li>
    <li>разработка конструктивных решений;</li>
    <li>проектирование внутренних и наружных инженерных систем;</li>
    <li>авторский надзор;</li>
    <li>разработка дизайн-проектов.</li>
</ul>', '<p>Группа компаний «ССК» занимается проектной деятельностью более 15 лет. Специалистами компании «ССК-Проект», входящей в группу компаний «ССК», разработано и реализовано значительное количество <b>проектов жилых и общественных зданий</b> различного уровня сложности, что позволяет решать разнообразные задачи в области проектирования с высоким качеством и с строгим соблюдением сроков выполнения работ.</p>

<p>Высокий уровень подготовки и многолетний опыт работы сотрудников позволяет решать любые творческие задачи, находить архитектурные решения, наиболее точно отражающие самые неожиданные и смелые желания заказчика.</p>

<p>«ССК-Проект» включает в себя группу архитектурного проектирования, конструкторский отдел, группу специалистов по <b>проектированию инженерных систем</b>, отдел дизайна и авторского надзора за реализацией проектов.</p>

<p>Специалисты проектного отдела владеют всеми новейшими методами проектирования, а современное техническое оснащение офиса позволяет успешно работать над сложнейшими объектами.</p>

<p>«ССК-Проект» обладает допуском к работам, оказывающим влияние на безопасность объектов капитального строительства.</p>

<p>Использование Группой компаний «ССК» современных стандартов качества гарантирует безопасность, актуальность и уникальность Вашего проекта.</p>', false, 'Проектные работы', 'проект, проектирование', 'Организация и выполнение всех видов проектных работ для жилых и нежилых объектов недвижимости Москвы и Московской области', '', '', 2, '2018-08-22 15:49:07.494709', '2018-08-29 02:48:42.345459', NULL, 0);
INSERT INTO public.activities (id, published, navigated, name, header, annotation, content, partial, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) VALUES (6, true, true, 'Строительный контроль', '', '<ul class="h-push">
    <li>проверка соблюдения технологии производства СМР и сроков строительства;</li>
    <li>проверка достоверности документирования результатов работ;</li>
    <li>освидетельствование скрытых работ и промежуточная приемка возведенных строительных конструкций;</li>
    <li>проверка соответствия фактически выполненных объемов;</li>
    <li>проверка соответствия законченного строительством объекта требованиям <b>проектной документации</b> и технических регламентов;</li>
    <li>осуществление иных видов работ по <b>строительному контролю</b>.</li>
</ul>', '<p>Одним из основных направлений деятельности ГК «ССК» является выполнение <strong>функций технического заказчика</strong>, в том числе, осуществление <strong>строительного контроля</strong>.</p>

<p>Специалисты ГК «ССК» имеют большой опыт выполнения <b>функций заказчика</b> на стадии строительства, в задачи которых входит решение любых организационных вопросов — от получения разрешения на строительство до ввода объекта в эксплуатацию.</p>

<p>При осуществлении <b>строительного контроля</b> сотрудники ГК «ССК» осуществляют надзор за всеми стадиями строительного процесса, дают конкретные рекомендации по устранению нарушений, выявленных техническим, авторским и государственным строительным надзором. Заказчики своевременно информируются о выявленных нарушениях.</p>

<h2>Контроль качества строительно-монтажных работ</h2>

<h4>Контроль качества</h4>

<p>Инженеры группы компаний «ССК» осуществляют ежедневный мониторинг строительно-монтажных работ на объекте, принимая непосредственное участие в сдаче-приемке всех выполненных этапов работ. Контроль качества подразумевает как виртуальный осмотр, так и проведение необходимых испытаний непосредственно на площадке строительства, в том числе и в лабораторных условиях. В ходе мониторинга выполняется сверка фактически выполненных работ с решениями, принятыми в рабочей документации.</p>

<p>Стоит отметить, что <b>контроль качества работ</b> и выявление нарушений может производиться совместно с Авторским надзором. По результатам ежедневного мониторинга инженерами <b>строительного контроля</b> подготавливаются такие документы, как реестр не устраненных — генподрядчиком замечаний, реестры полученной и исполнительной рабочей документации, накопительные ведомости, фото-отчеты, предписания и уведомления подрядным организациям.</p>

<h4>Контроль качества СМР</h4>

<p>Обеспечивает высокий <b>контроль качества строительства</b> — предотвращает деформации и обрушения конструкций зданий, возникающие уже в первые годы эксплуатации объекта, а зачастую обнаруживаемые еще до сдачи объекта в эксплуатацию. Позволяет исключить скрытые дефекты конструкций и других инженерных сетей, обнаружение которых на этапе эксплуатации здания невозможно или затруднено, и сопряжено со значительными дополнительными расходами на обследование здания.</p>

<h4>Контроль соблюдения графиков строительно-монтажных работ</h4>

<p>Именно <b>контроль утвержденных сроков</b> выполнения строительно-монтажных работ является одной из основных функций специалистов строительного контроля. Не стоит говорить о том, насколько важно соблюдение сроков при строительстве объектов жилой, коммерческой или промышленной недвижимости.</p>

<p>В первую очередь, срыв запланированных графиков приводит к значительному удорожанию стоимости строительства, в особенности если были задействованы кредитные средства.</p>

<p>Существует ряд основных мероприятий ГК «ССК» по контролю соблюдения сроков строительно-монтажных работ:</p>

<ul class="h-push">
    <li>Сверка условий договоров подряда с утвержденным проектной документацией объемом работ;</li>
    <li>Анализ соответствия графика работ с утвержденным объемом работ и их порядком на основании таких документов как:
        <ul>
            <li>проект организации строительства;</li>
            <li>проект производства работ и др.</li>
        </ul>
    </li>
    <li>Ежедневный контроль соблюдения утвержденных графиков непосредственно на строительной площадке.</li>
</ul>

<h2>Входной контроль</h2>

<p>К сожалению, практически на любой строительной площадке можно столкнуться с тем, что подрядные организации, вопреки рабочей документации, закупают более дешевые строительные материалы.</p>

<p>На данном этапе, в первую очередь осуществляется проверка поступающих на объект строительных материалов, и готовых конструкций.</p>

<p>Контролируется <em>качество материалов</em>, их количество и комплектность, а также условия хранения на строительной площадке. Помимо этого, осуществляется обязательная проверка <em>сопроводительной документации на материалы</em> — сертификаты, технические паспорта, товарные накладные, результаты исследований.</p>

<p>Проверка поступающих на площадку материалов и оборудования осуществляется по следующим критериям:</p>

<ul class="push">
    <li>Визуальный осмотр и проверка комплектности продукции;</li>
    <li>Приемка сопроводительной документации на продукцию, которая, помимо транспортной (отгрузочной) документации, может включать в себя технические, эксплуатационные и разрешительные документы (сертификаты, разрешения, свидетельства экспертизы);</li>
    <li>Приемка по количеству;</li>
    <li>Соответствие маркировок проектно-сметной документации;</li>
    <li>Оценка качества не только путем визуального осмотра, но и с использованием специализированного оборудования.</li>
</ul>

<h2>Контроль документации</h2>

<p>На протяжении выполнения строительно-монтажных работ подрядные организации оформляют исполнительную документацию, которая в последующем анализируется и визируется специалистами строительного контроля.</p>

<p>Комплект исполнительной документации включает в себя исполнительные геодезические схемы и акты приемки геодезической разбивки, общие и специальные журналы работ, схемы сетей инженерных коммуникаций, акты приемки конструкций, результаты испытаний работоспособности инженерных систем и оборудования, результаты лабораторных исследований, рабочие чертежи (включающие данные о реально выполненных работах) и другие документы. Вся работа службы строительного контроля основывается на разработанном комплекте рабочей документации. Данная документация тщательно проверяется по аспектам комплектности, достаточности, информативности и содержания.</p>

<p>После проверки рабочей документации наличия положительного заключения <em>Государственной экспертизы</em>, она передается в производство работ.</p>

<p> Порядок оформления <em>исполнительной документации</em> строго регламентируется действующим законодательством Российской Федерации. В комплект исполнительной документации входят документы, подтверждающие фактическое выполнение работ и их соответствие рабочей документации. Наряду с проверкой качества строительно-монтажных работ, инженеры строительного надзора также выполняют мониторинг исполнительной документации на предмет ее комплектности и соответствия реальному положению. При сдаче объекта в эксплуатацию данный комплект исполнительной документации должен быть предоставлен инспекторам Строительного надзора для проверки и помещения прав.</p>', false, 'Строительный контроль', 'строительный контроль, контроль качества, контроль соблюдения сроков, строительный надзор', 'Организация проведения мероприятий строительного контроля и строительного надзора на крупных жилых и нежилых объектах недвижимости Москвы и Московской области', '', '', 5, '2018-08-22 15:49:07.584233', '2018-08-28 01:51:59.717726', '1', 1);
INSERT INTO public.activities (id, published, navigated, name, header, annotation, content, partial, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) VALUES (1, true, true, 'Функции технического заказчика', '', '<ul class="mb-3 h-push">
    <li>разработка задания на проектирование;</li>
    <li>получение Градостроительного Плана Земельного Участка;</li>
    <li>организация инженерных изысканий;</li>
    <li>получение технических условий на присоединение к инженерным сетям;</li>
    <li>сопровождение экспертизы Проектной документации и ее утверждение;</li>
    <li>получение разрешения на строительство;</li>
    <li>сопровождение сдачи законченного строительством объекта и получение ЗОС;</li>
    <li>получение разрешения на ввод объекта в эксплуатацию;</li>
    <li>постановка на кадастровый учет;</li>
    <li>разработка и утверждение специальных технических условий;</li>
    <li>согласование перепланировок и изменения функционального назначения помещений.</li>
</ul>

<ul class="h-push">
    <li>проверка соблюдения технологии производства СМР и сроков строительства;</li>
    <li>проверка достоверности документирования результатов работ;</li>
    <li>освидетельствование скрытых работ и промежуточная приемка возведенных строительных конструкций;</li>
    <li>проверка соответствия фактически выполненных объемов;</li>
    <li>проверка соответствия законченного строительством объекта требованиям проектной документации и технических регламентов;</li>
    <li>осуществление иных видов работ по строительному контролю.</li>
</ul>', '', true, 'Функции технического заказчика', 'технический заказчик, функции технического заказчика', 'Предоставление услуг по выполнению функций технического заказчика на крупных жилых и нежилых объектах недвижимости Москвы и Московской области', '', '', 0, '2018-08-22 15:49:07.397378', '2018-08-28 01:52:31.716758', NULL, 0);
INSERT INTO public.activities (id, published, navigated, name, header, annotation, content, partial, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) VALUES (4, true, true, 'Строительство', 'Строительно-монтажные работы', '<ul class="h-push">
    <li>общестроительные работы;</li>
    <li>отделочные работы;</li>
    <li>монолитные работы;</li>
    <li>строительство и перекладка инженерных сетей и сооружений;</li>
    <li>дорожное строительство;</li>
    <li>снос зданий;</li>
    <li>рекультивация территорий застройки;</li>
    <li>монтаж внутренних инженерных систем;</li>
    <li>монтаж слаботочных и охраннопожарных систем;</li>
    <li>дизайнерская отделка помещений.</li>
</ul>', '<p><b>Группа компаний «ССК»</b> выполняет полный спектр <strong>строительно-монтажных работ</strong>, в том числе осуществление функций генерального подрядчика.</p>

<p>Современные методы управления проектами и наличие <a href="/activities/1">системы контроля управления качеством</a> позволяет выполнить поставленные задачи в кратчайшие сроки и с должным качеством.</p>

<div class="card lead text-justify border-success mb-3">
    <div class="card-body">
        <p class="card-text"><b>Строительно-монтажные работы</b> проводятся высококвалифицированными и опытными специалистами с высшим строительным образованием, которые своевременно проходят курсы повышения квалификации, имеют <a href="/permits">сертификаты соответствия</a>, удостоверяющие, что уровень профессионального образования, опыт работы и профессиональные навыки соответствуют занимаемым должностям.</p>
    </div>
</div>

<p>Использование собственных <a href="/activities/5">средств механизации</a> является одним из ключевых конкурентных преимуществ Группы.</p>', false, 'Строительно-монтажные работы', 'строительно-монтажные работы', 'Организация выполнения строительно-монтажных работ любого уровня на жилых и нежилых объектах недвижимости Москвы и Московской области', '', '', 3, '2018-08-22 15:49:07.522346', '2018-08-29 03:01:12.023597', NULL, 0);
INSERT INTO public.activities (id, published, navigated, name, header, annotation, content, partial, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) VALUES (5, true, true, 'Механизация строительства', 'Механизация строительства, дорожные и земляные работы', '<ul class="h-push">
    <li>аренда спецтехники;</li>
    <li>земляные работы;</li>
    <li>асфальтирование;</li>
    <li>получение разрешения на перемещение грунта;</li>
    <li>вывоз грунта;</li>
    <li>перевозка сыпучих грунтов.</li>
</ul>', '<p class="mb-2"><b>ООО&nbsp;«УМ&nbsp;77»</b> располагает большим парком спецтехники, основу которого составляют большегрузные самосвалы немецкого производителя MAN, что позволяет выполнять следующие виды работ:</p>

<div class="h-overflow--x">
    <ul class="list-icon h-push mb-3">
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            разработка котлованов, вывоз грунта;
        </li>
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            снос зданий;
        </li>
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            аренда грузовых самосвалов;
        </li>
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            асфальтирование дорог;
        </li>
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            доставка песка, щебня, отсева, грунта, керамзита и т.д.;
        </li>
        <li>
            <span class="icon icon-check-square-o icon--list text-success" aria-hidden="true"></span>
            озеленение и благоустройство территорий.
        </li>
    </ul>
</div>

<p class="mb-2"><b>ООО&nbsp;«УМ&nbsp;77»</b> в 2015 году занимался разработкой, вывозом грунта и строительного мусора с объектов:</p>

<ul class="list-icon h-push">
    <li>
        <span class="icon icon-check-square icon--list text-success" aria-hidden="true"></span>
        Реконструкция стадиона «Лужники»;
    </li>
    <li>
        <span class="icon icon-check-square icon--list text-success" aria-hidden="true"></span>
        Строительство объекта «Парк Зарядье», по адресу: г. Москва, ул. Варварка, д. 6;
    </li>
    <li>
        <span class="icon icon-check-square icon--list text-success" aria-hidden="true"></span>
        Объект  «Михалковский тоннель», по адресу: пересечение Большой Академической ул. и Михалковской;
    </li>
    <li>
        <span class="icon icon-check-square icon--list text-success" aria-hidden="true"></span>
        Объект Северо-Восточная хорда,  участок от Щелковского до Измайловского шоссе;
    </li>
    <li>
        <span class="icon icon-check-square icon--list text-success" aria-hidden="true"></span>
        Объект Северо-Западная хорда, участок от Сколковского шоссе, до Дмитровского шоссе.
    </li>
</ul>', false, 'Механизация строительства, дорожные и земляные работы', 'спецтехника, аренда спецтехники', 'Организация мероприятий по механизации строительства, выполнение дорожных и земляных работ любого уровня на крупных жилых и нежилых объектах недвижимости Москвы и Московской области', '', '', 4, '2018-08-22 15:49:07.552984', '2018-08-29 04:38:55.634593', NULL, 0);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.ar_internal_metadata (key, value, created_at, updated_at) VALUES ('environment', 'production', '2018-08-22 15:49:02.642486', '2018-08-22 15:49:02.642486');


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.areas (id, active, name, index, created_at, updated_at) VALUES (1, true, 'Функции технического заказчика', 0, '2018-08-22 15:49:07.299747', '2018-08-22 15:49:07.299747');
INSERT INTO public.areas (id, active, name, index, created_at, updated_at) VALUES (2, true, 'Научно-исследовательская деятельность', 1, '2018-08-22 15:49:07.310224', '2018-08-22 15:49:07.310224');
INSERT INTO public.areas (id, active, name, index, created_at, updated_at) VALUES (3, true, 'Проектные работы', 2, '2018-08-22 15:49:07.324708', '2018-08-22 15:49:07.324708');
INSERT INTO public.areas (id, active, name, index, created_at, updated_at) VALUES (4, true, 'Строительно-монтажные работы', 3, '2018-08-22 15:49:07.341833', '2018-08-22 15:49:07.341833');
INSERT INTO public.areas (id, active, name, index, created_at, updated_at) VALUES (5, true, 'Механизация строительства, дорожные и земляные работы', 4, '2018-08-22 15:49:07.350967', '2018-08-22 15:49:07.350967');


--
-- Data for Name: areas_throughs; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (1, 'Activity', 1, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (2, 'Activity', 2, 2);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (3, 'Activity', 3, 3);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (4, 'Activity', 4, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (5, 'Activity', 5, 5);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (6, 'Activity', 6, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (7, 'Activity', 7, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (8, 'Activity', 8, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (9, 'Activity', 9, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (10, 'Activity', 10, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (11, 'Target', 1, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (12, 'Target', 1, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (13, 'Target', 2, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (14, 'Target', 3, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (15, 'Target', 4, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (16, 'Target', 5, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (17, 'Target', 6, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (18, 'Target', 7, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (19, 'Target', 8, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (20, 'Target', 9, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (21, 'Target', 9, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (22, 'Target', 10, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (23, 'Target', 11, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (24, 'Target', 12, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (25, 'Target', 13, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (26, 'Target', 14, 3);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (27, 'Target', 15, 3);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (28, 'Target', 16, 3);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (29, 'Target', 17, 3);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (30, 'Target', 18, 3);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (31, 'Target', 19, 3);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (32, 'Target', 20, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (33, 'Target', 20, 2);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (34, 'Target', 21, 2);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (35, 'Target', 22, 2);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (36, 'Target', 23, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (37, 'Target', 24, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (38, 'Target', 25, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (39, 'Target', 26, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (40, 'Target', 27, 1);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (41, 'Target', 28, 4);
INSERT INTO public.areas_throughs (id, resource_type, resource_id, area_id) VALUES (42, 'Target', 29, 4);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: vps
--



--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: vps
--



--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.partners (id, published, navigated, active, affiliate, name, content, email, phone, address, geo, website, title, keywords, description, canonical, robots, index, user_id, created_at, updated_at) VALUES (8, true, true, true, false, 'АО «ПСН»', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2018-08-22 15:49:07.871605', '2018-08-22 15:49:07.871605');
INSERT INTO public.partners (id, published, navigated, active, affiliate, name, content, email, phone, address, geo, website, title, keywords, description, canonical, robots, index, user_id, created_at, updated_at) VALUES (1, true, true, true, true, 'ООО «ССК»', '', '', '', '', '', '', '', '', '', '', '', 0, NULL, '2018-08-22 15:49:07.776965', '2018-08-22 15:56:43.182703');
INSERT INTO public.partners (id, published, navigated, active, affiliate, name, content, email, phone, address, geo, website, title, keywords, description, canonical, robots, index, user_id, created_at, updated_at) VALUES (2, true, true, true, true, 'ООО «ССК-Проект»', '', '', '', '', '', '', '', '', '', '', '', 1, NULL, '2018-08-22 15:49:07.791147', '2018-08-22 15:57:28.838049');
INSERT INTO public.partners (id, published, navigated, active, affiliate, name, content, email, phone, address, geo, website, title, keywords, description, canonical, robots, index, user_id, created_at, updated_at) VALUES (3, true, true, true, true, 'ООО «СУ 363»', '', '', '', '', '', '', '', '', '', '', '', 2, NULL, '2018-08-22 15:49:07.803061', '2018-08-22 15:57:40.534716');
INSERT INTO public.partners (id, published, navigated, active, affiliate, name, content, email, phone, address, geo, website, title, keywords, description, canonical, robots, index, user_id, created_at, updated_at) VALUES (4, true, true, true, true, 'НПЦ «СтройТех»', '', '', '', '', '', '', '', '', '', '', '', 3, NULL, '2018-08-22 15:49:07.814739', '2018-08-22 15:58:08.290865');
INSERT INTO public.partners (id, published, navigated, active, affiliate, name, content, email, phone, address, geo, website, title, keywords, description, canonical, robots, index, user_id, created_at, updated_at) VALUES (5, true, true, true, true, 'ООО «УМ-77»', '', '', '', '', '', '', '', '', '', '', '', 4, NULL, '2018-08-22 15:49:07.827359', '2018-08-22 15:58:37.785221');
INSERT INTO public.partners (id, published, navigated, active, affiliate, name, content, email, phone, address, geo, website, title, keywords, description, canonical, robots, index, user_id, created_at, updated_at) VALUES (6, true, true, true, false, 'ЗАО «ДОНСТРОЙ Инвест»', '', '', '', '', '', '', '', '', '', '', '', 5, NULL, '2018-08-22 15:49:07.839387', '2018-08-22 15:58:53.429394');
INSERT INTO public.partners (id, published, navigated, active, affiliate, name, content, email, phone, address, geo, website, title, keywords, description, canonical, robots, index, user_id, created_at, updated_at) VALUES (7, true, true, true, false, 'АО «МР Групп»', '', '', '', '', '', '', '', '', '', '', '', 6, NULL, '2018-08-22 15:49:07.855648', '2018-08-22 15:59:05.8893');


--
-- Data for Name: permits; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.permits (id, published, navigated, name, header, number, provider, issue_at, onset_at, end_at, title, keywords, description, canonical, robots, index, partner_id, created_at, updated_at) VALUES (1, true, true, 'СРО', 'Свидетельство <small>о допуске к определённому виду или видам работ, которые оказывают влияние на безопасность объектов капитального строительства</small>', '0178.01-2013-7717595347-П-120', 'СРО НП «Объединение проектных организаций»', '2013-06-14', NULL, NULL, 'Свидетельство о допуске к определённому виду или видам работ, которые оказывают влияние на безопасность объектов капитального строительства 0178.01-2013-7717595347-П-120', 'свидетельство о допуске', 'Свидетельство о допуске к определённому виду или видам работ № 0178.01-2013-7717595347-П-120', '', '', 0, 1, '2018-08-22 15:49:08.977357', '2018-09-23 08:30:41.465331');
INSERT INTO public.permits (id, published, navigated, name, header, number, provider, issue_at, onset_at, end_at, title, keywords, description, canonical, robots, index, partner_id, created_at, updated_at) VALUES (2, true, true, 'СРО', 'Свидетельство <small>о допуске к определённому виду или видам работ, которые оказывают влияние на безопасность объектов капитального строительства</small>', '00888.02-2010-7717595347-C-196', 'СРО НП «Ассоциация строительных организаций «Межрегиональное качество»»', '2012-04-26', NULL, NULL, 'Свидетельство о допуске к определённому виду или видам работ, которые оказывают влияние на безопасность объектов капитального строительства 00888.02-2010-7717595347-C-196', 'свидетельство о допуске', 'Свидетельство о допуске к определённому виду или видам работ № 00888.02-2010-7717595347-C-196', '', '', 1, 1, '2018-08-22 15:49:08.99658', '2018-09-23 08:31:29.017035');
INSERT INTO public.permits (id, published, navigated, name, header, number, provider, issue_at, onset_at, end_at, title, keywords, description, canonical, robots, index, partner_id, created_at, updated_at) VALUES (3, true, true, 'ФСБ', 'Лицензия ФСБ <small>на осуществление работ, связанных с использованием сведений, составляющих государственную тайну</small>', '21220', 'Управление ФСБ России по г. Москве и Московской области', '2012-05-04', NULL, '2016-11-11', 'Лицензия ФСБ на осуществление работ, связанных с использованием сведений, составляющих государственную тайну 21220', 'лицензия, лицензия фсб', 'Лицензия № 21220 Управления ФСБ России по городу Москве и Московской области', '', '', 2, 1, '2018-08-22 15:49:09.011421', '2018-09-23 08:31:55.833986');
INSERT INTO public.permits (id, published, navigated, name, header, number, provider, issue_at, onset_at, end_at, title, keywords, description, canonical, robots, index, partner_id, created_at, updated_at) VALUES (4, true, true, 'СРО', 'Свидетельство <small>о допуске к определённому виду или видам работ, которые оказывают влияние на безопасность объектов капитального строительства</small>', '0109.03-2013-7717690230-П-120', 'СРО НП «Объединение проектных организаций»', '2013-03-07', NULL, NULL, 'Свидетельство о допуске к определённому виду или видам работ, которые оказывают влияние на безопасность объектов капитального строительства 0109.03-2013-7717690230-П-120', 'свидетельство о допуске', 'Свидетельство о допуске к определённому виду или видам работ № 0109.03-2013-7717690230-П-120', '', '', 0, 2, '2018-08-22 15:49:09.030976', '2018-09-23 08:32:21.575921');


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.schema_migrations (version) VALUES ('20180707000000');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000001');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000010');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000011');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000012');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000020');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000021');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000030');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000031');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000040');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000050');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000060');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000070');
INSERT INTO public.schema_migrations (version) VALUES ('20180707000080');


--
-- Data for Name: targets; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (4, true, true, 1, NULL, NULL, 'МФК «Водный»', '«Водный» <small>многофункциональный комплекс</small>', '<p>общая площадь 191.893&nbsp;м<sup>2</sup></p>', 'г.&nbsp;Москва, Головинское&nbsp;шоссе, вл.&nbsp;5', '55.840252, 37.492013', '', 'Многофункциональный комплекс «Водный»', 'водный', 'Проведены работы в многофункциональном комплексе «Водный» по адресу город Москва, Головинское шоссе, владение 5', '', '', 3, 7, '', '2018-08-22 15:49:08.141756', '2018-08-22 16:21:01.939538');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (3, true, true, 1, NULL, NULL, 'ЖК «Фили Град-2»', '«Фили Град-2» <small>жилой комплекс</small>', '<p>общая площадь 191.215&nbsp;м<sup>2</sup></p>', 'г.&nbsp;Москва, Береговой&nbsp;проезд, вл.&nbsp;5', '55.755464, 37.510034', '', 'Жилой комплекс «Фили Град-2»', 'фили град', 'Проведены работы в жилом комплексе «Фили Град-2» по адресу г. Москва, Береговой проезд, вл. 5', '', '', 2, 7, '', '2018-08-22 15:49:08.111424', '2018-08-22 16:03:24.698721');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (5, true, true, 1, NULL, NULL, 'ЖК «Суббота»', '«Суббота» <small>жилой комплекс</small>', '<p>Общая площадь 85.878 м<sup>2</sup></p>', 'Москва,  САО, ул.&nbsp;Верхняя, вл.&nbsp;34', '55.779052, 37.574595', '', 'Жилой комплекс «Суббота»', 'суббота, дон-строй', 'Проведены работы в жилом комплексе «Суббота» по адресу Москва,  САО, улица Верхняя, владение 34', '', '', 0, 6, '', '2018-08-22 15:49:08.166936', '2018-08-22 16:04:03.358967');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (6, true, true, 0, NULL, NULL, 'МФК гостиница «Москва»', 'Гостиница «Москва» <small>многофункциональный комплекс</small>', '', 'Москва, улица&nbsp;Охотный ряд, владение&nbsp;2', '55.756998, 37.617644', '', 'Многофункциональный комплекс Гостиница «Москва»', 'гостиница москва', 'Проведены строительно-монтажные работы в многофункциональном комплексе «Гостиница Москва» по адресу Москва улица Охотный ряд владение 2', '', '', 0, NULL, '', '2018-08-22 15:49:08.199691', '2018-08-22 16:04:26.339249');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (7, true, true, 0, NULL, NULL, 'МЖК «Эмеральд»', '«Эмеральд» <small>многофункциональный жилой комплекс</small>', '', 'Москва, Ленинский проспект, владение&nbsp;105', '55.666283, 37.514328', '', 'Многофункциональный жилой комплекс «Эмеральд»', 'эмеральд', 'Проведены строительно-монтажные работы в многофункциональном жилом комплексе «Эмеральд» по адресу Москва Ленинский проспект владение 105', '', '', 1, NULL, '', '2018-08-22 15:49:08.227654', '2018-08-22 16:04:56.241985');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (8, true, true, 0, NULL, NULL, 'МЖК «Алые Паруса»', '«Алые Паруса» <small>многофункциональный жилой комплекс</small>', '', 'Москва, улица&nbsp;Авиационная, владение&nbsp;77(77-99)', '55.808338, 37.450716', '', 'Многофункциональный жилой комплекс «Алые Паруса»', 'алые паруса', 'Проведены строительно-монтажные работы в многофункциональном жилом комплексе «Алые Паруса» по адресу Москва, улица Авиационная, владение 77(77-99)', '', '', 2, NULL, '', '2018-08-22 15:49:08.255944', '2018-08-22 16:05:18.954055');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (9, true, true, 0, NULL, NULL, 'МЖК «Авеню 77»', '«Авеню 77» <small>многофункциональный жилой комплекс</small>', '', 'Москва, микрорайон Северное Чертаново, владение&nbsp;1а', '55.637302, 37.59948', '', 'Многофункциональный жилой комплекс «Авеню 77»', 'авеню 77', 'Проведены строительно-монтажные работы в многофункциональном жилом комплексе «Авеню 77» по адресу Москва микрорайон Северное Чертаново владение 1а', '', '', 3, NULL, '', '2018-08-22 15:49:08.288011', '2018-08-22 16:05:38.438346');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (10, true, true, 0, NULL, NULL, 'МЖК «Аэробус»', '«Аэробус» <small>многофункциональный жилой комплекс</small>', '', 'Москва, Кочновский проезд, дом&nbsp;4', '55.806447, 37.543473', '', 'Многофункциональный жилой комплекс «Аэробус»', 'аэробус', 'Проведены строительно-монтажные работы в многофункциональном жилом комплексе «Аэробус» по адресу Москва Кочновский проезд дом 4', '', '', 4, NULL, '', '2018-08-22 15:49:08.32755', '2018-08-22 16:08:39.038468');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (11, true, true, 0, NULL, NULL, 'ЖК «Скай Форт»', '«Скай Форт» <small>жилой комплекс</small>', '', 'Москва, 1-й Нагатинский проезд, владение&nbsp;11', '55.67822, 37.634416', '', 'Жилой комплекс «Скай Форт»', 'скай форт', 'Проведены строительно-монтажные работы в жилом комплексе «Скай Форт» по адресу Москва 1-й Нагатинский проезд владение 11', '', '', 5, NULL, '', '2018-08-22 15:49:08.361256', '2018-08-22 16:09:01.645012');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (12, true, true, 0, NULL, NULL, 'ФОК ул.&nbsp;Ткацкая, вл.&nbsp;26', 'ул. Ткацкая, вл. 26 <small>физкультурно-оздоровительный комплекс</small>', '', 'г.&nbsp;Москва, ул.&nbsp;Ткацкая, вл.&nbsp;26', '55.786348, 37.732645', '', 'Физкультурно-Оздоровительный Комплекс ул. Ткацкая, вл. 26', 'ткацкая', 'Проедены работы в физкультурно-оздоровительном комплексе (ФОК) по адресу г. Москва, ул. Ткацкая, вл. 26', '', '', 6, NULL, '', '2018-08-22 15:49:08.398853', '2018-08-22 16:09:25.968901');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (14, true, true, 0, NULL, NULL, 'МФК «Негоциант»', '«Негоциант» <small>многофункциональный комплекс</small>', '', 'г.&nbsp;Москва, ул.&nbsp;Большая Якиманка, вл.&nbsp;2-4', '55.740956, 37.613412', '', 'Многофункциональный комплекс «Негоциант»', 'негоциант', 'Проведены работы в многофункциональном комплексе «Негоциант» с апартаментами и гостиницей по адресу г. Москва ул. Большая Якиманка вл. 2-4', '', '', 8, NULL, '', '2018-08-22 15:49:08.457712', '2018-08-22 16:10:09.212701');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (15, true, true, 0, NULL, NULL, 'Жилой дом Милютинский пер.', 'Милютинский пер., д. 7 <small>жилой дом</small>', '', 'г.&nbsp;Москва, Милютинский&nbsp;пер., д.&nbsp;7', '55.763162, 37.63161', '', 'Жилой дом Милютинский пер., д. 7', 'милютинский', 'Проведены работы в жилом доме по адресу г. Москва Милютинский пер. д. 7', '', '', 9, NULL, '', '2018-08-22 15:49:08.492837', '2018-08-22 16:10:31.65616');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (16, true, true, 0, NULL, NULL, 'Жилой дом Леонтьевский пер.', 'Леонтьевский пер., д. 2а, стр. 1 <small>жилой дом</small>', '', 'г.&nbsp;Москва, Леонтьевский&nbsp;пер., д.&nbsp;2а, стр.&nbsp;1', '55.758301, 37.601471', '', 'Жилой дом Леонтьевский пер., д. 2а, стр. 1', 'леонтьевский', 'Проведены работы в жилом доме по адресу г. Москва, Леонтьевский пер., д. 2а, стр. 1', '', '', 10, NULL, '', '2018-08-22 15:49:08.524935', '2018-08-22 16:10:52.26214');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (17, true, true, 0, NULL, NULL, 'Санаторный комплекс УДП', 'Санаторный комплекс <small>управление делами президента</small>', '', 'Московская&nbsp;обл., пос.&nbsp;Снегири', '55.886189, 37.038266, 10', '', 'Санаторный комплекс Управления делами Президента', 'снегири', 'Проведены работы в санаторном комплексе Управления делами Президента по адресу Московская область посёлок Снегири', '', '', 11, NULL, '', '2018-08-22 15:49:08.556022', '2018-08-22 16:11:18.422614');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (18, true, true, 0, NULL, NULL, 'Жилой посёлок Заречье', 'Заречье <small>жилой посёлок</small>', '', 'Московская&nbsp;область, Одинцовский&nbsp;район, посёлок&nbsp;Заречье', '55.68777, 37.395339, 10', '', 'Жилой посёлок Заречье', 'заречье', 'Проведены проектные работы для жилого посёлка Заречье по адресу Московская область Одинцовский район посёлок Заречье', '', '', 12, NULL, '', '2018-08-22 15:49:08.580573', '2018-08-22 16:11:38.858442');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (20, true, true, 0, NULL, NULL, 'МФК БЦ «Лотос»', '«Лотос» <small>многофункциональный комплекс бизнес-центр</small>', '', 'г.&nbsp;Москва, ул.&nbsp;Одесcкая, вл.&nbsp;2', '55.66422, 37.598606', '', 'Многофункциональный комплекс бизнес-центр «Лотос»', 'лотос', 'Проведены научно-исследовательские работы в многофункциональном комплексе бизнес-центр «Лотос» по адресу Москва улица Одесcкая владение 2', '', '', 14, NULL, '', '2018-08-22 15:49:08.646549', '2018-08-22 16:12:20.482377');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (21, true, true, 0, NULL, NULL, 'ЖК «Дом на Мосфильмовской»', '«Дом на Мосфильмовской» <small>жилой комплекс</small>', '', 'г.&nbsp;Москва, ул.&nbsp;Пырьева, вл.&nbsp;2', '55.724023, 37.527506', '', 'Жилой комплекс «Дом на Мосфильмовской»', 'дом на мосфильмовской', 'Проведены научно-исследовательские работы в жилом комплексе «Дом на Мосфильмовской» по адресу Москва улица Пырьева владение 2', '', '', 15, NULL, '', '2018-08-22 15:49:08.678602', '2018-08-22 16:12:41.750199');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (22, true, true, 0, NULL, NULL, 'МФК Стадион «Спартак»', 'Стадион «Спартак» <small>многофункциональный комплекс</small>', '', 'г.&nbsp;Москва, Волоколамское&nbsp;ш., вл.&nbsp;69', '55.817964, 37.440294', '', 'Многофункциональный комплекс стадион «Спартак»', 'стадион спартак', 'Проведены научно-исследовательские работы в многофункциональном комплексе стадион «Спартак» по адресу Москва Волоколамское шоссе владение 69', '', '', 16, NULL, '', '2018-08-22 15:49:08.705028', '2018-08-22 16:13:01.492118');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (23, true, true, 0, NULL, NULL, 'МЖК «PerovSky»', '«PerovSky» <small>многофункциональный жилой комплекс</small>', '', 'Москва, шоссе&nbsp;Энтузиастов, 88', '55.76643, 37.799655', '', 'Многофункциональный жилой комплкс «PerovSky»', 'perovsky, mr group', 'Проведены работы в многофункциональном жилом комплексе «PerovSky» по адресу Москва, шоссе Энтузиастов, 88', '', '', 17, NULL, '', '2018-08-22 15:49:08.732493', '2018-08-22 16:13:28.131134');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (24, true, true, 0, NULL, NULL, 'ЖК «Фили Град»', '«Фили Град» <small>жилой комплекс</small>', '<p>общая площадь 176.000&nbsp;м<sup>2</sup></p>', 'г.&nbsp;Москва, Береговой&nbsp;проезд, вл.&nbsp;5', '55.756112, 37.50822', '', 'Жилой комплекс «Фили Град»', 'фили град', 'Проведены работы в жилом комплексе «Фили Град-2» по адресу г. Москва, Береговой проезд, вл. 5', '', '', 18, NULL, '', '2018-08-22 15:49:08.760075', '2018-08-22 16:13:52.7531');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (13, true, true, 0, NULL, NULL, 'ЖК «Большое Домодедово»', '«Большое Домодедово» <small>жилой комплекс</small>', '<p>общая площадь 685.000&nbsp;м<sup>2</sup></p>', 'Московская область, г.&nbsp;Домодедово, мкр.&nbsp;Южное Домодедово, ул&nbsp;. Курыжова', '55.396338, 37.770882', '', 'Жилой комплекс «Большое Домодедово»', 'большое домодедово', 'Проведены работы в жилом комплексе «Большое Домодедово» по адресу Московская область г. Домодедово мкр. Южное Домодедово ул . Курыжова', '', '', 7, NULL, '', '2018-08-22 15:49:08.428555', '2018-08-22 16:09:49.783746');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (19, true, true, 0, NULL, NULL, 'БЦ «Прогресс Плаза»', '«Прогресс Плаза» <small>бизнес-центр</small>', '<p>общая площадь 11.520&nbsp;м<sup>2</sup></p>', 'г. Москва, улица&nbsp;Шарикоподшипниковская, дом&nbsp;1', '55.723129, 37.66562', '', 'Бизнес-центр «Прогресс Плаза»', 'прогресс плаза', 'Проведены проектные работы для бизнес-центра «Прогресс Плаза» по адресу город Москва улица Шарикоподшипниковская дом 1', '', '', 13, NULL, '', '2018-08-22 15:49:08.61721', '2018-08-22 16:12:01.132584');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (1, true, true, 2, NULL, NULL, 'Микрорайон «Эко Видное»', '«Эко Видное» <small>жилой микрорайон</small>', '', 'Московская область, Ленинский район', '55.536338, 37.724465', '', 'Жилой микрорайон «Эко Видное»', 'эко видное', 'Проведены работы в жилом микрорайоне «Эко Видное» по адресу Московская область, Ленинский район', '', '', 0, 7, '', '2018-08-22 15:49:07.949177', '2018-08-22 16:02:39.127057');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (2, true, true, 2, NULL, NULL, 'Эко-город «Новое Ступино»', '«Новое Ступино» <small>малоэтажный город-спутник</small>', '', 'Московская&nbsp;обл., Ступинский&nbsp;район, село&nbsp;Верзилово', '55.025603, 38.094262, 13', '', 'Малоэтажный город-спутник «Новое Ступино»', 'новое ступино', 'Проведены работы в малоэтажном городе-спутнике «Новое Ступино» по адресу Московская обл. Ступинский район село Верзилово', '', '', 1, 7, '', '2018-08-22 15:49:07.989131', '2018-08-22 16:02:58.411797');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (26, true, true, 0, NULL, NULL, 'МФЦ «Савеловский Сити»', '«Савёловский Сити» <small>многофункциональный офисно-деловой центр</small>', '', 'г.&nbsp;Москва, ул.&nbsp;Складочная, вл.&nbsp;1', '55.797604, 37.593742', '', 'Многофункциональный офисно-деловой центр «Савёловский Сити»', 'савёловский сити', 'Проведены работы в многофункциональном офисно-деловом центре «Савёловский Сити» по адресу город Москва, улица Складочная, владение 1', '', '', 20, NULL, '', '2018-08-22 15:49:08.8101', '2018-08-22 16:14:36.859686');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (29, true, true, 0, NULL, NULL, 'БЦ «Высота»', '«Высота» <small>бизнес-центр</small>', '', 'г.&nbsp;Москва, пос.&nbsp;Газопровод', '55.58501, 37.473578', '', 'Бизнес-центр «Высота»', '', 'Проведены работы в бизнес-центре «Высота» г. Москва, пос. Газопровод', '', '', 23, NULL, '', '2018-08-22 15:49:08.898723', '2018-08-22 16:15:59.884997');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (25, true, true, 0, NULL, NULL, 'БЦ «Danilov Plaza»', '«Danilov Plaza» <small>бизнес-центр</small>', '<p>офисный центр класса «В+» общая площадь 39.740&nbsp;м<sup>2</sup></p>', 'г.&nbsp; Москва, Новоданиловская&nbsp;наб., вл.&nbsp;6', '55.698014, 37.62508', '', 'Бизнес-центр «Danilov Plaza»', 'danilov plaza', 'Проведены работы в бизнес-центре «Danilov Plaza» по адресу г.  Москва, Новоданиловская наб., вл. 6 - офисном центре класса «В+»  общей площадью 39.740 кв. м.', '', '', 19, NULL, '', '2018-08-22 15:49:08.786028', '2018-08-22 16:14:16.580226');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (28, true, true, 0, NULL, NULL, 'Квартал 126', 'Квартал 126 <small>жилой микрорайон</small>', '', 'г. Москва, район Рязанский', '55.715076, 37.796152', '', 'Микрорайон Квартал 126', '126 квартал', 'Проведены работы в жилом микрорайоне Квартал 126 по адресу г. Москва, район Рязанский', '', '', 22, NULL, '', '2018-08-22 15:49:08.863108', '2018-08-22 16:15:40.754103');
INSERT INTO public.targets (id, published, navigated, importance, start_at, finish_at, name, header, content, address, geo, website, title, keywords, description, canonical, robots, index, partner_id, partner_as, created_at, updated_at) VALUES (27, true, true, 0, NULL, NULL, 'ЖК «Водный»', '«Водный» <small>жилой комплекс</small>', '', 'г.&nbsp;Москва, Головинское&nbsp;шоссе, вл.&nbsp;5', '55.841204, 37.494281', '', 'Жилой комплекс «Водный»', 'водный', 'Проведены работы в жилом комплексе «Водный» по адресу город Москва, Головинское шоссе, владение 5', '', '', 21, NULL, '', '2018-08-22 15:49:08.834324', '2018-08-22 16:20:28.357651');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vps
--

INSERT INTO public.users (id, email, encrypted_password, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, is_admin, in_staff, name, phone, address) VALUES (2, 'manager@test.test', '$2a$11$K3yGoO1Cmcb1ro5FqbQeqOXjvXZ3C9rpd/VBnoFQVrJ8Hx7ZSWaaC', NULL, 0, NULL, NULL, NULL, NULL, '2018-08-22 15:49:07.073026', '2018-08-22 15:49:07.073026', false, true, 'Менеджер', NULL, NULL);
INSERT INTO public.users (id, email, encrypted_password, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, is_admin, in_staff, name, phone, address) VALUES (3, 'client@test.test', '$2a$11$fvyn4fditv7ZzzML9bn7SebmsLPwe7cQVaYrMwFAE9vq8rMreH0MK', NULL, 0, NULL, NULL, NULL, NULL, '2018-08-22 15:49:07.270984', '2018-08-22 15:49:07.270984', false, false, 'Клиент', NULL, NULL);
INSERT INTO public.users (id, email, encrypted_password, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, is_admin, in_staff, name, phone, address) VALUES (1, 'admin@test.test', '$2a$11$uADp2zLDJIxi7LZCGZTgrOr7NKubQJWUtrXtxkSalcb6J8yfXMQhW', '2018-08-22 15:50:15.29225', 1, '2018-08-22 15:50:15.330677', '2018-08-22 15:50:15.330677', '176.15.202.231', '176.15.202.231', '2018-08-22 15:49:06.876124', '2018-08-22 15:50:50.94704', true, true, 'Администратор', '', '');


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 92, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 92, true);


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.activities_id_seq', 10, true);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.areas_id_seq', 5, true);


--
-- Name: areas_throughs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.areas_throughs_id_seq', 42, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, false);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 1, false);


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.partners_id_seq', 8, true);


--
-- Name: permits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.permits_id_seq', 4, true);


--
-- Name: targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.targets_id_seq', 29, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vps
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: areas_throughs areas_throughs_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.areas_throughs
    ADD CONSTRAINT areas_throughs_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: permits permits_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.permits
    ADD CONSTRAINT permits_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: targets targets_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_sorting; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_active_storage_attachments_sorting ON public.active_storage_attachments USING btree (record_type, record_id, index);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: vps
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: vps
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_activities_on_ancestry; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_activities_on_ancestry ON public.activities USING btree (ancestry);


--
-- Name: index_activities_on_index; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_activities_on_index ON public.activities USING btree (index);


--
-- Name: index_activities_on_name; Type: INDEX; Schema: public; Owner: vps
--

CREATE UNIQUE INDEX index_activities_on_name ON public.activities USING btree (name);


--
-- Name: index_activities_on_navigated; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_activities_on_navigated ON public.activities USING btree (navigated);


--
-- Name: index_activities_on_published; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_activities_on_published ON public.activities USING btree (published);


--
-- Name: index_area_throughs_for_uniqueness; Type: INDEX; Schema: public; Owner: vps
--

CREATE UNIQUE INDEX index_area_throughs_for_uniqueness ON public.areas_throughs USING btree (resource_type, resource_id, area_id);


--
-- Name: index_areas_on_active; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_areas_on_active ON public.areas USING btree (active);


--
-- Name: index_areas_on_index; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_areas_on_index ON public.areas USING btree (index);


--
-- Name: index_areas_on_name; Type: INDEX; Schema: public; Owner: vps
--

CREATE UNIQUE INDEX index_areas_on_name ON public.areas USING btree (name);


--
-- Name: index_areas_throughs_on_area_id; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_areas_throughs_on_area_id ON public.areas_throughs USING btree (area_id);


--
-- Name: index_areas_throughs_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_areas_throughs_on_resource_type_and_resource_id ON public.areas_throughs USING btree (resource_type, resource_id);


--
-- Name: index_articles_on_header; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_articles_on_header ON public.articles USING btree (header);


--
-- Name: index_articles_on_navigated; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_articles_on_navigated ON public.articles USING btree (navigated);


--
-- Name: index_articles_on_published; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_articles_on_published ON public.articles USING btree (published);


--
-- Name: index_articles_on_published_at; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_articles_on_published_at ON public.articles USING btree (published_at);


--
-- Name: index_feedbacks_on_header; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_feedbacks_on_header ON public.feedbacks USING btree (header);


--
-- Name: index_feedbacks_on_index; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_feedbacks_on_index ON public.feedbacks USING btree (index);


--
-- Name: index_feedbacks_on_navigated; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_feedbacks_on_navigated ON public.feedbacks USING btree (navigated);


--
-- Name: index_feedbacks_on_partner_id; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_feedbacks_on_partner_id ON public.feedbacks USING btree (partner_id);


--
-- Name: index_feedbacks_on_published; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_feedbacks_on_published ON public.feedbacks USING btree (published);


--
-- Name: index_feedbacks_on_published_at; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_feedbacks_on_published_at ON public.feedbacks USING btree (published_at);


--
-- Name: index_partners_on_active; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_partners_on_active ON public.partners USING btree (active);


--
-- Name: index_partners_on_affiliate; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_partners_on_affiliate ON public.partners USING btree (affiliate);


--
-- Name: index_partners_on_index; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_partners_on_index ON public.partners USING btree (index);


--
-- Name: index_partners_on_name; Type: INDEX; Schema: public; Owner: vps
--

CREATE UNIQUE INDEX index_partners_on_name ON public.partners USING btree (name);


--
-- Name: index_partners_on_navigated; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_partners_on_navigated ON public.partners USING btree (navigated);


--
-- Name: index_partners_on_published; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_partners_on_published ON public.partners USING btree (published);


--
-- Name: index_partners_on_user_id; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_partners_on_user_id ON public.partners USING btree (user_id);


--
-- Name: index_permits_on_index; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_permits_on_index ON public.permits USING btree (index);


--
-- Name: index_permits_on_issue_at; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_permits_on_issue_at ON public.permits USING btree (issue_at);


--
-- Name: index_permits_on_name; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_permits_on_name ON public.permits USING btree (name);


--
-- Name: index_permits_on_navigated; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_permits_on_navigated ON public.permits USING btree (navigated);


--
-- Name: index_permits_on_number; Type: INDEX; Schema: public; Owner: vps
--

CREATE UNIQUE INDEX index_permits_on_number ON public.permits USING btree (number);


--
-- Name: index_permits_on_partner_id; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_permits_on_partner_id ON public.permits USING btree (partner_id);


--
-- Name: index_permits_on_provider; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_permits_on_provider ON public.permits USING btree (provider);


--
-- Name: index_permits_on_published; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_permits_on_published ON public.permits USING btree (published);


--
-- Name: index_targets_on_finish_at; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_targets_on_finish_at ON public.targets USING btree (finish_at);


--
-- Name: index_targets_on_importance; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_targets_on_importance ON public.targets USING btree (importance);


--
-- Name: index_targets_on_index; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_targets_on_index ON public.targets USING btree (index);


--
-- Name: index_targets_on_name; Type: INDEX; Schema: public; Owner: vps
--

CREATE UNIQUE INDEX index_targets_on_name ON public.targets USING btree (name);


--
-- Name: index_targets_on_navigated; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_targets_on_navigated ON public.targets USING btree (navigated);


--
-- Name: index_targets_on_partner_id; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_targets_on_partner_id ON public.targets USING btree (partner_id);


--
-- Name: index_targets_on_published; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_targets_on_published ON public.targets USING btree (published);


--
-- Name: index_targets_on_start_at; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_targets_on_start_at ON public.targets USING btree (start_at);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: vps
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_is_admin_and_in_staff; Type: INDEX; Schema: public; Owner: vps
--

CREATE INDEX index_users_on_is_admin_and_in_staff ON public.users USING btree (is_admin, in_staff);


--
-- Name: feedbacks fk_rails_1829abd250; Type: FK CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT fk_rails_1829abd250 FOREIGN KEY (partner_id) REFERENCES public.partners(id) ON DELETE SET NULL;


--
-- Name: partners fk_rails_19700d5164; Type: FK CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT fk_rails_19700d5164 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: areas_throughs fk_rails_68743d2681; Type: FK CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.areas_throughs
    ADD CONSTRAINT fk_rails_68743d2681 FOREIGN KEY (area_id) REFERENCES public.areas(id) ON DELETE CASCADE;


--
-- Name: targets fk_rails_6dea60d266; Type: FK CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT fk_rails_6dea60d266 FOREIGN KEY (partner_id) REFERENCES public.partners(id) ON DELETE SET NULL;


--
-- Name: permits fk_rails_b003262cc9; Type: FK CONSTRAINT; Schema: public; Owner: vps
--

ALTER TABLE ONLY public.permits
    ADD CONSTRAINT fk_rails_b003262cc9 FOREIGN KEY (partner_id) REFERENCES public.partners(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

