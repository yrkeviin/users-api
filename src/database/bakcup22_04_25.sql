PGDMP                      }            user_db    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16438    user_db    DATABASE     m   CREATE DATABASE user_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt-BR';
    DROP DATABASE user_db;
                     postgres    false            �            1259    16505    posts    TABLE     �   CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    user_id integer
);
    DROP TABLE public.posts;
       public         heap r       postgres    false            �            1259    16504    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public               postgres    false    220                        0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public               postgres    false    219            �            1259    16494    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16493    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    218                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    217            ]           2604    16508    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            \           2604    16497    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    16505    posts 
   TABLE DATA           <   COPY public.posts (id, title, content, user_id) FROM stdin;
    public               postgres    false    220   �       �          0    16494    users 
   TABLE DATA           :   COPY public.users (id, name, email, password) FROM stdin;
    public               postgres    false    218   2                  0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 50, true);
          public               postgres    false    219                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 51, true);
          public               postgres    false    217            c           2606    16512    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public                 postgres    false    220            _           2606    16503    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    218            a           2606    16501    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            d           2606    16513    posts posts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_user_id_fkey;
       public               postgres    false    4705    220    218            �   �  x�mԽM1���S�U������4@��rH\GtBe��l������o���-��������q���^-�kN3�HԚ��5
��6s��\�4���w3�cǱ����8p��4�9N\k��|���es0ۈ���/����a8C�(��92F#DΒ1&B��<cG�4�)c��se�!�p��q!��N�17�t��2&���p����H��e�BJ7�.c6R��ts"��N�1w�t��2恔n:]�<��M�˘J��tkCI��.cJ��t���y����P(��e�FI��.cM�t��2֎�n9]�:P�-��X'J��t�BK��.coh��e�@K��.c'Z��t����/,��FK��.cO�t��2���n;]�>��m���'Z��t��t��s����I      �   8  x�mT�n�0<�?&�,ˏ[��M�E�9���h�%��h�9�ԏ����O�%]�����;w�3,�	�9�w����P�5��&3ؠ���A�Kܺ���9Q��yChb�
�-�ZYY�N�����.qM޺*����Q��ښ��Y�6X�g�)�`Sl�N���g��w����3�83jd�b���{;����45��QR�x�����3JJ����tv8d���ݞ��b��%��'m�H�
�;�iK0%e��vm��Ք�1��@
�DkN��0�$�p��t�,��P�Ԅ�()o7*���}IX`��u�QR��������u^��1Vx��?�%e��X�Mi�).��1(FY.Ҧ\ڔ����+���h������M�1����~HF5��~���Z���>�Vf��%�	��.�$��*TZ�Y��%ӻ1Χ��[o���HR��y=pI���Q{s��GBI)q���]FI�"�A�#U�ci��e�G���	Φ51��%��?�e�PRV��u,�hۜH�?��0��j�Ĭ�Kjf�����F��v1�L��}Ku     