--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-08-09 23:10:01

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

--
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 16405)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    available boolean DEFAULT false NOT NULL,
    student uuid
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17042)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17112)
-- Name: passport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passport (
    name character varying
);


ALTER TABLE public.passport OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17063)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id character varying(255) NOT NULL,
    "productName" character varying(255) NOT NULL,
    "productPrice" integer NOT NULL,
    "productExists" boolean NOT NULL,
    student uuid
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16395)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    birth_date timestamp without time zone NOT NULL,
    graduated boolean DEFAULT false NOT NULL,
    last_name character varying(255),
    birthdate timestamp without time zone,
    tutor uuid
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16431)
-- Name: student_subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_subject (
    student uuid NOT NULL,
    subject uuid NOT NULL
);


ALTER TABLE public.student_subject OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16422)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description character varying
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16445)
-- Name: tutor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tutor (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    birth_date timestamp without time zone NOT NULL,
    last_name character varying(255),
    student_count integer NOT NULL,
    master boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tutor OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17084)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    active boolean NOT NULL,
    address character varying(255),
    email character varying(255),
    name character varying(255),
    password character varying(255),
    phone character varying(255),
    role character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2878 (class 0 OID 16405)
-- Dependencies: 204
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (id, name, created, description, available, student) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 17112)
-- Dependencies: 211
-- Data for Name: passport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passport (name) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 17063)
-- Dependencies: 209
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, "productName", "productPrice", "productExists", student) FROM stdin;
B0003	Head First	10	f	\N
C0003	Coats	22	f	\N
D0001	Coca Cola	1	f	\N
B0002	Spring In Action	20	f	\N
C0001	T-shirt	10	f	\N
C0002	Shirts	13	f	\N
B0001	Core Java	30	f	\N
B0004	Effective Java	30	f	\N
B0005	Thinking in Java	30	f	\N
D0002	Starbucks Violet Drink	2	f	\N
F0001	Chicken	4	f	\N
F0002	McDonaldвЂ�s Food	20	f	\N
\.


--
-- TOC entry 2877 (class 0 OID 16395)
-- Dependencies: 203
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, name, birth_date, graduated, last_name, birthdate, tutor) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 16431)
-- Dependencies: 206
-- Data for Name: student_subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_subject (student, subject) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 16422)
-- Dependencies: 205
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subject (id, name, description) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 16445)
-- Dependencies: 207
-- Data for Name: tutor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tutor (id, name, birth_date, last_name, student_count, master) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 17084)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, active, address, email, name, password, phone, role) FROM stdin;
2147483641	t	3200 West Road	customer1@email.com	customer1	$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu	123456789	ROLE_CUSTOMER
2147483642	t	2000 John Road	manager1@email.com	manager1	$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu	987654321	ROLE_MANAGER
2147483643	t	222 East Drive 	employee1@email.com	employee1	$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu	123123122	ROLE_EMPLOYEE
2147483645	t	3100 Western Road A	customer2@email.com	customer2	$2a$10$0oho5eUbDqKrLH026A2YXuCGnpq07xJpuG/Qu.PYb1VCvi2VMXWNi	2343456	ROLE_CUSTOMER
\.


--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 208
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- TOC entry 2733 (class 2606 OID 16414)
-- Name: book book_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pk PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 16403)
-- Name: student student_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pk PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 16429)
-- Name: subject subject_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pk PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 16454)
-- Name: tutor tutor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutor
    ADD CONSTRAINT tutor_pk PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 17095)
-- Name: users uk_sx468g52bpetvlad2j9y0lptc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_sx468g52bpetvlad2j9y0lptc UNIQUE (email);


--
-- TOC entry 2745 (class 2606 OID 17091)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 1259 OID 16420)
-- Name: book_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX book_id_uindex ON public.book USING btree (id);


--
-- TOC entry 2731 (class 1259 OID 16421)
-- Name: book_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX book_name_uindex ON public.book USING btree (name);


--
-- TOC entry 2737 (class 1259 OID 16444)
-- Name: index_student_subject; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_student_subject ON public.student_subject USING btree (student, subject);


--
-- TOC entry 2727 (class 1259 OID 16404)
-- Name: student_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX student_name_uindex ON public.student USING btree (name);


--
-- TOC entry 2734 (class 1259 OID 16430)
-- Name: subject_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX subject_id_uindex ON public.subject USING btree (id);


--
-- TOC entry 2738 (class 1259 OID 16451)
-- Name: tutor_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tutor_id_uindex ON public.tutor USING btree (id);


--
-- TOC entry 2739 (class 1259 OID 16452)
-- Name: tutor_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tutor_name_uindex ON public.tutor USING btree (name);


--
-- TOC entry 2750 (class 2606 OID 17131)
-- Name: product FK_product_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_product_student" FOREIGN KEY (student) REFERENCES public.student(id);


--
-- TOC entry 2746 (class 2606 OID 16455)
-- Name: student FK_student_tutor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "FK_student_tutor" FOREIGN KEY (tutor) REFERENCES public.tutor(id);


--
-- TOC entry 2747 (class 2606 OID 16415)
-- Name: book fk_book_students; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT fk_book_students FOREIGN KEY (student) REFERENCES public.student(id);


--
-- TOC entry 2748 (class 2606 OID 16434)
-- Name: student_subject fk_student_subject_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_subject
    ADD CONSTRAINT fk_student_subject_student FOREIGN KEY (student) REFERENCES public.student(id);


--
-- TOC entry 2749 (class 2606 OID 16439)
-- Name: student_subject fk_student_subject_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_subject
    ADD CONSTRAINT fk_student_subject_subject FOREIGN KEY (subject) REFERENCES public.subject(id);


-- Completed on 2020-08-09 23:10:01

--
-- PostgreSQL database dump complete
--

