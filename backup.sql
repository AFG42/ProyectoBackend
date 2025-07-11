--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: calificacion; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.calificacion (
    id integer NOT NULL,
    id_usuario_calificador integer NOT NULL,
    id_usuario_calificado integer NOT NULL,
    valoracion integer NOT NULL,
    comentarios integer
);


ALTER TABLE public.calificacion OWNER TO admin;

--
-- Name: calificacion_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.calificacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.calificacion_id_seq OWNER TO admin;

--
-- Name: calificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.calificacion_id_seq OWNED BY public.calificacion.id;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.categoria OWNER TO admin;

--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_seq OWNER TO admin;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- Name: estado_libro; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.estado_libro (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.estado_libro OWNER TO admin;

--
-- Name: estado_libro_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.estado_libro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_libro_id_seq OWNER TO admin;

--
-- Name: estado_libro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.estado_libro_id_seq OWNED BY public.estado_libro.id;


--
-- Name: estado_transaccion; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.estado_transaccion (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.estado_transaccion OWNER TO admin;

--
-- Name: estado_transaccion_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.estado_transaccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_transaccion_id_seq OWNER TO admin;

--
-- Name: estado_transaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.estado_transaccion_id_seq OWNED BY public.estado_transaccion.id;


--
-- Name: libros; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.libros (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    isbn character varying(80),
    autor character varying(200),
    editorial character varying(200),
    fecha_publicacion date,
    id_estado_libro integer,
    precio double precision,
    descripcion character varying(255),
    portada character varying(255),
    id_usuario integer NOT NULL,
    id_categoria integer NOT NULL,
    disponibilidad character varying(100) NOT NULL,
    estatus integer NOT NULL,
    id_tipo_transaccion integer
);


ALTER TABLE public.libros OWNER TO admin;

--
-- Name: libros_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.libros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.libros_id_seq OWNER TO admin;

--
-- Name: libros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.libros_id_seq OWNED BY public.libros.id;


--
-- Name: metodo_pago; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.metodo_pago (
    id integer NOT NULL,
    metodo character varying(50) NOT NULL,
    requiere_dato boolean DEFAULT false NOT NULL,
    descripcion character varying(255)
);


ALTER TABLE public.metodo_pago OWNER TO admin;

--
-- Name: metodo_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.metodo_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metodo_pago_id_seq OWNER TO admin;

--
-- Name: metodo_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.metodo_pago_id_seq OWNED BY public.metodo_pago.id;


--
-- Name: reporte; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.reporte (
    id integer NOT NULL,
    id_usuario_reportado integer NOT NULL,
    id_usuario_reportante integer NOT NULL,
    descripcion text NOT NULL,
    fecha timestamp without time zone NOT NULL
);


ALTER TABLE public.reporte OWNER TO admin;

--
-- Name: reporte_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.reporte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reporte_id_seq OWNER TO admin;

--
-- Name: reporte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.reporte_id_seq OWNED BY public.reporte.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO admin;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO admin;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: tipo_transaccion; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.tipo_transaccion (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.tipo_transaccion OWNER TO admin;

--
-- Name: tipo_transaccion_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.tipo_transaccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_transaccion_id_seq OWNER TO admin;

--
-- Name: tipo_transaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.tipo_transaccion_id_seq OWNED BY public.tipo_transaccion.id;


--
-- Name: token_blacklist; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.token_blacklist (
    id integer NOT NULL,
    token text NOT NULL,
    fecha_expiracion timestamp without time zone NOT NULL
);


ALTER TABLE public.token_blacklist OWNER TO admin;

--
-- Name: token_blacklist_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.token_blacklist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.token_blacklist_id_seq OWNER TO admin;

--
-- Name: token_blacklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.token_blacklist_id_seq OWNED BY public.token_blacklist.id;


--
-- Name: transaccion; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.transaccion (
    id integer NOT NULL,
    id_comprador integer NOT NULL,
    id_vendedor integer NOT NULL,
    id_libro integer NOT NULL,
    precio_acordado integer,
    metodo_pago integer,
    id_estado_transaccion integer,
    fecha_transaccion timestamp without time zone,
    fecha_entrega date,
    comentarios character varying(255)
);


ALTER TABLE public.transaccion OWNER TO admin;

--
-- Name: transaccion_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.transaccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaccion_id_seq OWNER TO admin;

--
-- Name: transaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.transaccion_id_seq OWNED BY public.transaccion.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    correo_institucional character varying(255) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido_paterno character varying(50) NOT NULL,
    apellido_materno character varying(50),
    contrasena text NOT NULL,
    id_rol integer NOT NULL,
    calificacion double precision,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estatus boolean DEFAULT true,
    correo_iv character varying(255)
);


ALTER TABLE public.usuario OWNER TO admin;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO admin;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: calificacion id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.calificacion ALTER COLUMN id SET DEFAULT nextval('public.calificacion_id_seq'::regclass);


--
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- Name: estado_libro id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.estado_libro ALTER COLUMN id SET DEFAULT nextval('public.estado_libro_id_seq'::regclass);


--
-- Name: estado_transaccion id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.estado_transaccion ALTER COLUMN id SET DEFAULT nextval('public.estado_transaccion_id_seq'::regclass);


--
-- Name: libros id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.libros ALTER COLUMN id SET DEFAULT nextval('public.libros_id_seq'::regclass);


--
-- Name: metodo_pago id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.metodo_pago ALTER COLUMN id SET DEFAULT nextval('public.metodo_pago_id_seq'::regclass);


--
-- Name: reporte id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reporte ALTER COLUMN id SET DEFAULT nextval('public.reporte_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: tipo_transaccion id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipo_transaccion ALTER COLUMN id SET DEFAULT nextval('public.tipo_transaccion_id_seq'::regclass);


--
-- Name: token_blacklist id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.token_blacklist ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_id_seq'::regclass);


--
-- Name: transaccion id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.transaccion ALTER COLUMN id SET DEFAULT nextval('public.transaccion_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: calificacion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.calificacion (id, id_usuario_calificador, id_usuario_calificado, valoracion, comentarios) FROM stdin;
\.


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.categoria (id, nombre) FROM stdin;
1	Literatura
2	Ciencias
3	Arte
4	Historia
\.


--
-- Data for Name: estado_libro; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.estado_libro (id, nombre) FROM stdin;
1	Nuevo
2	Usado
3	Da├▒ado
\.


--
-- Data for Name: estado_transaccion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.estado_transaccion (id, nombre) FROM stdin;
1	Pendiente
2	Aceptada
3	Rechazada
\.


--
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.libros (id, titulo, isbn, autor, editorial, fecha_publicacion, id_estado_libro, precio, descripcion, portada, id_usuario, id_categoria, disponibilidad, estatus, id_tipo_transaccion) FROM stdin;
1	Cien Anos de Soledad	\N	Gabriel Garcia Marquez	Sudamericana	1967-06-05	1	250	Una novela iconica del realismo magico latinoamericano.	https://ejemplo.com/portadas/cien-anos.jpg	1	1	true	1	1
\.


--
-- Data for Name: metodo_pago; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.metodo_pago (id, metodo, requiere_dato, descripcion) FROM stdin;
1	Efectivo	f	Pago presencial en efectivo entre usuarios
2	Transferencia	t	Transferencia bancaria directa, se mostrar├í el n├║mero de cuenta del vendedor
3	Stripe	f	Pago con tarjeta procesado mediante Stripe
\.


--
-- Data for Name: reporte; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.reporte (id, id_usuario_reportado, id_usuario_reportante, descripcion, fecha) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.roles (id, nombre) FROM stdin;
1	Administrador
2	Moderador
3	Usuario
\.


--
-- Data for Name: tipo_transaccion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tipo_transaccion (id, nombre) FROM stdin;
1	Venta
2	Intercambio
\.


--
-- Data for Name: token_blacklist; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.token_blacklist (id, token, fecha_expiracion) FROM stdin;
\.


--
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.transaccion (id, id_comprador, id_vendedor, id_libro, precio_acordado, metodo_pago, id_estado_transaccion, fecha_transaccion, fecha_entrega, comentarios) FROM stdin;
4	1	1	1	150	1	1	2025-05-05 13:00:00	2025-05-10	Se entregar├í en la entrada de la ESCOM
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.usuario (id, correo_institucional, nombre, apellido_paterno, apellido_materno, contrasena, id_rol, calificacion, fecha_registro, estatus, correo_iv) FROM stdin;
1	c4dbc9f72c02f559399df6dcdd235f1ecf5edb6cdded51168b6eb9f817229afb5be6e60702051294f121bc3afa83d0d9	Leonardo	Dominguez	Olvera	$2b$10$zR0C2tRQaGyburC7.b6cNuG9RVuM9o2nJFqnWmmFHux4K/C1cIjFG	1	4.6	2025-04-24 00:47:01.008	t	\N
\.


--
-- Name: calificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.calificacion_id_seq', 1, false);


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.categoria_id_seq', 1, false);


--
-- Name: estado_libro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.estado_libro_id_seq', 1, false);


--
-- Name: estado_transaccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.estado_transaccion_id_seq', 1, false);


--
-- Name: libros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.libros_id_seq', 1, true);


--
-- Name: metodo_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.metodo_pago_id_seq', 3, true);


--
-- Name: reporte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.reporte_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: tipo_transaccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tipo_transaccion_id_seq', 1, false);


--
-- Name: token_blacklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.token_blacklist_id_seq', 1, false);


--
-- Name: transaccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.transaccion_id_seq', 4, true);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, true);


--
-- Name: calificacion calificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.calificacion
    ADD CONSTRAINT calificacion_pkey PRIMARY KEY (id);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: estado_libro estado_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.estado_libro
    ADD CONSTRAINT estado_libro_pkey PRIMARY KEY (id);


--
-- Name: estado_transaccion estado_transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.estado_transaccion
    ADD CONSTRAINT estado_transaccion_pkey PRIMARY KEY (id);


--
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id);


--
-- Name: metodo_pago metodo_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.metodo_pago
    ADD CONSTRAINT metodo_pago_pkey PRIMARY KEY (id);


--
-- Name: reporte reporte_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT reporte_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: tipo_transaccion tipo_transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipo_transaccion
    ADD CONSTRAINT tipo_transaccion_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist token_blacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.token_blacklist
    ADD CONSTRAINT token_blacklist_pkey PRIMARY KEY (id);


--
-- Name: transaccion transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT transaccion_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: transaccion fk_comprador; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT fk_comprador FOREIGN KEY (id_comprador) REFERENCES public.usuario(id);


--
-- Name: transaccion fk_libros; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT fk_libros FOREIGN KEY (id_libro) REFERENCES public.libros(id);


--
-- Name: transaccion fk_metodo_pago; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT fk_metodo_pago FOREIGN KEY (metodo_pago) REFERENCES public.metodo_pago(id);


--
-- Name: transaccion fk_vendedor; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT fk_vendedor FOREIGN KEY (id_vendedor) REFERENCES public.usuario(id);


--
-- PostgreSQL database dump complete
--

