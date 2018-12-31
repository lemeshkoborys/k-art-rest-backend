--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO k_art_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO k_art_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO k_art_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO k_art_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO k_art_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO k_art_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO k_art_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO k_art_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO k_art_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO k_art_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO k_art_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO k_art_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying(120) NOT NULL
);


ALTER TABLE public.categories OWNER TO k_art_user;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO k_art_user;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    author character varying(120) NOT NULL,
    email character varying(254) NOT NULL,
    created timestamp with time zone NOT NULL,
    post_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.comments OWNER TO k_art_user;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO k_art_user;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO k_art_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO k_art_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO k_art_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO k_art_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO k_art_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO k_art_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO k_art_user;

--
-- Name: feedback_categories; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.feedback_categories (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text
);


ALTER TABLE public.feedback_categories OWNER TO k_art_user;

--
-- Name: feedback_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.feedback_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedback_categories_id_seq OWNER TO k_art_user;

--
-- Name: feedback_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.feedback_categories_id_seq OWNED BY public.feedback_categories.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.feedbacks (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(128),
    content text NOT NULL,
    category_id integer NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.feedbacks OWNER TO k_art_user;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.feedbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedbacks_id_seq OWNER TO k_art_user;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying(350) NOT NULL,
    image character varying(255) NOT NULL,
    content text NOT NULL,
    created timestamp with time zone NOT NULL,
    short_content character varying(255) NOT NULL
);


ALTER TABLE public.posts OWNER TO k_art_user;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO k_art_user;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: section_images; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.section_images (
    id integer NOT NULL,
    image character varying(255) NOT NULL,
    section_id integer NOT NULL
);


ALTER TABLE public.section_images OWNER TO k_art_user;

--
-- Name: section_images_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.section_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.section_images_id_seq OWNER TO k_art_user;

--
-- Name: section_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.section_images_id_seq OWNED BY public.section_images.id;


--
-- Name: sections; Type: TABLE; Schema: public; Owner: k_art_user
--

CREATE TABLE public.sections (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    description text NOT NULL,
    category_id integer
);


ALTER TABLE public.sections OWNER TO k_art_user;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: k_art_user
--

CREATE SEQUENCE public.sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_id_seq OWNER TO k_art_user;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_art_user
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: feedback_categories id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.feedback_categories ALTER COLUMN id SET DEFAULT nextval('public.feedback_categories_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: section_images id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.section_images ALTER COLUMN id SET DEFAULT nextval('public.section_images_id_seq'::regclass);


--
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Новость	7	add_post
26	Can change Новость	7	change_post
27	Can delete Новость	7	delete_post
28	Can view Новость	7	view_post
29	Can add комментарий	8	add_comment
30	Can change комментарий	8	change_comment
31	Can delete комментарий	8	delete_comment
32	Can view комментарий	8	view_comment
33	Can add Обратная связь	9	add_feedback
34	Can change Обратная связь	9	change_feedback
35	Can delete Обратная связь	9	delete_feedback
36	Can view Обратная связь	9	view_feedback
37	Can add Категория вопроса	10	add_feedbackcategory
38	Can change Категория вопроса	10	change_feedbackcategory
39	Can delete Категория вопроса	10	delete_feedbackcategory
40	Can view Категория вопроса	10	view_feedbackcategory
41	Can add Картинка	11	add_sectionimage
42	Can change Картинка	11	change_sectionimage
43	Can delete Картинка	11	delete_sectionimage
44	Can view Картинка	11	view_sectionimage
45	Can add Секция	12	add_section
46	Can change Секция	12	change_section
47	Can delete Секция	12	delete_section
48	Can view Секция	12	view_section
49	Can add Основной Раздел	13	add_category
50	Can change Основной Раздел	13	change_category
51	Can delete Основной Раздел	13	delete_category
52	Can view Основной Раздел	13	view_category
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$pgTlogFKrWoM$jiDJCkYN+c4Xaa7nbWxBsn+EswuZmVQYByj/ZwhObKo=	2018-12-31 00:49:35.321683+02	t	admin				t	t	2018-12-31 00:49:25.009422+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.categories (id, title) FROM stdin;
1	Цифровая и офсетная полиграфия
2	Широкоформатная и УФ печать
3	Наружная реклама
4	Интерьерное оформление помещений
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.comments (id, author, email, created, post_id, content) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-12-31 00:50:28.617805+02	1	Section object (1)	1	[{"added": {}}]	12	1
2	2018-12-31 00:52:05.167772+02	2	Каталоги	1	[{"added": {}}]	12	1
3	2018-12-31 00:52:18.040895+02	3	Фирменные папки	1	[{"added": {}}]	12	1
4	2018-12-31 00:52:33.755271+02	4	Альбомы с дизайнерскими обложками	1	[{"added": {}}]	12	1
5	2018-12-31 00:52:48.85005+02	5	Визитки	1	[{"added": {}}]	12	1
6	2018-12-31 00:52:59.347684+02	6	Открытки	1	[{"added": {}}]	12	1
7	2018-12-31 00:53:14.527343+02	7	Пригласительные	1	[{"added": {}}]	12	1
8	2018-12-31 01:07:12.258621+02	1	Category object (1)	1	[{"added": {}}]	13	1
9	2018-12-31 01:07:19.493619+02	2	Category object (2)	1	[{"added": {}}]	13	1
10	2018-12-31 01:07:24.927007+02	3	Category object (3)	1	[{"added": {}}]	13	1
11	2018-12-31 01:07:34.200999+02	4	Category object (4)	1	[{"added": {}}]	13	1
12	2018-12-31 01:10:08.989488+02	1	Буклеты	1	[{"added": {}}]	12	1
13	2018-12-31 01:10:23.575945+02	2	Каталоги	1	[{"added": {}}]	12	1
14	2018-12-31 01:10:47.051038+02	3	Фирменные папки	1	[{"added": {}}]	12	1
15	2018-12-31 01:11:15.310936+02	4	Альбомы с дизайнерскими обложками	1	[{"added": {}}]	12	1
16	2018-12-31 01:11:26.78351+02	5	Визитки	1	[{"added": {}}]	12	1
17	2018-12-31 01:11:39.547824+02	6	Открытки	1	[{"added": {}}]	12	1
18	2018-12-31 01:11:55.77103+02	7	Пригласительные	1	[{"added": {}}]	12	1
19	2018-12-31 01:15:03.492965+02	1	SectionImage object (1)	1	[{"added": {}}]	11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	news_app	post
8	news_app	comment
9	feedback_app	feedback
10	feedback_app	feedbackcategory
11	index_app	sectionimage
12	index_app	section
13	index_app	category
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-12-31 00:40:05.450997+02
2	auth	0001_initial	2018-12-31 00:40:06.277169+02
3	admin	0001_initial	2018-12-31 00:40:06.48509+02
4	admin	0002_logentry_remove_auto_add	2018-12-31 00:40:06.516223+02
5	admin	0003_logentry_add_action_flag_choices	2018-12-31 00:40:06.534706+02
6	contenttypes	0002_remove_content_type_name	2018-12-31 00:40:06.575337+02
7	auth	0002_alter_permission_name_max_length	2018-12-31 00:40:06.591819+02
8	auth	0003_alter_user_email_max_length	2018-12-31 00:40:06.608445+02
9	auth	0004_alter_user_username_opts	2018-12-31 00:40:06.621825+02
10	auth	0005_alter_user_last_login_null	2018-12-31 00:40:06.641782+02
11	auth	0006_require_contenttypes_0002	2018-12-31 00:40:06.650146+02
12	auth	0007_alter_validators_add_error_messages	2018-12-31 00:40:06.665467+02
13	auth	0008_alter_user_username_max_length	2018-12-31 00:40:06.725307+02
14	auth	0009_alter_user_last_name_max_length	2018-12-31 00:40:06.741822+02
15	feedback_app	0001_initial	2018-12-31 00:40:06.952455+02
16	feedback_app	0002_feedback_created	2018-12-31 00:40:07.094758+02
17	feedback_app	0003_auto_20181013_1414	2018-12-31 00:40:07.135591+02
18	news_app	0001_initial	2018-12-31 00:40:07.219118+02
19	news_app	0002_auto_20181005_2110	2018-12-31 00:40:07.234048+02
20	news_app	0003_auto_20181006_2254	2018-12-31 00:40:07.487512+02
21	news_app	0004_comment_post	2018-12-31 00:40:07.603497+02
22	news_app	0005_comment_content	2018-12-31 00:40:07.737707+02
23	news_app	0006_post_short_content	2018-12-31 00:40:07.820868+02
24	news_app	0007_remove_post_short_content	2018-12-31 00:40:07.844341+02
25	news_app	0008_post_short_content	2018-12-31 00:40:07.929571+02
26	news_app	0009_auto_20181016_2214	2018-12-31 00:40:07.944993+02
27	sessions	0001_initial	2018-12-31 00:40:08.070124+02
30	index_app	0001_initial	2018-12-31 01:03:22.985676+02
31	index_app	0002_category	2018-12-31 01:03:23.042741+02
32	index_app	0003_section_category	2018-12-31 01:03:23.161329+02
33	index_app	0004_auto_20181231_0057	2018-12-31 01:03:23.200876+02
34	index_app	0005_auto_20181231_0058	2018-12-31 01:03:23.225779+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
oxxs7z090q512sexailx6fx6g9s3iyg7	MDkwM2YwYWRjMTc2MDhlYTZiMGVmMTM4OGQ4YTRhM2E2YmQyYjE4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZWY2ZDVjZGI5OGU3YjBmM2FmNGM0Y2JiMzUwZmJlNjkyM2IxMzIyIn0=	2019-01-14 00:49:35.330408+02
\.


--
-- Data for Name: feedback_categories; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.feedback_categories (id, title, content) FROM stdin;
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.feedbacks (id, name, email, phone, content, category_id, created) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.posts (id, title, image, content, created, short_content) FROM stdin;
\.


--
-- Data for Name: section_images; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.section_images (id, image, section_id) FROM stdin;
1	image/upload/v1546211703/gqoxsrdsfpkrtstnfbs2.png	1
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: k_art_user
--

COPY public.sections (id, title, description, category_id) FROM stdin;
1	Буклеты	Многочисленные исследования по маркетингу показали, что рекламный буклет – в лидерах по популярности, а главное эффективности среди рекламных инструментов.	1
2	Каталоги	Каталог можно считать идеальным решением для компаний, ассортимент товаров и услуг которых постоянно пополняется.	1
3	Фирменные папки	Печать папок с корпоративной символикой, например, логотипом – это создание и постоянное поддерживание имиджа компании на рынке услуг.	1
4	Альбомы с дизайнерскими обложками	Каталог можно считать идеальным решением для компаний, ассортимент товаров и услуг которых постоянно пополняется.	1
5	Визитки	Печать папок с корпоративной символикой, например, логотипом – это создание и постоянное поддерживание имиджа компании на рынке услуг.	1
6	Открытки	Каталог можно считать идеальным решением для компаний, ассортимент товаров и услуг которых постоянно пополняется.	1
7	Пригласительные	Печать папок с корпоративной символикой, например, логотипом – это создание и постоянное поддерживание имиджа компании на рынке услуг.	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 19, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 34, true);


--
-- Name: feedback_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.feedback_categories_id_seq', 1, false);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: section_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.section_images_id_seq', 1, true);


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_art_user
--

SELECT pg_catalog.setval('public.sections_id_seq', 7, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: feedback_categories feedback_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.feedback_categories
    ADD CONSTRAINT feedback_categories_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: section_images section_images_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.section_images
    ADD CONSTRAINT section_images_pkey PRIMARY KEY (id);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: comments_post_id_67cfce36; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX comments_post_id_67cfce36 ON public.comments USING btree (post_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: feedbacks_category_id_7a4e873e; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX feedbacks_category_id_7a4e873e ON public.feedbacks USING btree (category_id);


--
-- Name: section_images_section_id_5ee16c8f; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX section_images_section_id_5ee16c8f ON public.section_images USING btree (section_id);


--
-- Name: sections_category_id_160f39ab; Type: INDEX; Schema: public; Owner: k_art_user
--

CREATE INDEX sections_category_id_160f39ab ON public.sections USING btree (category_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comments comments_post_id_67cfce36_fk_posts_id; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_67cfce36_fk_posts_id FOREIGN KEY (post_id) REFERENCES public.posts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: feedbacks feedbacks_category_id_7a4e873e_fk_feedback_categories_id; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_category_id_7a4e873e_fk_feedback_categories_id FOREIGN KEY (category_id) REFERENCES public.feedback_categories(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: section_images section_images_section_id_5ee16c8f_fk_sections_id; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.section_images
    ADD CONSTRAINT section_images_section_id_5ee16c8f_fk_sections_id FOREIGN KEY (section_id) REFERENCES public.sections(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections sections_category_id_160f39ab_fk_categories_id; Type: FK CONSTRAINT; Schema: public; Owner: k_art_user
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_category_id_160f39ab_fk_categories_id FOREIGN KEY (category_id) REFERENCES public.categories(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

