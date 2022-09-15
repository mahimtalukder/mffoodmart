PGDMP                         z            scraping_db    14.5    14.5 #               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16395    scraping_db    DATABASE     o   CREATE DATABASE scraping_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE scraping_db;
                postgres    false                       0    0    DATABASE scraping_db    ACL     ,   GRANT ALL ON DATABASE scraping_db TO mahim;
                   postgres    false    3352            �            1259    25563    category_dims    TABLE       CREATE TABLE public.category_dims (
    category_id integer NOT NULL,
    category_name character varying(255) NOT NULL,
    category_type character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public.category_dims;
       public         heap    mahim    false            �            1259    25562    category_dims_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_dims_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.category_dims_category_id_seq;
       public          mahim    false    218                       0    0    category_dims_category_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.category_dims_category_id_seq OWNED BY public.category_dims.category_id;
          public          mahim    false    217            �            1259    25554    product_dims    TABLE     |  CREATE TABLE public.product_dims (
    product_id integer NOT NULL,
    product_name character varying(255) NOT NULL,
    "downloaded_pageLink" character varying(255) NOT NULL,
    "actual_pageLink" character varying(255) NOT NULL,
    images character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public.product_dims;
       public         heap    mahim    false            �            1259    25553    product_dims_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_dims_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.product_dims_product_id_seq;
       public          mahim    false    216                       0    0    product_dims_product_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.product_dims_product_id_seq OWNED BY public.product_dims.product_id;
          public          mahim    false    215            �            1259    26466    product_facts    TABLE     �  CREATE TABLE public.product_facts (
    product_id character varying(255) NOT NULL,
    product_dim_id integer NOT NULL,
    shop_product_id character varying(255),
    product_category_id integer NOT NULL,
    availability character varying(255),
    price character varying(255),
    currency character varying(255),
    weight character varying(255),
    shop_id integer NOT NULL,
    pieces character varying(255),
    inventory character varying(255),
    scraped_at character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "productDimProductId" integer,
    "categoryDimCategoryId" integer,
    "shopDimShopId" integer
);
 !   DROP TABLE public.product_facts;
       public         heap    mahim    false            �            1259    26044 	   shop_dims    TABLE     �   CREATE TABLE public.shop_dims (
    shop_id integer NOT NULL,
    shop_name character varying(255) NOT NULL,
    branc_name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.shop_dims;
       public         heap    mahim    false            �            1259    26043    shop_dims_shop_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shop_dims_shop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.shop_dims_shop_id_seq;
       public          mahim    false    220                       0    0    shop_dims_shop_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.shop_dims_shop_id_seq OWNED BY public.shop_dims.shop_id;
          public          mahim    false    219            q           2604    25566    category_dims category_id    DEFAULT     �   ALTER TABLE ONLY public.category_dims ALTER COLUMN category_id SET DEFAULT nextval('public.category_dims_category_id_seq'::regclass);
 H   ALTER TABLE public.category_dims ALTER COLUMN category_id DROP DEFAULT;
       public          mahim    false    218    217    218            p           2604    25557    product_dims product_id    DEFAULT     �   ALTER TABLE ONLY public.product_dims ALTER COLUMN product_id SET DEFAULT nextval('public.product_dims_product_id_seq'::regclass);
 F   ALTER TABLE public.product_dims ALTER COLUMN product_id DROP DEFAULT;
       public          mahim    false    216    215    216            r           2604    26047    shop_dims shop_id    DEFAULT     v   ALTER TABLE ONLY public.shop_dims ALTER COLUMN shop_id SET DEFAULT nextval('public.shop_dims_shop_id_seq'::regclass);
 @   ALTER TABLE public.shop_dims ALTER COLUMN shop_id DROP DEFAULT;
       public          mahim    false    219    220    220                      0    25563    category_dims 
   TABLE DATA           l   COPY public.category_dims (category_id, category_name, category_type, "createdAt", "updatedAt") FROM stdin;
    public          mahim    false    218   0                 0    25554    product_dims 
   TABLE DATA           �   COPY public.product_dims (product_id, product_name, "downloaded_pageLink", "actual_pageLink", images, "createdAt", "updatedAt") FROM stdin;
    public          mahim    false    216   W2                 0    26466    product_facts 
   TABLE DATA             COPY public.product_facts (product_id, product_dim_id, shop_product_id, product_category_id, availability, price, currency, weight, shop_id, pieces, inventory, scraped_at, "createdAt", "updatedAt", "productDimProductId", "categoryDimCategoryId", "shopDimShopId") FROM stdin;
    public          mahim    false    221   p                 0    26044 	   shop_dims 
   TABLE DATA           ]   COPY public.shop_dims (shop_id, shop_name, branc_name, "createdAt", "updatedAt") FROM stdin;
    public          mahim    false    220   ��                  0    0    category_dims_category_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.category_dims_category_id_seq', 31, true);
          public          mahim    false    217                       0    0    product_dims_product_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.product_dims_product_id_seq', 416, true);
          public          mahim    false    215                       0    0    shop_dims_shop_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.shop_dims_shop_id_seq', 1, true);
          public          mahim    false    219            v           2606    25570     category_dims category_dims_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.category_dims
    ADD CONSTRAINT category_dims_pkey PRIMARY KEY (category_id);
 J   ALTER TABLE ONLY public.category_dims DROP CONSTRAINT category_dims_pkey;
       public            mahim    false    218            t           2606    25561    product_dims product_dims_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.product_dims
    ADD CONSTRAINT product_dims_pkey PRIMARY KEY (product_id);
 H   ALTER TABLE ONLY public.product_dims DROP CONSTRAINT product_dims_pkey;
       public            mahim    false    216            z           2606    26472     product_facts product_facts_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.product_facts
    ADD CONSTRAINT product_facts_pkey PRIMARY KEY (product_id);
 J   ALTER TABLE ONLY public.product_facts DROP CONSTRAINT product_facts_pkey;
       public            mahim    false    221            x           2606    26051    shop_dims shop_dims_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.shop_dims
    ADD CONSTRAINT shop_dims_pkey PRIMARY KEY (shop_id);
 B   ALTER TABLE ONLY public.shop_dims DROP CONSTRAINT shop_dims_pkey;
       public            mahim    false    220                       2606    26493 6   product_facts product_facts_categoryDimCategoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_facts
    ADD CONSTRAINT "product_facts_categoryDimCategoryId_fkey" FOREIGN KEY ("categoryDimCategoryId") REFERENCES public.category_dims(category_id) ON UPDATE CASCADE ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.product_facts DROP CONSTRAINT "product_facts_categoryDimCategoryId_fkey";
       public          mahim    false    3190    221    218            ~           2606    26488 4   product_facts product_facts_productDimProductId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_facts
    ADD CONSTRAINT "product_facts_productDimProductId_fkey" FOREIGN KEY ("productDimProductId") REFERENCES public.product_dims(product_id) ON UPDATE CASCADE ON DELETE SET NULL;
 `   ALTER TABLE ONLY public.product_facts DROP CONSTRAINT "product_facts_productDimProductId_fkey";
       public          mahim    false    221    3188    216            |           2606    26478 4   product_facts product_facts_product_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_facts
    ADD CONSTRAINT product_facts_product_category_id_fkey FOREIGN KEY (product_category_id) REFERENCES public.category_dims(category_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.product_facts DROP CONSTRAINT product_facts_product_category_id_fkey;
       public          mahim    false    221    218    3190            {           2606    26473 /   product_facts product_facts_product_dim_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_facts
    ADD CONSTRAINT product_facts_product_dim_id_fkey FOREIGN KEY (product_dim_id) REFERENCES public.product_dims(product_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.product_facts DROP CONSTRAINT product_facts_product_dim_id_fkey;
       public          mahim    false    221    3188    216            �           2606    26498 .   product_facts product_facts_shopDimShopId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_facts
    ADD CONSTRAINT "product_facts_shopDimShopId_fkey" FOREIGN KEY ("shopDimShopId") REFERENCES public.shop_dims(shop_id) ON UPDATE CASCADE ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.product_facts DROP CONSTRAINT "product_facts_shopDimShopId_fkey";
       public          mahim    false    221    220    3192            }           2606    26483 (   product_facts product_facts_shop_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_facts
    ADD CONSTRAINT product_facts_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shop_dims(shop_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.product_facts DROP CONSTRAINT product_facts_shop_id_fkey;
       public          mahim    false    3192    220    221               1  x����R�0�ϻO�S/mk�817t(�!�'.��I41�إ��U$�ۚ���7��ߕ5�m��M�.��ٿ��-PF4ʪ�+]��iQ��R���3�2LH4D�y0�n�7ꓺ���Kkٚz����<",�ӯ��Yv���p3���ly`��,9",��X��ޭ���M�(z&��BB��94�ӎ�pƙ��vG�m?4�sDX�<��ڵZ��8��]r���`޸ދ�JT���޽���Ț\��QDE?y˝Y5yWc�6�����?���D_�l5�T�jWl�nf���;�E�x�	�.���޹f��u�$�7���B=�k�f���'�"&��)ܰ��H��l��VV�;���]5c���vBʢf��<����ҙN���%����6ʄ��ܱ��������&��[��ZvȕE���"�V��Z�Cg�J-M_�+NZ|UB*�ެw}k�����]�i�l֯�����k��B*���Ϭn�oY#w�)��}�G����(u6�2!��R�f9�K�������l6��z"�\Ï�6o��o,~=��K�O� �            x��}�v۸��5����Wz�B���sg;q�����޻O�5kyA-1�D5)�q_�ט���y�y��@�H�t����;��H~�P 
�m�O��4}s�d��\�O���x{6��?�g�E:��C��������t5ό�j�,����������1��s^�ގ��Js�aR�9gM
OK6��d�:[/����3�r�3+Rp�����~F��v��cV�lߴ���w���g�O+h�"]�������L��r
<{�SI?�9H�I1J�2�d�g㠉q���h����bf^���ʼ_/��.�<�h�B�F��2�c+�c邁^�
;^4r�	s�0��>�c���(J�G��F���/�B�OZH��Q=�UR�f#���JB����FE�,�i���7g�j�\���CfY�L����(�[�|�2/�m^�x�4Xf�n@C��X|�/_���+��|��i9ei	��@�c�Z%���?��t5e;ﮁB�Lh������eA�z�5�2!��h�4����^�4��}d�!Ǩ�
�)�BW[��z��E}��������z1�����oXe-���?]߾�ݷ�����@$vI�� 4�֏k�|�3����F����N�;�;]�����p~�pwm�Q�0j�ӔQ4�$�یC]K-�+��Bwe}cY��ѝ�m��T�1����F���`����k�P���w��h��PH�e|����m���p�i%7({Bh�x	�!!���5��Q��m�
�����3���7��c�V����J	�Ax�kN�C�#K�9��}>�ܼ��QCبv�UVB���ݵr�'�����Obⓘ���bΠ��\A�I����h`��t��a�%~��j�y���l���%�����Z��g|�����Yb[Y/ �į~��L����e풽�l��:+���x��6xO�<�.Q�#�	���[��ͯMC�
��g	�.����ͣ�Γe
~��ʼ,���k���l��W��$]!ؑq�/�:#�]\;a�����*.i'Ks�Tc�n�.�h��0����e�=)7[-��~��F��eܧ�u	�n1�%��w��0i
cH�V��P�h��=l)5_�������=ɲ������6�������	`_�&]�r:�q���יy� ������Z@%���B�' �yV��k���Zl�(�N�&a�Y�/Ǐ�)I&�!�)G$�H�w7���y���S�+}���e�Еr�L�͈.�H����{��唣kZ�p���'>���*��L����]����/�$1=p���_���9N7Eo3�W���l�<5X�n�l��R�;��x�>���	V ��NW;�s�HC0��brlrVM�N�a�.�g�V���BKM�?*�����~m���h�D���K>KN`_�h3�7�@���4iz*E'> �zY���@�|�!�-(��&q���~@���c�� �@Zi��'d[�$s<�"�P�j;}��������
?
mǵ(}�r";���s�(��yM�#{S)�vm�+(>�\�HG��F��S����6�c�� >M�w�d<��4����ȗ�hR^�u�w<;���>y��3�]VqvzT�j�f��8���A@N�H��u�lp���d#�҉VX��˘_^$?G�^99o"Ewq~�W�B�=ms�H��C-'$G�R4p7��5/��̻d�Oq��jڶȄ+Q��)�=K7
w"�;����Aox�3ީ��jh.�֗ ������r|+t-ϳCǋ"�zm��Ѝ�؎"ߋ��aQ��І��m$��&|�Y�ɱ�FI�X��-r�:��Ĵ�������P��b�;�a�Z�C��Y;;��w��c_?]ӕ�^.����	jo׏�*�8�
[Z�VX
wt����u�K���Ze	)x�X�_I1�o;-��(i��G�ҷ2l��� Y�h��r�O�&�+�3�a�cj�V�I%6�%��T�f��L}�xm������@��>�E���μH��:]i�Ḳ�5P��ʆR�k�x|J&t@��tu�eup��t��%_��M�S��jZ@�#������N�o�P���ȌE�����'��}5mꏘR׫%xuK�`�JV��9`�%'<�h���9>�,��XjmCLQ�O�� ^����i�ONwI��j���/V���,���ڶH�[H�����6�GF�R4����y�^�u��=m�3��?�E'��9𒢁mOS�Ou�j�ܕR/�7-Z�!�n�l�q���/&�y�u�U:ڼ�������j���^��Jx�	�N@���g�[�3����ډ�X
���H�|�tξ���lt�&ǳD��y>KO�x���(�pj}���V}Y�)���"�IR�WE�t�ʁ��eP�=��YG<?F�Bt�('��M�x��$+���i6Z�6A�йk����1M�Έ����	�nާ�.c_U����
_�R��0���*�U"�U�7N�>�����Etvq�MN"���KgGH�����y��jU���������R����ݽ$�7DB]��,�����?�pޞ����������*#E����e!Ҹu�n���k��~�z�UlL'2������M?"�tʋQ�33t��v��d�N�(��4��#{��B��}۪>�f��3��-أ���hX��;���bR���?kO[D%6C��ץ�MC�@�,t)�q�ۘ�&?��Oy&�;�Օ�h���0:�d=:G��c\�U:�*��u�;w��ukg)uT<�}�y�Zq�e�i+�G�J� p���i��ՂM���C6:����.߷.Sy]��,]��t����D��K���6%MO��%��g�
��,����]̞KDR4�6)��8��n��������y��WD�{	�I���Xg��~��g�]�.f�����}�C���^,��-���$E� 2���!�!in�[��@�P��D���䆜 V��9���^���~��L��#갑��E6P���Zϧ�B��-_���s���ȖIa[�?Պ�����W����,)��E��xl���_��騛4۪��x���E>^�V����V�,�5�g�j���nCX�KR4�:�o&����ѢG,^Hj(�ZP�ekI��4�)� �i����,�z䚃B�x?��$)�RI ��A��3��h��Ǽk�$�
оs_�׷���+%E�00������9'�l 훌�f ���:��.�X�O�H��E���%A�Ėܳߓ�z7
i��E���Aw	���+�c>��y��8��o�T*l
*�\b��6�"����X���y��B��_lM��Dm+$۬o�%/D��2.2<!B$uʝ۬����y��Jx���[�!�>�ރ��=���ЋޱȺ���_�g���%��y�չe����Pާ��J� ���"Z���iV������,��&�~]�]��,p�uD	���eW4�â��5 ��[6�GQ�O����r�����檼�k':��ߧ"�`0x�x�<���|z��"ϸ��Ť�(k@�""��xU]������<�h��Zc)nA4��rB���^���i)D��i�,[�y��^e�̶�g�ob
��&:D��D�q��ESͬ��� �S/+�2� Q�Qd��H�Mt*y+�5 �Щ�Y�d�hՐ��@K��%��6�A�1����p�Z�T�;}?���X���v̆��Y4�`��p��Y�*R4�-���Hd�雋,Ͷ���=_�M�u������ςFǨngl�X���Y&1n��N����kd����b��RBr@�1n|LwR���Iu����|����e)ĸ�q�E�j��0��.5z:�~D�P$K���i��Zl �y�������Ol�H���t:�b߸��{M7q�mg�k��݄e�v�)"#�f�	+�?��o
�t� D�80.�O[�����T����J�,ˀ�吢A��'�K�j�TctF?�c��^E�"'y��}!�e*�e&Kn�yW<7��#h��y���z�/g���d.E�86�%���y���1�g#���� �iR�:�l�R�n�    �~n��5ϻ�w��@���Hي��z�^V�$�hWR��c�LWi�Pb��9��39��7w�t�g&�l���H+i�W�;�Ep�ب9���G0�l�5��8Qܞ9�w���t�y��<�#|���u�mX�*��dC�v;��։��N������I;7 i0C(K&��E��()NA�I���R�6XM�]}��O�w���я��N����z�m��g��fM=���X���M���OT�"2ߛ]�h����]xg���z���
9�"���r���6�vJ}��(=��+�R4�mܽ���5�=��΋�D�M^��K��WڥX��5N_�t���ƴ2�pJy��k:��Bt�E�� �J����k�����Rl\�&Y����>�Ȯ%�}�c2�N��c��x&���Q�v6���(8�\;���a���&���[ؐ^Z��E���o�餚�hs"�v�B��|��Й�Y�R4��ḩ�	�������D{e�4� )2�q�7R�H�Yv�ΉQ��4�C7��>���/r��IFI�4�:k�*̑�0u\h���4Хڐ"����)�Bq��!?�/vM�	�Y��e|˧k=���l�
��>c�Og8��S���.>�v��t��m�P�4��l*D�@w�P��P]��8�f��#lt.�+���
�rU��GXHr�P�l��� :����S�f9�dX%E@�3���GR����E�2]�j��G��t�[*���������c�_on?~{�@�C���7�y�X�ƴ'"�#�@���.����"`��bRp�o.�-T;+�}oB�S����R�B�>��2m]݆i\�!���`�aH��P��Ȑg6�i��Z��	N��nk�jk�"X/����ZK�]�紁=c��R�>�.�Tc:k�#���'B5��ڊ�-_L֥�-��H�]�y��K9^��`�LF��LC�f�	����;WY�.��_j�%��_�#'�����[7�����'��/�'����x�����HiV�%G0 M��]]G_�.��-�^�0Z(�2�0n��y�R�!�Y����� ꯹��G_���H���j\��Q�j'�B�i%�8�B��Q���f��3���Uy�\�O��D1�c3���g[o]���4�2��k-#u���t�¼�\�%�����VJ�_n����=��԰�ż�t�g�ſ����~`�y�j�A�L�]�O��#�!yI�'	��K��(��N�T:���i��b~#�=T{� �쵬`;Mf g"5;�YƗ|&�9��6�}Ӝ ��Sk"O�V!E@�6��懼 �+q;���M�N�S7ѥ�e5q�9��:k.��=^�_^�v3izZ%R�*�_y9��YƩNkИ���u�nX�|�]��]{���g��j�r-��Wsn�tsTs���)�t��d
_����U�(Vc��c���bK��Wۥ)n��l"5g��<��r]�)cԀv��)G ��iG��ɜHM�x�q��M�ճy�gya~��.���?D�B�!�ٴ�rM�E,�����"���]�ꠒH<�������}�,�x~7�:K~��_��_�$Y�a&��RjZ9�+���8�B-�<-?��x#rh.E`�����E�"���d\6��ǶR����|Y�
]�����I��͞R4�}K�|��PO0|��R/��{ld/c�#zz%R�+���}��x3Û{^���M��;�)¤��f�J��wX�:[�r�®�����"�\��.Nm�Y��7�	/�Ĝ���_L����kk[�����x��4|Yq�5���:R&r+�Ft曋t������_̻l�;�Dں&��`C�e�2�q����|.m$��G��G�2�8����I[��ۏ�|͏��"��+~�9�ڼ�����\f��MQ
�������� z�Ѵ�2S;�Yl�����m����E���\ڀd��f������ʉn���t��j��x��<�Nt�/m4�P&>����9�,E`������	��7xM���X��j����	�NE`=��{��i��1�<���#�g&�fM�+L{�,�`WB�"&^D3���U��0�H�cqM�0P�}��T*TuN᨞s�V��n)E;��t�T���zc�7��㼹��Z�G4�j|�Q�%����S��&>��/��B�>� �k,K�c'���'7l��$H�@F�cK�a��fM�&G���*�%���"�ś�G��Br�q|a�g�g6�����!>n�I�g�b��o�ɼ���,��`	 ��x�_3�i����l9*���9M�O��<��艔XM������zG�	L;={�ܐU�	1�J�	��o��������������[�N��!Wq��U�d��x�It8���؍� F��{nZq�=�G�l�.Z� �#���d/�U�ϗ���=o#uCw�k˲<��v��HV�)I'��Kly��{����;� ���#q��ʼM�˶�~�׈΅���|)T��G}��`�#hнu�z�Xn<{?���_��-���ۅ�L&���X��K�	�D���-�&]�4:����	XɎ�W?���
O���T���m|�����;9dGXnۯ�,K��
�!�:�fi*Pu���4o#��vz�b���ؐwܿ��P}3~:�7W"`��mw�Q`��5LV0lVqc[n#0�F���yH�t��Q�JQ´�B�-;�Bԅ'�e�x��
���{�T�ڹ��*6�^�J��>��7%-�X�4�QD`ٷƆ������]�}���3#4b'dF{VWy���=ɲ�I�|<mi�{�V<��'߻�r<Ǜ��ΨLs�G]�R��zd\&c^�y��X|C�C�����lG�>�E4�Jt�ۉ>��t��U\.������/�g�
u�!�k�|�S�����4fC�K��&.*�����{$��7/�;���!��$ J`�N9�	�q]����1/t߳/�Yx�{��x�q DڶC��w�U�F�8��0�V�M�����,X)�ݎ=r��k���^G��iG��g�����͋�H�����r��!����ί�>�vJ�ր��[���+����7��y�����v��3���|���J�~���.@U~�A�nS��~�M�^�%�v�ڇRc�J}�
�M��_��2G2�D��t�c/V�IN�/�g$�;�ʆa
5�T��s5��hb��t��q�s/�+�^8:�����/�ƪ�.l�v�v�[C�S��!u��+n�w#?�k�(O�A�Vj�qѕ8^�,h�ty����V��O�*�+�KGEv[�������d�3hN�\�� �ظN�+h�*���{�$	`�<�Ы�����ex����w��)�/����� $J����Ɩq�'���3���z��D��8��u�I565�uv��7�>�^�o��������@���cS���[^��c�@�Q���[�NW'MޤL��**�t�/wϨA��X�%��6�v�	��}��Ʈq;͓E:J�)>��-]M�w�9���)�JS^�@x·]}�|L[b�cY[�ec/�Xr`r��l�e_���\s�hV"��A!�U$+�r�J�|�O��|ފ�F֞h��������siw�+wwEZ���b�S�GG|�lg�Ū�Z�,Q�����^?������=N �lu�x#�8��*�,�%I/E�]��*��ds�{�D
��
ڵ7�?��9����˹��m�����-�3x�bn�h(t ��	l,5��?x#�o�@ԉ�H^x�T)�)8��_q
>�]�пi��P�����J��gR�����E:�H�#O����0�h��#^85���$֫�#��-�æ��@�yQ�_��(�Ct)��![?<����������^��콫�;Ϸ�@�I�=B>>�|܁|ܕ�o������w��������')�8�`\�3n��|I���ix �x�uc[,�) o�L�J\}��e���<1�$��.�j���PoRӘ#��x�x����J��|�C�]Y��>�    �~��ߒ�:ێ����j�,rVH�1�η�D�44���B5��I�L���_���,����a���%g���F�G�}�s�>Mh?�^�^�0����-Ʃ)o���,�|�ᢛS:6 U&����*U��_�,]�,t�2��?[|z�h��[�|I?N]���O.�J0�ႱQޯ�^:j�y�>�����J����q�C���l�H\A�1�ۧ�^��8?�=�g{p�����Ui�����]�r��q��`��t������A����x�vP�f�3��@�ES��شk�������O����o�����oX�t�ӎ]�u�?nq�u'�liv�K�;��C�E������4)W����,{�],㾐��'hz��!��ŋ?�vp���OT���������ȸH������r{��c�.��2?��yy�l�"^N�.O_c��:�yG�[�1�͋�,�*�� ���Y�Jv�dxw�伪����:Ņ�C6��1͜���|'��Y���L�� .usf%��ƻ��"�P��d�������M���PW�0J�����B��,Cv�R�q�+x;��7���\���#��;���2Jw��c���2�F�_�	��􏫦׸*�����0<)�p'-�O�Zޝ*�-��z����Nb�K^4��t	���m�9D4�������v��e'0>���|6���2�VI�����uQCu���j��T)��!w�����G(�n6g.��n�&�1��
��7	��n|1NhCb52�@��Q]=��}��J�cE_F=�0�S���(<uC�hQ�4�������Cs��k�ب=�<�>��C����l�s��x|\:j�;8�&���$��ӥ�Rw$��Xcα�F��z�G��a�ܒW�O]?\���k\�~]�ri�5DcR���G��K�����o������ٌ�-�u�g%�q��V�`t��oPj�겿s0@��P��U�_��
z֨kG��_16�g	]5K�����Nl�i����Ea�;����K��H����:O&�|c~Z��81��6��o�G�
�W�S��U"�_U{6OyZ5����[!�l�J4p<�'��y�7������Ph�G��I����-ȉt)[����)�։�%�+���yE�"=��a��z��������O��q$;K)��!r��ۦ���h$�c���x�F/)Ξq��f�Aq�hg���=�t)��q�3l�'.4�i�o!���M��*���-�5/*@�A���7r��L?/4γ<7o��;�?�?S��Z�~�% �r�uG�'^�ī�e^�ޘ'E�'��):�Lk�2c���A�&#E�#6n3�.o.ِ����8@E���x�d��m?��г�7�]��0t���W�A9q��O����~�G]SU��ow�"]L�oy��-���1���}�PaxT��wY<����kpD���Q�c��y^���V�?*V
��ա~1S/&�����Wg�+�
/��J�)l�F���R=�^�JT�m��Z�Bw<�򦆿 m:Kգ�Z=5����
���H���0 ̒�T����LV�?#�:w+���C�ǆJO�&���٥}�^��ºd^puŢ��g�~�F��G��}
��#Pï-��X����y^���-��׶и�c�dio���_��K��d���k�zn�OW�@U��6��t�Mu��Ǽ����爎��f��W���,^�<�5L~M�ihǩ�fX�:������H
�Zs��m�,��r��KT�-�p6���m(�[?:j�;�P�����ݫo4���z�y��G�𦧁"�r\+p���?J�-O3q���}�4%u*����tإ6��qm��i:��;�]���V��R��N?8���������MEϠ{j=�jSɫ���V�H3�~�)�����A�$�r��iuz���^r�C�ĦvL�4cl����|�z1R�FT�������t�Uq6v�x�T�����k�ݚ�P�g#*��}��d��3w=����G�� kW.�ł4�Nc�3<���q�O!i�9��"��ws�aQ1��A���L�%ɹI�}@��8�6�J��	���܋�����0/v/��U�1���s��]��r.�`ק�r}����E�<����b������H�4��q�G�Z���h�����昃`���*yҠ��y�����7��~C[���t�U�	��S��:�K���Q��$E���*�6�$�+�S��-濨q���G�/��B��I/��Lރ�_�9<��	g_M8���u���7K�hx��m���ӳ^X���� �'�-��K��xc�b&O
�fczG<��r����x ^��Ʌl�/���kD˿I��5U�����-�t/�i:�f��a����QUr �y�БT7��l�P���z���I<R�4m:��W��!^���cS�z���u;�#8�S^Q�	��O&�x�W��+�1���k�ݻ�y��۱��N��ӿ����\a���7�8�>� /a'џ���S?�� �G�� ����yϷ7�o�V��t��l�Oߙ_1����אD�c����Ƈ�㡂�r�Q�k>b> �6��(N ��C��0>}2��H���>h�0�2������V�z����%�x-4O��
?$����ƒ��4_�
���[:,�7�'>IL����#�[��lQ��t5~����*��VIґ%���-�@��72���.d_�V�>A�� 3�w����'�)c� _/H{E� '���޵�[<��n�}��SJ�~f	��4��\��"0�c&��q�Ҹ������,l�2�[L;�X:�ȕ���2C��ū�T��7M���:!�$��4M9������z�x%�Gg��*�7��
��ͻ�B޵�{��A��a�$gG��bB���V����I�	����!�	��@��F�q>ϸ<���6��2��0@�ٶ5�N�/F�s�}�e�N��B�ĝ���|c�&�Pl�`�Q�M@/i�������(�n2����[��y�(��c����@�wE;�}˚�u�K�)������k�����d��6P'D�q���:3o�xӸ�jA�O?H6�:}Z�z=S�՜>�'�ga5[�ȋ��gT�7ht1�/h����^^��Ķ!A�3�M�:�Ư�,q���9��S���>���4Y�n�l�c\f�o��e#��L��qp�R+^�>j}*�=���*-�M���������H�]mtK��hR��z�yHI:!6P	��g���ua���G�Y��v����~#gr���	b�x���y���E��C�s<��2<i�d\���ǁ�x�ah�X��(=�#���_�.��4���:�4Uu�d�L�����7[��Ǝ��
�ThI�wI��i�J�l)�}��76��w��W'.��%⒙�G���,ʉ����<�>?N��i�$sr]�2~]���=T+���^��뎌��dCI�G)K�0EmEn�}��!!��D��!D�4}�-�?�"��%tF�e���F���o-�X��˕�v�3;K;f�7CS7L��H��5n�d���M��i']��U�"v,��O9�S�����x��F���i��Gc�O��"`����	=Ҧ3bN��� �0C�l�R��>I
�a�>�}/(�Ā_�3�ce��M��I���Tьw0'l���ղ,φ
������K��j��!�;'E@72���t�H��9/��e��n�������4��VڅN�`c�tӳ:R���x7�j�ށ�S�j}٧E�����G��mm��^��NY���J|�Q �$қ��x�5��i�Z�+�"��k�)�����5F��C:kL�����9��Ο��k����Jl)�z�⫐��" ���q2L�ط�ڴq��_q�G�m�L�Ӳ������續��ڔq��'矣tVTH�|H�k�����!׮�����6�i�Zy�ޕ�^�}������!>��h�o� �  ]��fB�/y/
ێ,�>�#��q�x�Z̲� N��#O�w��)��[fɸy���a�
z�92Ά��]M!����D����� Ndj:�-�6�9&2�PG�{	�^���-�O��v�'0j=�ϓ���9����Dpߒ?��j��Ak�.��K�8��Ft�G�ĝML�-�St�o��y�R߾����n�j^���p���١Iy��y%�z���YөUR�]���|��̋"�}�x�i���1H{f�R��~O�/���+�	�z��C� �iSRl�:��r�.�ɺ���i��*5A�{b�w�Ǐ^����]����/�}�������i2�.H����f�X6� �թ���o꡸ш69)#E`��x��K�!�7�N��������vs�M��J��;cWx�� ��`|�qi,jI��+�(;x��,��{�ʛ޻�(JP���)nM��%z�c��+|�RE0�SЛ)	z�ї Kp����%Yv��)؉�KT��^|S#J�F�!g(�hຖq�.xa�K�
�j�(��U	;�A4��nO|S��cxn��o$�"0�m|��|�d�C@�⨲c�n���qz���yL'LG���R\q�d��� �u�d�[�Q��_�[�Qc!�{w�����l٭�a�F���M!��$��C:)�x�6>ē��!�Q�Κ��z�X��Et֝O���^�%�<��G��Β�n<�ZCC��n�B%Y��NAO^Dt*��!�}C|��E9��H����;��^�"�MD_$E`�и��5}���/���g�� ���Q���Z����K����!4��R����47��C@��;��c񸽾��8�[ю���\\����(F�fa��/����S�=��*E׳T�m��-_��S5�si�
�iT�ǚuM6�'��絝��3ԑ�����nY���Eӱ���C�F�^�a���Q��� m����=]({:�1.�ł�s�Q��궴=}^����Eڐ����K0�m��D��g-�=�ƶ P�WQ�#JQG�8n�Gt�>��d��=_�E�?۪h���R�9��YMG�G>W9]���+�c�:��+�8S/�)x�*�R������G9���,�5z�#��J��0��6�ԏ���L�<!����x��4'�n �\EƸ�qc�)T�q�< ���6�r:OL���;��=��]fJ�e��2��1}A��ظ�xM�q�[2m�s�Y��Y��?��鋤h���$u<ڈ��zH�{�"�ЙW1�5Z����yq��4�x�h������S��k��[O������:��r��D��?�[���k��^��ʀ��]Lg��*k�w<B�gң飊�1P�Xu�#T��+R����t1������C�HR�=E<��sM� ��$.�j�]��g��!N�tG�t__��4wu�.�{�I[��;kW�|=�^O�&��Xe��$}9��3��|x��6B��Hh@�
���W3�j�,}ѽ�P�������C��ආ����Sj��a"��D(�9���ʽ,"?��bxަ� �8t���9�1N�=N7���n!K7u��cEU�g�-�&UY$/@U>H��5pm +��d�QΫ6�c;=�S9G�}�|9�i��{�O�OlI�v�����Q^�N��Kp����4�H;�4��7��-��^����9q��|�*0�!OK��4	�`�E
X;0��,��Y�31-%ǹt���#��J/��h�Q���;���>��8��+��7rM���htկ��k�x-I��ժR�}��z
?bM 7<&�X��?`KC��[r�.U�,�km��C��
U���8��i�'mh��^rC��ܦ�&����� ڣ�X�ȉt���^Y�\P)�qM�*Y,����wPڔ���q��<1=�����g�X�[�Sw.e13F�W�S�e�����������.�n�_�|��E=%�������J�!�;jt]��yq&�y��k����Z�io��4f�xxJ�J���5�aؤ�M�s�s�R��`����[(F�:o�"`��l��Q���6����=��Σ��@�tK�z�v��H��NX��^i��������E��?`||��(�d��&�[��a�"��	>�X���wa�KP*�|�����AW-�8��z5O&-ż�&�J�
�������n��ߓ,˟��G�ڴ��n��f15�M>���E` �8�3xYz8�U	����BW>`^�eՋ�*11�]�ndaJ��u(����F���2�c����i�k��MLX�"`d�h��S�v�+���G�3�S�C?	�q/�#2dkw6'��<:~��B��ƴ���<H^��0���/$�8Ԡ��	i�s$"��W��E\�S�����7M�w	��jD;?��B;��'�ӛ���U���[��)7����k�CĲ��)�G�ב�pjpj��<3o�iNV��q�C����^��hntD�V��ϟ0�<[�f��.J#?�l���7����/����&T�&��~�㔷z�]��f���0\����r�lD;�H9��&����Id�4k��%� �պK�B�Z4pc�f*h��yY��*C���%E�8Z���g�;�J4�F1��2ڋ�}ΗS>�Z�ָ��m 1���J��C&��݋Z��}�PG�� �"5B"�b���Or"g
�)&[M1��>��x� xB�н@�Jk�3H��A��}����m�Y�t{V޹(��dc����g�ױ�ؿ2�+ez�iӳF��5����4C�%�i����N	��{�-��l���s@Nׅ�p;cϋ~��k���
Z��p�O�
�xc�t�E�^Q�M��Z���j0������6�L#���~ �+?�$"�@�GP��u1}˳�5>�=�Iu�y��D?A��z�A�u/��P���Bj�>�3��ͱ�6�c�0�ZD7A�C��	/(�D��� ��	@����eL���G��Z������LƼG ��u��Z#�H�E@��%���r�$�`��5�_l"ͯu���u���N���^gr�&E@<�ɡsg�#���(�<
QL����6����h��ϸX�(�i�[ ]�sT������T���C�������tӟ�S�FG �Tӟ�SvLq���a��V��mm�#g��@t�u����5��D�Z��]~SQ��I�	��B�zZ? �~)�Ed;�=r$=��l��m���=�|c��nx�K�	��}�յl�>ĥֵغ��w������V��?��0/��Gq��J�_��.7������:�	�C�$�����fk�m��5p<�i,ũ��K������C�<Ip􍛴��/a؍���c��Z�/YZAc�B�"a�Ԛ=�l�i#[xk!0���g�;�H�\���-�; ��	���ROؠ��0'/�B^髤h����"            x��}M�Gr�:u�Ẑ=B��9�6�pL�6����F7��{����,:�N�ܳ�3=���ȬD���� ��/="�=<�?����������Ǿ3݇Ǉ�>����1!����������^�2�����[��?����w�������7���`�k�^�r�÷��O��˗�Ly�kS^���SkC�_��/��~�f.�� 2S �Ӑ��vV ���,�@<FfDvR��Kd��E���h�sr:��+͌�LZ�2��gD�.�� � �Ӑ�,v~�,\����wZ��3��.�����e�,wA"+��'h?��e��x��4� +��>;����y�lm�ř��Rg��06�����C�v���Kp/��8��4�a�]���l��W�.��>0�I�4A��.��0ho�C4�e	�� �޾o���)up���4t�݋��� �ؕ�/���=��2�>bdAK�-�3����_?�yx{�����?��9|���[��-wfM�^.9?����T���.@'���`�Q[�Q�"H����7����h�Y��{l	+.Aő�u���{�v(N�*����ԛS�]wN���Xq*nX`��Zq�2�G"E"6(خU\\��HA���I��e�r��M�!T&����<�aK
6����*�<��#�00G�u��c�y���XWj����X�<��#�0�����+�cC6p?���tC��{lϪE���9�8.�I?6���V95d��9��*�4;�13
1Y�Y�i����bJ+��a�tҰy�����06-�ߟ�"	�j�kB�r���<���
����Ad���,o��VN���
2l�"4nY�����}�g{W:;� s���r�-gj��=>i儵���|��)�Ld���ϛ�eh8��q�2Ì�7��Rk�j����p�2Ô���h��	5��e�9K�:;EGt�0��ak�K�*�F(,�I�
VUX3�dX��z���\A�h�^;���1�V�!��"�Y���5w�yH��:�K�!'�l���|��d���ϝ3r$դ����r�Xkj�&P8�4L�ys�⎴	,X'QL�2�����]gq�l8x�G�k��+��y�Wt�����`�w�6�������U����4��ф�I^_ݶ��I!������ �<9��<���Le�p@]`@M�\'��]�D�J;2���p���|-��x�*��h����VԆ#�#�;'���i�t��D�G�F�!�X��2s?~�.p�ሺ��:��K�S򕞑�U��s&B�<��k#j��W������Γ]���j� ���ሺ���"h�%�p���C���ĮӐ�v^:�لnsh��}�NC4�yya�h-����ul�u_QȃNC6��$�W��f	\�Ƙ��=� ��ڦ![��)���ѫ�n��;<�Ni�|�Ab��h��Ʒ��<�@7 Ӑ.�N����JmgŻC�x�y��r�4�r�MO#�Yw�V٥z`4�h�J�qā4�
`��3pW<)�R�'u�FmWE�*:K��rҠ�.H�Ҵ�ͦ�(-�g�iHCf�0�����&���2VX�
s]�V�GD6��zd/��<$�'sb[�*��S�)2!Ku�	�Zm��=֖O�!U삸�!CLq�bŚ���2��4��J]��~���{����o��C�{m�4820��'�E�A	�\���j>�hd�C��E+�e�mZjt7����O`�z�h�律N`�E՛9|s��汉��9�5g��Ȳ
t%D�����(���pͶ�^��	d�as'�=5�U��ÊsPq�B~	/
x�n]��A�ǫ��U�厰�y�w{^+n��0��02�.&a�L��Uk�r5/� W]�b�z?�۸��l���4l�!�Ė��ܒL���DM���<�a�]�ޫ7�q��U�YӐ���N6K�L�$���㇇��Ǜ������BY� �5)(K�%�â�(���4����%'��)}����ڑ������Z�2j2���^�>��|�;>��ib�ڳ8�0�,�KAά����_;�Z|r���\|��4�E��ެ������b&�(�����![�tΨ��*�O�*���7�o%uI�
f֤l�&��*��G4d���S���B�^�����Uљ���<�!+]�':�'%��)��1��vj�L'����.�����^i��4P3��L���������LEg��fR��.�#D�r�����E�4�Bs]�Ǉ`���]�|p�;��|���!�kך�����FdsM���ZK:�5;�V�J�!\�������:����C*���"��kכ��\�NC*�����2�G�����۷�>�>a�������ӻ��W���w�:�X��8�0�4}銸ɄRE������_^�x����Bo�et8"u�욎�E\�2�/����L���eZ�֗>E�﷡oD��(�.�6�K�I��ѷ��ZH�oN�ũ1�+�m%:J��Z	� '��TԾ+£�����ٔP��݌l�1NC*������qQª}��)�`ƐcW�4�^@N��5�;� �q�>C��HK�i36�V4�CZ�CZ.(���b�K�k4�x#�K���m'��K�_��W�k¬(9�u�B���^����V���������>�;�������7���'��Ɖ��꽓�u)��ֽ�j'�ç!����1�>�<�={5t`ǲ2*a\�E��/����#:�#��v��`�Ȁ�,�1\�ދWm��6���H����ۻ�wM��j�����Ӑ�2t|p�����>��m��K&ď�ǎ�6"��_e�y�����
����&����ҧ{1��~�#�O�Ta���hR?�=���F.u�y=&�V BC��O�e�F�{[������߾���w��B�Dgt=L���T2�ƺܻN0y� �!<��}#���+)�)6�{��f�Iӧ12q{rsA�����u��zţ��?9P�mB_0[:�%� �-��=N�3?��A�l�]z��Û���Ǜ?����������J���C�ǇG~����$};��P�%b=έ{�[�d�|Vw��[Q�t��9x�s�����~7�@��2CfE�8�q>�1�Y�v_qd��~��+y�N�!���Z�~���e�]1���j�@{fG��hk����o�]5R���m��jR�3s��d��־��=����/�熶��z��|N6��}ɔa"�\��s�MdX��~X�e�gU���E�5�.b���J�U�'�ig�4�uk�a���~�&<��	Ϙ���+������W���oo~�����o���d=�0>`x橒�p����W����]cE��aR1�3�,���Xɨ|^�������"g+�i�0�͏O?܋����O�ᒋ���˥j�s�����*��1�92��A�2��{%o[W���3�����ą������ �k�����u�3ioMEY��m7s
��c���/���\_������!\��[��]Ey8ep�>�Gq~��"@�Zi�R�p�p�̌�x�m{j+UKG�G�8��bȅpJ�i
�I��0����n��n`w1�(����u:1����^�!"sV_@��e F�F�F���ԧ�OsZ%�i�e��&$�/i6�S����������姛F��P�f���/�?ڹ
X9�/�sR��O�����@�+We%�A{�!bP ���[�4�B�n ��>δ(��q��<;h}�C*Bf[5��%���g^ѡ1
�U�
��x;�t�a��=LK��T�L��fۺ;���1 �aҰ�^��o�=�"��'6�S�~���m���3�1&L5!Մ�n-�V��g��W%~.͛��#��gq�m���`}��T���>{z�mVYo��8
.
�.��aK�;L"���@6�>͂ǠGfn�
w@�!`�<-�k�I�wĤ����5��=:��ح��7q��a'�    ���	�3Ngfv,"U��ہ�
l����#�$��lj��V		.�K�D�d�#��*��]Es�t!A�ýB%U����*� �5��h"%U�f���p�7�o&�+�2'��Cgk�jG5���M��^wU�=ԏjR�q��(���]%VA��!�A$EU�3��7x�*�^��	�C���H��n��*�	�/N�}1�>K;/W��C]��!��\���p�2�����DweC/WeL8�L8�,�su���ˠ�4��󟩥�����\�C*��zz5��⾌��J�L�\�V�͚�Tp�s�j��Q1n�e
�	s��Z/V!���}p��I��iPE�*�U��gx�o���y:T��a�AF[ۓ���H�<m�U+���@����lX?��ا�z��|k�\�Z+�i�)Rۓk�ŝz|j�_}��ȖU�+3�3�-�mHAn�`4�lw�뛧�_�o��Z��^�q�4�|���k>A��$F�u�+[9�Y�x��qFA��,�� +�h���[X��S�Xvu;4X	�pM,i�=w�L�l��o{��k V�,Q��iH�H.D���I������8d�0d������v�W�?p��b�i�A� |�9
o����O�qi�q�%�f��#}�ʋ[�Wq�������I����O�>�g�jY�����t(�c����|����tYp X` h�� Iogf�,�5VMt���$i�IR���$}�1�m������o��*���ª^˫.IG�g}��]�U�˂jd��L��f���	����\�\̤ �ɕ�y��7�h0�]�.�}+/ֲ�Vӆ���q�������^ h5��؍H1֤W|�������*wf(�3�e��,��� ����i	]%�P�x����rs1�ó� B�D\eK��/ĭ��^�����p��`�b���eR��Kp/�U��Jw(˧��)��W<E�j��ye`��C*�2�nnfLf�-t�R=��4t����Ė�v��MI�A !�8�b3��>?4D�f*��,W��Zӗ>�Eׄ�;� l�8��#!�jKH��\����8t??��|7{��#��ná�7H�������8��^*)�Tp|�!;��]��I�l�,���[N��h~��&|��A�G^�C*<v���`��m�0�ϑ1��iRᑃ��.̔��sD�mK�	6�����K �j��֛N^�.�jk����1���8�³��^�t1���AH�i�q�SӲ��;�J ;=C���|Ė��g,���Q�o�p3���P�>����bn#�|��������j��\����{	pPu��١�|��U締����J5;ԏ/ѽ8x�0��d�nnN�O��֞���0������g��}��M��?ZZ�9�S��pƃ5	i,�}K����b�������®�N(w�8���-�'l5�JlOu%܃��L�����e��� �������s5�<j�z�������lc�1����K������1ג�Y�b��EM�=�Uh�	zB0��hy��N?h�VN �b*�h�!�JP�sN��9�fu�W	�**�Tx�zJ�|l�d���X�����9J�t��� �ٚ�T[p���Y~�/����LJYEm8T68T��2s�A�U��J�jQ�h�Tx���d=0(�mP*$��RrY
�l?��Xu�5�d�4�,κ[�u�AA���,,>�1����ptE�=aM�����!]������Dcۜ@zL�יJ�:���c�q��q|,��� (�~{|����������>�`V�f=�4���!a�
̯��}cE����4���tV�  �����ۛ��ǻ�Ww͇�	p�����v6��
���S�(��V
�64aX��;�M�A�[���'(g!���A:Mn��ap�>�#��@�a�ƻ�V%�,~���$����&q�h�˸	C�[6��,�7��)��q�����qHEGD��Ӷ��u�b�V(�	���Tx�Bz	/�]�^y�\2�=HJf)2��L�����2j�|DH6i�2y#\���3�i�2.�gXsj�̛5ұelRZqU�u����Tx�-��i9��!l���PU�8��#wa�7YW߰m����H��ür��oRA��0ҧE@rܲ$�$l�g*-�l&�a�o�^���	�,��g*��h+u�H'Ǉ$mE�2Ԑے1�X��X?�AD��CPt��@���������O�?}�iX�RK%�}�ң�fv)���`E�jѓ������W߷0V�	�'����tP��Hܟ��4���<�����֔����C�_��)�����PGW�4�+��rр(�|B�T�4�i6���m_Sj�g{���5�����b� ����������Owuvl�Z�s�6������;5n窱��ak7Si�f9f �
ȧ5 +	~��3���BNG���J����b�fQV���g�g������!�b%><���~i����5�5��3�ÝT���4mO���P��qHH�Ɩ��$�Xk��?� ���|��O��]���!��3��p�	ݜ�5À 9�>�<=}��������&Ԋ>Q8Si�zr7��?U�k���r-���8�B%�#���NV���������o������Rx����zw�2���ۇ����S=:'��<��	23d�m��5�~��Hk���(�}�kE����4s⢉��-{�+L�w�3�Ns�������|�G��7br0���&;+y�{v�rߘ�+�o�+�Tz�q���4���­;�Ԍ1aE���7���z�<3�h��L�C5Y9w�o����1ɻ���@t���/K_E���7n�����Oas^$�������+f��!'�g���v��C��48��q����#�X??`����j�a���qH�Jn��܌G��-n��2�?%��)	��[?s3ك��i%Q�W�8�"��g���O��0˥�x�w�L�`wp���4iu�-2BH�W?���3�ff��lïF��v��� ��ΐ����� �MS����ۻ_Ơ��5?��\M��0���VP�f�OcU%6��^E�8�`r�Y�1s.\���UNذe���lc�*+�p�+`������������M��c�h��ƭۜ%_#�q��̕mk���=��t�������[��7�V�+>��d&+�q�@�4�F�A +:�G�>w��� ��C�qh��F��x�U|�Q����~n�sG�+�r���&���&=VԨ!��
������gَi���CH~E0H@+�� kn��M�����d��{T��#�I���C\`A(�XA��S�`��Y��8~��#�"�@�% Nm�~w|�n ��ض`Vt�o=pw<G�Jb��z|.tL3�-t5��;ps<湴�q�@�v�*t�!*�qHEG>E�!��o�pz[���ze����ǜ� ��p{)��-��U}2��������C�I�	`������p;����/_��/�?}�pw{�t������Lv57
�&�W/b�(����J���������7���yg���T��9G�E�#�U����5*�8k���(�sQ�u�jɎG�M�j>;�U������<�ʫ�?�͕Z8+�;"f�qH�ING0f�G-p�������x���͛����_�o���x��N�cH��/7?��l��:���Lzk%��i�Q���#>�E|��ua]�k#8WˎÞ��ғ�yrK��0��v �d�aKBSiI�<��$'Ɓ�:\a�*��om"���䨒<�ء�H��O���}�X�k�ܓd��ד`�r�������ۛC|�a������xq���eQ�f@ u����/~5�̇�m�_���8@rV�E-��~���԰]��J=�f��
��U����t�T>�_��?��~'���@�J�pиkWU���"<�rD�N*�U��Wz��~�����L�:�E�+7��C*trQ�o�/��&��&k�)�)|+�Je��    ���:ݞ��7�[�\|�Qk�qH�G�"�'�v��pv��)ë�R\�am�� �|j�^&xB�:IW9�G\�ae���,���y�FO�fJ`x�����]�!�X�˳�	�U�/�|:l�i*�5]����Pp9���Ps�	_�%|Ai:I��-�Y{�6���N�b,ዱHΥ�*&3[~"G؄V��K�R�k���`�d���"�!t�#9l�i*�?W�Y��O�F�=F��_\�/	N|��"���M����+ҿ'ٗ$��m{��o~���;|�E���ğL���Y��r���IM�5���p�pgi�����8��#�!8N^Ko�ʡ:ዛ�on��_����K�Ƭ�W�N���.&p�qb]}���X{l�p��p��l�f�����I�ϭx��U�ىd'r�un����,�$�_��Z�u��|��|�ln�?�c8�,f|�e	?,K�s�ǁ���n�WD,�v��N��ɥx�.�po����]M�w5)unF3ї�=[�9^�������/	��)�5���L�W2�tn�1�O�Ft���o��X�םd\w����ұqh/i�F���I-�x�2�}���%�琎���<״*���e�l�0ז�k�왳C���^��ʖqmIƵ%�|�`r��u;��4�V�g>q�;~��11[{��Z!uƥ�����C!����Ut�C�Ce��`��̜t�͵��+H2� ��,�<��ٶ��`��W��͐b�S=��SS<i��M��k������P&�a�!�I�Tt+tW���8��8�/�,�<��h��&c��TGg�g�rFz2�wl�Jit��"׋�3OVtx�y�ȵlrNXy	+�����,�u�����N��%X�/�
y+}Y {v���2�]ƺ#oa���W���I�=SM�g�+�-f<�]�V���l�mP79����R�h�	r��s�@��[���=LDT 8�	�{7S��}�� �&��*���v�D�7U�96[�U���-(v�`�0&��Y��j/8Wљ���<�b"/!�HgVN�Yv�m�(�+��S�9��@ �.���!������|����~w�h�������Ō���~��_w�C�*��
~�T��'N,:A�@��Ŗ��dy��*��
~�T�S'O�gMm-:S;�ό�!��[B�F�k\��L���xk*o}O��ͼE�y#N�k�W9�����sv�Io�Ue{ ��D��5h�]~�q�a1��m�X�jА�p�w���([V4�������N����5���-|��m�Y���ސ���)mVRMd�݋3�f����yy��XO+k�|���U�ōC*<r��03�U���������_��/8/K��A+�i!���ŃHoR�����3�M���۷��ǻ�oo�n��~�31؊�ËqHK�C. `�J5Z���c`9Is`�u׬<�.��{2��U���t�`��;̒|�#7�g��^ǵX|�e�ԍC*<r^&��=���� t�L����Tt�� � oOҾ4R�h	z>���M3[s@y-h�`kq�T[i�ʳ�$��w{VL[�*��V�ޒ��=�K��\��f��̱��Rm�Y���I��>��*��K�8r�����zl�z�`��"Xo�=Hނ>����%ؔ@KB��I��������p�4����O��#/!�
z&���:x5�U���G^BR����'� ||xO�u���@�����P�'��T�T9I^��ML�|�!�]l�6v�8$kA��tݡ��㐊�|�$,賹|���R4���;rq�<�������C*:rq�<�6Е�`����J7W>ƺ8s;�]�����Tt�>$Io�kOݮ�yJ֎C<�۝�(���Wq�1�C*<� ��`x�w=���PY�8��#"���3��֖0 .�qH�G�B�0�k�U�z	zj1���aH�>U������=T�9���cH�����&x5wO8���aH��X��;|�0����cHx�\��n�Ż6s_j	n���Kd��u���\�y��c�ȄG*0P	�/$S ,Upmg[��eXu8��]H� �W|�L!�ȁ\�����hXs��,N�q�L�-n�F��>D�_�tPlC�@���-N�s�����Dh�-����I2����Z4������ۻ�Ot�l��L9���F�C_��R�/c�PɝHn����2^���ķ�=��*ƀ��=�$_�	������p}�@�"�!bQ ��9 b-�Dɷb�T�6k�e�R�m�y�0X �'B�B����Fd�ٟM`���?��zR�|#�պ��ZoG��"��eR��Y$K���M�R�C*8:�>7��UA�CH	*��Ttt,"�n��6M����E�C*::�B�g���6C�׾�<Dq2���u$	/"x+�U���t�J7U�("HDȤ��6TtW��<�t���=k7�ês8�p2�6�+�՗.�������s8�p:����f�o�_E8!�ۦrM�,��o�6���ci�ci./n�?h�������­{R��(�Oe��le�Y��:���k��~���֟��#�!�:_�^�����!B�qH�G�C�u��F���WQ���Tx�9[OoF�c��s>���8����]�����m�*��� :��}?sa��*���;���c��g�#�=�*���5����A��p9�^�9��w8o��ղk���@?�7�UV�iХq��d�|2�5ȓV6�2�NTM]�^�J�� �K�J�`��p�ɫ�O<���L�>{cz�&We_R5�AE��
1+w$�������~����)�ҦT x�w��_������{�E(�4�����T��`�`[i���E8e{�C�&,�l+��}a�"_��FNm�6����F<>��q�|h���Wyc�Q=�8���7}�d�:���W��(�D<>��)��2�P̎m[yc��A��B��!xa���p��q�J��K���WOn���0�{����ፌ�~x��*$<�fa<~�Cҽ �)g��=��n�J\�[�8��c�L"df���H��$��U|޸h���>#�唛 ݟ?�9|Aa��o7G���6��	k�����qHEKD�ޔ���z�B��_|���C蹟�T&�9�Z����ዻ�����ǛcS�����!؄6�p{9;�g��]�bYּ1br�Txa	��g��Ws��l���$��P$__^���&��a���b�k�9���g�Ir�*���~uw|��*�5?��J<�+	�В��xeS;�_��s�۾�
���4��=�7P�\�H�iH���Vgo�y�iHK�h�cq�K+Ă��iH��b���?e��T�6��X`��!Ul8��V* r��T�������+��^oR����+����iH����T�.��Д����Uf9˼Z$ _��4�����S�`Yk/�N�Ӑ*֜�^-n����.�>V���`��lR���r������)u�V��OC�T���Il�}��<�����9N�Ǧ`,����O�tE�e)4���->���,�Z��1�4����ۗ��7�şi����r��=<n������o�g"8uMC�X�,��8*���iH�ky^�|.v�;y��^��0��q�������mv
�LC���,�^)7��iH�K�j��#�9��~l˅�7$
����O��WLn��Ӑ*7?˽V,x_3�bw�F!���m�Ϯ����g��Z'Z�1�(�-B��5ZtxӐ*�>��>w�\�������b)�C�u+�B��{�.���J�(:NC�ءڹ+�A���4����b��
ڦ!Uj��`8��έ�ʠ��4��͝us��њu�ަ!U��p��k���oe�ʰO(޴��.p��x��iJ�f�� ��5�4��T�C=��fP�6�b�WT��b�r��o�\�ٴs2Ϋf�W��m�U�	�a5@�B2;[����[#/'x�Ӧ�����˜v��>K��+    ��S�fN�Y��\��׮�p�l�����n�I:��Ӑ*������,�
	�yk�?!����<���-�k�iH˯G���oXS�R��%��X@U�4��M��=�
�1wޡ�]�h���X:�w)<_��4����.3U ��4��5���kcx�kߖ�'��	�vGQ1��׈.|R��CK����j,8՘|���,�����Ư�^����!�*��kd�v�`��b�j��^��AD�Ӑ*6u[�5b�Do��Ů�T�+pRŖ.�٢ڠ�п��AdҤ����{�qDh�pa�����uc<�"m�Q�[U�O���4�Ju]�3������T���YҞ�4E�\�4��]��"Em��o��hq�o�iH��8�pP|�kF��� �9�rS�\�4����P��d�!Un�C߻lY�$�7;Ӑ*�\H�}�
M���4��-}�\�s/��"��xRE��梧u�^4�j���b\j[5+�2�Ӑ*�u1���n�A�qR��.����������4��%�U�r�0.�5r��⯍]��^r�b��2K�o�?��^��?<<?��t�����������.�9ىsŗ��Д&7�;eV�	��Ӑ"7�}��R��U���s�;>��iˇ���w�M��\�����Bd�Ӑ*�v)���ެ�����*�u)픊�>f���RFr�JOa��iH�T�;�l�Q�FkR�F:��'�rzQ,����4�JM]6s�Q*�Ƕ���4���]�s�y�ׂ�4�J-]v�k�H��
/t�����,�Н�T���a�Tl�u4��qϬ���Ӑ*�u9A���0�iLC�\��S.vLjD�\v̬!Uj��`�T2���}���������O��ݞk����k��7��}�������ׇ9��%�608?��F��b_��A�yHV����m����┇�)�h���9��X󦃅�2�iH�e�^h��|����hmW�	���P����NC*ו4�O�\x�փɍ�O��O��c�3f<"�AKٸ��H���ƛ_���F 7���T`��-�����7�}��&��zRdB`׮.������ç���y�=����)��f,�����6[X�+�4 ���4D\�/l��]�n��0����v���pB���L��>.���~?4�����ӻ �J$��\LЧ����$_��g�8�B�ma��6+�����G���\���.p��v�_}a�������k�c�4��J�~���ȷ����?�?�Y[g���*ˊ,�Y�^d� {�4��#n�(.���Ǜm� DA9ix�T¬w);ԅ�`�����,��y	x�u�4��#�nG,��Û���Ǜ�������_���}	��g��#2ƪ��NC*2n��85,5�Y&�:xS=y��ޞ�e��D���3��Kj�^?U�ߧx ��Nѓ�������]h�"���zܥ���i��k����p���4�b�Z�e�E,��1c=�L����cf�NC*"2�vi�4K[(T&V��2���[!죱��Nvi���^�?���yW�Mv���Go�cq���������ۛ�n)�����ͻW�#`�#`n�d�ٕ������'��f���)7^�� �*�8��|�1��u��h�d����{q�a���Ê�g���Z��cM��(�!U2�B:q hL��}��Au�4�ɍ�"W\�Vx���h�=�3�G[�@X^#Y�S���(������iH��nӌ�Z�iH��-�<��fF���?8(���W(gY1�^��3�D����$����zӐ*:���+=��p<�8:��Y����H8N�z�(�l�Tz[(�bܥ~��P���� F���|�y���3!����!���Am�����b�Œ{���	��~@��gA��r��u�A��4���f!{z�W�����*��X(:��C'�R�D��֖�?_x��,�ѐI���38�mZVF�݀� ��iH��g ۛH@ x��>1���K+<����=l�6ۡ�n#�^OC�p�,|���k.��-��n�`�ՐR#��-��6Pj�O���W�C,˿��8&��C�%�҆zA�u��;�w�C[�%��F���u��s�/�A�y�s��S��0�qJ���:U�^/�|EX����C�q��-��r;m�Oژ�1��[n�v��0�ޒbp�`��υ±�$��*/-������*bw�K�]�Bv�T+�m�;�1I0ai���/���3�������.8B��}���p=���]������5f�L�>zP�q�3H�~A(�6��0�O�>z�ᷡiN��w�V�oc���קY��[�?�#4��{2�}AN�E�!Up�C�ɿ��B���E�9�6V2�$:���/�K�`���(�8s��7U�_o���$i$i$�hN���ls������!g�a�;��4��z�1���_�<�z|Ӭ�M8�`��(���n��a�P �3���]2�9쐙(r7���]_��	&�Ns*����|����//��ɔ�J��h=��k��4ٖ,ک�~��s�yH�m���Y�H²qg�yHMv--�Z��٠Y�4��&���vm�nӟB�&=���8���x�\!G)G)�["-M����<�Od��H\��.��S�>�i��7�d$�NIK���t���0O��4%-��f?�q�q�'ii\'
�ղ�w���KL�W��ߎx�#�m.&�^+�w2>�p�HZ6�t6�3�4�Jf�V���op����o,��{ڕ�C�S$Ʌ�����Z�K9�iV6�4�T�qiG�2�i���C�V�es����QxG��3�ځh~�_�&����6�2�X������l�/㙅�k��"��-t�T�d����᷅�x���]��]}���q�Up��Þ^t�o�Ʌ����r�l�1�0�n�2��4��ԯش������y�q��0�}i\�s��s&
�v4�~�%
�sJ����?�,�ig
f_ӿ�ױ����`w5����
�*~�����ȇ:�����Ng���~^.�ٻ���$4���6��~K0}q
qOۿᷱ��a?�����Sa���v�W�ū��������Odk=L�l*�ɉ���d:����,:�7Q�F�Ӑ���z-�Y��Ӽ}�k[�}`��_���R�+t��#�\�t�\�� �Z��l�qH�w5�~X�qH��4���FTG����-~�8��{�4L6�>p�*��X�Q�m���Q5�8��%+V�1׆�ï㽄��	~Y�ӚN�f��c�P.��/�5m���6N������n����Q�7�B�`a��������K=��r��E;�iY�U	[h8�؎�6��oW�b��������
�qJ����-����k*���_��FَqH�w�_��^��&R�=a�����������n�>��7����e�?�=��:����}S<J�C�xC��A��=���<���k^��|Ӕ-��� �.�V��y��T�l��B��į��
�C�d6f�ݬ1�q�C�d6gi!Y�gY#4�3"�����d�ŸB0��{J:����:��V6�x�T�l�z��W�2*y�Tɥ*�-�A�����5Kc*y��ldt�5��ɊlD�*o�j]�!U2/��������C�qHM��,�f����o���!,
8]Agk��S�g��N�E��*�Ec���B�*��̉N9�,���fZ ���0��Q�ɚ��?�>=ݼ{����7�]gQ��8�b`�V�`]�tww����M��jR���;�B�d���p���oWL ��,��2���9`U?~���5��7��L��=Q	�X�`�=��2E���f$��p�ǟo���<��t�`�!I��iRA�<�]��8��'�w�2��V�ǁ&����[�寧���n;�;����/N<E��?�?<���~iB@M%�!@�4���o���u� f  u��Xk+v��5��ޱ��乥�s�,xT�0i�)��ni��_o��>Ѭ�yx�����%a��]g
0�[�<��� {���Wg�5�[�?���������<�c^�0��s^"��ۇ����S;�A�p�!U:�>����G��8�b ���Wp�:�bB��.	����^�Nq;���mZ����M�z�p�!Z��Ӻ�͕�/�q9�B�T�l��F�]�mNO:���iZ�4�F���4%���)�LA���f�����%�Z�c\�-�_�Z�Ն5[����\Z_�oL��\��\
.��0�����̦B̜)´~i�ĺ߈����fZ_	5W�Z'�L�e�2�nDc+���T�u�`�(��g������Mf�L����������/C=�M�B� �
r� Ӟ1�_��t��R%���0S��Lgl*tƙ�I{f��������������M�.�ᄞ�	�L�=�T\�y��s0��)��g��|mU��4ĦBC�)��g��I��r ����]�@Ξ	+&�f^��͏�_E�xm!�o�<|�)��g�
��)l�z�6l*lÙB9{&�أy<�x��ʝ+�'�a�dh�0�p�(Ξ��Ŝ�v�_�W�o�$!З�+�L��=��+n�tMz�P�)���Bq!b(���ͻ���WC��� ���o�3�u�\2��g�i�)�������ť�c;��8
��V\���T�Gp��q�F��=׊K�v��	0�>��ɺ�k�O���O�����w�w�|�[�"������������f���t���B
��n\��Os?4�9�?�5;�2�C*�y��qU����o�1!r��Ξ��} �(�ـ���(��(��<{.*W�c�@+5�!`3��M��칸[��{ޔ��x8��p���xw��#�5����0T�&lH6�/7�G�㐊����n�����<|��)���o�u�Z�8��qb��A���r�l(˥�����ؠ�+vh��ܟ�T,d8Ou�ׂ���hˆs�C�L!�=�F�y�8��?n�oo�UX��D9� �Z��?
�^�pC��ů��p^�I��ݘ�:S�hOŶ�陃�R/v�^P7�qH�@v�T�bx����&8���ў�Cw-N��yH�MF�T7)d�-Nn\xZ�_���*��8[IA�=V�՚��چ�'NQxiO��</ѧ������mX��d�.���j$d�ۗWXi�)���:<!Y|u��0$<7��L��=UjY�$|U1I��|��<E��T�eU����������+�E%KXq�p�p�N��=��Y��F2L���ў
ä§�nJś�e��8�i{���hG�G�\cq���!o(�s�ũFj�	�xCe��(�%,$�k���C�d2^%Ε-^�����癹Ԣ`���H�[	o$�\ei3�6EG��yH��%ei���Y#�-�l�)Ns��h���U_�������\�4Zv���綃��%G�)8s�]���F�Tpe��Tង��p�&d�tH2n*$�b/�/-X��"�"����B�K��+�����>d
�\��vF�.vR%g�����Hqn*��ק�`��?��f�u�8�	�ȝJh���	ք�?x���[aSV�d�f[a'���0ȝ
YT�k*�"~��7
�ܩ�e�`lH`�g�0ȝjY�Hj"�z��q��	�Sd��.����Ќ$���� w���~Y�<8N�S�N4V+�_)�q�7��S���~�vJ8}�p���͝jft�k���
�{�8ȝ*e��5�]Su�`�PV(rf��L�i��t��na�W�_	_�&x�Z(�q�5�:�j��1
� �b��N0�b��)�8k��5�:aއy
��;�X��V����D�B4_(�p���{��Hz%|�I�8Cg���kE�_��L��4���B��;�L�<�w�Jt�I@/Q(�p�Z��gw,n���L��B!�;��%�%�uS6<&�B�ߝ�Z�Iƶ^u���TزOv��w��:U�H���d�7�B�ߝ�X�=�S���O�0�~!���%8��2���w�/���3�8�QF����sfˈ�v�7CK}Re��rq�l\0�i�Υ���{
��a�P�܅+�%�83�8�瞭���|����c2��)
�S����q�-/$+�Su���p�:�e|��_�P���C��\��.Çt�b wn����k
E��*�,׹ݭ�:����xw��������ߏͪ��o�2�*$ݝJA�����[�7o�Bwn5{�4�K�/�
��T�q�P��TZ
ܩ�C�n+� �Sɇ*w��2�
3�0������]̓DƩ�Sk�����0��U��/܆ `s�jva  r�.,�߮�[H�o*���<�K��Q0���Ԓ�
K�U,�v
�v�绰4SC���x��.,���\��pYh�e�����Z���f�/��]������>>����yzw ���}���M���P,��҄m�v\Z`ih�x��˸k�`\9S`�L� �ť�*F�¿P��NS�/u��%H$x�)�W��ÿP0��Nc�ot1��h��Kc��WE��#\����g[%#J}S��/���g[%c���h��=�,3�;-�ti��I�A	�J(0p�2 ����Ga�t�m�l_�(�4���|������σY�T�d���~m���Km�P�P|��Ҁm���8�J&�vY0�y�1r�$S4��`m�Ϳ�?�3�9'��������m_(pi����ߙ�^p&����c��o�~!	(�T��Y�-��G9��	��/7������ۻ�O7a�+H[��/����j-�
Xl���P��Ε1e̺��L���*�Tљ4P�D�]x���_�E��_-���!M8��\4�\�a���y�-��/Ɍo,E��7���x��E�\x�~s�
��K�*���r�&��q�sLqڹ�H�:nw3��0�s!�Z��F(^W���(B�K{.�ܼt��Gd��*��W�H^!=��T����ިkT�7��)>�Ϧ�yE�Mr��8��%'�J_�����0�������IFe�*��V�;���o����n�S�IF9�qH�L��\X��ߌj��!U2��ra�6JF��!U2ٯR�_k$C�d�k����˳�R���818�g��f�VIƟ�
��/��KZ�5��[�qH�L���&l�7�0��0�̗�/L�F��M�8�J�$�m
D,"�T�t�<�@��}[*��1�!�u���M�8[cq����9�M֎��7��,z�>�@�3��r�˱8�C6�����������9d���w��,N�X��!!��5��VT����φ)�*���ٿx h�$�,b��t�l��N�x��8�$�}[�uިn��h�E;�������8�K�$9�%�w�>�����@���{��F��.:v�,��V��u�8��N$z��٪nt�6�3�^��_�^��
Q>�&Cv��r3���u��!�����y���.!Z�,M_�y���0mC��s;e!9�o�_�~�-�"C�'$d�N�fɦjB������ȍD���B�8���}��{xx�9|�96u������o�+@��_�p��:Hn�r��s��5If+/֟�L��fP���(Q��
e>���{}u0�S��U8P��qh��ë�����;s         9   x�3��MK��O�M,*�4�4202�5��54U04�22�2��3�0�60�#����� �+�     