--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: access_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE access_log (
    logdatetime timestamp with time zone NOT NULL,
    pagename character varying(255),
    remotehost character varying(255),
    remoteaddr character varying(255),
    host character varying(255),
    user_agent character varying(255),
    accept_language character varying(255),
    country character varying(255),
    displaycountry character varying(255),
    displaylanguage character varying(255),
    displayname character varying(255),
    iso3country character varying(255),
    iso3language character varying(255),
    language character varying(255),
    searchtext character varying(255),
    sessionid character varying(255) NOT NULL,
    referer character varying(4000)
);



--
-- Name: activities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activities (
    activity_id character varying(20) NOT NULL,
    language character varying(2) NOT NULL,
    description character varying(100) NOT NULL,
    login character varying(100),
    iddomain character varying(20),
    status character varying(1),
    external_id character varying(100),
    read_only character varying(5) DEFAULT 'false'::character varying
);



SET default_with_oids = false;

--
-- Name: adminservicesclasses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE adminservicesclasses (
    name character varying(20) NOT NULL,
    classname character varying(100),
    "order" numeric NOT NULL
);



--
-- Name: alert; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alert (
    alert_type character varying(15) NOT NULL,
    alert_id numeric(38,0) NOT NULL,
    alert_iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    alert_to character varying(100) NOT NULL,
    alert_from character varying(100) NOT NULL,
    alert_original character varying(100) NOT NULL,
    alert_time timestamp with time zone NOT NULL,
    text character varying(1024),
    event_date timestamp without time zone
);



SET default_with_oids = true;

--
-- Name: allert; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE allert (
    allert_type character varying(15) NOT NULL,
    allert_id numeric(38,0) NOT NULL,
    allert_to character varying(15) NOT NULL,
    allert_from character varying(15) NOT NULL,
    allert_original character varying(15) NOT NULL,
    allert_time timestamp with time zone NOT NULL,
    text character varying(1024)
);



SET default_with_oids = false;

--
-- Name: authenticationclasses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authenticationclasses (
    authuriprotocol character varying(20) NOT NULL,
    classname character varying(256) NOT NULL
);



--
-- Name: autosave; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE autosave (
    login character varying(100) NOT NULL,
    service character varying(10) NOT NULL,
    context character varying(50) NOT NULL,
    webtopid numeric NOT NULL,
    key character varying(100) NOT NULL,
    value text
);



--
-- Name: calendars; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE calendars (
    user_calendar character varying(100) NOT NULL,
    calendar character varying(50) NOT NULL,
    description character varying(100),
    color character varying(20),
    iddomain character varying(20) NOT NULL,
    checked boolean,
    private character varying(6) DEFAULT 'false'::character varying,
    busy character varying(6) DEFAULT 'false'::character varying,
    sync character varying(6) DEFAULT 'true'::character varying,
    id numeric(38,0),
    "default" character varying(5) DEFAULT 'false'::character varying,
    default_reminder numeric(38,0),
    default_send_invite character varying(6)
);



SET default_with_oids = true;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    category_id character varying(20) NOT NULL,
    language character varying(2) NOT NULL,
    description character varying(100) NOT NULL,
    longdescription character varying(4000)
);



--
-- Name: classes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE classes (
    class_id numeric(38,0) NOT NULL,
    language character varying(2) NOT NULL,
    description character varying(100) NOT NULL
);



--
-- Name: clipboardevents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clipboardevents (
    event_by character varying(100) NOT NULL,
    event_id numeric(38,0) NOT NULL,
    flag character varying(1)
);



SET default_with_oids = false;

--
-- Name: confirm_causal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE confirm_causal (
    confirm_causal_id numeric(38,0) NOT NULL,
    description character varying(300) NOT NULL,
    customer_id character varying(15),
    external_id character varying(100),
    iddomain character varying(15),
    status character varying(1),
    login character varying(15),
    language character varying(2),
    status_d character varying(1)
);



SET default_with_oids = true;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contacts (
    idcontact numeric(38,0) NOT NULL,
    login character varying(100) NOT NULL,
    firstname character varying(60),
    lastname character varying(60),
    title character varying(30),
    function character varying(50),
    company character varying(60),
    caddress character varying(100),
    ccity character varying(30),
    cstate character varying(30),
    cpostalcode character varying(20),
    ccountry character varying(30),
    ctelephone character varying(50),
    ctelextension character varying(20),
    cfax character varying(50),
    cfaxextension character varying(20),
    ctelephone2 character varying(50),
    ctel2extension character varying(20),
    cpager character varying(50),
    cpagerextension character varying(20),
    cemail character varying(80),
    cassistant character varying(30),
    cnotes character varying(2000),
    haddress character varying(100),
    hcity character varying(30),
    hstate character varying(30),
    hpostalcode character varying(20),
    hcountry character varying(30),
    htelephone character varying(50),
    htelephone2 character varying(50),
    hfax character varying(50),
    hmobile character varying(50),
    hpager character varying(30),
    hemail character varying(80),
    hnotes character varying(2000),
    idsync numeric(38,0) DEFAULT 0 NOT NULL,
    status character varying(1) DEFAULT 'N'::character varying,
    searchfield character varying(200),
    type character varying(1),
    idlist numeric(38,0),
    revision timestamp without time zone DEFAULT now(),
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    cmobile character varying(50),
    ctelephoneassistant character varying(50),
    hpartner character varying(200),
    hanniversary timestamp without time zone,
    hbirthday timestamp without time zone,
    cdepartment character varying(200),
    photo oid,
    url character varying(200),
    cmanager character varying(200),
    cinstant_msg character varying(200),
    hinstant_msg character varying(200),
    oinstant_msg character varying(200),
    oaddress character varying(100),
    oemail character varying(80),
    category character varying(50) DEFAULT 'WebTop'::character varying,
    ocity character varying(30),
    ostate character varying(30),
    opostalcode character varying(20),
    ocountry character varying(30)
);



SET default_with_oids = false;

--
-- Name: contacts_category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contacts_category (
    login character varying(20) NOT NULL,
    category character varying(50) NOT NULL,
    description character varying(100),
    color character varying(20),
    iddomain character varying(20) NOT NULL,
    checked boolean,
    sync character varying(6) DEFAULT true,
    id numeric(38,0),
    "default" character varying(5) DEFAULT false
);



--
-- Name: content_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE content_types (
    extension character varying(10) NOT NULL,
    content_type character varying(100) NOT NULL
);



SET default_with_oids = true;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer (
    customer_id character varying(15) NOT NULL,
    description character varying(50) NOT NULL,
    type character varying(1),
    address character varying(100),
    city character varying(30),
    state character varying(30),
    postalcode character varying(20),
    country character varying(30),
    telephone character varying(50),
    email character varying(80),
    parent_id character varying(15),
    external_id character varying(100),
    status character varying(1),
    iddomain character varying(15),
    from_drm character varying(5)
);



--
-- Name: customer_relations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer_relations (
    customer_id character varying(15) NOT NULL,
    parent_id character varying(15) NOT NULL
);



SET default_with_oids = false;

--
-- Name: docmgt_associations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE docmgt_associations (
    login character varying(100) NOT NULL,
    idcategory character varying(20) NOT NULL
);



--
-- Name: docmgt_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE docmgt_categories (
    idcategory character varying(20) NOT NULL,
    description character varying(250) NOT NULL
);



--
-- Name: docmgt_subcategories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE docmgt_subcategories (
    idcategory character varying(20) NOT NULL,
    idsubcategory character varying(20) NOT NULL,
    description character varying(250) NOT NULL
);



--
-- Name: domains; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE domains (
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    description character varying(256) NOT NULL,
    domain character varying(256) NOT NULL,
    authuri character varying(256) NOT NULL,
    "order" numeric(38,0) DEFAULT 0 NOT NULL,
    enabled character varying(1) DEFAULT 'T'::character varying NOT NULL,
    adminldap character varying(100),
    passwordldap character varying(100),
    case_sensitive_auth boolean DEFAULT false NOT NULL,
    user_auto_creation boolean DEFAULT false NOT NULL,
    wt_adv_security boolean DEFAULT false NOT NULL
);



--
-- Name: domainsettings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE domainsettings (
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    idsetting character varying(40) NOT NULL,
    value text
);



SET default_with_oids = true;

--
-- Name: download_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE download_log (
    os_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    login character varying(100) NOT NULL,
    logdatetime timestamp with time zone NOT NULL,
    sessionid character varying(255) NOT NULL
);



--
-- Name: dual; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dual (
    dummy character varying(1)
);



--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events (
    event_id numeric(38,0) NOT NULL,
    event_by character varying(100) NOT NULL,
    event_date timestamp without time zone NOT NULL,
    fromtime timestamp without time zone NOT NULL,
    totime timestamp without time zone NOT NULL,
    description character varying(1024),
    activity_id character varying(20),
    activity_flag character varying(1),
    category_id character varying(20),
    customer_id character varying(6),
    statistic_id character varying(6),
    report_id character varying(100),
    event character varying(100) NOT NULL,
    private character varying(1),
    recurr_id numeric(38,0),
    reminder numeric(38,0),
    idsync numeric(38,0) DEFAULT 0 NOT NULL,
    status character varying(1) DEFAULT 'N'::character varying,
    readonly character varying(1),
    revision timestamp without time zone DEFAULT now(),
    share_with character varying(15),
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    categories character varying(1024),
    allday character varying(5),
    calendar character varying(50) DEFAULT 'WebTop'::character varying,
    uid_planning character varying(150),
    busy character varying(6) DEFAULT 'true'::character varying,
    reminder_flag timestamp without time zone,
    timezone character varying(50),
    task_id numeric(38,0),
    visit_id numeric(38,0),
    actions_id numeric(38,0),
    causal_id numeric(38,0)
);



SET default_with_oids = true;

--
-- Name: history_requests; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE history_requests (
    "timestamp" timestamp with time zone NOT NULL,
    transaction character varying(1) NOT NULL,
    request_id numeric(38,0) NOT NULL,
    request_by character varying(15) NOT NULL,
    request_date timestamp with time zone NOT NULL,
    login character varying(100) NOT NULL,
    assign_to character varying(15),
    category_id character varying(20),
    release character varying(100),
    class_id numeric(38,0),
    severity character varying(1),
    environment character varying(1024),
    description character varying(100),
    fulldescription character varying(1024),
    simulation character varying(1024),
    suggestion character varying(1024),
    status character varying(1),
    resolution character varying(1024),
    ispublic character varying(1),
    deleted character varying(1)
);



--
-- Name: identities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE identities (
    login character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    displayname character varying(100) NOT NULL,
    mainfolder character varying(100),
    mailcarduser character varying(15),
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    isfax boolean,
    usemypersonalinfos boolean
);



--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE languages (
    language_id character(2) NOT NULL,
    description character varying(30)
);



--
-- Name: listelements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE listelements (
    idlist numeric(38,0) NOT NULL,
    email character varying(200) NOT NULL,
    etype character varying(3) NOT NULL
);



SET default_with_oids = false;

--
-- Name: mail_workflow_requests; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mail_workflow_requests (
    id numeric(38,0) NOT NULL,
    iddomain character varying(20) NOT NULL,
    login character varying(100) NOT NULL,
    subject character varying(100),
    message character varying(1000),
    delegate_to character varying(100),
    answer character varying(1) NOT NULL,
    deadline character varying(5),
    date_delivery timestamp without time zone,
    messageid character varying(1024) NOT NULL,
    request_from character varying(100) NOT NULL,
    deleted character varying(5),
    completed character varying(5),
    pre_allerted boolean DEFAULT false,
    allerted boolean DEFAULT false,
    reason character varying(1000),
    annulled character varying(5),
    date_request timestamp without time zone,
    date_accept timestamp without time zone
);



--
-- Name: mail_workflow_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mail_workflow_users (
    id numeric(38,0) NOT NULL,
    iddomain character varying(20) NOT NULL,
    login character varying(100) NOT NULL,
    to_iddomain character varying(20) NOT NULL,
    to_login character varying(100) NOT NULL,
    mode character varying(2) NOT NULL
);



SET default_with_oids = true;

--
-- Name: mailfilters; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mailfilters (
    login character varying(100) NOT NULL,
    idfilter numeric(10,0) NOT NULL,
    status character varying(1) NOT NULL,
    continue character varying(1) NOT NULL,
    keepcopy character varying(1) NOT NULL,
    condition character varying(3) NOT NULL,
    fromvalue character varying(4000),
    tovalue character varying(4000),
    subjectvalue character varying(4000),
    sizematch character varying(1),
    sizevalue numeric(38,0),
    fieldname character varying(100),
    fieldvalue character varying(4000),
    action character varying(10) NOT NULL,
    actionvalue character varying(4000),
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL
);



SET default_with_oids = false;

--
-- Name: mailnotes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mailnotes (
    iddomain character varying(20) NOT NULL,
    messageid character varying(128) NOT NULL,
    text text
);



--
-- Name: mailscan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mailscan (
    login character varying(100) NOT NULL,
    foldername character varying(255) NOT NULL,
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL
);



--
-- Name: mailsentfilters; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mailsentfilters (
    login character varying(100) NOT NULL,
    idfilter numeric(10,0) NOT NULL,
    status character varying(1) NOT NULL,
    continue character varying(1) NOT NULL,
    keepcopy character varying(1) NOT NULL,
    condition character varying(3) NOT NULL,
    fromvalue character varying(4000),
    tovalue character varying(4000),
    subjectvalue character varying(4000),
    sizematch character varying(1),
    sizevalue numeric(38,0),
    fieldname character varying(100),
    fieldvalue character varying(4000),
    action character varying(10) NOT NULL,
    actionvalue character varying(4000),
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL
);



SET default_with_oids = true;

--
-- Name: notes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE notes (
    note_id numeric(38,0) NOT NULL,
    note_by character varying(15) NOT NULL,
    description character varying(100) NOT NULL,
    fulldescription character varying(1024),
    priority character varying(15),
    groupby character varying(1024),
    private character varying(1),
    status character varying(1) DEFAULT 'N'::character varying,
    revision timestamp without time zone DEFAULT now(),
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    complete numeric(3,0),
    status_complete character varying(15),
    date_start date,
    date_end date
);



SET default_with_oids = false;

--
-- Name: notes_tree; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE notes_tree (
    note_by character varying(15) NOT NULL,
    groupby character varying(1024),
    iddomain character varying DEFAULT ''::character varying NOT NULL
);



SET default_with_oids = true;

--
-- Name: order_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_log (
    order_id numeric(38,0) NOT NULL,
    product_id character varying(20) NOT NULL,
    login character varying(100) NOT NULL,
    logdatetime timestamp with time zone NOT NULL,
    sessionid character varying(255) NOT NULL,
    status character varying(1) NOT NULL,
    price numeric(10,2),
    vat numeric(10,2),
    totalprice numeric(10,2)
);



--
-- Name: parameters; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parameters (
    key character varying(256) NOT NULL,
    value character varying(1024) NOT NULL,
    notes character varying(1024)
);



--
-- Name: planning_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE planning_events (
    event_id numeric(38,0) NOT NULL,
    mailflag character varying(6) NOT NULL,
    email character varying(80) NOT NULL,
    recipienttype character varying(2) NOT NULL,
    answare character varying(20) NOT NULL
);



--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE profiles (
    security_level numeric(38,0) NOT NULL,
    service character varying(20) NOT NULL,
    orderid numeric(38,0)
);



SET default_with_oids = false;

--
-- Name: recurrences; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recurrences (
    recurr_id numeric(38,0) NOT NULL,
    recurr_type character(1) NOT NULL,
    dayly_freq numeric(2,0),
    weekly_freq numeric(2,0),
    monthly_day numeric(2,0),
    monthly_month numeric(2,0),
    yearly_day numeric(2,0),
    yearly_month numeric(2,0),
    until_date timestamp without time zone NOT NULL,
    weekly_day1 character varying(6),
    weekly_day2 character varying(6),
    weekly_day3 character varying(6),
    weekly_day4 character varying(6),
    weekly_day5 character varying(6),
    weekly_day6 character varying(6),
    weekly_day7 character varying(6),
    permanent character varying(6),
    repeat numeric(2,0),
    start_date timestamp without time zone
);



--
-- Name: recurrences_broken; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recurrences_broken (
    event_id numeric(38,0),
    recurr_id numeric(38,0),
    event_date timestamp without time zone,
    new_event_id numeric(38,0)
);



SET default_with_oids = true;

--
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requests (
    request_id numeric(38,0) NOT NULL,
    request_by character varying(15) NOT NULL,
    request_date timestamp with time zone NOT NULL,
    login character varying(100) NOT NULL,
    assign_to character varying(15),
    category_id character varying(20) NOT NULL,
    release character varying(100),
    class_id numeric(38,0) NOT NULL,
    severity character varying(1) NOT NULL,
    environment character varying(1024),
    description character varying(100) NOT NULL,
    fulldescription character varying(1024),
    simulation character varying(1024),
    suggestion character varying(1024),
    status character varying(1) NOT NULL,
    resolution character varying(1024),
    ispublic character varying(1),
    deleted character varying(1),
    customer_id character varying(15),
    statistic_id character varying(15),
    warning character varying(1) DEFAULT 'Y'::character varying NOT NULL
);



--
-- Name: seq_calendars; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_calendars
    START WITH 5585
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_calendars; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_calendars', 5607, true);


--
-- Name: seq_causal_confirm; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_causal_confirm
    START WITH 71
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_causal_confirm; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_causal_confirm', 71, false);


--
-- Name: seq_contacts; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_contacts
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_contacts; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_contacts', 10, true);


--
-- Name: seq_contacts_category; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_contacts_category
    START WITH 25991
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_contacts_category; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_contacts_category', 25999, true);


--
-- Name: seq_events; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_events
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_events; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_events', 43, true);


--
-- Name: seq_lists; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_lists
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_lists; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_lists', 1, false);


--
-- Name: seq_mail_workflow_requests; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_mail_workflow_requests
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_mail_workflow_requests; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_mail_workflow_requests', 1, false);


--
-- Name: seq_mail_workflow_users; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_mail_workflow_users
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_mail_workflow_users; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_mail_workflow_users', 1, false);


--
-- Name: seq_notes; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_notes
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_notes; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_notes', 1, false);


--
-- Name: seq_popup; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_popup
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_popup; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_popup', 1, false);


--
-- Name: seq_recurr; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_recurr
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_recurr; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_recurr', 1, false);


--
-- Name: seq_requests; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_requests
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_requests; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_requests', 1, false);


--
-- Name: seq_tasks; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_tasks
    START WITH 10000
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_tasks; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_tasks', 10000, true);


--
-- Name: seq_upgradestatements; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_upgradestatements
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_upgradestatements; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_upgradestatements', 58, true);


--
-- Name: seq_vfs_oplogs; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_vfs_oplogs
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: seq_vfs_oplogs; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_vfs_oplogs', 1, false);


SET default_with_oids = false;

--
-- Name: service_settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service_settings (
    iddomain character varying(20) NOT NULL,
    service character varying(10) NOT NULL,
    login character varying(100) NOT NULL,
    idsetting character varying(256) NOT NULL,
    value text
);



SET default_with_oids = true;

--
-- Name: serviceclasses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE serviceclasses (
    name character varying(20) NOT NULL,
    classname character varying(50),
    "order" numeric NOT NULL,
    url character varying(200),
    urlauth character varying(1),
    oldname character varying(20)
);



--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services (
    language character varying(2) NOT NULL,
    service character varying(10) NOT NULL,
    title character varying(1024) NOT NULL,
    href character varying(1024),
    image character varying(1024)
);



SET default_with_oids = false;

--
-- Name: servicestore; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE servicestore (
    iddomain character varying(20) NOT NULL,
    service character varying(10) NOT NULL,
    login character varying(100) NOT NULL,
    context character varying(40) NOT NULL,
    key character varying(1024) NOT NULL,
    value character varying(1024) NOT NULL,
    lasttime timestamp without time zone,
    frequency numeric
);



SET default_with_oids = true;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE settings (
    idsetting character varying(40) NOT NULL,
    value text
);



SET default_with_oids = false;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tasks (
    task_id numeric(38,0) NOT NULL,
    login character varying(100) NOT NULL,
    summary character varying(100) NOT NULL,
    description character varying(1024),
    priority character varying(15),
    categories character varying(1024),
    private character varying(1),
    status character varying(1) DEFAULT 'N'::character varying,
    revision timestamp without time zone DEFAULT now(),
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    complete numeric(3,0),
    status_complete character varying(15),
    dt_start date,
    dt_end date,
    reminder character varying(5),
    workorder_id numeric(38,0),
    mail_workflow_request_id numeric(38,0)
);



--
-- Name: tasks_tree; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tasks_tree (
    login character varying(100) NOT NULL,
    categories character varying(1024),
    iddomain character varying DEFAULT ''::character varying NOT NULL,
    private character varying(1),
    sync character varying(1) DEFAULT 'Y'::character varying,
    "default" character varying(1),
    description character varying(100),
    color character varying(20),
    checked boolean
);



--
-- Name: upgrade_statements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE upgrade_statements (
    id integer NOT NULL,
    tag character varying(20) NOT NULL,
    service_id character varying(20) NOT NULL,
    number smallint NOT NULL,
    script_name character varying(50) NOT NULL,
    data_source character varying(50) NOT NULL,
    statement_type character varying(10) NOT NULL,
    statement text,
    status character varying(50),
    message text,
    update_timestamp timestamp(6) without time zone NOT NULL
);



SET default_with_oids = true;

--
-- Name: user_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_log (
    login character varying(100) NOT NULL,
    logdatetime timestamp with time zone NOT NULL,
    sessionid character varying(255) NOT NULL
);



--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    login character varying(100) NOT NULL,
    password character varying(128) NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(255),
    company character varying(100),
    country character varying(255) NOT NULL,
    language character varying(2) NOT NULL,
    security_level numeric(38,0) NOT NULL,
    created timestamp with time zone NOT NULL,
    sessionid character varying(255) NOT NULL,
    address character varying(100) NOT NULL,
    zipcode character varying(10) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(2) NOT NULL,
    mailusername character varying(20),
    mailpassword character varying(128),
    mailhost character varying(50),
    mailprotocol character varying(10),
    mailport numeric(38,0),
    webscheduleview character varying(10),
    user_type character(1),
    maxmsglist numeric(38,0) DEFAULT 50 NOT NULL,
    lastcontacts character varying(200),
    folderprefix character varying(50),
    replywithoriginal character varying(1),
    mailsent character varying(40),
    maildrafts character varying(40),
    mailtrash character varying(40),
    mailspam character varying(40),
    passwordtype character varying(15),
    mailreceipt character varying(1),
    fontface character varying(40),
    fontsize character varying(10),
    theme character varying(10),
    color character varying(15),
    isadmin character varying(1),
    viewflag character varying(2) DEFAULT 'w5'::character varying,
    startday character varying(1) DEFAULT '1'::character varying,
    docmgt character varying(1),
    docmgt2 character varying(1),
    docmgtfolder character varying(40),
    syncenabled character varying(1),
    syncpassword character varying(128),
    scanall character varying(1),
    scansecs numeric(38,0),
    scancycles numeric(38,0),
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    mailsharedsort character varying(1) DEFAULT 'N'::character varying NOT NULL,
    fax character varying(1) DEFAULT 'N'::character varying,
    newsletter character varying(1) DEFAULT 'F'::character varying NOT NULL,
    title character varying(30),
    firstname character varying(60),
    lastname character varying(60),
    function character varying(50),
    work_mobile character varying(50),
    work_fax character varying(50),
    custom1 character varying(50),
    custom2 character varying(50),
    custom3 character varying(50)
);



--
-- Name: vacation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vacation (
    login character varying(100) NOT NULL,
    active character varying(1) NOT NULL,
    message character varying(4000),
    addresses character varying(4000) NOT NULL,
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL
);



SET default_with_oids = false;

--
-- Name: vfs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vfs (
    idvfs integer NOT NULL,
    name character varying(50) NOT NULL,
    uri text NOT NULL,
    login character varying(100),
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    parameters text
);



--
-- Name: vfs_du; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vfs_du (
    login character varying(100) NOT NULL,
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    idpath text NOT NULL,
    status text NOT NULL,
    password text,
    scadenza timestamp with time zone,
    hash text,
    data timestamp with time zone,
    authtype character varying(1) DEFAULT 'P'::character varying NOT NULL,
    askemail character varying(1) DEFAULT 'F'::character varying NOT NULL,
    validateemail character varying(1) DEFAULT 'F'::character varying NOT NULL
);



--
-- Name: vfs_du_params; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vfs_du_params (
    hash text NOT NULL,
    u_maxsize numeric
);



--
-- Name: vfs_emails; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vfs_emails (
    hash text NOT NULL,
    email character varying(200) NOT NULL
);



--
-- Name: vfs_idvfs_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vfs_idvfs_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: vfs_idvfs_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vfs_idvfs_seq OWNED BY vfs.idvfs;


--
-- Name: vfs_idvfs_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vfs_idvfs_seq', 1, true);


--
-- Name: vfs_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vfs_log (
    idpath text NOT NULL,
    status text NOT NULL,
    data timestamp with time zone NOT NULL,
    useragent text,
    email text
);



--
-- Name: vfs_oplogs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vfs_oplogs (
    oplog_id integer NOT NULL,
    iddomain character varying(20),
    login character varying(100),
    "timestamp" timestamp with time zone,
    operation character varying(50),
    subject text,
    data text
);



SET default_with_oids = true;

--
-- Name: viewevents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE viewevents (
    language character varying(2) NOT NULL,
    code character varying(15) NOT NULL,
    whereparam character varying(100) NOT NULL
);



--
-- Name: webtopid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webtopid
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: webtopid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webtopid', 65, true);


--
-- Name: workgroups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE workgroups (
    groupname character varying(100) NOT NULL,
    login character varying(100) NOT NULL,
    description character varying(100),
    allert character varying(1) DEFAULT 'Y'::character varying,
    readonly character varying(1) DEFAULT 'N'::character varying,
    contacts character varying(1),
    calendar character varying(1),
    tasks character varying(1),
    iddomain character varying(20) DEFAULT ''::character varying NOT NULL,
    mail character varying(1) DEFAULT 'F'::character varying,
    resource character varying(100),
    parameters character varying(100)
);



SET default_with_oids = false;

--
-- Name: xstreamhosts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE xstreamhosts (
    host character varying(100) NOT NULL,
    connection character varying(10) NOT NULL,
    "user" character varying(30),
    pass character varying(30)
);



--
-- Name: idvfs; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vfs ALTER COLUMN idvfs SET DEFAULT nextval('vfs_idvfs_seq'::regclass);


--
-- Data for Name: access_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY access_log (logdatetime, pagename, remotehost, remoteaddr, host, user_agent, accept_language, country, displaycountry, displaylanguage, displayname, iso3country, iso3language, language, searchtext, sessionid, referer) FROM stdin;
\.


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY activities (activity_id, language, description, login, iddomain, status, external_id, read_only) FROM stdin;
1	it	Operativa / Test	\N	\N	\N	\N	false
2	it	Sistemistica	\N	\N	\N	\N	false
3	it	Installazione	\N	\N	\N	\N	false
4	it	Formazione	\N	\N	\N	\N	false
5	it	Analisi / Progettazione	\N	\N	\N	\N	false
6	it	Sviluppo	\N	\N	\N	\N	false
7	it	Consulenza	\N	\N	\N	\N	false
8	it	Database	\N	\N	\N	\N	false
9	it	Viaggio A/R	\N	\N	\N	\N	false
10	it	Chiamate	\N	\N	\N	\N	false
12	it	Permesso	\N	\N	\N	\N	false
13	it	Ferie	\N	\N	\N	\N	false
14	it	Festa Nazionale	\N	\N	\N	\N	false
15	it	Malattia	\N	\N	\N	\N	false
16	it	Personale	\N	\N	\N	\N	false
11	it	Sonicle (Interna / Riunioni / ...)	\N	\N	\N	\N	false
17	it	Assistenza Remota	\N	\N	\N	\N	false
18	it	Assistenza da Chiamata	\N	\N	\N	\N	false
\.


--
-- Data for Name: adminservicesclasses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY adminservicesclasses (name, classname, "order") FROM stdin;
webtopadmin	com.sonicle.webtop.webtopadmin.WebtopAdminService	1
\.


--
-- Data for Name: alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alert (alert_type, alert_id, alert_iddomain, alert_to, alert_from, alert_original, alert_time, text, event_date) FROM stdin;
\.


--
-- Data for Name: allert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY allert (allert_type, allert_id, allert_to, allert_from, allert_original, allert_time, text) FROM stdin;
\.


--
-- Data for Name: authenticationclasses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authenticationclasses (authuriprotocol, classname) FROM stdin;
imap	com.sonicle.security.login.ImapAuthenticator
imaps	com.sonicle.security.login.ImapAuthenticator
sonicle	com.sonicle.security.login.SonicleAuthenticator
vfs	com.sonicle.security.login.VfsAuthenticator
webtop	com.sonicle.security.login.WebTopAuthenticator
ldap	com.sonicle.security.login.LdapAuthenticator
\.


--
-- Data for Name: autosave; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY autosave (login, service, context, webtopid, key, value) FROM stdin;
\.


--
-- Data for Name: calendars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY calendars (user_calendar, calendar, description, color, iddomain, checked, private, busy, sync, id, "default", default_reminder, default_send_invite) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (category_id, language, description, longdescription) FROM stdin;
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY classes (class_id, language, description) FROM stdin;
\.


--
-- Data for Name: clipboardevents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clipboardevents (event_by, event_id, flag) FROM stdin;
\.


--
-- Data for Name: confirm_causal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY confirm_causal (confirm_causal_id, description, customer_id, external_id, iddomain, status, login, language, status_d) FROM stdin;
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contacts (idcontact, login, firstname, lastname, title, function, company, caddress, ccity, cstate, cpostalcode, ccountry, ctelephone, ctelextension, cfax, cfaxextension, ctelephone2, ctel2extension, cpager, cpagerextension, cemail, cassistant, cnotes, haddress, hcity, hstate, hpostalcode, hcountry, htelephone, htelephone2, hfax, hmobile, hpager, hemail, hnotes, idsync, status, searchfield, type, idlist, revision, iddomain, cmobile, ctelephoneassistant, hpartner, hanniversary, hbirthday, cdepartment, photo, url, cmanager, cinstant_msg, hinstant_msg, oinstant_msg, oaddress, oemail, category, ocity, ostate, opostalcode, ocountry) FROM stdin;
\.


--
-- Data for Name: contacts_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contacts_category (login, category, description, color, iddomain, checked, sync, id, "default") FROM stdin;
\.


--
-- Data for Name: content_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY content_types (extension, content_type) FROM stdin;
bin	binary/octet-stream
html	text/html
txt	text/plain
css	text/css
csv	text/csv
xml	text/xml
eml	message/rfc822
gif	image/gif
jpg	image/jpeg
jpeg	image/jpeg
png	image/png
bmp	image/x-bmp
tif	image/tiff
ico	image/vnd.microsoft.icon
tar	application/x-tar
zip	application/zip
gz	application/x-gzip
z	application/x-compressed
pdf	application/pdf
doc	application/msword
ppt	application/mspowerpoint
xls	application/msexcel
js	application/javascript
swf	application/x-shockwave-flash
wav	audio/x-wav
mp3	audio/mpeg
aiff	audio/x-aiff
au	audio/basic
wma	audio/x-ms-wma
ogg	audio/ogg
wmv	video/x-ms-wmv
avi	video/x-msvideo
divx	video/divx
mpeg	video/mpeg
mp4	video/mp4
mov	video/quicktime
asf	video/x-ms-asf
htm	text/html\n
dwg	vector/x-dwg
ai	application/postscript
ps	application/postscript
eps	application/postscript
dot	application/msword
docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document
xlsx	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
pptx	application/vnd.openxmlformats-officedocument.presentationml.presentation
ics	text/calendar
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer (customer_id, description, type, address, city, state, postalcode, country, telephone, email, parent_id, external_id, status, iddomain, from_drm) FROM stdin;
\.


--
-- Data for Name: customer_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer_relations (customer_id, parent_id) FROM stdin;
\.


--
-- Data for Name: docmgt_associations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY docmgt_associations (login, idcategory) FROM stdin;
\.


--
-- Data for Name: docmgt_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY docmgt_categories (idcategory, description) FROM stdin;
\.


--
-- Data for Name: docmgt_subcategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY docmgt_subcategories (idcategory, idsubcategory, description) FROM stdin;
\.


--
-- Data for Name: download_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY download_log (os_id, product_id, login, logdatetime, sessionid) FROM stdin;
\.


--
-- Data for Name: dual; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dual (dummy) FROM stdin;
X
\.


--
-- Data for Name: history_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY history_requests ("timestamp", transaction, request_id, request_by, request_date, login, assign_to, category_id, release, class_id, severity, environment, description, fulldescription, simulation, suggestion, status, resolution, ispublic, deleted) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY identities (login, email, displayname, mainfolder, mailcarduser, iddomain, isfax, usemypersonalinfos) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY languages (language_id, description) FROM stdin;
it	Italiano
en	English
\.


--
-- Data for Name: listelements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY listelements (idlist, email, etype) FROM stdin;
\.


--
-- Data for Name: mail_workflow_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mail_workflow_requests (id, iddomain, login, subject, message, delegate_to, answer, deadline, date_delivery, messageid, request_from, deleted, completed, pre_allerted, allerted, reason, annulled, date_request, date_accept) FROM stdin;
\.


--
-- Data for Name: mail_workflow_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mail_workflow_users (id, iddomain, login, to_iddomain, to_login, mode) FROM stdin;
\.


--
-- Data for Name: mailfilters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mailfilters (login, idfilter, status, continue, keepcopy, condition, fromvalue, tovalue, subjectvalue, sizematch, sizevalue, fieldname, fieldvalue, action, actionvalue, iddomain) FROM stdin;
\.


--
-- Data for Name: mailnotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mailnotes (iddomain, messageid, text) FROM stdin;
\.


--
-- Data for Name: mailscan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mailscan (login, foldername, iddomain) FROM stdin;
\.


--
-- Data for Name: mailsentfilters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mailsentfilters (login, idfilter, status, continue, keepcopy, condition, fromvalue, tovalue, subjectvalue, sizematch, sizevalue, fieldname, fieldvalue, action, actionvalue, iddomain) FROM stdin;
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notes (note_id, note_by, description, fulldescription, priority, groupby, private, status, revision, iddomain, complete, status_complete, date_start, date_end) FROM stdin;
\.


--
-- Data for Name: notes_tree; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notes_tree (note_by, groupby, iddomain) FROM stdin;
\.


--
-- Data for Name: order_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_log (order_id, product_id, login, logdatetime, sessionid, status, price, vat, totalprice) FROM stdin;
\.


--
-- Data for Name: parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY parameters (key, value, notes) FROM stdin;
TRACKING_DEFAULT_CATEGORY_ID	other	Default Category in Add new item
TRACKING_DEFAULT_CLASS_ID	2	Default Class in Add new item
TRACKING_DEFAULT_SEVERITY	S	Default Severity in Add new item
TRACKING_CALL_EVENT	YES	Enable tracking/event integration
TRACKING_DEFAULT_ACTIVITY_ID	10	Default Activity opening new event
TRACKING_DEFAULT_ACTIVITY_FLAG	I	Default Activity Flag opening new event
\.


--
-- Data for Name: planning_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY planning_events (event_id, mailflag, email, recipienttype, answare) FROM stdin;
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY profiles (security_level, service, orderid) FROM stdin;
1	contacts	3
1	fileserver	4
2	webmail	1
2	contacts	3
2	schedule	2
1	webmail	1
1	schedule	2
\.


--
-- Data for Name: recurrences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recurrences (recurr_id, recurr_type, dayly_freq, weekly_freq, monthly_day, monthly_month, yearly_day, yearly_month, until_date, weekly_day1, weekly_day2, weekly_day3, weekly_day4, weekly_day5, weekly_day6, weekly_day7, permanent, repeat, start_date) FROM stdin;
\.


--
-- Data for Name: recurrences_broken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recurrences_broken (event_id, recurr_id, event_date, new_event_id) FROM stdin;
\.


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requests (request_id, request_by, request_date, login, assign_to, category_id, release, class_id, severity, environment, description, fulldescription, simulation, suggestion, status, resolution, ispublic, deleted, customer_id, statistic_id, warning) FROM stdin;
\.


--
-- Data for Name: service_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_settings (iddomain, service, login, idsetting, value) FROM stdin;
\.


--
-- Data for Name: serviceclasses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY serviceclasses (name, classname, "order", url, urlauth, oldname) FROM stdin;
calendar	com.sonicle.webtop.calendar.CalendarService	2	\N	\N	schedule
tasks	com.sonicle.webtop.tasks.TasksService	4	\N	\N	schedule
contacts	com.sonicle.webtop.contacts.ContactsService	3	\N	\N	contacts
mail	com.sonicle.webtop.mail.MailService	1	\N	\N	webmail
vfs	com.sonicle.webtop.vfs.VFSService	5	\N	\N	fileserver
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY services (language, service, title, href, image) FROM stdin;
it	schedule	Agenda	schedule/scheduler.jsp	images/schedule2.jpg
en	contacts	Contacts	templates/contacts/contacts.html	images/contacts2.jpg
en	schedule	Calendar	schedule/scheduler.jsp	images/schedule2.jpg
en	tracking	Activities	tracking/tracking.jsp	images/tracking2.jpg
it	fileserver	Files	tools/fileserver.jsp	images/fileserver2.jpg
en	fileserver	Files	tools/fileserver.jsp	images/fileserver2.jpg
it	contacts	Contatti	templates/contacts/contacts.html	images/contacts2.jpg
en	admin	Administration	admin/admin.html	x
it	admin	Amministrazione	admin/admin.html	x
en	webmail	Mail	webmail/displayFolders.jsp	images/webmail2.jpg
it	webmail	Posta elettronica	webmail/displayFolders.jsp	images/webmail2.jpg
\.


--
-- Data for Name: servicestore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY servicestore (iddomain, service, login, context, key, value, lasttime, frequency) FROM stdin;
\.


-- @NETHESIS: 
--	* calendar.pub.url and vfs.pub.url may be prepared with a known public name
--	  for the machine being initialized
--	* /var/lib/nethserver/webtop should containt prepared folders:
--		images (with photocontacts.png inside)
--		logs (for logback structured logging)
--		models (with initial mailcard.html)
--		mydocuments (empty)
--		public (with structure as from sample server)
--		tmp (empty)
--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY settings (idsetting, value) FROM stdin;
mail.attachment.maxsize	30000000
mail.smtp.port	25
sync.funambol.jdbc.driver	org.postgresql.Driver
sync.provider	funambol
fax.smtphost	faxhost
fax.smtpport	25
default.mailprotocol	imap
default.webscheduleview	week
default.user_type	B
default.maxmsglist	50
default.folderprefix	\N
default.replywithoriginal	Y
default.mailsent	Sent
default.fontsize	12
default.mailtrash	Trash
default.maildrafts	Drafts
fax.filetypes	doc,docx,xls,xlsx,ppt,pptx,pdf,odt,ods,odp,txt,csv
default.mailspam	junkmail
default.mailreceipt	N
default.fontface	Verdana
default.theme	win
default.color	gray
default.isadmin	N
default.viewflag	w5
default.startday	1
default.scanall	N
default.scansecs	30
default.scancycles	10
mail.specialfolders.autocreate	Y
default.mailport	143
fax.cover	none
fax.pattern	{username}@{number}.fax
vfs.pub.maxuploadsize	20000000
default.mailhost	localhost
mail.smtp.host	localhost
sync.funambol.jdbc.uri	jdbc:postgresql://localhost:5432/funambol
sync.funambol.jdbc.user	sonicle
vfs.default.expire.days	3
vfs.deleteexpired.emails.days	15
vfs.deleteexpired.uploads.days	30
calendar.remainderemailfreq	30
sync.daysync	7
sync.funambol.jdbc.password	sonicle
contacts.suggestautosaved	Y
main.otp.sonicleauth.interval	30
main.whatsnew.enabled	true
main.otp.trust.device.enabled	true
tasks.manifest.version	4.5.0
default.language	it
default.country	IT
main.manifest.version	4.5.5
calendar.pub.url	http://www.mypublicdomain.com/webtop
calendar.tmp	/var/lib/nethserver/webtop/tmp
contacts.tmp	/var/lib/nethserver/webtop/tmp
mail.models	/var/lib/nethserver/webtop/models
vfs.personalcloudroot	file://var/lib/nethserver/webtop/mydocuments
vfs.pub.temppath	/var/lib/nethserver/webtop/public/tmp
vfs.pub.url	http://www.mypublicdomain.com/webtop
webtop.archive	/var/lib/nethserver/webtop/archive
webtop.images	/var/lib/nethserver/webtop/images
webtop.public	/var/lib/nethserver/webtop/public
webtop.tmp	/var/lib/nethserver/webtop/tmp
default.security_level	1
mail.sharing.rights	Full:lrswipkxtecda,ReadOnly:lsr
mail.manifest.version	4.5.12
calendar.manifest.version	4.5.3
contacts.manifest.version	4.5.1
vfs.manifest.version	4.5.2
main.maintenance	false
main.profiledata.editable	true
mail.identities.editable	true
main.passwordbutton.show	false
mail.folders.sort	true
mail.username.stripdomain	true
sync.phppath	/usr/share/webtop/bin/
sync.zpushpath	/usr/share/webtop/z-push/
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tasks (task_id, login, summary, description, priority, categories, private, status, revision, iddomain, complete, status_complete, dt_start, dt_end, reminder, workorder_id, mail_workflow_request_id) FROM stdin;
\.


--
-- Data for Name: tasks_tree; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tasks_tree (login, categories, iddomain, private, sync, "default", description, color, checked) FROM stdin;
\.


--
-- Data for Name: upgrade_statements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY upgrade_statements (id, tag, service_id, number, script_name, data_source, statement_type, statement, status, message, update_timestamp) FROM stdin;
\.


--
-- Data for Name: user_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_log (login, logdatetime, sessionid) FROM stdin;
\.


--
-- Data for Name: vacation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vacation (login, active, message, addresses, iddomain) FROM stdin;
\.


--
-- Data for Name: vfs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vfs (idvfs, name, uri, login, iddomain, parameters) FROM stdin;
\.


--
-- Data for Name: vfs_du; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vfs_du (login, iddomain, idpath, status, password, scadenza, hash, data, authtype, askemail, validateemail) FROM stdin;
\.


--
-- Data for Name: vfs_du_params; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vfs_du_params (hash, u_maxsize) FROM stdin;
\.


--
-- Data for Name: vfs_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vfs_emails (hash, email) FROM stdin;
\.


--
-- Data for Name: vfs_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vfs_log (idpath, status, data, useragent, email) FROM stdin;
\.


--
-- Data for Name: vfs_oplogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vfs_oplogs (oplog_id, iddomain, login, "timestamp", operation, subject, data) FROM stdin;
\.


--
-- Data for Name: viewevents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY viewevents (language, code, whereparam) FROM stdin;
\.


--
-- Data for Name: workgroups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY workgroups (groupname, login, description, allert, readonly, contacts, calendar, tasks, iddomain, mail, resource, parameters) FROM stdin;
\.


--
-- Data for Name: xstreamhosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY xstreamhosts (host, connection, "user", pass) FROM stdin;
\.


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

SET search_path = pg_catalog;


--
-- Data for Name: BLOB COMMENTS; Type: BLOB COMMENTS; Schema: -; Owner: 
--


SET search_path = public, pg_catalog;

--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (activity_id, language);


--
-- Name: alert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alert
    ADD CONSTRAINT alert_pkey PRIMARY KEY (alert_iddomain, alert_to, alert_time);


--
-- Name: authenticationclasses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authenticationclasses
    ADD CONSTRAINT authenticationclasses_pkey PRIMARY KEY (authuriprotocol);


--
-- Name: autosave_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autosave
    ADD CONSTRAINT autosave_pkey PRIMARY KEY (login, service, context, webtopid, key);


--
-- Name: calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY calendars
    ADD CONSTRAINT calendars_pkey PRIMARY KEY (user_calendar, calendar, iddomain);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id, language);


--
-- Name: classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (class_id, language);


--
-- Name: confirm_causal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY confirm_causal
    ADD CONSTRAINT confirm_causal_pkey PRIMARY KEY (confirm_causal_id);


--
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contacts_category
    ADD CONSTRAINT contact_pkey PRIMARY KEY (login, category, iddomain);


--
-- Name: contacts_primarykey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_primarykey PRIMARY KEY (idcontact);


--
-- Name: content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY content_types
    ADD CONSTRAINT content_types_pkey PRIMARY KEY (extension);


--
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: customer_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer_relations
    ADD CONSTRAINT customer_relations_pkey PRIMARY KEY (customer_id, parent_id);


--
-- Name: docmgt_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY docmgt_associations
    ADD CONSTRAINT docmgt_associations_pkey PRIMARY KEY (login, idcategory);


--
-- Name: docmgt_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY docmgt_categories
    ADD CONSTRAINT docmgt_categories_pkey PRIMARY KEY (idcategory);


--
-- Name: docmgt_ssubcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY docmgt_subcategories
    ADD CONSTRAINT docmgt_ssubcategories_pkey PRIMARY KEY (idcategory, idsubcategory);


--
-- Name: domains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY domains
    ADD CONSTRAINT domains_pkey PRIMARY KEY (iddomain);


--
-- Name: domainsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY domainsettings
    ADD CONSTRAINT domainsettings_pkey PRIMARY KEY (iddomain, idsetting);


--
-- Name: events_primarykey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_primarykey PRIMARY KEY (event_id);


--
-- Name: identities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (iddomain, login, email, displayname);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (language_id);


--
-- Name: mail_workflow_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mail_workflow_requests
    ADD CONSTRAINT mail_workflow_requests_pkey PRIMARY KEY (id);


--
-- Name: mail_workflow_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mail_workflow_users
    ADD CONSTRAINT mail_workflow_users_pkey PRIMARY KEY (id);


--
-- Name: mailfilters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mailfilters
    ADD CONSTRAINT mailfilters_pkey PRIMARY KEY (iddomain, login, idfilter);


--
-- Name: mailscan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mailscan
    ADD CONSTRAINT mailscan_pkey PRIMARY KEY (iddomain, login, foldername);


--
-- Name: mailsentfilters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mailsentfilters
    ADD CONSTRAINT mailsentfilters_pkey PRIMARY KEY (iddomain, login, idfilter);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: order_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_log
    ADD CONSTRAINT order_log_pkey PRIMARY KEY (order_id);


--
-- Name: parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (key);


--
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (security_level, service);


--
-- Name: recurrences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recurrences
    ADD CONSTRAINT recurrences_pkey PRIMARY KEY (recurr_id);


--
-- Name: requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (request_id);


--
-- Name: service_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_settings
    ADD CONSTRAINT service_settings_pkey PRIMARY KEY (iddomain, service, login, idsetting);


--
-- Name: serviceclasses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY serviceclasses
    ADD CONSTRAINT serviceclasses_pkey PRIMARY KEY (name);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (language, service);


--
-- Name: servicesclasses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adminservicesclasses
    ADD CONSTRAINT servicesclasses_pkey PRIMARY KEY (name);


--
-- Name: servicestore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY servicestore
    ADD CONSTRAINT servicestore_pkey PRIMARY KEY (iddomain, service, login, context, key);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (idsetting);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (task_id);


--
-- Name: upgrade_statements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY upgrade_statements
    ADD CONSTRAINT upgrade_statements_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (iddomain, login);


--
-- Name: vacation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vacation
    ADD CONSTRAINT vacation_pkey PRIMARY KEY (iddomain, login, active);


--
-- Name: vfs_du_params_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vfs_du_params
    ADD CONSTRAINT vfs_du_params_pkey PRIMARY KEY (hash);


--
-- Name: vfs_du_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vfs_du
    ADD CONSTRAINT vfs_du_pkey PRIMARY KEY (login, idpath, iddomain, status);


--
-- Name: vfs_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vfs_emails
    ADD CONSTRAINT vfs_emails_pkey PRIMARY KEY (hash, email);


--
-- Name: vfs_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vfs_log
    ADD CONSTRAINT vfs_log_pkey PRIMARY KEY (idpath, data, status);


--
-- Name: vfs_oplogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vfs_oplogs
    ADD CONSTRAINT vfs_oplogs_pkey PRIMARY KEY (oplog_id);


--
-- Name: vfs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vfs
    ADD CONSTRAINT vfs_pkey PRIMARY KEY (idvfs);


--
-- Name: viewevents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY viewevents
    ADD CONSTRAINT viewevents_pkey PRIMARY KEY (language, code);


--
-- Name: workgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY workgroups
    ADD CONSTRAINT workgroups_pkey PRIMARY KEY (iddomain, groupname, login);


--
-- Name: xstreamhosts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY xstreamhosts
    ADD CONSTRAINT xstreamhosts_pkey PRIMARY KEY (host);


--
-- Name: Contacts Search Field; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "Contacts Search Field" ON contacts USING btree (searchfield);


--
-- Name: Contacts idlist; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "Contacts idlist" ON contacts USING btree (idlist);


--
-- Name: KEY_CUSTOMERTYPE; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "KEY_CUSTOMERTYPE" ON customer USING btree (type, description);


--
-- Name: allert_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX allert_id ON allert USING btree (allert_type, allert_id);


--
-- Name: allert_to; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX allert_to ON allert USING btree (allert_to);


--
-- Name: event_date_by; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX event_date_by ON events USING btree (event_date, iddomain, event_by);


--
-- Name: events_by; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX events_by ON events USING btree (iddomain, event_by, event_id);


--
-- Name: identities_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX identities_index ON identities USING btree (login, displayname);


--
-- Name: listelements_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX listelements_key ON listelements USING btree (idlist, email);


--
-- Name: mail_workflow_users_ak1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX mail_workflow_users_ak1 ON mail_workflow_users USING btree (iddomain, login, to_iddomain, to_login, mode);


--
-- Name: note_by; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX note_by ON notes USING btree (iddomain, note_by, note_id);


--
-- Name: plannig_events_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX plannig_events_index ON planning_events USING btree (event_id);


--
-- Name: reccurences; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reccurences ON events USING btree (recurr_id);


--
-- Name: upgradestatements_tag_service_number; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX upgradestatements_tag_service_number ON upgrade_statements USING btree (tag, service_id, number);


--
-- Name: upgradestatements_tag_type_status; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX upgradestatements_tag_type_status ON upgrade_statements USING btree (tag, statement_type, status);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--


--
-- PostgreSQL database dump complete
--

--
-- NethServer configuration
--


INSERT INTO settings VALUES ('main.config.domains.management', 'false');
INSERT INTO settings VALUES ('main.config.postmap.management', 'false');
INSERT INTO settings VALUES ('main.config.pecbridge.management', 'false');
INSERT INTO settings VALUES ('main.config.fetchmail.management', 'false');


INSERT INTO users VALUES ('admin', 'admin', 'Administrator', '', NULL, NULL, 'EN', 'en', 0, now(), 'admin', 'address', 'zip', 'city', 'ST', '', '', NULL, NULL, NULL, NULL, 'U', 0, NULL, '', NULL, NULL, NULL, NULL, NULL, 'PLAIN', NULL, NULL, NULL, NULL, NULL, 'Y', 'w5', '1', NULL, NULL, NULL, 'Y', NULL, 'N', 30, 10, '', 'N', 'N', 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
 INSERT INTO users VALUES ('admin', '', 'NethServer Administrator', '', NULL, NULL, 'EN', 'en', 1, now(), 'admin', 'address', 'zip', 'city', 'ST', '', '', NULL, NULL, NULL, NULL, 'U', 0, NULL, '', NULL, NULL, NULL, NULL, NULL, 'PLAIN', NULL, NULL, NULL, NULL, NULL, 'N', 'w5', '1', NULL, NULL, NULL, 'Y', NULL, 'N', 30, 10, 'NethServer', 'N', 'N', 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into service_settings (iddomain,service,login,idsetting,value) values ('NethServer','mail','admin','pagerows',100);


CREATE LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION _WEBTOP_DELETEUSER (_tbl VARCHAR, _key VARCHAR, _value VARCHAR) RETURNS void AS $$
DECLARE
	BEXISTS VARCHAR;
BEGIN
	SELECT '1' INTO BEXISTS FROM information_schema.tables WHERE table_schema = 'public' AND table_name = _tbl;
	IF FOUND THEN
		EXECUTE 'DELETE FROM ' || _tbl || ' WHERE ' || _key || ' = ''' || _value || ''' ';
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION WEBTOP_DELETEUSER (_value VARCHAR) RETURNS VARCHAR as $$
BEGIN
	PERFORM _WEBTOP_DELETEUSER ('contacts','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('autosave','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('docmgt_associations','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('download_log','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('history_requests','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('identities','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('mailfilters','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('mailscan','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('mailsentfilters','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('order_log','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('requests','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('service_settings','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('servicestore','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('tasks','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('tasks_tree','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('user_log','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('users','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('vfs','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('vfs_du','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('alert','alert_to',_value);
	PERFORM _WEBTOP_DELETEUSER ('alert','alert_from',_value);
	PERFORM _WEBTOP_DELETEUSER ('alert','alert_original',_value);
	PERFORM _WEBTOP_DELETEUSER ('calendars','user_calendar',_value);
	PERFORM _WEBTOP_DELETEUSER ('clipboardevents','event_by',_value);
	PERFORM _WEBTOP_DELETEUSER ('events','event_by',_value);
	PERFORM _WEBTOP_DELETEUSER ('workgroups','groupname',_value);
	PERFORM _WEBTOP_DELETEUSER ('workgroups','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_company_users','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_documents','login_lock_file',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_documents_link','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_expense_note','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_expense_note_adddocuments','login_lock_file',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_expense_note_adddocuments_link','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_expense_note_row','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_expense_note_row_detail','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_expense_note_row_documents','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_expense_note_row_documents','login_lock_file',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_expense_note_row_documents_link','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_expense_note_settings','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_generic_documents','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_generic_documents_attachments_link','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_generic_documents_link','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_generic_documents_settings','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_groups','supervisor',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_groups_users','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_register_visit','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_register_visit_settings','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_adddocuments','login_lock_file',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_adddocuments_link','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_int_settings','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_visit','performed_by',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_visit','performed_with',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_visit','compiled_by',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_visit_actions','performed_by',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_visit_actions_documents','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_visit_adddocuments','login_lock_file',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_visit_adddocuments_link','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_report_visit_settings','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_requests','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_requests','request_by',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_requests','assign_to',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_requests_history','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_requests_history','request_by',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_requests_history','assign_to',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_requests_settings','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_responsible','login_responsible',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_responsible_for_users','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_responsible_user','login_responsible',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_timetable_report_temp','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_timetable_requests_holiday','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_timetable_requests_holiday','responsible',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_timetable_requests_holiday_adddocuments','login_lock_file',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_timetable_settings','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_timetable_user_hours','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_user_register','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_workorder','request_by',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_workorder','assign_to',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_workorder','compiled_by',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_workorder_adddocuments','login_lock_file',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_workorder_adddocuments_link','login',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_workorder_other_assign_to','assign_to',_value);
	PERFORM _WEBTOP_DELETEUSER ('drm_workorder_settings','login',_value);
	RETURN 'OK';
END;
$$ LANGUAGE plpgsql;
