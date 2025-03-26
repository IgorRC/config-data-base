--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Debian 16.8-1.pgdg120+1)
-- Dumped by pg_dump version 16.8 (Debian 16.8-1.pgdg120+1)

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
-- Name: logistics; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA logistics;


ALTER SCHEMA logistics OWNER TO postgres;

--
-- Name: management; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA management;


ALTER SCHEMA management OWNER TO postgres;

--
-- Name: marketing; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA marketing;


ALTER SCHEMA marketing OWNER TO postgres;

--
-- Name: master; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA master;


ALTER SCHEMA master OWNER TO postgres;

--
-- Name: ordering; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ordering;


ALTER SCHEMA ordering OWNER TO postgres;

--
-- Name: payment; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA payment;


ALTER SCHEMA payment OWNER TO postgres;

--
-- Name: stock; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stock;


ALTER SCHEMA stock OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courier; Type: TABLE; Schema: logistics; Owner: postgres
--

CREATE TABLE logistics.courier (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    courier_id uuid NOT NULL,
    delivery_company_id uuid,
    user_id uuid,
    address character varying(255),
    name character varying(255),
    phone character varying(255),
    plate character varying(255)
);


ALTER TABLE logistics.courier OWNER TO postgres;

--
-- Name: delivery_company; Type: TABLE; Schema: logistics; Owner: postgres
--

CREATE TABLE logistics.delivery_company (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    delivery_company_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE logistics.delivery_company OWNER TO postgres;

--
-- Name: delivery_manifest; Type: TABLE; Schema: logistics; Owner: postgres
--

CREATE TABLE logistics.delivery_manifest (
    open boolean,
    manifest_number bigint,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    courier_id uuid,
    delivery_manifest_id uuid NOT NULL,
    user_id uuid,
    warehouse_id uuid,
    observations text
);


ALTER TABLE logistics.delivery_manifest OWNER TO postgres;

--
-- Name: delivery_manifest_items; Type: TABLE; Schema: logistics; Owner: postgres
--

CREATE TABLE logistics.delivery_manifest_items (
    collected boolean,
    delivered boolean,
    quantity integer,
    delivery_manifest_id uuid,
    delivery_manifest_item_id uuid NOT NULL,
    order_item_id uuid,
    product_id uuid,
    user_id uuid
);


ALTER TABLE logistics.delivery_manifest_items OWNER TO postgres;

--
-- Name: supplier; Type: TABLE; Schema: logistics; Owner: postgres
--

CREATE TABLE logistics.supplier (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    country_id uuid,
    district_id uuid,
    supplier_id uuid NOT NULL,
    supplier_type_id uuid,
    business_name character varying(255),
    email character varying(255),
    location character varying(255),
    phone_number character varying(255),
    ruc character varying(255),
    token_user character varying(255)
);


ALTER TABLE logistics.supplier OWNER TO postgres;

--
-- Name: supplier_type; Type: TABLE; Schema: logistics; Owner: postgres
--

CREATE TABLE logistics.supplier_type (
    supplier_type_id uuid NOT NULL
);


ALTER TABLE logistics.supplier_type OWNER TO postgres;

--
-- Name: warehouse; Type: TABLE; Schema: logistics; Owner: postgres
--

CREATE TABLE logistics.warehouse (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    user_id uuid,
    warehouse_id uuid NOT NULL,
    address character varying(255),
    contact character varying(255),
    name character varying(255),
    phone character varying(255),
    reference character varying(255)
);


ALTER TABLE logistics.warehouse OWNER TO postgres;

--
-- Name: access; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.access (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    access_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE management.access OWNER TO postgres;

--
-- Name: audit; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.audit (
    registration_date timestamp(6) with time zone,
    audit_event_id uuid,
    audit_id uuid NOT NULL,
    client_id uuid,
    user_id uuid,
    detail text,
    reference character varying(255)
);


ALTER TABLE management.audit OWNER TO postgres;

--
-- Name: audit_event; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.audit_event (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    audit_event_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE management.audit_event OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.client (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid NOT NULL,
    district_id uuid NOT NULL,
    address character varying(255) NOT NULL,
    business character varying(255) NOT NULL,
    dni character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    mobile character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    ruc character varying(255) NOT NULL,
    surname character varying(255) NOT NULL
);


ALTER TABLE management.client OWNER TO postgres;

--
-- Name: membership_module; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.membership_module (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone NOT NULL,
    update_date timestamp(6) with time zone NOT NULL,
    membership_id uuid NOT NULL,
    membership_module_id uuid NOT NULL,
    module_id uuid NOT NULL,
    user_id uuid
);


ALTER TABLE management.membership_module OWNER TO postgres;

--
-- Name: membership_module_role; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.membership_module_role (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone NOT NULL,
    update_date timestamp(6) with time zone,
    membership_module_id uuid NOT NULL,
    membership_module_role_id uuid NOT NULL,
    role_id uuid NOT NULL,
    user_id uuid
);


ALTER TABLE management.membership_module_role OWNER TO postgres;

--
-- Name: onboarding; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.onboarding (
    billing boolean NOT NULL,
    demo boolean NOT NULL,
    ecommerce boolean NOT NULL,
    users_maximum integer NOT NULL,
    users_minimum integer NOT NULL,
    category_id uuid NOT NULL,
    client_id uuid NOT NULL,
    entry_channel_id uuid NOT NULL,
    onboard_id uuid NOT NULL,
    comment character varying(255) NOT NULL
);


ALTER TABLE management.onboarding OWNER TO postgres;

--
-- Name: onboarding_channel; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.onboarding_channel (
    closing_channel_id uuid NOT NULL,
    onboard_channel_id uuid NOT NULL,
    onboard_id uuid NOT NULL
);


ALTER TABLE management.onboarding_channel OWNER TO postgres;

--
-- Name: onboarding_module; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.onboarding_module (
    module_id uuid,
    onboard_id uuid,
    onboard_module_id uuid NOT NULL
);


ALTER TABLE management.onboarding_module OWNER TO postgres;

--
-- Name: onboarding_store; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.onboarding_store (
    onboard_id uuid NOT NULL,
    onboard_store_id uuid NOT NULL,
    store_id uuid NOT NULL
);


ALTER TABLE management.onboarding_store OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.role (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    role_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE management.role OWNER TO postgres;

--
-- Name: role_access; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.role_access (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    access_id uuid NOT NULL,
    role_access_id uuid NOT NULL,
    role_id uuid NOT NULL,
    user_id uuid
);


ALTER TABLE management.role_access OWNER TO postgres;

--
-- Name: store; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.store (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid NOT NULL,
    store_id uuid NOT NULL,
    store_type_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE management.store OWNER TO postgres;

--
-- Name: user_data; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.user_data (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid NOT NULL,
    district_id uuid NOT NULL,
    user_id uuid NOT NULL,
    address character varying(255) NOT NULL,
    dni character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    gender character varying(255) NOT NULL,
    mobile character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE management.user_data OWNER TO postgres;

--
-- Name: user_role; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.user_role (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    role_id uuid NOT NULL,
    user_id uuid NOT NULL,
    user_role_id uuid NOT NULL
);


ALTER TABLE management.user_role OWNER TO postgres;

--
-- Name: brand; Type: TABLE; Schema: marketing; Owner: postgres
--

CREATE TABLE marketing.brand (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    brand_id uuid NOT NULL,
    client_id uuid,
    user_id uuid,
    name character varying(255),
    sku character varying(255)
);


ALTER TABLE marketing.brand OWNER TO postgres;

--
-- Name: model; Type: TABLE; Schema: marketing; Owner: postgres
--

CREATE TABLE marketing.model (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    brand_id uuid,
    client_id uuid,
    model_id uuid NOT NULL,
    user_id uuid,
    name character varying(255),
    sku character varying(255)
);


ALTER TABLE marketing.model OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: marketing; Owner: postgres
--

CREATE TABLE marketing.product (
    picture_flag boolean,
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    color_id uuid NOT NULL,
    model_id uuid NOT NULL,
    product_id uuid NOT NULL,
    size_id uuid NOT NULL,
    sub_category_product_id uuid NOT NULL,
    unit_id uuid,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE marketing.product OWNER TO postgres;

--
-- Name: product_picture; Type: TABLE; Schema: marketing; Owner: postgres
--

CREATE TABLE marketing.product_picture (
    registration_date timestamp(6) with time zone,
    client_id uuid,
    product_id uuid,
    product_picture_id uuid NOT NULL,
    user_id uuid,
    product_picture_url character varying(255)
);


ALTER TABLE marketing.product_picture OWNER TO postgres;

--
-- Name: product_price; Type: TABLE; Schema: marketing; Owner: postgres
--

CREATE TABLE marketing.product_price (
    status boolean,
    unit_sale_price double precision,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    product_id uuid,
    product_price_id uuid NOT NULL,
    user_id uuid
);


ALTER TABLE marketing.product_price OWNER TO postgres;

--
-- Name: cancellation_reason; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.cancellation_reason (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    cancellation_reason_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE master.cancellation_reason OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.category (
    status boolean DEFAULT true,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    category_id uuid NOT NULL,
    user_id uuid,
    description character varying(255),
    name character varying(255)
);


ALTER TABLE master.category OWNER TO postgres;

--
-- Name: category_product; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.category_product (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    category_product_id uuid NOT NULL,
    client_id uuid,
    size_type_id uuid,
    unit_type_id uuid,
    user_id uuid,
    name character varying(255),
    sku character varying(255)
);


ALTER TABLE master.category_product OWNER TO postgres;

--
-- Name: closing_channel; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.closing_channel (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    closing_channel_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE master.closing_channel OWNER TO postgres;

--
-- Name: color; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.color (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    color_id uuid NOT NULL,
    user_id uuid,
    name character varying(255),
    sku character varying(255)
);


ALTER TABLE master.color OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.country (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    country_id uuid NOT NULL,
    name character varying(255)
);


ALTER TABLE master.country OWNER TO postgres;

--
-- Name: department; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.department (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    country_id uuid,
    department_id uuid NOT NULL,
    name character varying(255)
);


ALTER TABLE master.department OWNER TO postgres;

--
-- Name: discount; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.discount (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    discount_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE master.discount OWNER TO postgres;

--
-- Name: district; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.district (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    district_id uuid NOT NULL,
    province_id uuid,
    name character varying(255)
);


ALTER TABLE master.district OWNER TO postgres;

--
-- Name: entry_channel; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.entry_channel (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    entry_channel_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE master.entry_channel OWNER TO postgres;

--
-- Name: management_type; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.management_type (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    management_type_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE master.management_type OWNER TO postgres;

--
-- Name: membership_state; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.membership_state (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    membership_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE master.membership_state OWNER TO postgres;

--
-- Name: module; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.module (
    monthly_price double precision NOT NULL,
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone NOT NULL,
    update_date timestamp(6) with time zone NOT NULL,
    module_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE master.module OWNER TO postgres;

--
-- Name: order_state; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.order_state (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    order_state_id uuid NOT NULL,
    user_id uuid,
    hex_color character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE master.order_state OWNER TO postgres;

--
-- Name: payment_method; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.payment_method (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone NOT NULL,
    update_date timestamp(6) with time zone,
    payment_method_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE master.payment_method OWNER TO postgres;

--
-- Name: payment_state; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.payment_state (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone NOT NULL,
    update_date timestamp(6) with time zone NOT NULL,
    payment_state_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE master.payment_state OWNER TO postgres;

--
-- Name: province; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.province (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone NOT NULL,
    update_date timestamp(6) with time zone NOT NULL,
    department_id uuid NOT NULL,
    province_id uuid NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE master.province OWNER TO postgres;

--
-- Name: sale_channel; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.sale_channel (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    sale_channel_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE master.sale_channel OWNER TO postgres;

--
-- Name: size; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.size (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    size_id uuid NOT NULL,
    size_type_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE master.size OWNER TO postgres;

--
-- Name: size_type; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.size_type (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    size_type_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE master.size_type OWNER TO postgres;

--
-- Name: store_type; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.store_type (
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    store_type_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE master.store_type OWNER TO postgres;

--
-- Name: sub_category_product; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.sub_category_product (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    category_product_id uuid,
    client_id uuid,
    sub_category_product_id uuid NOT NULL,
    user_id uuid,
    name character varying(255),
    sku character varying(255)
);


ALTER TABLE master.sub_category_product OWNER TO postgres;

--
-- Name: unit; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.unit (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    unit_id uuid NOT NULL,
    unit_type_id uuid,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE master.unit OWNER TO postgres;

--
-- Name: unit_type; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.unit_type (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    unit_type_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE master.unit_type OWNER TO postgres;

--
-- Name: cancelled_order; Type: TABLE; Schema: ordering; Owner: postgres
--

CREATE TABLE ordering.cancelled_order (
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    cancellation_reason_id uuid,
    cancelled_order_id uuid NOT NULL,
    client_id uuid,
    order_id uuid,
    user_id uuid
);


ALTER TABLE ordering.cancelled_order OWNER TO postgres;

--
-- Name: courier_picture; Type: TABLE; Schema: ordering; Owner: postgres
--

CREATE TABLE ordering.courier_picture (
    registration_date timestamp(6) with time zone,
    client_id uuid,
    courier_picture_id uuid NOT NULL,
    order_id uuid,
    user_id uuid,
    picture_url character varying(255)
);


ALTER TABLE ordering.courier_picture OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: ordering; Owner: postgres
--

CREATE TABLE ordering.customer (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    customer_id uuid NOT NULL,
    customer_type_id uuid,
    district_id uuid,
    user_id uuid,
    address character varying(255),
    dni character varying(255),
    instagram character varying(255),
    name character varying(255),
    phone character varying(255),
    reference character varying(255)
);


ALTER TABLE ordering.customer OWNER TO postgres;

--
-- Name: customer_type; Type: TABLE; Schema: ordering; Owner: postgres
--

CREATE TABLE ordering.customer_type (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    customer_type_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE ordering.customer_type OWNER TO postgres;

--
-- Name: delivery_point; Type: TABLE; Schema: ordering; Owner: postgres
--

CREATE TABLE ordering.delivery_point (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    delivery_point_id uuid NOT NULL,
    user_id uuid,
    address character varying(255),
    name character varying(255)
);


ALTER TABLE ordering.delivery_point OWNER TO postgres;

--
-- Name: order; Type: TABLE; Schema: ordering; Owner: postgres
--

CREATE TABLE ordering."order" (
    advanced_payment double precision,
    cancellation boolean,
    delivery_amount double precision,
    delivery_flag boolean,
    discount_amount double precision,
    receipt_flag boolean,
    order_number bigint,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    closing_channel_id uuid,
    courier_id uuid,
    customer_id uuid,
    delivery_point_id uuid,
    discount_id uuid,
    management_type_id uuid,
    order_id uuid NOT NULL,
    order_state_id uuid,
    payment_method_id uuid,
    payment_state_id uuid,
    sale_channel_id uuid,
    store_id uuid,
    user_id uuid,
    delivery_address character varying(255),
    observations text,
    seller character varying(255)
);


ALTER TABLE ordering."order" OWNER TO postgres;

--
-- Name: order_contacted; Type: TABLE; Schema: ordering; Owner: postgres
--

CREATE TABLE ordering.order_contacted (
    contacted boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    agent_id uuid,
    client_id uuid,
    order_contacted_id uuid NOT NULL,
    order_id uuid NOT NULL,
    user_id uuid,
    observations text
);


ALTER TABLE ordering.order_contacted OWNER TO postgres;

--
-- Name: order_item; Type: TABLE; Schema: ordering; Owner: postgres
--

CREATE TABLE ordering.order_item (
    discount_amount double precision,
    quantity integer,
    select_order_status boolean,
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    discount_id uuid,
    order_id uuid,
    order_item_id uuid NOT NULL,
    product_id uuid,
    user_id uuid,
    observations text
);


ALTER TABLE ordering.order_item OWNER TO postgres;

--
-- Name: order_log; Type: TABLE; Schema: ordering; Owner: postgres
--

CREATE TABLE ordering.order_log (
    registration_date timestamp(6) with time zone,
    client_id uuid,
    order_id uuid,
    order_log_id uuid NOT NULL,
    order_state_id uuid,
    user_id uuid,
    detail text
);


ALTER TABLE ordering.order_log OWNER TO postgres;

--
-- Name: order_payment_receipt; Type: TABLE; Schema: ordering; Owner: postgres
--

CREATE TABLE ordering.order_payment_receipt (
    registration_date timestamp(6) with time zone,
    client_id uuid,
    order_id uuid,
    order_payment_receipt uuid NOT NULL,
    user_id uuid,
    payment_receipt_url character varying(255)
);


ALTER TABLE ordering.order_payment_receipt OWNER TO postgres;

--
-- Name: membership; Type: TABLE; Schema: payment; Owner: postgres
--

CREATE TABLE payment.membership (
    demo boolean NOT NULL,
    expiration_date timestamp(6) with time zone,
    registration_date timestamp(6) with time zone NOT NULL,
    update_date timestamp(6) with time zone,
    client_id uuid NOT NULL,
    membership_id uuid NOT NULL,
    membership_payment_id uuid NOT NULL,
    membership_state_id uuid,
    subscription_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE payment.membership OWNER TO postgres;

--
-- Name: membership_payment; Type: TABLE; Schema: payment; Owner: postgres
--

CREATE TABLE payment.membership_payment (
    gross_amount double precision NOT NULL,
    net_amount double precision NOT NULL,
    payment_gateway_fee double precision NOT NULL,
    tax_amount double precision NOT NULL,
    registration_date timestamp(6) with time zone NOT NULL,
    update_date timestamp(6) with time zone,
    client_id uuid,
    membership_payment_id uuid NOT NULL,
    payment_gateway_id uuid,
    user_id uuid
);


ALTER TABLE payment.membership_payment OWNER TO postgres;

--
-- Name: membership_payment_state; Type: TABLE; Schema: payment; Owner: postgres
--

CREATE TABLE payment.membership_payment_state (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    membership_payment_state_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE payment.membership_payment_state OWNER TO postgres;

--
-- Name: payment_gateway; Type: TABLE; Schema: payment; Owner: postgres
--

CREATE TABLE payment.payment_gateway (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    payment_gateway_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE payment.payment_gateway OWNER TO postgres;

--
-- Name: subscription; Type: TABLE; Schema: payment; Owner: postgres
--

CREATE TABLE payment.subscription (
    discount_percent double precision NOT NULL,
    months integer NOT NULL,
    status boolean NOT NULL,
    registration_date timestamp(6) with time zone NOT NULL,
    update_date timestamp(6) with time zone,
    subscription_id uuid NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL
);


ALTER TABLE payment.subscription OWNER TO postgres;

--
-- Name: general_stock; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.general_stock (
    quantity integer,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    general_stock_id uuid NOT NULL,
    product_id uuid,
    user_id uuid
);


ALTER TABLE stock.general_stock OWNER TO postgres;

--
-- Name: stock_transaction; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.stock_transaction (
    registration_date timestamp(6) with time zone,
    client_id uuid,
    stock_transaction_id uuid NOT NULL,
    stock_transaction_type_id uuid,
    user_id uuid,
    warehouse_id uuid,
    serial character varying(255)
);


ALTER TABLE stock.stock_transaction OWNER TO postgres;

--
-- Name: stock_transaction_item; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.stock_transaction_item (
    quantity integer,
    registration_date timestamp(6) with time zone,
    client_id uuid,
    product_id uuid,
    stock_transaction_id uuid,
    stock_transaction_item_id uuid NOT NULL,
    user_id uuid
);


ALTER TABLE stock.stock_transaction_item OWNER TO postgres;

--
-- Name: stock_transaction_type; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.stock_transaction_type (
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    stock_transaction_type_id uuid NOT NULL,
    user_id uuid,
    name character varying(255)
);


ALTER TABLE stock.stock_transaction_type OWNER TO postgres;

--
-- Name: supply_order; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.supply_order (
    status boolean,
    delivery_date timestamp(6) with time zone,
    order_number bigint,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    supply_order_id uuid NOT NULL,
    user_id uuid,
    warehouse_id uuid,
    ref character varying(255)
);


ALTER TABLE stock.supply_order OWNER TO postgres;

--
-- Name: supply_order_item; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.supply_order_item (
    quantity integer,
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    product_id uuid,
    purchase_id uuid,
    purchase_item_id uuid NOT NULL,
    user_id uuid,
    observations text
);


ALTER TABLE stock.supply_order_item OWNER TO postgres;

--
-- Name: warehouse_output; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.warehouse_output (
    status boolean,
    order_number bigint,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    user_id uuid,
    warehouse_id uuid,
    warehouse_output_id uuid NOT NULL,
    ref character varying(255)
);


ALTER TABLE stock.warehouse_output OWNER TO postgres;

--
-- Name: warehouse_output_item; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.warehouse_output_item (
    quantity integer,
    status boolean,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    product_id uuid,
    user_id uuid,
    warehouse_output_id uuid,
    warehouse_output_item_id uuid NOT NULL
);


ALTER TABLE stock.warehouse_output_item OWNER TO postgres;

--
-- Name: warehouse_stock; Type: TABLE; Schema: stock; Owner: postgres
--

CREATE TABLE stock.warehouse_stock (
    quantity integer,
    registration_date timestamp(6) with time zone,
    update_date timestamp(6) with time zone,
    client_id uuid,
    product_id uuid,
    user_id uuid,
    warehouse_id uuid,
    warehouse_stock_id uuid NOT NULL
);


ALTER TABLE stock.warehouse_stock OWNER TO postgres;

--
-- Data for Name: courier; Type: TABLE DATA; Schema: logistics; Owner: postgres
--

COPY logistics.courier (status, registration_date, update_date, client_id, courier_id, delivery_company_id, user_id, address, name, phone, plate) FROM stdin;
t	2025-03-17 21:53:06.944739+00	2025-03-17 21:53:06.944743+00	84a40517-458c-4933-97e7-e399d71b50e8	99a14e46-d30c-4376-a3f8-5ebd99abde28	cbf33efd-ea88-404f-9ff1-279cd3720fd5	2f363ce3-e629-42d7-8bb2-7892307e0275	calle 0	CAPIBARA	929417416	000-000
t	2025-03-17 21:53:22.620287+00	2025-03-17 21:53:22.620293+00	84a40517-458c-4933-97e7-e399d71b50e8	afbd0e30-6ef8-4389-9f0d-3cc4214cdc38	cbf33efd-ea88-404f-9ff1-279cd3720fd5	2f363ce3-e629-42d7-8bb2-7892307e0275	calle 0	SIN COURIER	929417416	000-000
\.


--
-- Data for Name: delivery_company; Type: TABLE DATA; Schema: logistics; Owner: postgres
--

COPY logistics.delivery_company (status, registration_date, update_date, client_id, delivery_company_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.837478+00	2025-03-17 21:13:14.837481+00	84a40517-458c-4933-97e7-e399d71b50e8	55adbbf1-97f0-4b6c-8807-a9ab01db183a	2f363ce3-e629-42d7-8bb2-7892307e0275	SIN EMPRESA
t	2025-03-17 21:53:03.207295+00	2025-03-17 21:53:03.2073+00	84a40517-458c-4933-97e7-e399d71b50e8	cbf33efd-ea88-404f-9ff1-279cd3720fd5	2f363ce3-e629-42d7-8bb2-7892307e0275	GNIUS COMPANY
\.


--
-- Data for Name: delivery_manifest; Type: TABLE DATA; Schema: logistics; Owner: postgres
--

COPY logistics.delivery_manifest (open, manifest_number, registration_date, update_date, client_id, courier_id, delivery_manifest_id, user_id, warehouse_id, observations) FROM stdin;
\.


--
-- Data for Name: delivery_manifest_items; Type: TABLE DATA; Schema: logistics; Owner: postgres
--

COPY logistics.delivery_manifest_items (collected, delivered, quantity, delivery_manifest_id, delivery_manifest_item_id, order_item_id, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: logistics; Owner: postgres
--

COPY logistics.supplier (status, registration_date, update_date, client_id, country_id, district_id, supplier_id, supplier_type_id, business_name, email, location, phone_number, ruc, token_user) FROM stdin;
\.


--
-- Data for Name: supplier_type; Type: TABLE DATA; Schema: logistics; Owner: postgres
--

COPY logistics.supplier_type (supplier_type_id) FROM stdin;
\.


--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: logistics; Owner: postgres
--

COPY logistics.warehouse (status, registration_date, update_date, client_id, user_id, warehouse_id, address, contact, name, phone, reference) FROM stdin;
\.


--
-- Data for Name: access; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.access (status, registration_date, update_date, access_id, user_id, name) FROM stdin;
t	2025-03-17 21:12:56.918096+00	2025-03-17 21:12:56.918118+00	601fdba2-2c1f-41b2-aeee-cd1eaeecb453	2f363ce3-e629-42d7-8bb2-7892307e0275	USER_GET
t	2025-03-17 21:13:11.842534+00	2025-03-17 21:13:11.842538+00	d43ebf59-df69-46ae-921a-2f6675ce0e52	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESS_POST
t	2025-03-17 21:13:11.850648+00	2025-03-17 21:13:11.850651+00	99395567-5b69-4e1f-a2b4-96254651f91f	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESS_DELETE
t	2025-03-17 21:13:11.85702+00	2025-03-17 21:13:11.857022+00	09875317-5adb-4180-812d-187820876353	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESS_GET
t	2025-03-17 21:13:11.865072+00	2025-03-17 21:13:11.865077+00	17df3f39-e56b-431b-86c9-fbe7b798bb89	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESS_PUT
t	2025-03-17 21:13:11.872195+00	2025-03-17 21:13:11.8722+00	ff88e7e5-f596-4ec2-8328-2b1573eec48b	2f363ce3-e629-42d7-8bb2-7892307e0275	BRAND_POST
t	2025-03-17 21:13:11.878691+00	2025-03-17 21:13:11.878696+00	1d18c9b2-ee0f-47bc-a09c-e929eafe6d7d	2f363ce3-e629-42d7-8bb2-7892307e0275	BRAND_DELETE
t	2025-03-17 21:13:11.890095+00	2025-03-17 21:13:11.890103+00	ce0112dc-dbe7-49f5-9797-da047211929e	2f363ce3-e629-42d7-8bb2-7892307e0275	BRAND_GET
t	2025-03-17 21:13:11.899428+00	2025-03-17 21:13:11.899433+00	bfda5153-a0fc-404e-8a35-52832d35ddf5	2f363ce3-e629-42d7-8bb2-7892307e0275	BRAND_PUT
t	2025-03-17 21:13:11.905892+00	2025-03-17 21:13:11.905896+00	5b566369-4e9c-4b66-b840-600c604281d9	2f363ce3-e629-42d7-8bb2-7892307e0275	CANCELLATION_REASON_POST
t	2025-03-17 21:13:11.911651+00	2025-03-17 21:13:11.911655+00	72049c7c-90f1-45c7-99e0-5c80c376916a	2f363ce3-e629-42d7-8bb2-7892307e0275	CANCELLATION_REASON_GET
t	2025-03-17 21:13:11.916186+00	2025-03-17 21:13:11.916191+00	8be3ba8d-7d63-40c1-9821-c55941f56405	2f363ce3-e629-42d7-8bb2-7892307e0275	CANCELLATION_REASON_PUT
t	2025-03-17 21:13:11.921205+00	2025-03-17 21:13:11.921209+00	5cfda39f-4237-4009-beb4-ad0a30a6edd1	2f363ce3-e629-42d7-8bb2-7892307e0275	CANCELLED_ORDER_POST
t	2025-03-17 21:13:11.92642+00	2025-03-17 21:13:11.926423+00	4c5b95eb-a24b-4383-8d0c-28a7e8e346eb	2f363ce3-e629-42d7-8bb2-7892307e0275	CANCELLED_ORDER_GET
t	2025-03-17 21:13:11.931315+00	2025-03-17 21:13:11.931317+00	a994428f-7965-449b-983e-8df0095a7747	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORY_GET
t	2025-03-17 21:13:11.935055+00	2025-03-17 21:13:11.935057+00	2350800f-f9e0-4ba0-b32d-8849531aa0a3	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORY_POST
t	2025-03-17 21:13:11.939603+00	2025-03-17 21:13:11.939607+00	6fbba35a-2204-47bc-8a84-5a09628397e6	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORY_PUT
t	2025-03-17 21:13:11.944165+00	2025-03-17 21:13:11.944169+00	d8c240b4-8597-4a4c-ad70-eec4ccbe7e70	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORY_DELETE
t	2025-03-17 21:13:11.948862+00	2025-03-17 21:13:11.948866+00	a5cc0a79-5b80-48e0-89bd-0968569bdb37	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORY_PRODUCT_POST
t	2025-03-17 21:13:11.954018+00	2025-03-17 21:13:11.954022+00	6b208f24-758d-4bef-b6b8-8caf07fbba44	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORY_PRODUCT_GET
t	2025-03-17 21:13:11.958364+00	2025-03-17 21:13:11.958367+00	415c69a4-7743-43d5-8117-a4669ba51916	2f363ce3-e629-42d7-8bb2-7892307e0275	CLIENT_GET
t	2025-03-17 21:13:11.96223+00	2025-03-17 21:13:11.962234+00	f81055e8-3e96-429f-aac2-3c4e2f2dab38	2f363ce3-e629-42d7-8bb2-7892307e0275	CLIENT_POST
t	2025-03-17 21:13:11.965875+00	2025-03-17 21:13:11.965877+00	3fccde5b-72da-43b0-9f30-8bf23d3556a2	2f363ce3-e629-42d7-8bb2-7892307e0275	CLIENT_PUT
t	2025-03-17 21:13:11.969286+00	2025-03-17 21:13:11.969289+00	fc1d7ce9-5e51-4aba-a66c-fec03b9a795a	2f363ce3-e629-42d7-8bb2-7892307e0275	CLIENT_DELETE
t	2025-03-17 21:13:11.973507+00	2025-03-17 21:13:11.97351+00	19c1a0f3-a177-4cb7-b106-bb7481894429	2f363ce3-e629-42d7-8bb2-7892307e0275	CLOSING_CHANNEL_POST
t	2025-03-17 21:13:11.976542+00	2025-03-17 21:13:11.976546+00	bdeb0d7f-438a-4661-b17e-3f3727aa074b	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR_POST
t	2025-03-17 21:13:11.980163+00	2025-03-17 21:13:11.980165+00	f309d688-40ab-42ef-b603-0c3f2b9e2534	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR_GET
t	2025-03-17 21:13:11.983785+00	2025-03-17 21:13:11.983788+00	a04b75ea-9ded-4e92-8163-16cdc5d836c1	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR_DELETE
t	2025-03-17 21:13:11.989445+00	2025-03-17 21:13:11.98945+00	5f360384-8d52-41fe-92a9-c44876f83a70	2f363ce3-e629-42d7-8bb2-7892307e0275	COURIER_POST
t	2025-03-17 21:13:11.99441+00	2025-03-17 21:13:11.994413+00	a1d151b6-f402-4c26-a9ec-a868d09c76cb	2f363ce3-e629-42d7-8bb2-7892307e0275	COURIER_PUT
t	2025-03-17 21:13:11.998698+00	2025-03-17 21:13:11.998702+00	0fd5a006-5e1d-4bf5-880a-2ba6f170eece	2f363ce3-e629-42d7-8bb2-7892307e0275	COURIER_GET
t	2025-03-17 21:13:12.002416+00	2025-03-17 21:13:12.002419+00	9bafbfb1-20a1-4fe2-a56e-1bf42046f7df	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_COMPANY_GET
t	2025-03-17 21:13:12.00608+00	2025-03-17 21:13:12.006082+00	3f91eea3-7231-4f26-a208-c9a0cd2e8a1f	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_COMPANY_POST
t	2025-03-17 21:13:12.009597+00	2025-03-17 21:13:12.009599+00	9cb5f5ca-bb27-46a5-a8d3-e909ff05ca30	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_COMPANY_DELETE
t	2025-03-17 21:13:12.012867+00	2025-03-17 21:13:12.012869+00	02e24c4d-50d6-4878-818f-ecee0b633220	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_COMPANY_PUT
t	2025-03-17 21:13:12.016237+00	2025-03-17 21:13:12.01624+00	3d7265d1-096d-4c2c-bb11-cf5e354adabe	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_MANIFEST_STATUS_GET
t	2025-03-17 21:13:12.020005+00	2025-03-17 21:13:12.020008+00	052e1404-384c-4367-9770-23f65693f96c	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_MANIFEST_STATUS_POST
t	2025-03-17 21:13:12.022825+00	2025-03-17 21:13:12.022827+00	1d39ced1-ae2a-477a-a549-7aa036efb773	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_MANIFEST_STATUS_DELETE
t	2025-03-17 21:13:12.026029+00	2025-03-17 21:13:12.026032+00	f4968d3f-cbb7-428d-87d1-3a79443c6df5	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_MANIFEST_STATUS_PUT
t	2025-03-17 21:13:12.029326+00	2025-03-17 21:13:12.029328+00	69facf41-2bb5-49c6-bd34-0543b038982a	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_MANIFEST_ITEM_GET
t	2025-03-17 21:13:12.0333+00	2025-03-17 21:13:12.033304+00	555661dc-a7d9-498b-af06-e4d6c87b9d37	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_MANIFEST_ITEM_PUT
t	2025-03-17 21:13:12.037038+00	2025-03-17 21:13:12.037039+00	1bfebfa9-a244-4f6b-a6d2-0c30970a4d50	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_POINT_GET
t	2025-03-17 21:13:12.040746+00	2025-03-17 21:13:12.040749+00	1b4e77c8-5c15-4293-a0cd-e477e04d012b	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_POINT_POST
t	2025-03-17 21:13:12.044038+00	2025-03-17 21:13:12.04404+00	3b5613ac-c384-4e00-a205-2d47955ea72a	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_POINT_DELETE
t	2025-03-17 21:13:12.048039+00	2025-03-17 21:13:12.048043+00	49495739-62c7-4219-8a9a-346522848efa	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_POINT_PUT
t	2025-03-17 21:13:12.05142+00	2025-03-17 21:13:12.051423+00	a6406d8d-4b54-4136-a878-03442f750a6b	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_STATUS_GET
t	2025-03-17 21:13:12.054419+00	2025-03-17 21:13:12.054421+00	03d59595-bc3f-4e14-9803-e7351d1e4d84	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_STATUS_POST
t	2025-03-17 21:13:12.057771+00	2025-03-17 21:13:12.057772+00	b57ceb23-f09b-417e-a1ad-215237938d61	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_STATUS_DELETE
t	2025-03-17 21:13:12.061305+00	2025-03-17 21:13:12.061308+00	533a7162-da7e-4e3c-a83e-065ecc87ade8	2f363ce3-e629-42d7-8bb2-7892307e0275	DELIVERY_STATUS_PUT
t	2025-03-17 21:13:12.065311+00	2025-03-17 21:13:12.065315+00	54e5918b-6a85-4f8d-bfb4-dedd0ed71dfc	2f363ce3-e629-42d7-8bb2-7892307e0275	DEPARTMENT_GET
t	2025-03-17 21:13:12.06877+00	2025-03-17 21:13:12.068772+00	eb2e4996-07db-4a90-b9cc-70e21e19761a	2f363ce3-e629-42d7-8bb2-7892307e0275	DEPARTMENT_POST
t	2025-03-17 21:13:12.072206+00	2025-03-17 21:13:12.072209+00	b4a022ab-a7fd-486c-98c0-3dfc8b875643	2f363ce3-e629-42d7-8bb2-7892307e0275	DEPARTMENT_DELETE
t	2025-03-17 21:13:12.076092+00	2025-03-17 21:13:12.076094+00	f5ea9454-fc02-4fed-bd25-bc8a626631d5	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRICT_POST
t	2025-03-17 21:13:12.079657+00	2025-03-17 21:13:12.07966+00	7a6de0cd-d9aa-470d-8988-0a4c8c5cfa80	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRICT_DELETE
t	2025-03-17 21:13:12.082862+00	2025-03-17 21:13:12.082863+00	266e7a9a-1f3d-4910-98ba-e1cec47f77fe	2f363ce3-e629-42d7-8bb2-7892307e0275	ENTRY_CHANNEL_POST
t	2025-03-17 21:13:12.086819+00	2025-03-17 21:13:12.086821+00	f4038c9c-23dc-4ef2-a945-6d8d7512cfcf	2f363ce3-e629-42d7-8bb2-7892307e0275	GENERAL_STOCK_GET
t	2025-03-17 21:13:12.091228+00	2025-03-17 21:13:12.09123+00	952ecf88-cd79-4063-9d38-dd6f752c1347	2f363ce3-e629-42d7-8bb2-7892307e0275	MEMBERSHIP_GET
t	2025-03-17 21:13:12.095138+00	2025-03-17 21:13:12.09514+00	1dd5e8e6-68e6-4f61-8d2f-20a3cd60ab0e	2f363ce3-e629-42d7-8bb2-7892307e0275	MEMBERSHIP_PAYMENT_GET
t	2025-03-17 21:13:12.098359+00	2025-03-17 21:13:12.098362+00	50b3ec1b-d098-4ee1-874a-5a5869035330	2f363ce3-e629-42d7-8bb2-7892307e0275	MODEL_GET
t	2025-03-17 21:13:12.101674+00	2025-03-17 21:13:12.101677+00	f58ee37a-d5a0-47ea-9eb6-c71800b31981	2f363ce3-e629-42d7-8bb2-7892307e0275	MODEL_POST
t	2025-03-17 21:13:12.10516+00	2025-03-17 21:13:12.105162+00	50ffbccd-1b55-4173-81d8-cde143552f68	2f363ce3-e629-42d7-8bb2-7892307e0275	MODEL_DELETE
t	2025-03-17 21:13:12.108264+00	2025-03-17 21:13:12.108265+00	7bf2ec2f-3564-4aa5-b376-0162d7962999	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULE_GET
t	2025-03-17 21:13:12.111426+00	2025-03-17 21:13:12.111428+00	4051272a-a5b4-48ab-8289-73169b527e29	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULE_POST
t	2025-03-17 21:13:12.1143+00	2025-03-17 21:13:12.114303+00	8499c5f9-8958-4eb7-8d98-90346629b280	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULE_PUT
t	2025-03-17 21:13:12.117696+00	2025-03-17 21:13:12.117698+00	0b26240a-0946-4097-ad5c-321f07f1114f	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULE_DELETE
t	2025-03-17 21:13:12.121077+00	2025-03-17 21:13:12.12108+00	05c5e641-0ea8-41ea-8053-939d481ada73	2f363ce3-e629-42d7-8bb2-7892307e0275	ONBOARD_GET
t	2025-03-17 21:13:12.124691+00	2025-03-17 21:13:12.124693+00	3fa140b3-6a33-414b-b0e2-24b1d723f249	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_GET
t	2025-03-17 21:13:12.128095+00	2025-03-17 21:13:12.128097+00	60645611-8eeb-460f-a857-3cad16efe52a	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_POST
t	2025-03-17 21:13:12.131644+00	2025-03-17 21:13:12.131648+00	fe4adf52-0f80-417d-b44c-e76aa909f649	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_PUT
t	2025-03-17 21:13:12.13577+00	2025-03-17 21:13:12.135772+00	64b018d3-e3a8-4397-a8de-2d40af3907a9	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_CONTACTED_GET
t	2025-03-17 21:13:12.13973+00	2025-03-17 21:13:12.139734+00	f38f921f-1399-472d-ab89-b5c4c715dbe0	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_CONTACTED_PUT
t	2025-03-17 21:13:12.144274+00	2025-03-17 21:13:12.144278+00	1beab9c0-4c9e-4a0e-a27b-6f12baeed3e0	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_ITEM_GET
t	2025-03-17 21:13:12.148802+00	2025-03-17 21:13:12.148804+00	3328f2c6-9777-45ab-a817-0be8443b1f49	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_ITEM_POST
t	2025-03-17 21:13:12.152807+00	2025-03-17 21:13:12.15281+00	2b2d7271-b355-44bd-a418-b9fc534ab810	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_ITEM_DELETE
t	2025-03-17 21:13:12.156451+00	2025-03-17 21:13:12.156454+00	f7a88c1c-80a7-4946-a448-509c6b117e80	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_ITEM_PUT
t	2025-03-17 21:13:12.160328+00	2025-03-17 21:13:12.16033+00	e96d75ce-5f3f-4d9a-84d8-71abc9c60b05	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_STOCK_GET
t	2025-03-17 21:13:12.164499+00	2025-03-17 21:13:12.164502+00	5a228b93-3edb-4c79-a36d-98b767fa8c99	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_STOCK_POST
t	2025-03-17 21:13:12.168095+00	2025-03-17 21:13:12.168098+00	bed16da8-3a44-47d8-868f-e5412af291b0	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_STOCK_ITEM_GET
t	2025-03-17 21:13:12.171765+00	2025-03-17 21:13:12.171766+00	9582a25f-7006-4d58-aad6-bb10a898e401	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_PAYMENT_METHOD_POST
t	2025-03-17 21:13:12.176187+00	2025-03-17 21:13:12.176189+00	8b3cdb4a-0c8c-45d6-b0bd-24fff9400fb9	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_PAYMENT_METHOD_GET
t	2025-03-17 21:13:12.179518+00	2025-03-17 21:13:12.179521+00	44ecd45f-ae3d-410c-ac9b-2b1aa8807858	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_PAYMENT_METHOD_DELETE
t	2025-03-17 21:13:12.182583+00	2025-03-17 21:13:12.182584+00	0ef60bf5-29e3-48c1-be5a-2cdaa130972b	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_PAYMENT_STATE_GET
t	2025-03-17 21:13:12.185347+00	2025-03-17 21:13:12.185348+00	f0e619fd-87dc-40e1-a9e6-45dfdd76be85	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_PAYMENT_STATE_POST
t	2025-03-17 21:13:12.189153+00	2025-03-17 21:13:12.189159+00	ee2c3c3b-7b7b-4861-8c74-057b9779d80f	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_PAYMENT_STATE_DELETE
t	2025-03-17 21:13:12.193917+00	2025-03-17 21:13:12.193919+00	1b8ad6cd-131c-4b14-9af1-1b68ea36a427	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_STATE_GET
t	2025-03-17 21:13:12.198068+00	2025-03-17 21:13:12.198071+00	a0a7986e-8961-471c-83a5-a14abe0e451b	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_STATE_POST
t	2025-03-17 21:13:12.201759+00	2025-03-17 21:13:12.20176+00	b3aa231b-8b95-453e-93b6-f405f3550e42	2f363ce3-e629-42d7-8bb2-7892307e0275	ORDER_STATE_DELETE
t	2025-03-17 21:13:12.205482+00	2025-03-17 21:13:12.205485+00	3d6ab119-5dfa-4bdf-9a94-6512572f9161	2f363ce3-e629-42d7-8bb2-7892307e0275	PAYMENT_GATEWAY_POST
t	2025-03-17 21:13:12.209295+00	2025-03-17 21:13:12.209297+00	44e615aa-e64f-4b3d-99b1-d9f34dce53ad	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCT_GET
t	2025-03-17 21:13:12.21244+00	2025-03-17 21:13:12.212442+00	0ddfe2d7-97da-4c70-85b9-b5e670a1a76a	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCT_POST
t	2025-03-17 21:13:12.215728+00	2025-03-17 21:13:12.215729+00	ac0ef897-669f-43cd-8abe-7123f4823d8f	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCT_DELETE
t	2025-03-17 21:13:12.218802+00	2025-03-17 21:13:12.218803+00	6291da30-c163-40a5-8a39-f21afbbe2e7c	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCT_PRICE_POST
t	2025-03-17 21:13:12.222302+00	2025-03-17 21:13:12.222306+00	d35a6035-9f25-48cf-bca3-51f1682f85dc	2f363ce3-e629-42d7-8bb2-7892307e0275	PROVINCE_GET
t	2025-03-17 21:13:12.225295+00	2025-03-17 21:13:12.225298+00	567fb564-ce96-4231-9bb3-2d1c58c03d57	2f363ce3-e629-42d7-8bb2-7892307e0275	PROVINCE_POST
t	2025-03-17 21:13:12.228666+00	2025-03-17 21:13:12.228669+00	c5576e20-7b2e-4a07-ab50-91d5c9119b77	2f363ce3-e629-42d7-8bb2-7892307e0275	PROVINCE_DELETE
t	2025-03-17 21:13:12.23208+00	2025-03-17 21:13:12.232082+00	88a062f7-94fe-4eb3-8c0a-87ab1d2d96b1	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_GET
t	2025-03-17 21:13:12.235336+00	2025-03-17 21:13:12.23534+00	be8e61b8-4b62-4982-bb0c-d465cddc5902	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_POST
t	2025-03-17 21:13:12.238538+00	2025-03-17 21:13:12.238541+00	943641f5-e5cf-4f0f-be11-15058f0a7799	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_DOCUMENT_POST
t	2025-03-17 21:13:12.242314+00	2025-03-17 21:13:12.242317+00	237dbbd2-34a5-4583-b565-a42a93967c95	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_DOCUMENT_DELETE
t	2025-03-17 21:13:12.246433+00	2025-03-17 21:13:12.246436+00	22a62606-3186-4c62-88aa-a360bd1c94b9	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_DOCUMENT_GET
t	2025-03-17 21:13:12.25046+00	2025-03-17 21:13:12.250463+00	c777f82f-e995-49a2-b3b5-189e32842951	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_ITEM_GET
t	2025-03-17 21:13:12.254141+00	2025-03-17 21:13:12.254144+00	5efa854e-3335-491a-a4dc-ca98008a464e	2f363ce3-e629-42d7-8bb2-7892307e0275	ROLE_POST
t	2025-03-17 21:13:12.257946+00	2025-03-17 21:13:12.257949+00	7282d913-2667-44f5-a238-6eaa2f8d96db	2f363ce3-e629-42d7-8bb2-7892307e0275	ROLE_GET
t	2025-03-17 21:13:12.261585+00	2025-03-17 21:13:12.261588+00	de0515e7-3d09-4d79-99d1-18bf1166acc9	2f363ce3-e629-42d7-8bb2-7892307e0275	ROLE_DELETE
t	2025-03-17 21:13:12.265145+00	2025-03-17 21:13:12.265148+00	2abc444c-077d-4a48-9d45-7b0fe45e85fe	2f363ce3-e629-42d7-8bb2-7892307e0275	ROLE_PUT
t	2025-03-17 21:13:12.269116+00	2025-03-17 21:13:12.269119+00	7fecba35-ea6b-4e05-b031-cb0c3b22173c	2f363ce3-e629-42d7-8bb2-7892307e0275	ROLE_ACCESS_GET
t	2025-03-17 21:13:12.272918+00	2025-03-17 21:13:12.272921+00	faa6699a-9745-42f5-817c-4dc2e02deb01	2f363ce3-e629-42d7-8bb2-7892307e0275	ROLE_ACCESS_POST
t	2025-03-17 21:13:12.277064+00	2025-03-17 21:13:12.277066+00	b1d07269-1e1e-434b-a41e-ba3e7feffc1d	2f363ce3-e629-42d7-8bb2-7892307e0275	ROLE_ACCESS_PUT
t	2025-03-17 21:13:12.280562+00	2025-03-17 21:13:12.280564+00	19513df4-2496-469e-9699-3d47e46dad38	2f363ce3-e629-42d7-8bb2-7892307e0275	ROLE_ACCESS_DELETE
t	2025-03-17 21:13:12.28463+00	2025-03-17 21:13:12.284634+00	6a813cf6-e958-440d-aaa1-ff8d64522bc4	2f363ce3-e629-42d7-8bb2-7892307e0275	SALE_CHANNEL_POST
t	2025-03-17 21:13:12.288567+00	2025-03-17 21:13:12.28857+00	5ea84102-6420-4f79-994a-e388e99ce0d7	2f363ce3-e629-42d7-8bb2-7892307e0275	SALE_CHANNEL_DELETE
t	2025-03-17 21:13:12.292278+00	2025-03-17 21:13:12.29228+00	e4f05e3d-d3d4-4d13-981c-65cce8107d83	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_TYPE_POST
t	2025-03-17 21:13:12.296069+00	2025-03-17 21:13:12.296071+00	432d20d5-8e24-4725-85a5-c429ca8f35e7	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_TYPE_GET
t	2025-03-17 21:13:12.300199+00	2025-03-17 21:13:12.300202+00	b567116b-dfac-43a5-80d0-d0495075ea2a	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_PAYMENT_TYPE_GET
t	2025-03-17 21:13:12.303939+00	2025-03-17 21:13:12.30394+00	cdc4c0cd-84b1-4818-b147-d36e9fa5d663	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_PAYMENT_TYPE_POST
t	2025-03-17 21:13:12.307591+00	2025-03-17 21:13:12.307594+00	e950d598-ff71-4a71-85dc-d6a4c384b7e3	2f363ce3-e629-42d7-8bb2-7892307e0275	PURCHASE_PAYMENT_TYPE_PUT
t	2025-03-17 21:13:12.310529+00	2025-03-17 21:13:12.310531+00	f28a2287-4426-4da8-a3d4-9a12d299681d	2f363ce3-e629-42d7-8bb2-7892307e0275	SIZE_GET
t	2025-03-17 21:13:12.31406+00	2025-03-17 21:13:12.314061+00	b788a4df-1a70-4ed4-a3f5-c4fc57420eab	2f363ce3-e629-42d7-8bb2-7892307e0275	SIZE_POST
t	2025-03-17 21:13:12.317357+00	2025-03-17 21:13:12.31736+00	0630d457-23dc-4a09-ace0-1dfb4cae8548	2f363ce3-e629-42d7-8bb2-7892307e0275	SIZE_DELETE
t	2025-03-17 21:13:12.320743+00	2025-03-17 21:13:12.320745+00	ac5f8671-350a-4c2d-9558-b183364c0b2c	2f363ce3-e629-42d7-8bb2-7892307e0275	SIZE_TYPE_GET
t	2025-03-17 21:13:12.324686+00	2025-03-17 21:13:12.324689+00	fdcc4524-a04b-400f-a072-c38a9098aed1	2f363ce3-e629-42d7-8bb2-7892307e0275	SIZE_TYPE_POST
t	2025-03-17 21:13:12.32819+00	2025-03-17 21:13:12.328192+00	45a66b55-6cc6-4821-b617-c4c091382f69	2f363ce3-e629-42d7-8bb2-7892307e0275	SIZE_TYPE_DELETE
t	2025-03-17 21:13:12.331212+00	2025-03-17 21:13:12.331213+00	a6c8d911-87ad-41c4-93fb-06c22e699390	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_REPLENISHMENT_POST
t	2025-03-17 21:13:12.334637+00	2025-03-17 21:13:12.33464+00	b22ddf1a-7443-4c3c-acfe-de980e805090	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_REPLENISHMENT_GET
t	2025-03-17 21:13:12.338152+00	2025-03-17 21:13:12.338153+00	571b3108-bede-4c44-86bd-451c6ed6c6bf	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_REPLENISHMENT_ITEM_GET
t	2025-03-17 21:13:12.341472+00	2025-03-17 21:13:12.341475+00	ecc66b66-6a58-47b9-9fde-2c6318791317	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_RETURN_POST
t	2025-03-17 21:13:12.345512+00	2025-03-17 21:13:12.345516+00	fcd032fb-1afb-4c35-91ea-4a14bb34005b	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_RETURN_GET
t	2025-03-17 21:13:12.349176+00	2025-03-17 21:13:12.349178+00	1f831ce3-6f6c-4c5f-9552-4dc43c87e1e2	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_RETURN_ITEM_GET
t	2025-03-17 21:13:12.352901+00	2025-03-17 21:13:12.352904+00	dd82921f-75a7-4b67-b4be-622eeff76c2f	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_TRANSACTION_GET
t	2025-03-17 21:13:12.357457+00	2025-03-17 21:13:12.35746+00	33a71750-5100-41e7-a762-fdaade16192e	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_TRANSACTION_ITEM_GET
t	2025-03-17 21:13:12.361469+00	2025-03-17 21:13:12.361471+00	2a88d740-67aa-4a6d-8503-511eaa9bef74	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_TRANSACTION_TYPE_GET
t	2025-03-17 21:13:12.364691+00	2025-03-17 21:13:12.364693+00	ac501720-c960-49f1-bde6-3017eddb5bef	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_TRANSACTION_TYPE_POST
t	2025-03-17 21:13:12.368044+00	2025-03-17 21:13:12.368048+00	d7a7f08d-35bd-4afa-bd6c-fed54f967566	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_TRANSACTION_TYPE_DELETE
t	2025-03-17 21:13:12.372397+00	2025-03-17 21:13:12.372399+00	5ded71d3-1239-4aa2-a093-9da66ce8afaf	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_TRANSFER_POST
t	2025-03-17 21:13:12.376614+00	2025-03-17 21:13:12.376618+00	e09335e3-5689-4645-83ec-3509cb6d5454	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_TRANSFER_GET
t	2025-03-17 21:13:12.380611+00	2025-03-17 21:13:12.380613+00	b1660d31-fb50-4a74-ae8d-a16d7e97d7b2	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK_TRANSFER_ITEM_GET
t	2025-03-17 21:13:12.383917+00	2025-03-17 21:13:12.38392+00	b4f3c9b0-1d9f-4e7c-b0e0-b925359426bf	2f363ce3-e629-42d7-8bb2-7892307e0275	STORE_GET
t	2025-03-17 21:13:12.387477+00	2025-03-17 21:13:12.38748+00	761606db-1d96-4dd6-b90b-2a6176c25b53	2f363ce3-e629-42d7-8bb2-7892307e0275	STORE_POST
t	2025-03-17 21:13:12.391367+00	2025-03-17 21:13:12.39137+00	c6afa4b7-f91d-41d8-aebb-d29d3f969187	2f363ce3-e629-42d7-8bb2-7892307e0275	STORE_PUT
t	2025-03-17 21:13:12.395031+00	2025-03-17 21:13:12.395034+00	743d21b3-4ef5-489b-a838-c86066c6222e	2f363ce3-e629-42d7-8bb2-7892307e0275	STORE_DELETE
t	2025-03-17 21:13:12.399543+00	2025-03-17 21:13:12.399546+00	e18c682a-204c-4cdf-99e3-14689a077384	2f363ce3-e629-42d7-8bb2-7892307e0275	STORE_TYPE_POST
t	2025-03-17 21:13:12.40434+00	2025-03-17 21:13:12.404342+00	198efb33-8a9e-45b0-b479-b8a2e0b61b20	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB_CATEGORY_PRODUCT_GET
t	2025-03-17 21:13:12.408031+00	2025-03-17 21:13:12.408033+00	8ed7efa7-e443-4367-b3eb-af2d5c1ab5aa	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB_CATEGORY_PRODUCT_POST
t	2025-03-17 21:13:12.41172+00	2025-03-17 21:13:12.411722+00	65e9250c-6c72-461e-9e51-7f2b4b077fea	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB_CATEGORY_PRODUCT_DELETE
t	2025-03-17 21:13:12.414502+00	2025-03-17 21:13:12.414503+00	092770fc-9617-4c23-9c89-c9434b446897	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB_CATEGORY_PRODUCT_PUT
t	2025-03-17 21:13:12.417612+00	2025-03-17 21:13:12.417613+00	296061f5-a213-4b82-af9b-112622d2c0c9	2f363ce3-e629-42d7-8bb2-7892307e0275	SUBSCRIPTION_GET
t	2025-03-17 21:13:12.420816+00	2025-03-17 21:13:12.420819+00	0492cd07-a2cf-4f14-8573-5958bc2f728a	2f363ce3-e629-42d7-8bb2-7892307e0275	SUBSCRIPTION_POST
t	2025-03-17 21:13:12.424617+00	2025-03-17 21:13:12.42462+00	a67aeac2-fa9e-4c12-bbd8-415aca17b70c	2f363ce3-e629-42d7-8bb2-7892307e0275	SUBSCRIPTION_PAYMENT_POST
t	2025-03-17 21:13:12.427679+00	2025-03-17 21:13:12.427681+00	bbc2eff9-cc73-4d97-b903-f4ba91b23e0b	2f363ce3-e629-42d7-8bb2-7892307e0275	SUPPLIER_GET
t	2025-03-17 21:13:12.432161+00	2025-03-17 21:13:12.432164+00	648761ed-590d-4a17-9e24-d8f424e51c69	2f363ce3-e629-42d7-8bb2-7892307e0275	SUPPLIER_POST
t	2025-03-17 21:13:12.43563+00	2025-03-17 21:13:12.435633+00	15f1ec79-87d0-434d-8aca-5d8ab0e88d32	2f363ce3-e629-42d7-8bb2-7892307e0275	SUPPLIER_DELETE
t	2025-03-17 21:13:12.438651+00	2025-03-17 21:13:12.438653+00	edf8e6ca-95b2-4602-aa73-e20a028395ff	2f363ce3-e629-42d7-8bb2-7892307e0275	SUPPLIER_PRODUCT_GET
t	2025-03-17 21:13:12.442383+00	2025-03-17 21:13:12.442385+00	43b43743-04a5-4891-a0ba-b6d00d902e94	2f363ce3-e629-42d7-8bb2-7892307e0275	SUPPLIER_PRODUCT_POST
t	2025-03-17 21:13:12.446255+00	2025-03-17 21:13:12.446258+00	8d46cb6e-b2c1-49d2-bf5b-3d27e94d3808	2f363ce3-e629-42d7-8bb2-7892307e0275	SUPPLIER_PRODUCT_DELETE
t	2025-03-17 21:13:12.45059+00	2025-03-17 21:13:12.450591+00	13f44645-6a7d-4fc0-b281-81867ac78c40	2f363ce3-e629-42d7-8bb2-7892307e0275	UNIT_GET
t	2025-03-17 21:13:12.454457+00	2025-03-17 21:13:12.454458+00	977bc8c3-3ad4-4ac3-a989-f9bf8b196b0c	2f363ce3-e629-42d7-8bb2-7892307e0275	UNIT_POST
t	2025-03-17 21:13:12.457506+00	2025-03-17 21:13:12.457508+00	e8c4a703-b6ff-491c-b1ad-585ffb04e063	2f363ce3-e629-42d7-8bb2-7892307e0275	UNIT_DELETE
t	2025-03-17 21:13:12.460475+00	2025-03-17 21:13:12.460476+00	1d3f4c38-0022-4118-9d33-caf953b55c07	2f363ce3-e629-42d7-8bb2-7892307e0275	UNIT_TYPE_GET
t	2025-03-17 21:13:12.463882+00	2025-03-17 21:13:12.463884+00	623894be-838a-4f8a-b68f-f0ea222db862	2f363ce3-e629-42d7-8bb2-7892307e0275	UNIT_TYPE_POST
t	2025-03-17 21:13:12.46664+00	2025-03-17 21:13:12.466641+00	13ca538e-b633-4cb2-b267-da1457874d4d	2f363ce3-e629-42d7-8bb2-7892307e0275	UNIT_TYPE_DELETE
t	2025-03-17 21:13:12.469635+00	2025-03-17 21:13:12.469637+00	a909f9db-f0f5-4e8b-94bf-157f65a87cd1	2f363ce3-e629-42d7-8bb2-7892307e0275	USER_POST
t	2025-03-17 21:13:12.472569+00	2025-03-17 21:13:12.472573+00	2fdaed97-6249-4829-9d0f-a82218d3fb05	2f363ce3-e629-42d7-8bb2-7892307e0275	USER_PUT
t	2025-03-17 21:13:12.475657+00	2025-03-17 21:13:12.475658+00	6af6fbb0-2967-458a-a6fb-7a0a1df4aae6	2f363ce3-e629-42d7-8bb2-7892307e0275	USER_DELETE
t	2025-03-17 21:13:12.478828+00	2025-03-17 21:13:12.478831+00	5118ba64-f2d8-4db5-b24f-712dad9b6c7a	2f363ce3-e629-42d7-8bb2-7892307e0275	USER_ROLE_POST
t	2025-03-17 21:13:12.483357+00	2025-03-17 21:13:12.48336+00	cf130dee-2331-4adf-942b-1f6b7e316604	2f363ce3-e629-42d7-8bb2-7892307e0275	WAREHOUSE_GET
t	2025-03-17 21:13:12.48773+00	2025-03-17 21:13:12.487733+00	ecd5f308-2d97-4b92-b898-1d497b4bdfd9	2f363ce3-e629-42d7-8bb2-7892307e0275	WAREHOUSE_POST
t	2025-03-17 21:13:12.491296+00	2025-03-17 21:13:12.491299+00	b6ed4e45-c958-4fb4-9fbf-21814b79357c	2f363ce3-e629-42d7-8bb2-7892307e0275	WAREHOUSE_STOCK_GET
t	2025-03-17 21:13:12.495165+00	2025-03-17 21:13:12.495168+00	bc25d098-7452-4734-804d-5c1fd85c95be	2f363ce3-e629-42d7-8bb2-7892307e0275	WAREHOUSE_OUTPUT_GET
t	2025-03-17 21:13:12.498756+00	2025-03-17 21:13:12.498759+00	cd22c913-9675-4726-b68d-6b3fceb58935	2f363ce3-e629-42d7-8bb2-7892307e0275	WAREHOUSE_OUTPUT_POST
t	2025-03-17 21:13:12.50268+00	2025-03-17 21:13:12.502682+00	58501cd5-294b-4c26-a570-d69ad39851e7	2f363ce3-e629-42d7-8bb2-7892307e0275	WAREHOUSE_OUTPUT_DELETE
\.


--
-- Data for Name: audit; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.audit (registration_date, audit_event_id, audit_id, client_id, user_id, detail, reference) FROM stdin;
2025-03-17 21:13:11.856133+00	6405f252-eb4e-45ce-8914-e04787d9986c	6f719d6b-3ad5-44a4-ae09-19e3df780c8e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ACCESS_POSTCREADO .	NO APLICA
2025-03-17 21:13:11.869108+00	6405f252-eb4e-45ce-8914-e04787d9986c	15ddf352-57d6-403d-a198-dd84b2fdd9f4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ACCESS_GETCREADO .	NO APLICA
2025-03-17 21:13:11.869108+00	6405f252-eb4e-45ce-8914-e04787d9986c	c94a2ee9-ae04-4ea4-9c29-2697ae07cd5c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ACCESS_DELETECREADO .	NO APLICA
2025-03-17 21:13:11.882751+00	6405f252-eb4e-45ce-8914-e04787d9986c	8fcad68d-afbf-4128-a9bc-db59a338d5ad	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO BRAND_POSTCREADO .	NO APLICA
2025-03-17 21:13:11.890212+00	6405f252-eb4e-45ce-8914-e04787d9986c	8ac08b69-69ab-4218-9f48-f4958d0fbb0c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ACCESS_PUTCREADO .	NO APLICA
2025-03-17 21:13:11.896078+00	6405f252-eb4e-45ce-8914-e04787d9986c	c2c858a5-beea-4cb2-8060-0b5d21c780db	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO BRAND_DELETECREADO .	NO APLICA
2025-03-17 21:13:11.903677+00	6405f252-eb4e-45ce-8914-e04787d9986c	f0f9b28f-a59b-435d-a0c4-6a2ae055bcfe	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO BRAND_GETCREADO .	NO APLICA
2025-03-17 21:13:11.909433+00	6405f252-eb4e-45ce-8914-e04787d9986c	0c5acd4c-093c-483e-a2da-29a82b4fae1e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO BRAND_PUTCREADO .	NO APLICA
2025-03-17 21:13:11.913902+00	6405f252-eb4e-45ce-8914-e04787d9986c	44f57c06-da52-4329-a7cc-62865a451bf4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CANCELLATION_REASON_POSTCREADO .	NO APLICA
2025-03-17 21:13:11.919255+00	6405f252-eb4e-45ce-8914-e04787d9986c	571b3781-db2c-4a4f-81d6-4d607dfbe656	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CANCELLATION_REASON_GETCREADO .	NO APLICA
2025-03-17 21:13:11.92293+00	6405f252-eb4e-45ce-8914-e04787d9986c	c7067d77-017e-40a2-9ada-9c02a5d8d48e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CANCELLATION_REASON_PUTCREADO .	NO APLICA
2025-03-17 21:13:11.928165+00	6405f252-eb4e-45ce-8914-e04787d9986c	2425ec63-538e-4c69-8a3e-2051cab7dd6c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CANCELLED_ORDER_POSTCREADO .	NO APLICA
2025-03-17 21:13:11.932206+00	6405f252-eb4e-45ce-8914-e04787d9986c	a93db0bd-3ad1-4b90-b070-7c07dbf82253	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CANCELLED_ORDER_GETCREADO .	NO APLICA
2025-03-17 21:13:11.937041+00	6405f252-eb4e-45ce-8914-e04787d9986c	562def29-ddc9-4544-a160-1dec1d31b82a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CATEGORY_GETCREADO .	NO APLICA
2025-03-17 21:13:11.941334+00	6405f252-eb4e-45ce-8914-e04787d9986c	18a71853-3a56-4764-9e87-e44072b2878d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CATEGORY_POSTCREADO .	NO APLICA
2025-03-17 21:13:11.945768+00	6405f252-eb4e-45ce-8914-e04787d9986c	83a73f70-9523-4f32-8363-8a453783af05	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CATEGORY_PUTCREADO .	NO APLICA
2025-03-17 21:13:11.951106+00	6405f252-eb4e-45ce-8914-e04787d9986c	793a4592-817d-4f72-b6d6-e11044b39ca4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CATEGORY_DELETECREADO .	NO APLICA
2025-03-17 21:13:11.955783+00	6405f252-eb4e-45ce-8914-e04787d9986c	35d61576-9fd1-48b4-bcab-2b6dc57121a3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CATEGORY_PRODUCT_POSTCREADO .	NO APLICA
2025-03-17 21:13:11.95959+00	6405f252-eb4e-45ce-8914-e04787d9986c	7e833f1d-e87c-460f-8fdd-855f6eedf3d2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CATEGORY_PRODUCT_GETCREADO .	NO APLICA
2025-03-17 21:13:11.963848+00	6405f252-eb4e-45ce-8914-e04787d9986c	76f0845f-07bd-467a-869d-18348d61e209	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CLIENT_GETCREADO .	NO APLICA
2025-03-17 21:13:11.966317+00	6405f252-eb4e-45ce-8914-e04787d9986c	649ee524-5a62-428e-bb2b-354c312efc46	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CLIENT_POSTCREADO .	NO APLICA
2025-03-17 21:13:11.971461+00	6405f252-eb4e-45ce-8914-e04787d9986c	5f8efbae-268d-445f-9576-d4cf08085de3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CLIENT_PUTCREADO .	NO APLICA
2025-03-17 21:13:11.973707+00	6405f252-eb4e-45ce-8914-e04787d9986c	7d87dc43-1fa5-4f5f-96c4-0928ed8a9123	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CLIENT_DELETECREADO .	NO APLICA
2025-03-17 21:13:11.977799+00	6405f252-eb4e-45ce-8914-e04787d9986c	51b4ba01-d475-4c72-82f3-f925f468aa7c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO CLOSING_CHANNEL_POSTCREADO .	NO APLICA
2025-03-17 21:13:11.980762+00	6405f252-eb4e-45ce-8914-e04787d9986c	e67474bd-fb2d-4199-9e88-9ad10375cb6b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO COLOR_POSTCREADO .	NO APLICA
2025-03-17 21:13:11.985827+00	6405f252-eb4e-45ce-8914-e04787d9986c	4df8762f-1cba-4c4f-ad7d-d03e5dad9a87	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO COLOR_GETCREADO .	NO APLICA
2025-03-17 21:13:11.99007+00	6405f252-eb4e-45ce-8914-e04787d9986c	e8310373-4b48-479d-a362-380e9e88e2ef	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO COLOR_DELETECREADO .	NO APLICA
2025-03-17 21:13:11.995763+00	6405f252-eb4e-45ce-8914-e04787d9986c	e0c3ccdb-e15e-4db1-8984-7e5deadb9fcb	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO COURIER_POSTCREADO .	NO APLICA
2025-03-17 21:13:11.999142+00	6405f252-eb4e-45ce-8914-e04787d9986c	5cdf4771-5607-461c-9688-d76b15efa194	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO COURIER_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.003819+00	6405f252-eb4e-45ce-8914-e04787d9986c	40cd6b79-318e-451c-9beb-bf9f40090b29	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO COURIER_GETCREADO .	NO APLICA
2025-03-17 21:13:12.006493+00	6405f252-eb4e-45ce-8914-e04787d9986c	d7ac7604-31eb-4e9a-849b-36136ceb50a4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_COMPANY_GETCREADO .	NO APLICA
2025-03-17 21:13:12.010012+00	6405f252-eb4e-45ce-8914-e04787d9986c	749859b6-6a3f-4084-b2f7-738348e01117	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_COMPANY_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.013182+00	6405f252-eb4e-45ce-8914-e04787d9986c	3a388203-16a4-4200-b902-6cf36fba1bf5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_COMPANY_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.016659+00	6405f252-eb4e-45ce-8914-e04787d9986c	d9a57546-d731-4d8c-a81a-6c29e6ed7e79	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_COMPANY_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.020528+00	6405f252-eb4e-45ce-8914-e04787d9986c	e5c07980-426d-4076-aeb5-0f869fdb0586	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_MANIFEST_STATUS_GETCREADO .	NO APLICA
2025-03-17 21:13:12.02335+00	6405f252-eb4e-45ce-8914-e04787d9986c	510dae61-d52c-4943-aaa1-f8d4f71e2035	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_MANIFEST_STATUS_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.026338+00	6405f252-eb4e-45ce-8914-e04787d9986c	42ab263a-ac97-4d7d-8e0b-94632d28f7ff	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_MANIFEST_STATUS_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.029844+00	6405f252-eb4e-45ce-8914-e04787d9986c	6aa2bbe4-0149-4d56-8d57-3ea4033b7218	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_MANIFEST_STATUS_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.033886+00	6405f252-eb4e-45ce-8914-e04787d9986c	b04a4212-56eb-4107-bcf8-c787ad351c76	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_MANIFEST_ITEM_GETCREADO .	NO APLICA
2025-03-17 21:13:12.037402+00	6405f252-eb4e-45ce-8914-e04787d9986c	a208bc3e-5db0-4434-bf38-519eb8b71b5d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_MANIFEST_ITEM_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.041128+00	6405f252-eb4e-45ce-8914-e04787d9986c	8e5a0f81-f5cf-4da5-8726-679eb78d9a7f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_POINT_GETCREADO .	NO APLICA
2025-03-17 21:13:12.044421+00	6405f252-eb4e-45ce-8914-e04787d9986c	08619902-3152-44e6-b41c-0c281540a9bb	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_POINT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.048426+00	6405f252-eb4e-45ce-8914-e04787d9986c	a34d5b9e-cf59-44aa-a677-cd54d04751d8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_POINT_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.051758+00	6405f252-eb4e-45ce-8914-e04787d9986c	8795838f-8334-423e-b93d-db76ac786540	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_POINT_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.054954+00	6405f252-eb4e-45ce-8914-e04787d9986c	e8e4827e-a3fc-452c-9709-b2162b878e56	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_STATUS_GETCREADO .	NO APLICA
2025-03-17 21:13:12.05808+00	6405f252-eb4e-45ce-8914-e04787d9986c	fedfd13e-e8fe-41f4-8bf1-eaca35820cd9	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_STATUS_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.061581+00	6405f252-eb4e-45ce-8914-e04787d9986c	7c730e67-9271-40ae-bf6a-4acfb82b3b4b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_STATUS_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.065875+00	6405f252-eb4e-45ce-8914-e04787d9986c	846feb02-06b9-4d96-afd8-678a1f752059	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DELIVERY_STATUS_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.069186+00	6405f252-eb4e-45ce-8914-e04787d9986c	d95bd62d-46c4-4020-a5bb-effa1d983337	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DEPARTMENT_GETCREADO .	NO APLICA
2025-03-17 21:13:12.072544+00	6405f252-eb4e-45ce-8914-e04787d9986c	2be6759c-80cd-4d93-9a1c-e28c13e8deb1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DEPARTMENT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.076381+00	6405f252-eb4e-45ce-8914-e04787d9986c	5a9d1944-905b-43ef-a647-d4886c0d43d3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DEPARTMENT_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.080044+00	6405f252-eb4e-45ce-8914-e04787d9986c	d2e6bfab-328b-410a-bc19-030ff7fdbced	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DISTRICT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.083389+00	6405f252-eb4e-45ce-8914-e04787d9986c	93d54856-c8e1-47c7-a801-a0adc7f2a62c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO DISTRICT_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.087308+00	6405f252-eb4e-45ce-8914-e04787d9986c	573be6e0-b996-4cfe-b061-6c7a7b0c9ccf	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ENTRY_CHANNEL_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.091561+00	6405f252-eb4e-45ce-8914-e04787d9986c	ce961a88-d7c4-44c6-a9fe-68991135fb6c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO GENERAL_STOCK_GETCREADO .	NO APLICA
2025-03-17 21:13:12.095675+00	6405f252-eb4e-45ce-8914-e04787d9986c	0c485e53-26b4-4ae7-829a-83cf780667fa	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO MEMBERSHIP_GETCREADO .	NO APLICA
2025-03-17 21:13:12.101832+00	6405f252-eb4e-45ce-8914-e04787d9986c	6967c3a1-0c86-494d-b05a-3c763b5a1d28	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO MODEL_GETCREADO .	NO APLICA
2025-03-17 21:13:12.108604+00	6405f252-eb4e-45ce-8914-e04787d9986c	4c30b845-0e29-41ee-a48d-a57b3e9120d5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO MODEL_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.114418+00	6405f252-eb4e-45ce-8914-e04787d9986c	069a26e0-6a13-4c39-aadd-63987cc88441	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO MODULE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.121385+00	6405f252-eb4e-45ce-8914-e04787d9986c	dac2f6ce-b76f-4f75-96af-b2ee5f78246d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO MODULE_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.128512+00	6405f252-eb4e-45ce-8914-e04787d9986c	b09dbfa9-0c6f-444a-af47-1645c9b4106f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_GETCREADO .	NO APLICA
2025-03-17 21:13:12.13636+00	6405f252-eb4e-45ce-8914-e04787d9986c	70044ce6-3c3d-49db-98c2-0e79bb4a3151	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.144509+00	6405f252-eb4e-45ce-8914-e04787d9986c	8336b2a4-5884-481e-a167-e19a7ddae5b0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_CONTACTED_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.153279+00	6405f252-eb4e-45ce-8914-e04787d9986c	ddcea64b-d4be-474a-bf29-5e2888ad17e9	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_ITEM_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.160742+00	6405f252-eb4e-45ce-8914-e04787d9986c	8004756a-67cc-4d1e-b434-91fcac5b0523	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_ITEM_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.168418+00	6405f252-eb4e-45ce-8914-e04787d9986c	35135e55-7693-4330-8513-522af5a3c7f5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_STOCK_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.179659+00	6405f252-eb4e-45ce-8914-e04787d9986c	8e04ca59-fe7f-438f-a72c-bee76effb6d5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_PAYMENT_METHOD_GETCREADO .	NO APLICA
2025-03-17 21:13:12.185571+00	6405f252-eb4e-45ce-8914-e04787d9986c	bc0563de-fdd0-4840-81f0-6eb3bfac7535	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_PAYMENT_STATE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.194566+00	6405f252-eb4e-45ce-8914-e04787d9986c	6a39c65c-4fa4-474a-8c15-2775e03c088c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_PAYMENT_STATE_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.20222+00	6405f252-eb4e-45ce-8914-e04787d9986c	8522bfcb-dc2f-443d-beee-58311183323e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_STATE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.209912+00	6405f252-eb4e-45ce-8914-e04787d9986c	f9603535-fbec-4e66-8d6b-3d2e816fbd37	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PAYMENT_GATEWAY_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.216164+00	6405f252-eb4e-45ce-8914-e04787d9986c	88a38dab-d918-4cba-b09d-f3c0bfe1631c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PRODUCT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.222575+00	6405f252-eb4e-45ce-8914-e04787d9986c	e08d4e0d-5215-4b44-91d0-217df92d6e9f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PRODUCT_PRICE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.228962+00	6405f252-eb4e-45ce-8914-e04787d9986c	6b001883-f3d0-40e7-b83f-19ac89903315	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PROVINCE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.23561+00	6405f252-eb4e-45ce-8914-e04787d9986c	fd1651f4-11ac-4bdd-ad13-6c7f49bba057	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.242781+00	6405f252-eb4e-45ce-8914-e04787d9986c	ea4be22c-7057-4c1b-8a43-eaf03502d08e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_DOCUMENT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.250754+00	6405f252-eb4e-45ce-8914-e04787d9986c	24074b48-6967-4891-bfa5-5b24d73bb39a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_DOCUMENT_GETCREADO .	NO APLICA
2025-03-17 21:13:12.258337+00	6405f252-eb4e-45ce-8914-e04787d9986c	22da8a66-2f88-4a1b-ae12-817cbf98aee6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ROLE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.265518+00	6405f252-eb4e-45ce-8914-e04787d9986c	e1988a4d-e8ac-4b1b-bb69-e1f1f163e5d5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ROLE_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.27311+00	6405f252-eb4e-45ce-8914-e04787d9986c	618cf564-2dbb-4410-84a0-bedc1b0c81f8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ROLE_ACCESS_GETCREADO .	NO APLICA
2025-03-17 21:13:12.281381+00	6405f252-eb4e-45ce-8914-e04787d9986c	3ec83444-d4ae-4963-ba02-dd2d5839313c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ROLE_ACCESS_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.288905+00	6405f252-eb4e-45ce-8914-e04787d9986c	c6cdd074-05e4-4e8a-92a3-eeb78d37f47a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SALE_CHANNEL_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.296557+00	6405f252-eb4e-45ce-8914-e04787d9986c	6bc10a3a-bba4-4dd6-87d7-4c3bcd2bd21e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_TYPE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.304381+00	6405f252-eb4e-45ce-8914-e04787d9986c	baa2e8c4-25f8-4e6a-a52f-c9dd86853c80	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_PAYMENT_TYPE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.310853+00	6405f252-eb4e-45ce-8914-e04787d9986c	804a8cc3-62af-4b8a-a8d2-e8574f1e5e8b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_PAYMENT_TYPE_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.317751+00	6405f252-eb4e-45ce-8914-e04787d9986c	5bd4ffbf-e890-4ead-b5bd-807203c67821	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SIZE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.325081+00	6405f252-eb4e-45ce-8914-e04787d9986c	d31e4e01-3516-4e89-a176-ad50a57b3417	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SIZE_TYPE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.331657+00	6405f252-eb4e-45ce-8914-e04787d9986c	1dad442c-fb56-4530-b835-74a4a611d767	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SIZE_TYPE_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.338461+00	6405f252-eb4e-45ce-8914-e04787d9986c	82f88619-faf9-4e44-bb92-9ce9473d0f6a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_REPLENISHMENT_GETCREADO .	NO APLICA
2025-03-17 21:13:12.345801+00	6405f252-eb4e-45ce-8914-e04787d9986c	efa6996b-f3e7-412c-8cb2-3cb642561171	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_RETURN_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.353469+00	6405f252-eb4e-45ce-8914-e04787d9986c	0fec1557-b5b8-4a2f-ac14-23ad09bd5952	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_RETURN_ITEM_GETCREADO .	NO APLICA
2025-03-17 21:13:12.361756+00	6405f252-eb4e-45ce-8914-e04787d9986c	a28e83aa-b79d-4dfc-b4ba-4bd607005136	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_TRANSACTION_ITEM_GETCREADO .	NO APLICA
2025-03-17 21:13:12.368155+00	6405f252-eb4e-45ce-8914-e04787d9986c	10308b4d-2059-4206-9c03-9019f5bfda14	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_TRANSACTION_TYPE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.377511+00	6405f252-eb4e-45ce-8914-e04787d9986c	4140f7e0-5c7e-4ee9-9151-05d79b18066a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_TRANSFER_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.38409+00	6405f252-eb4e-45ce-8914-e04787d9986c	f2d3d94a-65ee-4068-9f1e-96ba9c0b4a44	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_TRANSFER_ITEM_GETCREADO .	NO APLICA
2025-03-17 21:13:12.391634+00	6405f252-eb4e-45ce-8914-e04787d9986c	e9e6d347-c3e3-4fd1-9dbb-1826c7309de6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STORE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.400255+00	6405f252-eb4e-45ce-8914-e04787d9986c	e482e57d-75b1-4b0d-b9bd-5cf4b6e19369	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STORE_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.408504+00	6405f252-eb4e-45ce-8914-e04787d9986c	f1eac4c4-81e9-4d9f-8125-63ababc5640b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUB_CATEGORY_PRODUCT_GETCREADO .	NO APLICA
2025-03-17 21:13:12.415119+00	6405f252-eb4e-45ce-8914-e04787d9986c	fa4e84c2-4745-4997-8b88-c5bfbbb29378	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUB_CATEGORY_PRODUCT_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.42116+00	6405f252-eb4e-45ce-8914-e04787d9986c	510ff6be-f936-4c6c-9bec-9107f133ebc5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUBSCRIPTION_GETCREADO .	NO APLICA
2025-03-17 21:13:12.427985+00	6405f252-eb4e-45ce-8914-e04787d9986c	ef775b39-1dd1-42eb-a627-8494ec28a288	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUBSCRIPTION_PAYMENT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.435902+00	6405f252-eb4e-45ce-8914-e04787d9986c	7f71e7ea-a4d3-45fd-801a-7d400639e652	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUPPLIER_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.442733+00	6405f252-eb4e-45ce-8914-e04787d9986c	61ab973a-33a8-4326-9e18-b0d182cbacce	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUPPLIER_PRODUCT_GETCREADO .	NO APLICA
2025-03-17 21:13:12.454829+00	6405f252-eb4e-45ce-8914-e04787d9986c	4da06a46-878c-4f2f-b5cd-bf327a5448be	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO UNIT_GETCREADO .	NO APLICA
2025-03-17 21:13:12.460824+00	6405f252-eb4e-45ce-8914-e04787d9986c	c636baea-75e7-4976-aeed-6dee66b8bc21	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO UNIT_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.467088+00	6405f252-eb4e-45ce-8914-e04787d9986c	d0fe9927-368c-420b-97df-59f9ec1af4ce	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO UNIT_TYPE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.473107+00	6405f252-eb4e-45ce-8914-e04787d9986c	09cad1a4-729a-447a-aa78-8261a116a743	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO USER_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.47891+00	6405f252-eb4e-45ce-8914-e04787d9986c	1656d7b7-d588-4e0d-8e03-d01cf7818dd4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO USER_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.488146+00	6405f252-eb4e-45ce-8914-e04787d9986c	02d584d0-ca77-4d39-8ee9-003708e46566	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO WAREHOUSE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.49558+00	6405f252-eb4e-45ce-8914-e04787d9986c	a4144cdc-684b-4bcc-8be9-713e3ae301e7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO WAREHOUSE_STOCK_GETCREADO .	NO APLICA
2025-03-17 21:13:12.098734+00	6405f252-eb4e-45ce-8914-e04787d9986c	ad9be67f-4672-456e-9af4-4c6df34a97ed	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO MEMBERSHIP_PAYMENT_GETCREADO .	NO APLICA
2025-03-17 21:13:12.105529+00	6405f252-eb4e-45ce-8914-e04787d9986c	8cdf6417-54b5-4803-9310-edb7b0352887	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO MODEL_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.111796+00	6405f252-eb4e-45ce-8914-e04787d9986c	c7aff98a-6385-4cea-ac25-dde9887604e9	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO MODULE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.117966+00	6405f252-eb4e-45ce-8914-e04787d9986c	f640cd03-1c31-4bab-8bbc-dc1e720c6c51	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO MODULE_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.125186+00	6405f252-eb4e-45ce-8914-e04787d9986c	6b6cba3c-92cc-4baa-b921-47d26511ad3c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ONBOARD_GETCREADO .	NO APLICA
2025-03-17 21:13:12.132139+00	6405f252-eb4e-45ce-8914-e04787d9986c	d18b85f5-8187-4e56-b35c-ceebc1bfc147	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.140273+00	6405f252-eb4e-45ce-8914-e04787d9986c	9aefdacb-2952-4d33-9814-91a222c399c8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_CONTACTED_GETCREADO .	NO APLICA
2025-03-17 21:13:12.149259+00	6405f252-eb4e-45ce-8914-e04787d9986c	e2a9eef3-bd88-4e36-9ffa-85d495eb2f66	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_ITEM_GETCREADO .	NO APLICA
2025-03-17 21:13:12.156777+00	6405f252-eb4e-45ce-8914-e04787d9986c	bc493719-1d6a-4a03-a55b-a728f3cc05f6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_ITEM_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.16489+00	6405f252-eb4e-45ce-8914-e04787d9986c	58eb4c6d-6e6a-4d4f-bfe1-6d771a1a9988	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_STOCK_GETCREADO .	NO APLICA
2025-03-17 21:13:12.172045+00	6405f252-eb4e-45ce-8914-e04787d9986c	8c0c7f4f-1032-4935-9902-3fb6ad0037a5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_STOCK_ITEM_GETCREADO .	NO APLICA
2025-03-17 21:13:12.176704+00	6405f252-eb4e-45ce-8914-e04787d9986c	2f65f9fc-d82c-4285-b097-9344dba3b1fc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_PAYMENT_METHOD_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.182841+00	6405f252-eb4e-45ce-8914-e04787d9986c	122d951f-6cf1-4d46-a1e1-7da4269e1a22	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_PAYMENT_METHOD_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.190048+00	6405f252-eb4e-45ce-8914-e04787d9986c	e3be87fa-8115-46bc-adb0-1cb8055c11cc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_PAYMENT_STATE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.19843+00	6405f252-eb4e-45ce-8914-e04787d9986c	1fbf07ea-e630-4621-aa49-7a5d7ed42b7d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_STATE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.205881+00	6405f252-eb4e-45ce-8914-e04787d9986c	f87fde9d-5091-49c9-858d-d9bb615d96f4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ORDER_STATE_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.212891+00	6405f252-eb4e-45ce-8914-e04787d9986c	0f84224e-1b5f-47dd-9818-b66207fd0e95	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PRODUCT_GETCREADO .	NO APLICA
2025-03-17 21:13:12.219287+00	6405f252-eb4e-45ce-8914-e04787d9986c	6daa7f5a-0aa0-4970-b846-4f62725a3258	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PRODUCT_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.225681+00	6405f252-eb4e-45ce-8914-e04787d9986c	51088918-f282-4397-b711-93c4d7e985cf	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PROVINCE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.232413+00	6405f252-eb4e-45ce-8914-e04787d9986c	5b06ceaa-bd75-42e9-97a6-f0afebfc5102	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PROVINCE_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.238912+00	6405f252-eb4e-45ce-8914-e04787d9986c	0c15ecf6-9e3b-422f-9b92-8bae1fa2ce4e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.246818+00	6405f252-eb4e-45ce-8914-e04787d9986c	3e794c96-bf4b-4453-bad2-71a4e2b304a5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_DOCUMENT_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.254433+00	6405f252-eb4e-45ce-8914-e04787d9986c	5657b4ca-ff85-4b4c-9867-1cd004be0214	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_ITEM_GETCREADO .	NO APLICA
2025-03-17 21:13:12.26186+00	6405f252-eb4e-45ce-8914-e04787d9986c	664d8ecf-a87c-4dc1-bd23-f9c56bf8b00a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ROLE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.269361+00	6405f252-eb4e-45ce-8914-e04787d9986c	ddfc996d-1a7c-407a-84d9-4ab8d56fd144	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ROLE_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.277727+00	6405f252-eb4e-45ce-8914-e04787d9986c	96fe35ec-0966-4521-a822-6193f472e660	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ROLE_ACCESS_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.285151+00	6405f252-eb4e-45ce-8914-e04787d9986c	6f4e88b8-dea0-46fb-bc0c-6d42f7cf6a69	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO ROLE_ACCESS_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.292943+00	6405f252-eb4e-45ce-8914-e04787d9986c	4b434af1-ec16-4d82-91ce-ad102ab3880e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SALE_CHANNEL_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.300404+00	6405f252-eb4e-45ce-8914-e04787d9986c	7e9da98b-e066-4760-9357-a45486b6abf9	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_TYPE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.307955+00	6405f252-eb4e-45ce-8914-e04787d9986c	b168c9dd-b5cc-4849-a809-81281288ac85	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO PURCHASE_PAYMENT_TYPE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.314433+00	6405f252-eb4e-45ce-8914-e04787d9986c	0445c1dd-2648-4747-8068-65930dc440ed	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SIZE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.32104+00	6405f252-eb4e-45ce-8914-e04787d9986c	9d211f2c-9905-4bf2-862e-7508c6b02070	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SIZE_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.328677+00	6405f252-eb4e-45ce-8914-e04787d9986c	1e360dba-1ce0-4200-b51c-69cc8a7520a5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SIZE_TYPE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.334881+00	6405f252-eb4e-45ce-8914-e04787d9986c	15eb928d-e147-437f-a3d6-c24b9d0b615c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_REPLENISHMENT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.341829+00	6405f252-eb4e-45ce-8914-e04787d9986c	46e1dd53-668a-4678-90de-3ac788d88e38	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_REPLENISHMENT_ITEM_GETCREADO .	NO APLICA
2025-03-17 21:13:12.349401+00	6405f252-eb4e-45ce-8914-e04787d9986c	b8de62a2-230c-4e32-a7d0-40de7a31da84	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_RETURN_GETCREADO .	NO APLICA
2025-03-17 21:13:12.357992+00	6405f252-eb4e-45ce-8914-e04787d9986c	99a07b37-0599-4af1-b938-1e9d474d0bcb	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_TRANSACTION_GETCREADO .	NO APLICA
2025-03-17 21:13:12.365292+00	6405f252-eb4e-45ce-8914-e04787d9986c	c3a9b0e0-4ea0-4c62-a871-4d999ea664d4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_TRANSACTION_TYPE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.372929+00	6405f252-eb4e-45ce-8914-e04787d9986c	e4fcb362-1000-46ee-b721-4897a440f413	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_TRANSACTION_TYPE_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.381162+00	6405f252-eb4e-45ce-8914-e04787d9986c	1a9685a8-7745-4951-befe-e789f6e3b1da	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STOCK_TRANSFER_GETCREADO .	NO APLICA
2025-03-17 21:13:12.387973+00	6405f252-eb4e-45ce-8914-e04787d9986c	fc374773-de5d-4fc9-8560-4fd997c6fdff	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STORE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.395648+00	6405f252-eb4e-45ce-8914-e04787d9986c	8a554037-d8dd-4392-ad04-bdb2fa2b4974	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STORE_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.404736+00	6405f252-eb4e-45ce-8914-e04787d9986c	943d0d5e-afc7-4d60-bbc0-58d69bd9c14e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO STORE_TYPE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.412216+00	6405f252-eb4e-45ce-8914-e04787d9986c	88121466-e396-4703-a091-049194966b5f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUB_CATEGORY_PRODUCT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.417983+00	6405f252-eb4e-45ce-8914-e04787d9986c	f47204aa-8778-4fde-a8ca-2da0ac160572	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUB_CATEGORY_PRODUCT_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.424974+00	6405f252-eb4e-45ce-8914-e04787d9986c	86c03424-c07f-4555-b288-8bebb6d1e04a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUBSCRIPTION_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.432439+00	6405f252-eb4e-45ce-8914-e04787d9986c	ae46ff7d-e515-4184-a5c0-4b35be720438	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUPPLIER_GETCREADO .	NO APLICA
2025-03-17 21:13:12.438977+00	6405f252-eb4e-45ce-8914-e04787d9986c	4ca8fd78-bdb3-43f3-9d48-77dc0e6eff93	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUPPLIER_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.446432+00	6405f252-eb4e-45ce-8914-e04787d9986c	31aa4617-8fb2-4541-83b4-4e60f5744835	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUPPLIER_PRODUCT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.451062+00	6405f252-eb4e-45ce-8914-e04787d9986c	d587d9d9-1fe1-49fe-a118-6ee258ee05b2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO SUPPLIER_PRODUCT_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.457913+00	6405f252-eb4e-45ce-8914-e04787d9986c	e7dfc5ae-83bc-46c5-84e5-105169b9c02d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO UNIT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.464646+00	6405f252-eb4e-45ce-8914-e04787d9986c	5cbff8dd-8e23-4e16-91b1-c932e6be1092	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO UNIT_TYPE_GETCREADO .	NO APLICA
2025-03-17 21:13:12.470021+00	6405f252-eb4e-45ce-8914-e04787d9986c	76c7429a-63ed-4e99-9cfa-f66814b50f82	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO UNIT_TYPE_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.476136+00	6405f252-eb4e-45ce-8914-e04787d9986c	084ee6f9-5a8c-4213-87cf-52c76231ddd5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO USER_PUTCREADO .	NO APLICA
2025-03-17 21:13:12.483874+00	6405f252-eb4e-45ce-8914-e04787d9986c	bc9a0a88-35dc-4440-a791-3baddc81dabf	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO USER_ROLE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.491688+00	6405f252-eb4e-45ce-8914-e04787d9986c	1c2c7ecd-3d08-46eb-902d-a9cd80215ccd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO WAREHOUSE_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.499009+00	6405f252-eb4e-45ce-8914-e04787d9986c	9d99ae5b-34f8-4b73-9545-12c2998638db	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO WAREHOUSE_OUTPUT_GETCREADO .	NO APLICA
2025-03-17 21:13:12.507625+00	6405f252-eb4e-45ce-8914-e04787d9986c	b90cae96-1fa0-432c-aee3-8716723b6d72	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO WAREHOUSE_OUTPUT_DELETECREADO .	NO APLICA
2025-03-17 21:13:12.512714+00	c3d0299c-c2d2-4acf-ab22-966d7c95517c	25d3bb32-38de-4ccf-8b77-26d2aa166703	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO CREADO.	NEGOCIO
2025-03-17 21:13:12.521614+00	c3d0299c-c2d2-4acf-ab22-966d7c95517c	2fbf5544-8c19-436f-9598-fc9cd20c35e2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK CREADO.	STOCK
2025-03-17 21:13:12.529291+00	c3d0299c-c2d2-4acf-ab22-966d7c95517c	d0dbb1a1-7e67-440d-8bf9-5f74598fe9b5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL COURIER CREADO.	COURIER
2025-03-17 21:13:12.542653+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	c7dc947e-e7a4-487e-a9d9-03a6383391ca	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO BRAND_GET.	VENTAS
2025-03-17 21:13:12.550059+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	f82fcf16-b60d-48d6-9428-601ce5f83aed	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO CANCELLATION_REASON_GET.	VENTAS
2025-03-17 21:13:12.557713+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1734ccc8-45fe-4eb9-8349-d8524497de81	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO CANCELLED_ORDER_GET.	VENTAS
2025-03-17 21:13:12.563069+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	10df796f-e0e0-49ab-be95-d0ba0069cfb8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO CANCELLED_ORDER_POST.	VENTAS
2025-03-17 21:13:12.568161+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1a435eb8-69d9-409b-b3df-bce6b384e673	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO COURIER_GET.	VENTAS
2025-03-17 21:13:12.574163+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	23c578f6-67e3-4ada-aac0-88d3351e2fda	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO MODEL_GET.	VENTAS
2025-03-17 21:13:12.580868+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0edc5f57-0b01-44f5-85fc-839ce90097a1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_GET.	VENTAS
2025-03-17 21:13:12.586431+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ba4bf0bd-d272-46fd-8d12-a5c64460294a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_POST.	VENTAS
2025-03-17 21:13:12.592181+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0b629f93-0f0e-4223-8269-986dd339e9a2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_PUT.	VENTAS
2025-03-17 21:13:12.597781+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	bbd69962-f5ce-4e66-b804-763f7f0e8a03	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_CONTACTED_GET.	VENTAS
2025-03-17 21:13:12.606298+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	311bcf58-6797-4dc6-943b-9339ee3da5ba	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_CONTACTED_PUT.	VENTAS
2025-03-17 21:13:12.611725+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b9c68775-b85f-42d4-b1e8-fe9948d3ffba	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_ITEM_GET.	VENTAS
2025-03-17 21:13:12.616888+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	625dbb74-e19a-4a36-9297-0cbb4356bc50	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_ITEM_POST.	VENTAS
2025-03-17 21:13:12.62326+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3cd14565-66ba-485d-9953-ad6446ff106c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_ITEM_PUT.	VENTAS
2025-03-17 21:13:12.62916+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	a4a64c18-830f-428c-93ba-00b630bb897d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_ITEM_DELETE.	VENTAS
2025-03-17 21:13:12.634365+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	e7fd18db-6f77-4362-8ea9-6f9eb647b68c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_PAYMENT_METHOD_GET.	VENTAS
2025-03-17 21:13:12.639189+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	dfa2e574-03a2-45b4-9688-bfb2b8d6d42e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_PAYMENT_STATE_GET.	VENTAS
2025-03-17 21:13:12.644562+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0010686b-3cc4-4870-9449-37a826cd63e3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO ORDER_STATE_GET.	VENTAS
2025-03-17 21:13:12.649369+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ae801518-e5d8-4907-a6c4-be5eaa02008c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO PRODUCT_GET.	VENTAS
2025-03-17 21:13:12.654127+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	02af5c62-7b9f-4c94-867e-5beae749e0d0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS AGREGA ACCESO STORE_GET.	VENTAS
2025-03-17 21:13:12.65973+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	8b4c0854-9077-44c7-b356-985dfffbca26	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO BRAND_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.664543+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	dd4a1915-966e-482a-88a7-af651048480e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO CANCELLATION_REASON_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.66937+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	6b5c70dc-2dbb-4646-8765-b390bc366340	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO CANCELLED_ORDER_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.673777+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	f1f9209c-52f8-489d-b603-23313715942e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO CANCELLED_ORDER_POST.	SERVICIO_CLIENTE
2025-03-17 21:13:12.678729+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ba113c04-f841-4afe-99a1-f94d4d7a0923	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO MODEL_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.683778+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	560409e7-9f3c-4bff-8092-6825baec20f9	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO COURIER_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.68936+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	85b8ac05-ab93-4324-946a-c1ec425f64f4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.695787+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ac276f5a-a002-48e5-86cd-390bca8026c7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_PUT.	SERVICIO_CLIENTE
2025-03-17 21:13:12.701331+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	e8d1dc03-ec57-4ce3-9dea-5720a5467bc9	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_CONTACTED_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.707376+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	39945bed-f58d-4a18-b772-ef78112f07e9	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_CONTACTED_PUT.	SERVICIO_CLIENTE
2025-03-17 21:13:12.713431+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	dd41ec16-d04e-4c02-bd15-5c951c48ab0e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_ITEM_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.718666+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	27b3f855-b69c-447c-8cdf-2653d80910d4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_ITEM_POST.	SERVICIO_CLIENTE
2025-03-17 21:13:12.723615+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	a79eaa79-0d04-463c-89da-357b29416199	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_ITEM_PUT.	SERVICIO_CLIENTE
2025-03-17 21:13:12.727963+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	c9164b18-f865-4b02-8120-7db652ab36b0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_ITEM_DELETE.	SERVICIO_CLIENTE
2025-03-17 21:13:12.733112+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ced69a61-2021-45b6-8850-823b969bd159	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_PAYMENT_METHOD_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.737815+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	e0be9d6d-ff60-4565-8f4b-61606cc65cdd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_PAYMENT_STATE_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.742984+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	26368129-d555-43c4-a15c-da669d20acbe	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO ORDER_STATE_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.747615+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	4aec2f4f-1b12-48e1-8333-c5f00c8d4158	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO PRODUCT_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.752454+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	760ae26c-ff8d-421e-ac4e-76cde8e8d08a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE AGREGA ACCESO STORE_GET.	SERVICIO_CLIENTE
2025-03-17 21:13:12.757379+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	7604b336-5352-46df-8b2e-8b7b7e5f9b79	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO BRAND_GET.	MARKETING
2025-03-17 21:13:12.763043+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	462d8d8d-6002-4605-be12-610592fa277e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO BRAND_POST.	MARKETING
2025-03-17 21:13:12.768326+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	9abb17ba-69dd-49aa-8d7c-a08962c51eca	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO BRAND_DELETE.	MARKETING
2025-03-17 21:13:12.773777+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	331fe37e-10cf-47bf-9003-a25d90e2152b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO BRAND_PUT.	MARKETING
2025-03-17 21:13:12.778866+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0c6f4632-813a-41fe-8da3-0146e9bb2149	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO CATEGORY_PRODUCT_GET.	MARKETING
2025-03-17 21:13:12.785327+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	e770d3a4-b063-415b-ba32-5677bb65988f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO COLOR_GET.	MARKETING
2025-03-17 21:13:12.503463+00	6405f252-eb4e-45ce-8914-e04787d9986c	028d2632-9485-48a3-ba53-b40740fbbfa4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESO WAREHOUSE_OUTPUT_POSTCREADO .	NO APLICA
2025-03-17 21:13:12.516695+00	c3d0299c-c2d2-4acf-ab22-966d7c95517c	d419a3ad-1c43-4d9f-bc83-2b6848e4da89	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL VENTAS CREADO.	VENTAS
2025-03-17 21:13:12.525102+00	c3d0299c-c2d2-4acf-ab22-966d7c95517c	5517d655-8d29-43ed-83fc-11c619f57749	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL SERVICIO_CLIENTE CREADO.	SERVICIO_CLIENTE
2025-03-17 21:13:12.533145+00	c3d0299c-c2d2-4acf-ab22-966d7c95517c	03c02a4c-a69e-4f25-bfaa-d7a359cbf53e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING CREADO.	MARKETING
2025-03-17 21:13:13.962121+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	095cef13-62ad-452d-8d6f-d25954b88375	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO ANALÍTICA DE VENTAS.	ANALÍTICA DE VENTAS
2025-03-17 21:13:13.970476+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	36158e75-a679-486d-882b-3e73dc5f44d3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO MÓDULO DE ALMACÉN.	MÓDULO DE ALMACÉN
2025-03-17 21:13:13.979341+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	2a8414eb-9d7d-4848-9602-bd5532760f88	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO MÓDULO DE REMARKETING.	MÓDULO DE REMARKETING
2025-03-17 21:13:13.987415+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	d8c51b5f-4a36-4900-8b4c-0a3ec75a0fd2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO INTEGRACION TIENDA VIRTUAL.	INTEGRACION TIENDA VIRTUAL
2025-03-17 21:13:13.996778+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	dbc7f2fe-65a6-4814-854d-ad311304481b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO MODULO DE FINANZAS.	MODULO DE FINANZAS
2025-03-17 21:13:14.005858+00	4fe7179c-d752-4125-88fd-cea8ae6e064c	5f9c008b-d0a9-4530-8104-c4c00362a116	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUBSCRIPCION SEMESTRAL CREADO.	SEMESTRAL
2025-03-17 21:13:14.030659+00	0718e9d4-f7c7-49a7-9225-766d7135045d	6899c5ed-6721-475d-acb6-fbbcf554f365	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORIA COSMETICOS CREADA.	COSMETICOS
2025-03-17 21:13:14.046063+00	7022ba63-ca35-48ca-bf00-e7c64eaf5f04	a29ff592-fcc6-4668-8cd6-401ddd404dd3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE CIERRE INSTAGRAM CREADO.	INSTAGRAM
2025-03-17 21:13:14.063224+00	7022ba63-ca35-48ca-bf00-e7c64eaf5f04	3581b68c-cbe8-4ca5-bf1a-3962a6f0bae2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE CIERRE MARKET PLACE CREADO.	MARKET PLACE
2025-03-17 21:13:14.07889+00	9c2b798f-5dd3-46da-9765-a27c79ccec54	d94c299e-3dd0-4a71-a7fa-867d31c9df92	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE ENTRADA TWITTER CREADO.	TWITTER
2025-03-17 21:13:14.090025+00	72cf8821-6d10-49f8-ae0f-a54d9c1c7152	2db912f6-7a7b-4445-973d-f1dfe045c5f7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TIENDA NINGUNA CREADO.	NINGUNA
2025-03-17 21:13:14.096944+00	72cf8821-6d10-49f8-ae0f-a54d9c1c7152	c50d949f-3535-4f35-a25d-324c492a3dbe	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TIENDA WIX CREADO.	WIX
2025-03-17 21:13:14.112737+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	4299c42b-166a-4b8d-a4df-b5fdea0b0bde	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR CAMEL CREADO.	CAMEL
2025-03-17 21:13:14.136974+00	cbf2279d-637a-4b9c-b13b-dc5fa924593e	f615e8ea-7aa0-4654-988d-f4303c736984	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE UNIDAD CALZADO CREADO.	CALZADO
2025-03-17 21:13:14.145871+00	cbf2279d-637a-4b9c-b13b-dc5fa924593e	5de01dbc-0ef8-4426-9e0f-365a995a3969	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE UNIDAD COMPLEMENTOS CREADO.	COMPLEMENTOS
2025-03-17 21:13:14.581148+00	efcb215f-36fb-482c-b8b2-2310ed86d654	6f3bec06-c87e-4cda-a4cf-d5a23781d137	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO POR RECOGER CREADO.	POR RECOGER
2025-03-17 21:13:14.594123+00	efcb215f-36fb-482c-b8b2-2310ed86d654	70069cad-3559-4c96-a925-7cf6397a3640	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO CANCELADO CREADO.	CANCELADO
2025-03-17 21:13:14.600572+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	656aca63-417d-4249-96a7-28a2ec3e8465	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA TIENDA OP CREADO.	TIENDA OP
2025-03-17 21:13:14.609507+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	a43a58e2-aeb6-42fb-948c-4ce9efea4177	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA WEB KUNCA.PE CREADO.	WEB KUNCA.PE
2025-03-17 21:13:14.616557+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	fa9dbd63-325c-48df-b583-a9220d9a4df2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA WEB KUNCA.SHOP CREADO.	WEB KUNCA.SHOP
2025-03-17 21:13:14.62976+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	a32ded84-d26a-410f-bf8e-21574d01c805	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA MP PLATANITOS CREADO.	MP PLATANITOS
2025-03-17 21:13:14.636777+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	0de862ad-504e-4533-bae8-5a3d79aaf72c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA LIVE SHOPPING ARANNI CREADO.	LIVE SHOPPING ARANNI
2025-03-17 21:13:14.652327+00	04b7b029-3b52-49c5-b4bf-8d6b937aa53d	80d39e8b-cc0f-4867-bc5d-59126fe14cfe	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE GESTION CAMBIO CREADO.	CAMBIO
2025-03-17 21:13:14.666461+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	917c42de-3f11-4020-ae6b-0924e4dcf94b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO INTERBANK CREADO.	INTERBANK
2025-03-17 21:13:14.67747+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	8033d5fa-9e74-4c90-a6c0-33db0bf92113	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RAZON DE CANCELACION MUY CARO EL ENVIO CREADA .	MUY CARO EL ENVIO
2025-03-17 21:13:14.684638+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	e868ab2a-3a5b-41dd-99ce-788effae6c85	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RAZON DE CANCELACION CLIENTE NO CONFIABLE PARA CONTRAENTREGA CREADA .	CLIENTE NO CONFIABLE PARA CONTRAENTREGA
2025-03-17 21:13:14.692428+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	c334b147-0871-4e98-8bf4-5f0f3bfa89da	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RAZON DE CANCELACION NO LE GUSTO PRODUCTO CREADA .	NO LE GUSTO PRODUCTO
2025-03-17 21:13:14.69852+00	35de4f53-aa01-4316-9be2-33ed1f4568dd	20e8cb0b-2cd1-4fff-aacd-0fd0920ae99f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE CLIENTE TRADICIONAL CREADO.	TRADICIONAL
2025-03-17 21:13:14.717141+00	54aaf521-ea36-4db3-bc82-07c7cc97a737	9f9dee1f-dcdd-4ea3-aeaa-e7a802ac0baa	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PUNTO DE ENTREGA PUNTO SCHARF CREADO.	PUNTO SCHARF
2025-03-17 21:13:14.725783+00	54aaf521-ea36-4db3-bc82-07c7cc97a737	25311798-39a2-463f-958e-5ded09e23698	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PUNTO DE ENTREGA RECOJO EN TIENDA CREADO.	RECOJO EN TIENDA
2025-03-17 21:13:14.736051+00	cf5ab96b-f971-4014-a451-894992095b39	13612f9d-f98b-4c24-b35f-449c8216600a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TRANSACCION SALIDA CREADO.	SALIDA
2025-03-17 21:13:14.743845+00	cf5ab96b-f971-4014-a451-894992095b39	e31fb24d-be40-4d23-accd-d93105209288	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TRANSACCION GUIA-COURIER-DEVOLUCION CREADO.	GUIA-COURIER-DEVOLUCION
2025-03-17 21:13:14.847497+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	e40dc941-bb41-4199-9607-21ca52d948a8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO STD CREADO.	STD
2025-03-17 21:13:14.870711+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	7606b0e0-d57d-49f0-97c4-ccdfa407153d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA WHATSAPP CREADO.	WHATSAPP
2025-03-17 21:13:14.942757+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	b9d2dceb-7b98-4eaf-87f1-2cf6ba7c37ef	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO SANTA ROSA CREADO.	SANTA ROSA
2025-03-17 21:13:14.951472+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	db6f4b73-248c-4062-8870-8ed395953096	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR MARRON CREADO.	MARRON
2025-03-17 21:13:14.958234+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	32779885-e568-4e21-9c92-31357494d04f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR CELESTE CREADO.	CELESTE
2025-03-17 21:13:14.966531+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	435bf7df-cf77-4e4f-81c8-bba72f6ae5b2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR AZUL ELECTRICO CREADO.	AZUL ELECTRICO
2025-03-17 21:13:12.790054+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b7e038e5-1253-49e2-bfa3-68ebe9e4f454	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO MODEL_GET.	MARKETING
2025-03-17 21:13:12.795291+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	afbb4fb1-5597-4ec4-a4e0-cb437eb4c51e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO MODEL_POST.	MARKETING
2025-03-17 21:13:12.800104+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	69365126-b1bc-4a87-a81e-40854bc14a0c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO MODEL_DELETE.	MARKETING
2025-03-17 21:13:12.804862+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	5af4c19b-08db-4f30-8557-f0cf1153d2d5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO PRODUCT_GET.	MARKETING
2025-03-17 21:13:12.810396+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	9cf57fa8-f68b-43c1-9561-2e7d9dfdc571	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO PRODUCT_POST.	MARKETING
2025-03-17 21:13:12.816174+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	410b45ef-ca85-44a2-bf19-ca2e1a78a9fe	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO PRODUCT_DELETE.	MARKETING
2025-03-17 21:13:12.820032+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	012c9888-4fe2-4ca4-b3cd-c95a6b15a932	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO PRODUCT_PRICE_POST.	MARKETING
2025-03-17 21:13:12.824218+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	f0cdb5ff-a833-45f6-b59e-8389e31aa1ef	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO SIZE_GET.	MARKETING
2025-03-17 21:13:12.828971+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1c8e568b-a1cd-4aa8-8869-47dca3f4b5ae	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO SIZE_TYPE_GET.	MARKETING
2025-03-17 21:13:12.836358+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	01500470-f5ab-451b-bf4b-1d390b01fdcb	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO UNIT_GET.	MARKETING
2025-03-17 21:13:12.840861+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3236550f-485f-401c-9d55-1176f2fcce75	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL MARKETING AGREGA ACCESO UNIT_TYPE_GET.	MARKETING
2025-03-17 21:13:12.845209+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3ab0a6f0-50cc-4252-9151-64acaab92bb7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO BRAND_GET.	STOCK
2025-03-17 21:13:12.850027+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ac79f4ac-7cef-4821-87b2-0fd6e380a301	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO COLOR_GET.	STOCK
2025-03-17 21:13:12.854861+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	a2c6f801-e8ee-431d-9ad4-f897cdf47798	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO GENERAL_STOCK_GET.	STOCK
2025-03-17 21:13:12.860283+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	d9d8644b-612d-48f7-bd4b-3a0d31fabf78	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO MODEL_GET.	STOCK
2025-03-17 21:13:12.865488+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	7fb3fabb-5578-4517-b322-6868b199023f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO ORDER_GET.	STOCK
2025-03-17 21:13:12.87078+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	db8e107e-ca83-4a3d-9c06-496489378503	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO ORDER_ITEM_GET.	STOCK
2025-03-17 21:13:12.875861+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1a5dd115-0744-41fd-924e-c7fa7629cb4e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO ORDER_STOCK_GET.	STOCK
2025-03-17 21:13:12.880527+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	d31cb26d-4ced-4f13-b04c-418974f6c447	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO ORDER_STOCK_POST.	STOCK
2025-03-17 21:13:12.885463+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	e8e8d614-6166-4f54-b734-49a01e5d3c10	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO ORDER_STOCK_ITEM_GET.	STOCK
2025-03-17 21:13:12.890687+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	d5d3b2cb-6e64-4760-9b88-74ad93adcdcd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO PURCHASE_GET.	STOCK
2025-03-17 21:13:12.897916+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	969b6770-cd1f-4856-893a-229641b48d6d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO PURCHASE_POST.	STOCK
2025-03-17 21:13:12.907033+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1324d8ca-3307-4088-9f0e-40c6d5f0cdee	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO PURCHASE_ITEM_GET.	STOCK
2025-03-17 21:13:12.914746+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	2cb8c1ac-5ba1-44b3-830f-14b42584d534	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO PURCHASE_TYPE_GET.	STOCK
2025-03-17 21:13:12.921226+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	55a4e67b-3adc-4a8b-be12-badc60fe404f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO SIZE_GET.	STOCK
2025-03-17 21:13:12.928004+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ee5d66ab-475a-46cc-9fb0-aacfde8885ab	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO SIZE_TYPE_GET.	STOCK
2025-03-17 21:13:12.934584+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	740fd7ad-a7f5-4424-ae5f-7a6d38bdc1dd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO STOCK_REPLENISHMENT_GET.	STOCK
2025-03-17 21:13:12.94059+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b7fc9a02-0e15-4f26-8dad-c19ed37aa52b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO STOCK_REPLENISHMENT_POST.	STOCK
2025-03-17 21:13:12.946051+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	8b8f4aca-5ac6-425e-92cb-9dc11e70d7ff	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO STOCK_REPLENISHMENT_ITEM_GET.	STOCK
2025-03-17 21:13:12.951522+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1ec164b3-ed65-4d50-a0aa-d93c139d68c2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO STOCK_RETURN_GET.	STOCK
2025-03-17 21:13:12.958142+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	72e2639f-b5ef-41e4-9f9e-82668c0f4d33	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO STOCK_RETURN_POST.	STOCK
2025-03-17 21:13:12.962723+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	f1db69bc-b6a0-4c2f-b121-227887a2fd40	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO STOCK_RETURN_ITEM_GET.	STOCK
2025-03-17 21:13:12.967875+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	7c57a0e8-87d5-48c7-865a-ac72e58b9924	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO STOCK_TRANSACTION_GET.	STOCK
2025-03-17 21:13:12.973474+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	32c1ed01-3f82-4912-9ba6-f34b52b56d93	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO STOCK_TRANSACTION_ITEM_GET.	STOCK
2025-03-17 21:13:12.978721+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	59ca91f7-2e41-414f-9b48-3784ed984636	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO SUPPLIER_GET.	STOCK
2025-03-17 21:13:12.983656+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	76adb1dc-f4d9-493a-917a-ad0a49024d1f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO SUPPLIER_POST.	STOCK
2025-03-17 21:13:12.991523+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	eb0a387b-bff7-45c4-8469-f2e165024a00	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO SUPPLIER_DELETE.	STOCK
2025-03-17 21:13:12.997688+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	fbbde33f-7c65-4cb3-8f9d-abfdea373413	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO SUPPLIER_PRODUCT_GET.	STOCK
2025-03-17 21:13:13.004483+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	2ea17ad2-5578-4420-82c6-69573bf3dd79	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO SUPPLIER_PRODUCT_POST.	STOCK
2025-03-17 21:13:13.010348+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	000aba37-7fb6-4780-b344-07f51c4332fd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO SUPPLIER_PRODUCT_DELETE.	STOCK
2025-03-17 21:13:13.017362+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	c53e0744-050a-47e8-8070-540bdbab277b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO UNIT_GET.	STOCK
2025-03-17 21:13:13.022996+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	54ca0828-ba73-40b0-9dce-7b042200f82f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO UNIT_TYPE_GET.	STOCK
2025-03-17 21:13:13.028494+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	743e4dfb-c8ad-453e-87c8-3154590c9172	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO WAREHOUSE_GET.	STOCK
2025-03-17 21:13:13.033876+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	e3855109-be21-422b-ab15-7486b7caf2f8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO WAREHOUSE_POST.	STOCK
2025-03-17 21:13:13.039135+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	caf596a2-ce83-4f16-9a02-da13873ae04e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO WAREHOUSE_OUTPUT_GET.	STOCK
2025-03-17 21:13:13.043932+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	7a24d641-7550-49b5-8628-26dc0dd7c156	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO WAREHOUSE_OUTPUT_POST.	STOCK
2025-03-17 21:13:13.049132+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	5348bb6d-ba17-4b84-893b-1b42435c11a6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL STOCK AGREGA ACCESO WAREHOUSE_OUTPUT_DELETE.	STOCK
2025-03-17 21:13:13.053957+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	71d8b99b-35f0-47e8-a7a9-0168ed3c99ec	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL COURIER AGREGA ACCESO COURIER_PUT.	COURIER
2025-03-17 21:13:13.058712+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0517c0dc-9613-440e-bf11-ea70405e4b9f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO BRAND_GET.	NEGOCIO
2025-03-17 21:13:13.063769+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	49de7ead-0fa3-49ae-a03f-04639af31059	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO CLIENT_GET.	NEGOCIO
2025-03-17 21:13:13.068618+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	410a9da0-cff8-4116-9be7-634f2b7e1614	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO COLOR_GET.	NEGOCIO
2025-03-17 21:13:13.074291+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	552d5916-eb86-4fae-93f1-b1685bbaf3d0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO CANCELLED_ORDER_GET.	NEGOCIO
2025-03-17 21:13:13.079271+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	97f7103a-6b6f-48d6-8953-4bbcb324746a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO COURIER_GET.	NEGOCIO
2025-03-17 21:13:13.084254+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	a52eba5b-a03e-4231-8db0-362ff34d2c82	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO COURIER_POST.	NEGOCIO
2025-03-17 21:13:13.088972+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	8f53901c-dc60-426f-bf65-c062f3e9a63c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO DELIVERY_COMPANY_GET.	NEGOCIO
2025-03-17 21:13:13.093906+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	f6158c43-a4d7-4eb5-b4de-86fb36e4473a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO DELIVERY_COMPANY_POST.	NEGOCIO
2025-03-17 21:13:13.099124+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	63b6a138-164b-40d4-9173-3514e1162034	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO DELIVERY_COMPANY_DELETE.	NEGOCIO
2025-03-17 21:13:13.103695+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3eeb27e2-33ec-4dd8-bd51-80cac134e3e0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO DELIVERY_COMPANY_PUT.	NEGOCIO
2025-03-17 21:13:13.108419+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	38251616-ddeb-444a-ac92-cb1166f821dc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO GENERAL_STOCK_GET.	NEGOCIO
2025-03-17 21:13:13.113651+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b71cbe3a-d03c-419a-ab43-868287d6c1ca	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO MEMBERSHIP_GET.	NEGOCIO
2025-03-17 21:13:13.119503+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3892c6a6-9212-40c4-83d1-87c51a618839	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO MEMBERSHIP_PAYMENT_GET.	NEGOCIO
2025-03-17 21:13:13.125003+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	85521401-8bc6-4c05-ac3c-bd54ae9259e1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO MODEL_GET.	NEGOCIO
2025-03-17 21:13:13.129519+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	5d76342e-cdb6-49cc-8e3f-9360d5fd8895	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO ORDER_GET.	NEGOCIO
2025-03-17 21:13:13.134324+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	bd365886-fa46-4cd7-bec2-7a342fb0fb2b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO ORDER_ITEM_GET.	NEGOCIO
2025-03-17 21:13:13.140391+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	2c32d2c6-38bc-4a4b-9f1a-78366ec541e6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO ORDER_STOCK_GET.	NEGOCIO
2025-03-17 21:13:13.146027+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	28a67599-dd65-4993-8f9b-3a905fe463f5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO ORDER_STOCK_ITEM_GET.	NEGOCIO
2025-03-17 21:13:13.151702+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	42fbdfc4-7f37-4671-a7ef-e76220e14fd7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO ORDER_PAYMENT_METHOD_GET.	NEGOCIO
2025-03-17 21:13:13.157302+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	fcf6f0e9-0391-4af7-8e62-f04e057c4aa5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO ORDER_PAYMENT_STATE_GET.	NEGOCIO
2025-03-17 21:13:13.162723+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	bf55b406-af15-4fbc-938b-23db5d3c0c5b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO ORDER_STATE_GET.	NEGOCIO
2025-03-17 21:13:13.16861+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	5e30681a-1d67-459e-9a28-bc393f6e3f53	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO PRODUCT_GET.	NEGOCIO
2025-03-17 21:13:13.173885+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	40d2f45b-a8c1-47f6-bfcf-bf58cc192bdc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO PURCHASE_GET.	NEGOCIO
2025-03-17 21:13:13.178785+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	798df965-748b-4db1-a7a2-4258480f68ca	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO PURCHASE_ITEM_GET.	NEGOCIO
2025-03-17 21:13:13.183746+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	596b1b1b-5bd2-4171-bbe6-78ff56cfcc28	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO ROLE_GET.	NEGOCIO
2025-03-17 21:13:13.188824+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	83a0387a-3875-43d6-a9f2-b6c5597a23fc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO SIZE_GET.	NEGOCIO
2025-03-17 21:13:13.194822+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	343dee43-4034-4db7-9ea1-9a8610b796af	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO SIZE_TYPE_GET.	NEGOCIO
2025-03-17 21:13:13.201007+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	140ea68c-ff8c-4fa3-b56d-cc0c11d7b058	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STOCK_REPLENISHMENT_GET.	NEGOCIO
2025-03-17 21:13:13.206032+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	8a4fc46d-7f8b-48c4-b7bc-c62e6bf7b7a1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STOCK_REPLENISHMENT_ITEM_GET.	NEGOCIO
2025-03-17 21:13:13.211575+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3af5443d-0714-402f-858e-3ca26a90ed7e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STOCK_RETURN_GET.	NEGOCIO
2025-03-17 21:13:13.216589+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	523a254d-55ab-4b78-a36f-42384b1ce89a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STOCK_RETURN_ITEM_GET.	NEGOCIO
2025-03-17 21:13:13.222178+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	7018c14f-ff07-4732-89bd-6d438b606c9b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STOCK_TRANSACTION_GET.	NEGOCIO
2025-03-17 21:13:13.228047+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	fb7a9a8d-cd62-40fe-b636-1267ddd1247d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STOCK_TRANSACTION_ITEM_GET.	NEGOCIO
2025-03-17 21:13:13.23332+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1060861a-802f-4a96-8020-4a8ce160fd4b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STOCK_TRANSFER_GET.	NEGOCIO
2025-03-17 21:13:13.238975+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0bc095f2-e77b-41a4-8b3f-4beffa84f6bf	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STOCK_TRANSFER_ITEM_GET.	NEGOCIO
2025-03-17 21:13:13.243787+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b1991054-83f6-483f-ab70-3440369e3d52	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STORE_GET.	NEGOCIO
2025-03-17 21:13:13.248602+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	320c033b-dd59-4806-92fa-46459b573ae1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STORE_PUT.	NEGOCIO
2025-03-17 21:13:13.253903+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	6f7d5aa3-504a-4deb-838b-bcb6bb8626bb	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STORE_POST.	NEGOCIO
2025-03-17 21:13:13.258805+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	26b3da36-ca1a-4189-b2e9-828a0f482d52	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO STORE_DELETE.	NEGOCIO
2025-03-17 21:13:13.264581+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	be2d54fe-139f-41d8-ad5e-02e02cebdb14	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO SUBSCRIPTION_GET.	NEGOCIO
2025-03-17 21:13:13.269198+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	4d8fc4a6-1999-4c96-baa5-9e666d3519eb	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO SUBSCRIPTION_PAYMENT_POST.	NEGOCIO
2025-03-17 21:13:13.274009+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	d8b08408-b9d2-4c2a-80d7-d657e2c1f775	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO SUPPLIER_GET.	NEGOCIO
2025-03-17 21:13:13.278841+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	8bbb1ca7-e5b1-4c30-b08d-47e6d58a38fd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO UNIT_GET.	NEGOCIO
2025-03-17 21:13:13.284068+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	5ec6aa8f-f264-47f2-818b-6d9bcf9b0118	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO UNIT_TYPE_GET.	NEGOCIO
2025-03-17 21:13:13.289378+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	7f140662-0279-4e16-bf67-7231ddba1bfa	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO USER_GET.	NEGOCIO
2025-03-17 21:13:13.2944+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	030035e7-2475-42d2-b793-c7bd8c47385d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO USER_POST.	NEGOCIO
2025-03-17 21:13:13.299495+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	a11c91e4-66aa-4d12-a1c9-afc4b2ac0025	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO WAREHOUSE_GET.	NEGOCIO
2025-03-17 21:13:13.304962+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3fb23b7c-1527-4614-97fa-ccf26d607ea0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO AGREGA ACCESO WAREHOUSE_STOCK_GET.	NEGOCIO
2025-03-17 21:13:13.310028+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	84ed5eec-f1e2-4dad-b7f2-c71df4ad259c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ACCESS_POST.	ADMINISTRACION
2025-03-17 21:13:13.316161+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	66439ecc-b744-430d-a414-863829dcd528	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ACCESS_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.321571+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	43dc07a5-4de0-4680-a3f8-f9e3c48a2fc5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ACCESS_GET.	ADMINISTRACION
2025-03-17 21:13:13.328142+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	08a151f8-66ae-47b8-b599-8cab77ef022f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ACCESS_PUT.	ADMINISTRACION
2025-03-17 21:13:13.333889+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	2518cbfe-28c9-47b5-9367-1c1edd4c9692	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO BRAND_GET.	ADMINISTRACION
2025-03-17 21:13:13.338851+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0f5b0ff0-3fcc-4351-939c-52672aaae275	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CANCELLED_ORDER_GET.	ADMINISTRACION
2025-03-17 21:13:13.343879+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b046b138-0ea8-42a6-b77f-37a78066dbea	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CANCELLATION_REASON_GET.	ADMINISTRACION
2025-03-17 21:13:13.348904+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	eea76ac2-aceb-4a3c-b992-ed6880861938	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CANCELLATION_REASON_POST.	ADMINISTRACION
2025-03-17 21:13:14.960884+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	5f9b554f-101f-4935-8cc1-ab4bc0749673	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR PLATA CREADO.	PLATA
2025-03-17 21:13:13.35395+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	da3d7b02-bd2c-409d-bd6f-471415dde101	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CANCELLATION_REASON_PUT.	ADMINISTRACION
2025-03-17 21:13:13.359041+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3da5d6a6-bbaa-4bdf-9176-5a567a52b323	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CATEGORY_POST.	ADMINISTRACION
2025-03-17 21:13:13.364427+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	c95d42b8-4c23-4b72-b7c7-4160d54dbd64	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CATEGORY_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.369093+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0623fab2-6ca7-4ece-a650-75a145011484	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CATEGORY_PUT.	ADMINISTRACION
2025-03-17 21:13:13.374655+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	c2aadec7-5d3f-4dd5-9ae6-96a1e1855ddd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CLIENT_GET.	ADMINISTRACION
2025-03-17 21:13:13.379968+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	5c9bf023-8afa-40c4-a311-7fd23eda9869	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CLIENT_POST.	ADMINISTRACION
2025-03-17 21:13:13.384892+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	53cb30b6-4644-4682-a757-fd6bd2ad3f7c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CLIENT_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.389913+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	112fa478-f621-441b-a847-e53147fd5473	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO CLOSING_CHANNEL_POST.	ADMINISTRACION
2025-03-17 21:13:13.395559+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	660e4cf2-6010-4870-8a8a-44fef4adb42e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO COLOR_GET.	ADMINISTRACION
2025-03-17 21:13:13.400628+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	64f828ec-02e4-43bb-9c17-e692b52606b1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO COLOR_POST.	ADMINISTRACION
2025-03-17 21:13:13.4075+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	77b14fbc-fa45-4c04-b0aa-660f1659c4ac	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO COLOR_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.413418+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	474b2539-8373-4778-986f-ec4e900f6d4a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO COURIER_GET.	ADMINISTRACION
2025-03-17 21:13:13.417791+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	26fe3c80-8791-4125-973f-5e6a020fb395	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO COURIER_POST.	ADMINISTRACION
2025-03-17 21:13:13.422864+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ec8dc2da-6f87-4f68-aef3-7bbe1857a26f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DELIVERY_STATUS_GET.	ADMINISTRACION
2025-03-17 21:13:13.428184+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	7075b5aa-5e37-4150-9569-3d0d50ae0f9e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DELIVERY_STATUS_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.434647+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	e4bb2cc7-188a-44ba-aa83-dbd6506c9bc8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DELIVERY_STATUS_POST.	ADMINISTRACION
2025-03-17 21:13:13.439241+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	5b896e10-9c71-448c-b8bb-d12ef48215b5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DELIVERY_STATUS_PUT.	ADMINISTRACION
2025-03-17 21:13:13.443998+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	5d2fc026-c8ed-4ba4-af78-e1e63972a544	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DELIVERY_MANIFEST_STATUS_GET.	ADMINISTRACION
2025-03-17 21:13:13.44869+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	700848a6-21fc-499c-b9b5-3cbec24698db	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DELIVERY_MANIFEST_STATUS_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.453655+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3dd7e6ad-a393-4b11-85c9-65becacb21e5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DELIVERY_MANIFEST_STATUS_POST.	ADMINISTRACION
2025-03-17 21:13:13.458682+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	a8af14f7-1c25-430e-b11f-8faed593319e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DELIVERY_MANIFEST_STATUS_PUT.	ADMINISTRACION
2025-03-17 21:13:13.46335+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	4c4ba5d7-4824-4b4e-b237-baf0d6118bfb	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DELIVERY_MANIFEST_ITEM_GET.	ADMINISTRACION
2025-03-17 21:13:13.467901+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	c6a4b3c8-2d55-453c-87d1-8ddaceec8942	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DELIVERY_MANIFEST_ITEM_PUT.	ADMINISTRACION
2025-03-17 21:13:13.472441+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ec45b198-21e6-4a5d-8e93-8e0e51c3fa53	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DEPARTMENT_GET.	ADMINISTRACION
2025-03-17 21:13:13.477646+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	f92058e9-cd32-4919-9e93-087d7773222a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DEPARTMENT_POST.	ADMINISTRACION
2025-03-17 21:13:13.482535+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	7e191b7e-b4ea-4acf-afc9-27a3e5049688	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DEPARTMENT_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.48747+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	2af17f56-c3bd-4072-9014-01987f518870	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DISTRICT_POST.	ADMINISTRACION
2025-03-17 21:13:13.492041+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ce9ea644-43b4-4cc3-a765-e760c8a1312f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO DISTRICT_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.497035+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	99e44dbd-1330-4689-a75f-f58c15f3f02a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ENTRY_CHANNEL_POST.	ADMINISTRACION
2025-03-17 21:13:13.503004+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3089487d-0a35-4f5a-8dc9-420db1752c40	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO GENERAL_STOCK_GET.	ADMINISTRACION
2025-03-17 21:13:13.509266+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	28dd1aa0-a2ba-4809-87e4-56d5dea9192d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO MEMBERSHIP_GET.	ADMINISTRACION
2025-03-17 21:13:13.514268+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	48e8afea-94c5-4a88-99b0-3a3ee1384755	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO MEMBERSHIP_PAYMENT_GET.	ADMINISTRACION
2025-03-17 21:13:13.51961+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	c8893fb3-1aa1-4ecc-a661-15489eb4522a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO MODEL_GET.	ADMINISTRACION
2025-03-17 21:13:13.524639+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	4738817b-d855-4714-8782-aa99a90c0a0d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO MODULE_GET.	ADMINISTRACION
2025-03-17 21:13:13.529559+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ca62484a-ab35-48da-8dbd-c2df1b263db5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO MODULE_POST.	ADMINISTRACION
2025-03-17 21:13:13.534639+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	f2d5cce0-aafd-4d2f-b814-a93b8b13c9b9	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO MODULE_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.540178+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	7b5d07d4-324e-450b-85e0-de66af935367	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ONBOARD_GET.	ADMINISTRACION
2025-03-17 21:13:13.545567+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	45d162cb-1eed-43eb-a8ac-a8fddbbd7229	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_GET.	ADMINISTRACION
2025-03-17 21:13:13.550596+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	e31d7fed-936c-4239-9e0f-a028192c008e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_ITEM_GET.	ADMINISTRACION
2025-03-17 21:13:13.555759+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	fbd76e50-a154-44c7-b76b-9c09fb28314a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_STOCK_GET.	ADMINISTRACION
2025-03-17 21:13:13.55987+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	40137dac-494f-4b18-b2cf-605546afa7d1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_STOCK_ITEM_GET.	ADMINISTRACION
2025-03-17 21:13:13.565951+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	8970ad48-3634-4e47-ac47-987e3bac6af4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_PAYMENT_METHOD_GET.	ADMINISTRACION
2025-03-17 21:13:13.570732+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b6cd7999-3d37-4eda-8b43-916bd24c1655	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_PAYMENT_METHOD_POST.	ADMINISTRACION
2025-03-17 21:13:13.576955+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	10f28de7-9200-494a-a25e-b79b649397ad	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_PAYMENT_METHOD_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.582749+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	faee3438-c9b4-4a17-8a38-db711f5d58a7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_PAYMENT_STATE_GET.	ADMINISTRACION
2025-03-17 21:13:13.588158+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	97af1472-6d77-4938-a53b-4b854c086a7b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_PAYMENT_STATE_POST.	ADMINISTRACION
2025-03-17 21:13:13.593964+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	9fa995d9-8933-47d5-b52b-d436af3982b6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_PAYMENT_STATE_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.598552+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	81e05d05-425c-4a65-b37c-2047bce66de7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_STATE_GET.	ADMINISTRACION
2025-03-17 21:13:13.603662+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	2d054643-ae30-48bb-83d5-ecc5ebd40287	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_STATE_POST.	ADMINISTRACION
2025-03-17 21:13:13.609234+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ad30fd8b-54da-4e0a-81a1-f438b2245f2b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ORDER_STATE_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.613489+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0c702653-8505-4d97-844e-d2adee1cb8d9	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PAYMENT_GATEWAY_POST.	ADMINISTRACION
2025-03-17 21:13:13.618091+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	49cfe13a-10b5-4a8f-944b-92d4a8204859	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PRODUCT_GET.	ADMINISTRACION
2025-03-17 21:13:13.624217+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	6243f37c-199d-4945-846a-b08c950ebf26	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PROVINCE_GET.	ADMINISTRACION
2025-03-17 21:13:13.630401+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	126990ad-0f6f-4b8d-a03f-53ca5b0faf67	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PROVINCE_POST.	ADMINISTRACION
2025-03-17 21:13:13.636379+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	23395265-ed27-4262-9936-5378ef55fda5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PROVINCE_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.642431+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	a29061f6-6233-4344-8a61-0335a3a02a94	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PURCHASE_GET.	ADMINISTRACION
2025-03-17 21:13:13.64807+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0a15ee41-27bd-4237-865a-c8f05a319750	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PURCHASE_ITEM_GET.	ADMINISTRACION
2025-03-17 21:13:13.653205+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	d87f35bf-34f9-475c-a772-f6f1c7928109	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PURCHASE_DOCUMENT_POST.	ADMINISTRACION
2025-03-17 21:13:13.657989+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	5018f3a9-9bbc-4f36-b42e-7e3013f0122d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PURCHASE_DOCUMENT_GET.	ADMINISTRACION
2025-03-17 21:13:13.663032+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	9c63966c-63cd-4205-860b-5b7f91ace96d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PURCHASE_DOCUMENT_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.668309+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	44929774-72c2-4be7-b508-ea9de3b2b18d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ROLE_GET.	ADMINISTRACION
2025-03-17 21:13:13.673284+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	c810db68-05ec-4297-886c-1d9e08cd8906	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ROLE_POST.	ADMINISTRACION
2025-03-17 21:13:13.678479+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b49359fc-cb10-4805-b21e-61d2dc0ebc2d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ROLE_PUT.	ADMINISTRACION
2025-03-17 21:13:13.683038+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	88ec6863-dd2a-4c2c-930a-19afc5af6054	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ROLE_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.688171+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	7d83b1d4-1467-4a3d-baf7-50b9ae14f68a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ROLE_ACCESS_GET.	ADMINISTRACION
2025-03-17 21:13:13.693384+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	2ae5cdce-a885-4150-94aa-f87c15e6d49d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ROLE_ACCESS_POST.	ADMINISTRACION
2025-03-17 21:13:13.698279+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	d046b75c-19de-4288-8c30-b649af7d5885	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ROLE_ACCESS_PUT.	ADMINISTRACION
2025-03-17 21:13:13.703402+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	5d9bf24e-4c69-4b61-8270-68cf9eb4161e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO ROLE_ACCESS_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.708399+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	82b2b63a-57e4-4b30-b21f-8a11a8626104	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SALE_CHANNEL_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.71366+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	2cbd1928-776f-4389-84c8-6b7ccb2256fc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SALE_CHANNEL_POST.	ADMINISTRACION
2025-03-17 21:13:13.718488+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b6259f12-e0de-4490-838a-fc7b0489261b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PURCHASE_TYPE_GET.	ADMINISTRACION
2025-03-17 21:13:13.724906+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	c9536b98-2818-4778-9547-63d188241dd0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PURCHASE_TYPE_POST.	ADMINISTRACION
2025-03-17 21:13:13.729527+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1600c0c5-a1ab-453d-a4c7-acab2f922a9d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PURCHASE_PAYMENT_TYPE_GET.	ADMINISTRACION
2025-03-17 21:13:13.734476+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	91bac571-d596-4836-b4cd-041e793e5a36	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PURCHASE_PAYMENT_TYPE_POST.	ADMINISTRACION
2025-03-17 21:13:13.74147+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1dbc53bb-8802-4d93-9709-e4d04fbe839b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO PURCHASE_PAYMENT_TYPE_PUT.	ADMINISTRACION
2025-03-17 21:13:13.748389+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	a0834320-4df4-450a-b2ca-65d7603e6558	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SIZE_GET.	ADMINISTRACION
2025-03-17 21:13:13.754044+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	ff0a94fd-102f-4136-a3ee-ac3c88c03003	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SIZE_POST.	ADMINISTRACION
2025-03-17 21:13:13.75908+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	e292f2dc-e8dc-4caa-a630-705c9f22a66c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SIZE_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.765064+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	da29dba2-38cd-4684-a7bf-a03cb53b960d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SIZE_TYPE_GET.	ADMINISTRACION
2025-03-17 21:13:13.769983+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	9cf43a19-c2b9-48b1-9515-4fffcdbb160d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SIZE_TYPE_POST.	ADMINISTRACION
2025-03-17 21:13:13.77523+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	963a1260-22dc-4091-972e-46731e400f9b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SIZE_TYPE_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.780054+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	8656e763-e052-402c-a902-feafdd0974cd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STOCK_REPLENISHMENT_GET.	ADMINISTRACION
2025-03-17 21:13:13.786351+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1172a907-b306-4a10-b0f0-b339bc0213c6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STOCK_REPLENISHMENT_ITEM_GET.	ADMINISTRACION
2025-03-17 21:13:13.791057+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	bc1fe8ab-cc9c-43f3-8053-8d50b54147a3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STOCK_RETURN_GET.	ADMINISTRACION
2025-03-17 21:13:13.796122+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	253e920e-6335-4a49-ae08-3f3048f65f2e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STOCK_RETURN_ITEM_GET.	ADMINISTRACION
2025-03-17 21:13:13.800606+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b6de3208-25dd-4cb2-b390-d3936f6e2215	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STOCK_TRANSACTION_GET.	ADMINISTRACION
2025-03-17 21:13:13.804985+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	3c5e6cd7-44a3-4228-a9b8-4ffcab09918a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STOCK_TRANSACTION_ITEM_GET.	ADMINISTRACION
2025-03-17 21:13:13.810121+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	dfc59d39-2f4a-41d8-8fb9-fc8c9d52e1c1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STOCK_TRANSACTION_TYPE_GET.	ADMINISTRACION
2025-03-17 21:13:13.816291+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	55c3d725-5436-4a35-ae81-e9516aa11559	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STOCK_TRANSACTION_TYPE_POST.	ADMINISTRACION
2025-03-17 21:13:13.821538+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	a05121e9-efed-444d-a62b-0260792cc783	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STOCK_TRANSFER_GET.	ADMINISTRACION
2025-03-17 21:13:13.826654+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	bdb59093-c898-4d86-975b-484f8c7b24aa	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STOCK_TRANSFER_ITEM_GET.	ADMINISTRACION
2025-03-17 21:13:13.832742+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b9c722b3-e8d6-4633-9d9d-2cfc39bd9465	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO STORE_GET.	ADMINISTRACION
2025-03-17 21:13:13.839748+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	48710c8f-625c-4db2-862a-3203d6195d4a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SUB_CATEGORY_PRODUCT_GET.	ADMINISTRACION
2025-03-17 21:13:13.846278+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	0ce836cd-e23f-47dc-b8ff-1c9dcfa7ba41	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SUB_CATEGORY_PRODUCT_POST.	ADMINISTRACION
2025-03-17 21:13:13.85121+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	34d1d72e-e365-43e3-a83e-a523a94096bf	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SUB_CATEGORY_PRODUCT_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.855754+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	8c515f95-56c2-4174-a355-a79c185078d0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SUB_CATEGORY_PRODUCT_PUT.	ADMINISTRACION
2025-03-17 21:13:13.860772+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	2275ca99-778a-4684-a4a8-bcfc9a9e0141	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SUBSCRIPTION_GET.	ADMINISTRACION
2025-03-17 21:13:13.865663+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	1cbeaf08-07b9-4b08-930e-612a8352d818	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SUBSCRIPTION_POST.	ADMINISTRACION
2025-03-17 21:13:13.870611+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	d1601aad-f69b-4c96-b1fc-d7dd93c7b89f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO SUPPLIER_GET.	ADMINISTRACION
2025-03-17 21:13:13.87568+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	060f8284-d8ab-4a4e-a1bb-d08e6117ab30	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO UNIT_GET.	ADMINISTRACION
2025-03-17 21:13:13.8805+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	6d4a711f-a263-4b4f-9210-f43462ac1b8e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO UNIT_POST.	ADMINISTRACION
2025-03-17 21:13:13.885794+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	34a2042c-2bdc-4c47-b07a-a7e99d78a332	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO UNIT_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.890283+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	d0084c4b-c4ba-4641-aa06-446362e17e85	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO UNIT_TYPE_GET.	ADMINISTRACION
2025-03-17 21:13:13.896446+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	b8b3838d-df5b-4e11-90f4-2a51ba101068	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO UNIT_TYPE_POST.	ADMINISTRACION
2025-03-17 21:13:13.905437+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	fe8a4a58-9065-4c2f-84ef-870a35b6a860	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO UNIT_TYPE_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.913674+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	22f5a6bc-f18a-459d-84e6-c1769722744c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO USER_POST.	ADMINISTRACION
2025-03-17 21:13:13.920687+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	249b79b8-18da-4b6e-ab56-434982927b3a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO USER_PUT.	ADMINISTRACION
2025-03-17 21:13:13.926914+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	a3da7a2b-e660-44fe-8095-c36be40a2dc1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO USER_DELETE.	ADMINISTRACION
2025-03-17 21:13:13.932439+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	f16736c7-ca7a-45b0-827e-c0945cbb9051	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO USER_ROLE_POST.	ADMINISTRACION
2025-03-17 21:13:13.938707+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	123b25c6-3751-4d62-ae1d-3ef22ca0a815	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO WAREHOUSE_GET.	ADMINISTRACION
2025-03-17 21:13:13.945986+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	fc7488e9-3e8f-40bb-a270-b4bac10be325	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL ADMINISTRACION AGREGA ACCESO WAREHOUSE_STOCK_GET.	ADMINISTRACION
2025-03-17 21:13:13.952191+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	5f9c1757-1b66-4043-a0b9-9f1dc241198f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO MÓDULO DE VENTAS.	MÓDULO DE VENTAS
2025-03-17 21:13:13.957941+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	012c3ac7-c312-4a3a-ab41-60bb32dad5d3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO MÓDULO DE GESTIÓN.	MÓDULO DE GESTIÓN
2025-03-17 21:13:13.966575+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	af343db6-6ca8-433d-9e3f-8286ee28d985	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO INTEGRACION CON SHOPIFY.	INTEGRACION CON SHOPIFY
2025-03-17 21:13:13.974434+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	8eded86e-6baf-4d7c-8d4b-c031a1243c18	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO FACTURACIÓN ELECTRONICA.	FACTURACIÓN ELECTRONICA
2025-03-17 21:13:13.983041+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	398abeb5-7e3f-4b64-adc4-9f7cbf73330b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO INTEGRACION CON MARKETPLACE.	INTEGRACION CON MARKETPLACE
2025-03-17 21:13:13.991895+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	1d343f2e-561e-4676-ac73-504b929ae13d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO MODULO DE COURIER.	MODULO DE COURIER
2025-03-17 21:13:14.001964+00	4fe7179c-d752-4125-88fd-cea8ae6e064c	7b1698a0-5dac-4822-b413-af385a4966ac	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUBSCRIPCION MENSUAL CREADO.	MENSUAL
2025-03-17 21:13:14.010817+00	4fe7179c-d752-4125-88fd-cea8ae6e064c	86394ef8-17ca-4683-b0ee-26aca7b88330	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUBSCRIPCION ANUAL CREADO.	ANUAL
2025-03-17 21:13:14.016178+00	0718e9d4-f7c7-49a7-9225-766d7135045d	99aecf07-9efb-4dca-bd4b-949ec656f4b8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORIA JOYAS Y BISUTERIA CREADA.	JOYAS Y BISUTERIA
2025-03-17 21:13:14.021841+00	0718e9d4-f7c7-49a7-9225-766d7135045d	c09cd241-260a-4440-b25c-adb06ffe7cd6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORIA MODA CREADA.	MODA
2025-03-17 21:13:14.02687+00	0718e9d4-f7c7-49a7-9225-766d7135045d	70e426c8-8b20-42c1-824c-97aa7386bba0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORIA TECNOLOGIA CREADA.	TECNOLOGIA
2025-03-17 21:13:14.036214+00	0718e9d4-f7c7-49a7-9225-766d7135045d	3d16e321-c03d-4352-884f-b810f12ff873	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORIA OTRO CREADA.	OTRO
2025-03-17 21:13:14.042317+00	7022ba63-ca35-48ca-bf00-e7c64eaf5f04	81a62ba6-0912-440a-a8e7-d53df477cfc0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE CIERRE WHATSAPP CREADO.	WHATSAPP
2025-03-17 21:13:14.050015+00	7022ba63-ca35-48ca-bf00-e7c64eaf5f04	653245dd-3b81-4fda-8d47-cbb7f65167b7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE CIERRE FACEBOOK CREADO.	FACEBOOK
2025-03-17 21:13:14.054458+00	7022ba63-ca35-48ca-bf00-e7c64eaf5f04	f7d08e52-e191-4fd5-89d2-4a334a0f79ed	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE CIERRE TIENDA CREADO.	TIENDA
2025-03-17 21:13:14.059071+00	7022ba63-ca35-48ca-bf00-e7c64eaf5f04	3171db3f-a306-4a17-8dd8-2a81cf74f744	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE CIERRE WEB CREADO.	WEB
2025-03-17 21:13:14.066559+00	7022ba63-ca35-48ca-bf00-e7c64eaf5f04	f70f36ff-81cc-4494-8e00-72e0aaa36578	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE CIERRE TIK TOK CREADO.	TIK TOK
2025-03-17 21:13:14.074743+00	7022ba63-ca35-48ca-bf00-e7c64eaf5f04	63e1e672-ab20-4cdc-987f-680ead76dbaf	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE CIERRE OTRO CREADO.	OTRO
2025-03-17 21:13:14.078968+00	9c2b798f-5dd3-46da-9765-a27c79ccec54	6b62a573-4c09-4b83-af55-b1f01c7c15c5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE ENTRADA WHATSAPP CREADO.	WHATSAPP
2025-03-17 21:13:14.084426+00	72cf8821-6d10-49f8-ae0f-a54d9c1c7152	71e13caf-9764-449b-95a9-d8df1d8c84b6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TIENDA WOOCOMMERCE CREADO.	WOOCOMMERCE
2025-03-17 21:13:14.086699+00	72cf8821-6d10-49f8-ae0f-a54d9c1c7152	f25fff11-ee6e-4a84-ae5e-678eab3ced55	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TIENDA TIENDADA CREADO.	TIENDADA
2025-03-17 21:13:14.093389+00	72cf8821-6d10-49f8-ae0f-a54d9c1c7152	741f7578-ee45-4e1a-984e-450c25202a5c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TIENDA OTRO CREADO.	OTRO
2025-03-17 21:13:14.10951+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	8f5743c0-b1fc-45d2-b090-a5b36635fb79	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR VERDE CREADO.	VERDE
2025-03-17 21:13:14.118383+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	195808e8-a734-4f2f-87ca-09341adba2ed	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR GRIS CREADO.	GRIS
2025-03-17 21:13:14.121684+00	f209fb42-6aea-47ae-b7d6-70e7577fe0d5	5fe1abad-3e4d-4a0b-afae-0545a1937d0a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TAMAÑO CALZADO CREADO.	CALZADO
2025-03-17 21:13:14.123146+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	70375bf5-7a11-4668-9868-e4d405cceae7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR JADE CREADO.	JADE
2025-03-17 21:13:14.128209+00	f209fb42-6aea-47ae-b7d6-70e7577fe0d5	2a0e24c9-b575-4f08-9c49-2e0b5be55070	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TAMAÑO ACCESORIOS CREADO.	ACCESORIOS
2025-03-17 21:13:14.13306+00	cbf2279d-637a-4b9c-b13b-dc5fa924593e	693d7d68-c6c8-4c92-a628-33411d4f3753	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE UNIDAD ROPA CREADO.	ROPA
2025-03-17 21:13:14.14157+00	cbf2279d-637a-4b9c-b13b-dc5fa924593e	368239ae-374b-4f6e-808e-ae9ad9315854	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE UNIDAD ACCESORIOS CREADO.	ACCESORIOS
2025-03-17 21:13:14.154771+00	759f54f1-5374-4172-804e-56c2fabd8707	ed1392d4-53fa-4fd1-925d-b9c39d129f35	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	UNIDAD UND CREADA.	UND
2025-03-17 21:13:14.162927+00	759f54f1-5374-4172-804e-56c2fabd8707	cf432279-fd3e-425d-bc8d-dfb73a3f54ec	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	UNIDAD PAR CREADA.	PAR
2025-03-17 21:13:14.167392+00	759f54f1-5374-4172-804e-56c2fabd8707	696a6f35-3485-4ec1-88f7-639fe8654d73	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	UNIDAD UND CREADA.	UND
2025-03-17 21:13:14.172078+00	759f54f1-5374-4172-804e-56c2fabd8707	b6187085-3440-4edc-8426-22fcebd87a00	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	UNIDAD UND CREADA.	UND
2025-03-17 21:13:14.180909+00	e4d2c617-4c80-4f09-994b-a2a4fe178d10	96c364f4-41a1-44c5-a5b7-e491a6b59ed1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORIA DE PRODUCTO ROPA CREADA.	ROPA
2025-03-17 21:13:14.191174+00	e4d2c617-4c80-4f09-994b-a2a4fe178d10	0d64b591-ab78-4f9e-8033-c248907a8524	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORIA DE PRODUCTO CALZADO CREADA.	CALZADO
2025-03-17 21:13:14.200179+00	e4d2c617-4c80-4f09-994b-a2a4fe178d10	45eecbc2-1444-4b2d-804d-833b95adc7c3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORIA DE PRODUCTO COMPLEMENTOS CREADA.	COMPLEMENTOS
2025-03-17 21:13:14.20631+00	e4d2c617-4c80-4f09-994b-a2a4fe178d10	aec5079d-5608-491d-bcac-f2639291d01a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CATEGORIA DE PRODUCTO ACCESORIOS CREADA.	ACCESORIOS
2025-03-17 21:13:14.080824+00	9c2b798f-5dd3-46da-9765-a27c79ccec54	fa2fb7f3-fbe4-413e-a154-ea7597bd1e25	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE ENTRADA TIKTOK CREADO.	TIKTOK
2025-03-17 21:13:14.08173+00	9c2b798f-5dd3-46da-9765-a27c79ccec54	80c54135-f70a-41cc-84e5-9799d135c5a6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE ENTRADA FACEBOOK CREADO.	FACEBOOK
2025-03-17 21:13:14.082857+00	9c2b798f-5dd3-46da-9765-a27c79ccec54	0e4cbdee-741c-4b68-bc3f-f80a0a1c7c68	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE ENTRADA INSTAGRAM CREADO.	INSTAGRAM
2025-03-17 21:13:14.083017+00	72cf8821-6d10-49f8-ae0f-a54d9c1c7152	02348fdd-af42-4650-8772-e496f9347d5d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TIENDA SHOPIFY CREADO.	SHOPIFY
2025-03-17 21:13:14.085107+00	9c2b798f-5dd3-46da-9765-a27c79ccec54	7ad90cc4-7136-454c-b6e5-2765261b0e27	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE ENTRADA OTRO CREADO.	OTRO
2025-03-17 21:13:14.085106+00	9c2b798f-5dd3-46da-9765-a27c79ccec54	f83c416c-e102-45c7-af45-83569559fb63	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE ENTRADA WEB CREADO.	WEB
2025-03-17 21:13:14.112092+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	f1a55a87-4362-4df5-8c1d-d0318a22d4a9	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR NEGRO CREADO.	NEGRO
2025-03-17 21:13:14.112087+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	aa931dbf-7b7c-40e0-a45c-91ee784c6aa2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR HUESO CREADO.	HUESO
2025-03-17 21:13:14.112087+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	e43f2403-7ad6-4068-8ed5-bcff2ada7646	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR PERLA CREADO.	PERLA
2025-03-17 21:13:14.112087+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	8be36327-e559-43bf-8b95-eb9f58c342dd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR BEIGE CREADO.	BEIGE
2025-03-17 21:13:14.113034+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	ea1ae3fb-d7af-467a-b186-963540e6078d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR BLANCO CREADO.	BLANCO
2025-03-17 21:13:14.113864+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	218fa400-31e4-4370-ab1c-577d33e5233b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR NUDE CREADO.	NUDE
2025-03-17 21:13:14.114804+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	c34fe4cb-5109-4a5d-8c3b-809f0a84eff0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR VINO CREADO.	VINO
2025-03-17 21:13:14.11863+00	f209fb42-6aea-47ae-b7d6-70e7577fe0d5	36bdfaaf-0e29-464f-bd56-793125e449a8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TAMAÑO ROPA CREADO.	ROPA
2025-03-17 21:13:14.124596+00	f209fb42-6aea-47ae-b7d6-70e7577fe0d5	f2879265-f552-46c8-8a37-ac8bce98b875	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TAMAÑO COMPLEMENTOS CREADO.	COMPLEMENTOS
2025-03-17 21:13:14.124777+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	99a3b7fb-e50c-4182-a48d-9fdd92c4589c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR NARANJA CREADO.	NARANJA
2025-03-17 21:13:14.125303+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	82498887-6875-4115-a6a5-5a044c0cfc43	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR COMBINADO CREADO.	COMBINADO
2025-03-17 21:13:14.125822+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	760e144a-87ad-4642-8452-f9c853ebd980	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR ACERO CREADO.	ACERO
2025-03-17 21:13:14.126022+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	c9e58605-c854-45ac-9342-c0e00af69905	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR AMARILLO CREADO.	AMARILLO
2025-03-17 21:13:14.126022+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	cb6def83-a743-4ba6-b67e-7ac7f94b3551	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR AZUL CREADO.	AZUL
2025-03-17 21:13:14.57485+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	5d11cc16-5c39-48e4-aadd-a92353f7a306	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO C CREADO.	C
2025-03-17 21:13:14.580228+00	efcb215f-36fb-482c-b8b2-2310ed86d654	55471c41-9d25-4f2b-a1db-8da682623961	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO PAGADO CREADO.	PAGADO
2025-03-17 21:13:14.580758+00	efcb215f-36fb-482c-b8b2-2310ed86d654	864a3631-60fa-4b52-8b16-ab5c9ba9809e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO ENTREGADO CREADO.	ENTREGADO
2025-03-17 21:13:14.581811+00	efcb215f-36fb-482c-b8b2-2310ed86d654	1061d639-55d3-4960-9fd3-9fde66db99c3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO NO HAY STOCK CREADO.	NO HAY STOCK
2025-03-17 21:13:14.58276+00	efcb215f-36fb-482c-b8b2-2310ed86d654	4c11c84c-e282-4b16-9670-3452b12083ff	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO RESERVADO CREADO.	RESERVADO
2025-03-17 21:13:14.583562+00	efcb215f-36fb-482c-b8b2-2310ed86d654	3f0a1edb-7e42-491e-82ef-d96378538c1c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO FALLIDO CREADO.	FALLIDO
2025-03-17 21:13:14.583672+00	efcb215f-36fb-482c-b8b2-2310ed86d654	e66e1998-be60-4175-bff9-86c2d0815bb1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO PREPARADO CREADO.	PREPARADO
2025-03-17 21:13:14.585216+00	efcb215f-36fb-482c-b8b2-2310ed86d654	5b2e6847-0a82-4f9a-9f1d-f3e4469387f2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO PENDIENTE CREADO.	PENDIENTE
2025-03-17 21:13:14.590844+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	4d55a817-d8c3-42a4-9e6d-d5b5c5d6481c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA MP FALLABELA CREADO.	MP FALLABELA
2025-03-17 21:13:14.591142+00	efcb215f-36fb-482c-b8b2-2310ed86d654	2a088983-67c5-487c-ae46-10205b2c5548	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO DEVOLUCION CREADO.	DEVOLUCION
2025-03-17 21:13:14.592026+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	f71713a6-2264-4b74-b0ac-9170a178e7cc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA IG ARANNI CREADO.	IG ARANNI
2025-03-17 21:13:14.595584+00	efcb215f-36fb-482c-b8b2-2310ed86d654	3a43e60d-a862-43d1-ad08-a94276dbea55	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO LLAMADO CREADO.	LLAMADO
2025-03-17 21:13:14.595992+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	e88be51f-67d0-4027-a77a-d74b18317dff	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA IG KUNCA CREADO.	IG KUNCA
2025-03-17 21:13:14.5971+00	15b67fac-d1ab-463a-8155-0ac0e632c96f	a43166d0-0e5b-4817-9099-1ee017b41be0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PAGO DE PEDIDO POR RECAUDAR CREADO.	POR RECAUDAR
2025-03-17 21:13:14.597542+00	15b67fac-d1ab-463a-8155-0ac0e632c96f	c555d515-de26-4b62-b767-f673bbc3362e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PAGO DE PEDIDO RECAUDADO CREADO.	RECAUDADO
2025-03-17 21:13:14.597981+00	15b67fac-d1ab-463a-8155-0ac0e632c96f	90d78ef9-ef1e-4801-82e0-9f08e632b11b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PAGO DE PEDIDO PERDIDA CREADO.	PERDIDA
2025-03-17 21:13:14.6458+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	f336b263-fde3-40a0-b053-3e77940a94ad	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA LIVE SHOPPING KUNCA CREADO.	LIVE SHOPPING KUNCA
2025-03-17 21:13:14.651575+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	95b2f1bd-90c7-4c2d-a3f0-9924a6c0cc2c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO EFECTIVO CREADO.	EFECTIVO
2025-03-17 21:13:14.651575+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	d7600097-1604-4d40-a001-3e9d0c65b889	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO LINK CREADO.	LINK
2025-03-17 21:13:14.652576+00	04b7b029-3b52-49c5-b4bf-8d6b937aa53d	f488f00b-b949-48d2-b5b2-ea33f87f076f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE GESTION PREVENTA CREADO.	PREVENTA
2025-03-17 21:13:14.652568+00	04b7b029-3b52-49c5-b4bf-8d6b937aa53d	ecfd590c-a317-4261-aac8-dd322d42adc7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE GESTION VENTA CREADO.	VENTA
2025-03-17 21:13:14.652361+00	04b7b029-3b52-49c5-b4bf-8d6b937aa53d	122914b5-612f-4dd7-9ffd-9d71591e998f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE GESTION RECUPERO CREADO.	RECUPERO
2025-03-17 21:13:14.663362+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	be74dfdd-12aa-4b18-a9fc-e320a7fc883d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RAZON DE CANCELACION DEMORA EN ENTREGA CREADA .	DEMORA EN ENTREGA
2025-03-17 21:13:14.665659+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	9d023ba2-5e7f-4244-bac2-216f263b5cc5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO CANJE CREADO.	CANJE
2025-03-17 21:13:14.665659+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	33239945-c8b8-4908-a4fc-cb117591822b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO PLIN CREADO.	PLIN
2025-03-17 21:13:14.667008+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	2cf02bbe-a6aa-4d4c-a7f3-3e571a548876	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO BCP CREADO.	BCP
2025-03-17 21:13:14.667008+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	12006aeb-ed11-4551-aaed-0f256d55df60	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO CONTRAENTREGA CREADO.	CONTRAENTREGA
2025-03-17 21:13:14.698639+00	269a6efb-0b79-4019-ab8a-ab0f8ac6eb67	acbd2a02-fa3a-4c8a-9d90-16f42370d92c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PASARELA DE PAGO DEMO CREADA.	DEMO
2025-03-17 21:13:14.699574+00	35de4f53-aa01-4316-9be2-33ed1f4568dd	6d23da5b-53eb-43b8-aba3-8062796dcda5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE CLIENTE MAYORISTA CREADO.	MAYORISTA
2025-03-17 21:13:14.699556+00	29eadb77-a4a1-4c19-9b4f-51c4dbcd5ab3	cbe1be1f-d199-4ff7-88b3-93171a8b23e6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE MEMBRESIA EXPIRADA CREADO.	EXPIRADA
2025-03-17 21:13:14.699983+00	269a6efb-0b79-4019-ab8a-ab0f8ac6eb67	c45f01af-7b8e-40d4-aadf-bb619fa3b6ff	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PASARELA DE PAGO MERCADO PAGO CREADA.	MERCADO PAGO
2025-03-17 21:13:14.704445+00	382d8b14-ee36-4fae-b8d9-5f67ac02f7b0	971e12f5-f79e-40db-b43f-ff6fbc7de194	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DESCUENTO PORCENTAJE CREADO.	PORCENTAJE
2025-03-17 21:13:14.950042+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	e6145bd8-c243-4cb0-b1eb-ccc3257a1126	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR PLATA QUEMADA CREADO.	PLATA QUEMADA
2025-03-17 21:13:14.95108+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	e2927f2b-8fe2-479f-9833-19461658fa81	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR ROSADO CREADO.	ROSADO
2025-03-17 21:13:14.952445+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	d7765221-5ff1-43cd-ba06-8e6a951350d2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR FUCSIA CREADO.	FUCSIA
2025-03-17 21:13:14.954579+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	2dbe3e24-6933-448c-9868-be75004787d3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR LACRE CREADO.	LACRE
2025-03-17 21:13:14.960095+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	f12582f4-1790-4ac1-be41-30039ec06557	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR MELON CREADO.	MELON
2025-03-17 21:13:14.101919+00	72cf8821-6d10-49f8-ae0f-a54d9c1c7152	68941f7e-05cc-4610-ba8e-34e254d6514e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TIENDA PRESTASHOP CREADO.	PRESTASHOP
2025-03-17 21:13:14.112087+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	a3bbf8d8-a181-49ea-9e57-cc62d84f5b55	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR ROJO CREADO.	ROJO
2025-03-17 21:13:14.123553+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	5e4a3be8-2d83-40f4-996e-9dc83bdd94a0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR MORADO CREADO.	MORADO
2025-03-17 21:13:14.57961+00	efcb215f-36fb-482c-b8b2-2310ed86d654	50caccbf-c67b-43c1-a7d3-f34698b07f93	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO LLAMAR CREADO.	LLAMAR
2025-03-17 21:13:14.582595+00	efcb215f-36fb-482c-b8b2-2310ed86d654	72d20af6-7725-43a4-bdb3-fc266a5e0861	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO PENDIENTE DE STOCK CREADO.	PENDIENTE DE STOCK
2025-03-17 21:13:14.594442+00	efcb215f-36fb-482c-b8b2-2310ed86d654	206b7a2b-87c3-45c4-a01d-3e5f823d8e6c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO EN RUTA CREADO.	EN RUTA
2025-03-17 21:13:14.604306+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	4e199d13-f7d2-4a04-b70e-3a630d02b284	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA VENTA B2B CREADO.	VENTA B2B
2025-03-17 21:13:14.613315+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	bdb33fd5-c550-4b38-a2a7-86ddc79899c1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA MP RIPLEY CREADO.	MP RIPLEY
2025-03-17 21:13:14.653019+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	9d33636f-b9d9-49d2-9536-458a85e47db0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO POS CREADO.	POS
2025-03-17 21:13:14.655677+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	b404da86-062e-41ab-b565-c082e6f4816d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO YAPE CREADO.	YAPE
2025-03-17 21:13:14.664798+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	c700084a-773a-4286-acdb-9c5bf05756cc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RAZON DE CANCELACION MALA CALIDAD CREADA .	MALA CALIDAD
2025-03-17 21:13:14.670081+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	46976c0f-47b3-4d33-bbfd-3a788604ee8e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RAZON DE CANCELACION SE LE DAÑO EL PRODUCTO - 30 DIAS CREADA .	SE LE DAÑO EL PRODUCTO - 30 DIAS
2025-03-17 21:13:14.698663+00	29eadb77-a4a1-4c19-9b4f-51c4dbcd5ab3	43af37df-4ecb-4388-b73c-c63864b67296	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE MEMBRESIA ACTIVA CREADO.	ACTIVA
2025-03-17 21:13:14.964785+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	6d1126cc-259e-4dbf-a797-7283084e5eb1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR MOSTAZA CREADO.	MOSTAZA
2025-03-17 21:13:14.217702+00	cc531fea-a431-4953-a93f-b256e1f77f42	1fefdd6a-04a1-40dc-bcfe-64759c5e2b42	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO BLUSA CREADA.	BLUSA
2025-03-17 21:13:14.227216+00	cc531fea-a431-4953-a93f-b256e1f77f42	235d607c-f638-44f1-b6b4-201b5e86cc07	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO CAMISA CREADA.	CAMISA
2025-03-17 21:13:14.237026+00	cc531fea-a431-4953-a93f-b256e1f77f42	fadb8b52-67f5-4ef1-b352-567568c1e9ba	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO VESTIDO CREADA.	VESTIDO
2025-03-17 21:13:14.246163+00	cc531fea-a431-4953-a93f-b256e1f77f42	1724c92a-631b-4257-bb77-c9f3e2308954	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO SACO CREADA.	SACO
2025-03-17 21:13:14.257586+00	cc531fea-a431-4953-a93f-b256e1f77f42	581df30d-7e03-40b6-9b9d-7b286fd34af6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO SHORT CREADA.	SHORT
2025-03-17 21:13:14.267486+00	cc531fea-a431-4953-a93f-b256e1f77f42	f1440c0f-649b-4e4e-87d1-c74e2cd499dc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO PANTALON_SASTRE CREADA.	PANTALON_SASTRE
2025-03-17 21:13:14.276616+00	cc531fea-a431-4953-a93f-b256e1f77f42	6488a39e-597f-4cb3-804d-08f183a94be2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO BLAZER CREADA.	BLAZER
2025-03-17 21:13:14.285338+00	cc531fea-a431-4953-a93f-b256e1f77f42	ee3a36e2-cfb0-4791-b70a-b089a2c4998e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO CHALECO CREADA.	CHALECO
2025-03-17 21:13:14.293651+00	cc531fea-a431-4953-a93f-b256e1f77f42	b670ab1d-3924-43cf-a01a-0b4c2dad8195	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO POLO CREADA.	POLO
2025-03-17 21:13:14.302644+00	cc531fea-a431-4953-a93f-b256e1f77f42	8199bae1-77a8-4341-af53-9a4cbafb4306	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO VESTIDO_SHORT CREADA.	VESTIDO_SHORT
2025-03-17 21:13:14.308221+00	cc531fea-a431-4953-a93f-b256e1f77f42	c35c890f-133c-46c3-96c4-6927a2978b27	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO FALDA CREADA.	FALDA
2025-03-17 21:13:14.313365+00	cc531fea-a431-4953-a93f-b256e1f77f42	323fb261-9530-4024-988f-3acdb5f8b5f1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO HOODIES CREADA.	HOODIES
2025-03-17 21:13:14.318728+00	cc531fea-a431-4953-a93f-b256e1f77f42	4055e03a-1306-4003-bf4b-f8b738ba338c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO CHOMPAS CREADA.	CHOMPAS
2025-03-17 21:13:14.324089+00	cc531fea-a431-4953-a93f-b256e1f77f42	e0c4ab26-6b42-4368-8758-6525184e9a78	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO PANTALON_DENIM CREADA.	PANTALON_DENIM
2025-03-17 21:13:14.329194+00	cc531fea-a431-4953-a93f-b256e1f77f42	3346e937-3300-470e-aafb-06e1d5e1248a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO PANTALONES CREADA.	PANTALONES
2025-03-17 21:13:14.333709+00	cc531fea-a431-4953-a93f-b256e1f77f42	1d8da333-9715-4487-bb22-f16f6a96395e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO TOPS CREADA.	TOPS
2025-03-17 21:13:14.338559+00	cc531fea-a431-4953-a93f-b256e1f77f42	662fa0cb-9ed0-42c3-8a71-01538d88949b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO ENTERIZOS CREADA.	ENTERIZOS
2025-03-17 21:13:14.34437+00	cc531fea-a431-4953-a93f-b256e1f77f42	9a6641f3-9702-4653-8db4-736c47c57fba	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO BOLSOS CREADA.	BOLSOS
2025-03-17 21:13:14.350996+00	cc531fea-a431-4953-a93f-b256e1f77f42	3add223a-cb96-4efc-a3cc-b6b01c2efa3b	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO CARTERAS CREADA.	CARTERAS
2025-03-17 21:13:14.356329+00	cc531fea-a431-4953-a93f-b256e1f77f42	c3e132bc-f227-48d6-b2a4-a91e5ef17d28	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO GORRAS CREADA.	GORRAS
2025-03-17 21:13:14.36292+00	cc531fea-a431-4953-a93f-b256e1f77f42	68c8f36e-7f61-4bd0-b66d-91c21861254f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO MOCHILAS CREADA.	MOCHILAS
2025-03-17 21:13:14.368271+00	cc531fea-a431-4953-a93f-b256e1f77f42	ec50dc49-83c0-45d9-aee7-d3b18277e709	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO BILLETERAS CREADA.	BILLETERAS
2025-03-17 21:13:14.373866+00	cc531fea-a431-4953-a93f-b256e1f77f42	ee8db032-bcc0-4ca5-abf5-1acadf3f0817	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO BOTIN_ALTO CREADA.	BOTIN_ALTO
2025-03-17 21:13:14.378601+00	cc531fea-a431-4953-a93f-b256e1f77f42	116bd172-dee3-40f7-b48d-63cf31c35b3d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO BOTIN_BAJO CREADA.	BOTIN_BAJO
2025-03-17 21:13:14.384113+00	cc531fea-a431-4953-a93f-b256e1f77f42	31856838-b226-495e-874f-16f8b4d445bd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO ZAPATILLAS CREADA.	ZAPATILLAS
2025-03-17 21:13:14.393911+00	cc531fea-a431-4953-a93f-b256e1f77f42	1535ff17-6570-4501-b7d2-57baac748d40	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO OXFORD CREADA.	OXFORD
2025-03-17 21:13:14.403867+00	cc531fea-a431-4953-a93f-b256e1f77f42	c5b71d82-be07-456c-8c28-1043f5626fa2	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO BALERINAS CREADA.	BALERINAS
2025-03-17 21:13:14.41336+00	cc531fea-a431-4953-a93f-b256e1f77f42	891e7775-c9d4-4034-b825-7c0b115dfa84	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO SANDALIAS_PLANAS CREADA.	SANDALIAS_PLANAS
2025-03-17 21:13:14.421913+00	cc531fea-a431-4953-a93f-b256e1f77f42	b7c97b16-3beb-4cf8-a27c-35c388551880	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO PLATAFORMAS CREADA.	PLATAFORMAS
2025-03-17 21:13:14.428291+00	cc531fea-a431-4953-a93f-b256e1f77f42	b051d03d-e66b-479a-8ea7-eaf265b26f92	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO SANDALIAS CREADA.	SANDALIAS
2025-03-17 21:13:14.433923+00	cc531fea-a431-4953-a93f-b256e1f77f42	5e672346-550d-4fcc-aec9-837f4a335f46	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO SANDALIAS_CON_TACO CREADA.	SANDALIAS_CON_TACO
2025-03-17 21:13:14.439021+00	cc531fea-a431-4953-a93f-b256e1f77f42	4a879828-026d-4940-8bc1-996528c8d5e1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO CHUNKIS CREADA.	CHUNKIS
2025-03-17 21:13:14.445416+00	cc531fea-a431-4953-a93f-b256e1f77f42	c2af7bf9-62f8-46b6-9a0f-6ee9ef821016	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO ALPAGARTAS CREADA.	ALPAGARTAS
2025-03-17 21:13:14.451462+00	cc531fea-a431-4953-a93f-b256e1f77f42	a1338b9c-3e9c-43fc-80af-67a8d9c0ac1c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO MULES CREADA.	MULES
2025-03-17 21:13:14.457337+00	cc531fea-a431-4953-a93f-b256e1f77f42	948dcf88-9d1e-4d18-8ee2-7f7a763ac251	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO BABUCHA CREADA.	BABUCHA
2025-03-17 21:13:14.462986+00	cc531fea-a431-4953-a93f-b256e1f77f42	0dfb8a75-fda7-4ba3-981c-a0a182d3148d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO BOTAS CREADA.	BOTAS
2025-03-17 21:13:14.467914+00	cc531fea-a431-4953-a93f-b256e1f77f42	c7076f9c-67af-440a-89b0-5fb3270a9a36	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO STILETTO CREADA.	STILETTO
2025-03-17 21:13:14.472529+00	cc531fea-a431-4953-a93f-b256e1f77f42	46e970ff-b18c-4a0e-9ec3-2f5aded49d3d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO SUECOS CREADA.	SUECOS
2025-03-17 21:13:14.477992+00	cc531fea-a431-4953-a93f-b256e1f77f42	9bec8eea-2ef1-4b93-9c33-47adcfa136eb	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO MOCASIN CREADA.	MOCASIN
2025-03-17 21:13:14.483683+00	cc531fea-a431-4953-a93f-b256e1f77f42	e475b647-dc03-4714-a4bb-f3398af9e678	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO ZAPATILLAS_URBANAS CREADA.	ZAPATILLAS_URBANAS
2025-03-17 21:13:14.489296+00	cc531fea-a431-4953-a93f-b256e1f77f42	5002cbde-28d8-4b18-9b21-2dba0e89cd4e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	SUB CATEGORIA DE PRODUCTO ACCESORIOS CREADA.	ACCESORIOS
2025-03-17 21:13:14.495691+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	06ef3d9f-1020-4595-a5ce-e7e6d6710dbc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO XS CREADO.	XS
2025-03-17 21:13:14.500865+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	40486ec9-5639-4d3e-bddb-3586f09f2948	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO S CREADO.	S
2025-03-17 21:13:14.507193+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	f6c04bfb-2ef2-4d27-b6f6-ddd8330dd7de	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO L CREADO.	L
2025-03-17 21:13:14.513654+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	9b687a55-7bc0-40ff-a360-43b24a770ed5	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO M CREADO.	M
2025-03-17 21:13:14.518949+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	5f26d59f-d02d-4ed1-9d2d-9703baabc9d4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO XL CREADO.	XL
2025-03-17 21:13:14.524518+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	99e10cde-9eb7-40d0-9267-170818a1dd7d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO XXL CREADO.	XXL
2025-03-17 21:13:14.530153+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	2c7a4fc6-5284-46bd-8064-56cc3cdec611	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO 35 CREADO.	35
2025-03-17 21:13:14.537057+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	a3b858c5-1120-498a-9a55-c15e08051860	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO 36 CREADO.	36
2025-03-17 21:13:14.543051+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	aa45d58e-90a5-482b-8343-b448e09954d6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO 37 CREADO.	37
2025-03-17 21:13:14.548457+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	cdc04400-33fb-4ef6-9a52-2cf664ab3a01	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO 38 CREADO.	38
2025-03-17 21:13:14.553969+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	459b24d9-6732-4878-ad7b-2afade501469	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO 39 CREADO.	39
2025-03-17 21:13:14.559646+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	0883969d-3808-4902-9274-5e0095ea175f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO 40 CREADO.	40
2025-03-17 21:13:14.565304+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	b19109a4-7a3c-4d0b-83bb-71bf159f1953	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO A CREADO.	A
2025-03-17 21:13:14.620672+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	c04a21c0-14e8-4f89-b514-004eaa59e66d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA MERCADO LIBRE CREADO.	MERCADO LIBRE
2025-03-17 21:13:14.594821+00	efcb215f-36fb-482c-b8b2-2310ed86d654	e9acb229-38e4-4c28-9118-e94a8116379e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE PEDIDO AGENDADO CREADO.	AGENDADO
2025-03-17 21:13:14.662854+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	2fee156f-5903-4864-8a37-8c08b1e4e523	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO CAMBIO CREADO.	CAMBIO
2025-03-17 21:13:14.66507+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	94d498d0-0aca-4a81-8c5f-52b28978c388	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO PLATAFORMA MP/WEB CREADO.	PLATAFORMA MP/WEB
2025-03-17 21:13:14.700756+00	382d8b14-ee36-4fae-b8d9-5f67ac02f7b0	8eaa4424-2392-4a62-96f6-283a29b58fe4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DESCUENTO MONTO CREADO.	MONTO
2025-03-17 21:13:14.958234+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	ad05b456-9835-445d-9ebb-b5d82aff5416	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR LILA CREADO.	LILA
2025-03-17 21:13:14.625939+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	edeb173b-8cf9-46fc-9124-a62c85e17ad0	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA MP YAPE CREADO.	MP YAPE
2025-03-17 21:13:14.6333+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	08e625f1-8cb5-4f39-a081-5c3eed4de468	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	CANAL DE VENTA WEB ARANNI.PE CREADO.	WEB ARANNI.PE
2025-03-17 21:13:14.651576+00	04b7b029-3b52-49c5-b4bf-8d6b937aa53d	44b8c2ce-5e31-4764-ad4a-2e15ba12813e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE GESTION CANJE CREADO.	CANJE
2025-03-17 21:13:14.653787+00	04b7b029-3b52-49c5-b4bf-8d6b937aa53d	200c2688-6b89-415f-9526-b294516b2119	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE GESTION RESERVA CREADO.	RESERVA
2025-03-17 21:13:14.661144+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	8a5f5a48-caf8-4fc5-b75a-f2bf3efddb75	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RAZON DE CANCELACION NO HAY STOCK CREADA .	NO HAY STOCK
2025-03-17 21:13:14.667008+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	3259af71-7c07-415e-8279-833c97eef2ec	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	METODO DE PAGO BANCO DE LA NACION CREADO.	BANCO DE LA NACION
2025-03-17 21:13:14.67403+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	6c494944-26a2-4aa3-b844-dd456fa415d8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RAZON DE CANCELACION OTROS MOTIVOS CREADA .	OTROS MOTIVOS
2025-03-17 21:13:14.68135+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	9cf43958-a32a-40d4-8fc4-77ee7c724412	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RAZON DE CANCELACION ZONA PELIGROSA CREADA .	ZONA PELIGROSA
2025-03-17 21:13:14.68787+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	a774e576-fcc4-4865-a466-4f0fddff854d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RAZON DE CANCELACION ROBO POR MOTORIZADO CREADA .	ROBO POR MOTORIZADO
2025-03-17 21:13:14.698519+00	29eadb77-a4a1-4c19-9b4f-51c4dbcd5ab3	e81b9636-eb61-4ee1-b367-db4dd49e3e96	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ESTADO DE MEMBRESIA PAGADA CREADO.	PAGADA
2025-03-17 21:13:14.707506+00	382d8b14-ee36-4fae-b8d9-5f67ac02f7b0	1cccff44-e770-4d98-b011-9180f1dd4bbb	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DESCUENTO NO APLICA CREADO.	NO APLICA
2025-03-17 21:13:14.713367+00	54aaf521-ea36-4db3-bc82-07c7cc97a737	7305a24f-e715-4b60-9a8f-f807b8e99137	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PUNTO DE ENTREGA LIMA CREADO.	LIMA
2025-03-17 21:13:14.720982+00	54aaf521-ea36-4db3-bc82-07c7cc97a737	e08ef545-9694-4389-afca-1dd251d58614	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PUNTO DE ENTREGA PROVINCIA CREADO.	PROVINCIA
2025-03-17 21:13:14.731935+00	cf5ab96b-f971-4014-a451-894992095b39	b867ed4e-b0fb-4f26-a232-8768d94f37ca	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TRANSACCION INGRESO CREADO.	INGRESO
2025-03-17 21:13:14.740294+00	cf5ab96b-f971-4014-a451-894992095b39	6e2b4c6d-7174-42b1-9f29-f96d057c80bf	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIPO DE TRANSACCION GUIA-COURIER CREADO.	GUIA-COURIER
2025-03-17 21:13:14.828324+00	ac5897b3-1941-40f2-af79-cdce8b773a11	d9e021a8-3727-48d2-b290-d84e98870833	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ROL NEGOCIO PARA USUARIO JROMERO CREADO.	JROMERO
2025-03-17 21:13:14.837462+00	67bd7a43-54a0-46b0-8049-851fdaf13729	91a79435-9ddb-451c-a1b8-136fb196f02e	9e1ca542-d718-4058-83d0-abf62b73f8d1	218d8bb1-3f43-4170-9776-9adb6d7db6ed	TIENDA SHOPIFY AGREGADA.	SHOPIFY
2025-03-17 21:13:14.844354+00	98327b97-c38f-4726-8dc4-9e52153e1e99	8719684d-c199-482e-ae20-2fd17ac6bc88	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	EMPRESA DE COURIER SIN EMPRESA CREADA.	SIN EMPRESA
2025-03-17 21:13:14.855015+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	60957b87-0abc-4dbb-b5d4-5039ce3cf295	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TAMAÑO PSZ CREADO.	PSZ
2025-03-17 21:13:14.860666+00	67bd7a43-54a0-46b0-8049-851fdaf13729	585a9fbb-1b69-4529-8350-3321b6473e15	9e1ca542-d718-4058-83d0-abf62b73f8d1	218d8bb1-3f43-4170-9776-9adb6d7db6ed	TIENDA ARANNI AGREGADA.	ARANNI
2025-03-17 21:13:14.866616+00	67bd7a43-54a0-46b0-8049-851fdaf13729	f38e8d67-a242-4c4a-ba70-e20604b9dccd	9e1ca542-d718-4058-83d0-abf62b73f8d1	218d8bb1-3f43-4170-9776-9adb6d7db6ed	TIENDA KUNCA AGREGADA.	KUNCA
2025-03-17 21:13:14.877616+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	efa3e009-eb04-4733-ae30-2abb5fa03cf1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO BELLAVISTA CREADO.	BELLAVISTA
2025-03-17 21:13:14.884779+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	f88c4f2e-40e9-49ad-a875-a9c83892974d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO COMAS CREADO.	COMAS
2025-03-17 21:13:14.890798+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	4514ebd3-0ae7-4b4a-af4a-4298f695d82f	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO INDEPENDENCIA CREADO.	INDEPENDENCIA
2025-03-17 21:13:14.898078+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	5ee6a347-a0a5-47b7-a9fb-a246191a94d3	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO LA VICTORIA CREADO.	LA VICTORIA
2025-03-17 21:13:14.910025+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	d326dc66-6864-4d8f-8399-86d1997d1345	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO MIRAFLORES CREADO.	MIRAFLORES
2025-03-17 21:13:14.917741+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	f7c54ea7-a016-4b5f-97cf-2dee62a96dfc	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO PUEBLO LIBRE CREADO.	PUEBLO LIBRE
2025-03-17 21:13:14.924621+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	6ce57bc7-9788-4e93-bc0c-25d19dbe28a1	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO SAN ISIDRO CREADO.	SAN ISIDRO
2025-03-17 21:13:14.930227+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	bf517923-9f79-48fc-a968-500a2849cf19	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO SAN LUIS CREADO.	SAN LUIS
2025-03-17 21:13:14.935813+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	24549b0d-2b4b-49e7-9e7f-ee1cf77ca73d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO SAN MIGUEL CREADO.	SAN MIGUEL
2025-03-17 21:13:14.949982+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	7f02377d-d140-4bf7-8dc8-bb8b28ee0dac	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR DORADO CREADO.	DORADO
2025-03-17 21:13:14.958601+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	aa67b615-c15e-45b7-9c3d-fad02fafb08a	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR PRINT CREADO.	PRINT
2025-03-17 21:13:14.965123+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	6de9229f-4431-4980-a477-65aa8ce92ffa	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR CHOCOLATE CREADO.	CHOCOLATE
2025-03-17 21:13:14.972861+00	4257d20d-c784-4f1a-9424-b3435351c148	9babe489-cda1-4db4-a6de-cc50d4e3fb29	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MARCA ADIDAS CREADA.	ADIDAS
2025-03-17 21:13:14.978109+00	4257d20d-c784-4f1a-9424-b3435351c148	adc1979d-2563-4ae8-98bc-d4bcbf6fcdf6	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MARCA NIKE CREADA.	NIKE
2025-03-17 21:13:14.983125+00	4257d20d-c784-4f1a-9424-b3435351c148	9c036721-fdb2-4f26-9e44-78f54e32c651	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MARCA GUCCI CREADA.	GUCCI
2025-03-17 21:13:14.990549+00	4257d20d-c784-4f1a-9424-b3435351c148	0f890bed-34f3-461b-a4c3-afa72e7c33f7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MARCA ZARA CREADA.	ZARA
2025-03-17 21:13:15.000185+00	ac969df3-5803-4243-8816-7b77c6e7f656	bd88979f-b2fb-47b6-aafa-df7cd8f66014	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODELO AIR FORCE 1 CREADO.	AIR FORCE 1
2025-03-17 21:13:15.008373+00	ac969df3-5803-4243-8816-7b77c6e7f656	ef515756-98f6-4fe2-8c43-266f7e36f502	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	MODELO SUPERSTAR CREADO.	SUPERSTAR
2025-03-17 21:13:14.962684+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	65437321-91b0-40af-8410-61beeb90d7cd	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	DISTRITO SALAMANCA CREADO.	SALAMANCA
2025-03-17 21:13:14.967333+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	60abb315-221e-43b7-a2aa-30c5da0ac828	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR VERDE PERA CREADO.	VERDE PERA
2025-03-17 21:13:14.969148+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	2754d794-5c45-4fb7-81a5-bf34f07b2443	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COLOR VERDE LORO CREADO.	VERDE LORO
2025-03-17 21:52:53.722751+00	172596c2-4dd1-46e6-9b7e-ba042ffafa46	e055d33a-1e99-4582-9afc-4cbffb4fa13e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PRECIO 12.0 DE PRODUCTO DE MARKETING AX001AC001ACCAR001ZBLAA AGREGADO.	AX001AC001ACCAR001ZBLAA
2025-03-17 21:52:55.882552+00	044d0dac-92c2-4c00-82e2-0802c4e88c45	3b3c7a4d-1e87-47dd-bb45-52d9461280ca	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	FOTOS (1) DE PRODUCTO DE MARKETING AGREGADAS.	AX001AC001ACCAR001ZBLAA
2025-03-17 21:52:56.048661+00	63fe946b-9270-4c84-bff9-03fc512a4820	292addce-ac6c-480f-a32b-9b030d5748b8	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO DE MARKETING 931FC955-4613-404A-AF2D-4459241D8F8D CREADO.	931FC955-4613-404A-AF2D-4459241D8F8D
2025-03-17 21:52:59.423388+00	253e7699-b0ff-4c31-bfcc-ad2c6eb1fe39	063e7b59-56fe-4fa8-a639-5c3dd323c5bf	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COMPRADOR IGOR/929417416 CREADO.	929417416
2025-03-17 21:53:03.219105+00	98327b97-c38f-4726-8dc4-9e52153e1e99	c7230f3d-aa95-49cc-9ae3-668ca7d0884d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	EMPRESA DE COURIER GNIUS COMPANY CREADA.	GNIUS COMPANY
2025-03-17 21:53:06.956662+00	72b8dc69-5102-47c0-b1ca-27df51c12688	2590e960-27e0-4e70-9521-66926d498ade	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COURIER CAPIBARA CREADO.	CAPIBARA
2025-03-17 21:53:22.632371+00	72b8dc69-5102-47c0-b1ca-27df51c12688	8443aba0-5854-4bba-910f-838d5fdded82	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	COURIER SIN COURIER CREADO.	SIN COURIER
2025-03-17 21:57:47.150629+00	67bd7a43-54a0-46b0-8049-851fdaf13729	dcb1d681-5c19-4aa7-8213-66504d5547c4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	TIENDA GNIUS AGREGADA.	GNIUS
2025-03-17 22:51:52.850575+00	d14d8660-112d-4e38-8ce7-1c1980942ad8	53f5a2fb-1b1b-4fb9-9241-cd40920459e4	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO AX001AC001ACCAR001ZBLAA DE PEDIDO 2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D CON 2 UNIDADES AGREGADO.	2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D
2025-03-17 22:51:55.724651+00	618622a5-c84e-4371-a90c-b897d6945e90	eb831595-2efb-488e-8977-11c14212e1ce	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	RECIBO DE PAGO PARA PEDIDO 2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D AGREGADA.	2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D
2025-03-17 22:51:56.0258+00	8098b8ef-40ed-4ba8-94fd-d85c1cb9ec15	ad2a9075-9ddd-451c-b583-f123494536ba	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PEDIDO 2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D CREADO.	2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D
2025-03-17 22:58:14.522554+00	bff0c4a4-a20a-47d2-a2a0-f5bd032599a7	4680b552-6109-442a-a977-b122af031a6e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	USUARIO JROMERO INICIO SESION.	JROMERO
2025-03-17 22:58:54.860173+00	5622ec6d-01b6-46bf-845e-b05c6a75f3ca	7fd4ab76-7f37-460b-aa7b-ce151483ab97	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO PRODUCTO1 CREADO POR EXCEL.	PRODUCTO1
2025-03-17 22:58:54.868615+00	5622ec6d-01b6-46bf-845e-b05c6a75f3ca	c2518246-dca1-4df9-9b91-60f0b2bdb746	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO PRODUCTO2 CREADO POR EXCEL.	PRODUCTO2
2025-03-17 22:58:54.878636+00	5622ec6d-01b6-46bf-845e-b05c6a75f3ca	2f14cd3e-7468-467e-b95a-768c39ed431e	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO PRODUCTO3 CREADO POR EXCEL.	PRODUCTO3
2025-03-17 22:58:54.887717+00	5622ec6d-01b6-46bf-845e-b05c6a75f3ca	e07a4902-d012-49f9-a963-28765c03e46c	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO PRODUCTO4 CREADO POR EXCEL.	PRODUCTO4
2025-03-17 23:42:59.648965+00	d14d8660-112d-4e38-8ce7-1c1980942ad8	12753617-7879-449e-80ed-2d7b2ab21803	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO NX001AC001ACCNC001CSMARA DE PEDIDO 2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D CON 2 UNIDADES.	2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D
2025-03-17 23:44:02.522023+00	d14d8660-112d-4e38-8ce7-1c1980942ad8	d9a9309c-90c5-434f-afbf-319219a4a27d	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO NX001AC001ACCNC001CSMARA DE PEDIDO 2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D CON 2 UNIDADES.	2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D
2025-03-17 23:44:04.202402+00	d14d8660-112d-4e38-8ce7-1c1980942ad8	0a8ca463-f4f1-45e4-b9dd-96ad2221a8c7	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO NX001AC001ACCNC001CSMARA DE PEDIDO 2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D CON 2 UNIDADES.	2CEFD59C-8B42-4EB2-B2C2-6F6CD7251D8D
\.


--
-- Data for Name: audit_event; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.audit_event (status, registration_date, update_date, audit_event_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:10.4805+00	2025-03-17 21:13:10.480511+00	457cd27a-a3f7-4dd5-9cbc-89b981e27785	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ACCESS
t	2025-03-17 21:13:10.488214+00	2025-03-17 21:13:10.488221+00	5c4ddf9f-b529-4eff-9d2a-0aae0ef9bf5b	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_BRAND
t	2025-03-17 21:13:10.497301+00	2025-03-17 21:13:10.497309+00	9064b71a-b350-4439-9945-056e364501a6	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_CANCELLATION_REASON
t	2025-03-17 21:13:10.505231+00	2025-03-17 21:13:10.505239+00	457f9b88-af3d-443d-9357-5f1af29a3f87	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_CATEGORY
t	2025-03-17 21:13:10.512471+00	2025-03-17 21:13:10.512482+00	f5019bce-7a3c-4767-a35d-e554f1467060	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_CATEGORY_PRODUCT
t	2025-03-17 21:13:10.519589+00	2025-03-17 21:13:10.519594+00	8debaa01-c945-4521-ab84-940b9e712c3c	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_CLIENT
t	2025-03-17 21:13:10.527949+00	2025-03-17 21:13:10.527954+00	f57b4627-9c50-4905-aa06-3672a86c645d	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_CLOSING_CHANNEL
t	2025-03-17 21:13:10.535155+00	2025-03-17 21:13:10.53516+00	1484c163-7b54-421a-b816-d2f0ce3d8b11	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_COLOR
t	2025-03-17 21:13:10.540414+00	2025-03-17 21:13:10.540417+00	d85f3721-78cd-46cc-97b8-20c27853dff8	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_COURIER
t	2025-03-17 21:13:10.545204+00	2025-03-17 21:13:10.545207+00	4ab7ca15-3fee-432b-8cc0-8f957ae1a475	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_CUSTOMER_TYPE
t	2025-03-17 21:13:10.550169+00	2025-03-17 21:13:10.550173+00	8de1d0e6-fb06-456f-b7e9-1fb50e18ade3	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_DELIVERY_COMPANY
t	2025-03-17 21:13:10.556918+00	2025-03-17 21:13:10.556923+00	8cd1789c-eb15-4090-a438-fd1669ea86cf	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_DELIVERY_POINT
t	2025-03-17 21:13:10.564555+00	2025-03-17 21:13:10.564561+00	16ac1858-2df8-46b2-a371-76aea67fb5c4	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_DELIVERY_STATUS
t	2025-03-17 21:13:10.571022+00	2025-03-17 21:13:10.571027+00	eb6bb1ec-5eca-477f-a495-f17a99af3314	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_DELIVERY_MANIFEST_STATUS
t	2025-03-17 21:13:10.576428+00	2025-03-17 21:13:10.576431+00	1bf0887d-be16-4d09-92e1-62a792b0bca5	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_DEPARTMENT
t	2025-03-17 21:13:10.580897+00	2025-03-17 21:13:10.5809+00	a953634c-82d0-44ca-b330-853476dfafd9	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_DISTRICT
t	2025-03-17 21:13:10.58531+00	2025-03-17 21:13:10.585317+00	43f1960f-2a35-477d-b2e5-79832b313c00	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_DEMO_ACCOUNT
t	2025-03-17 21:13:10.591544+00	2025-03-17 21:13:10.591549+00	bedb61d7-3849-4081-afbb-06e8637fb13e	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ENTRY_CHANNEL
t	2025-03-17 21:13:10.597633+00	2025-03-17 21:13:10.597636+00	6e91d80b-b1c5-4d59-9a98-937376f42326	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_MANAGEMENT_TYPE
t	2025-03-17 21:13:10.602828+00	2025-03-17 21:13:10.602832+00	0c1f6605-ea61-47c8-a21a-93a62e3be8c9	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_MEMBERSHIP_STATE
t	2025-03-17 21:13:10.608672+00	2025-03-17 21:13:10.608678+00	b52c1540-60d5-4f2c-8e79-f35b44f030b5	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_MODEL
t	2025-03-17 21:13:10.614062+00	2025-03-17 21:13:10.614066+00	cf6a32f3-1202-4c21-8d3b-50ab054ebf04	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_MODULE
t	2025-03-17 21:13:10.620073+00	2025-03-17 21:13:10.620077+00	38cfbc9b-3191-4c85-9f0b-c817b03f21ba	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ORDER_PAYMENT_METHOD
t	2025-03-17 21:13:10.626752+00	2025-03-17 21:13:10.626756+00	482be235-afef-43d7-81ef-c8b2a24d5600	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ORDER_PAYMENT_STATE
t	2025-03-17 21:13:10.632525+00	2025-03-17 21:13:10.632529+00	e48dca36-4ba0-4be7-9b51-87d660b5d57a	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ORDER_RETURN_ITEM
t	2025-03-17 21:13:10.639089+00	2025-03-17 21:13:10.639093+00	fc1a49f9-5320-4682-8434-8f197fb50089	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ORDER_RETURN_TYPE
t	2025-03-17 21:13:10.644979+00	2025-03-17 21:13:10.644987+00	a02ee79b-30b2-49e2-9644-31043672dc9b	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ORDER_STATE
t	2025-03-17 21:13:10.652064+00	2025-03-17 21:13:10.652072+00	17aeb9d6-7391-4c20-bc1d-3d7efc68602d	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ORDER_STOCK_ITEM
t	2025-03-17 21:13:10.658883+00	2025-03-17 21:13:10.658887+00	341e2ceb-cf9d-4c87-adc5-48652d506e79	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_PAYMENT_GATEWAY
t	2025-03-17 21:13:10.666057+00	2025-03-17 21:13:10.666064+00	8e3421ad-014a-4c12-96ba-6e0368859696	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_PRODUCT
t	2025-03-17 21:13:10.671965+00	2025-03-17 21:13:10.671969+00	d3dd71cd-db8a-4fb8-862e-3fa1d02275ac	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_PURCHASE_DOCUMENT
t	2025-03-17 21:13:10.677518+00	2025-03-17 21:13:10.677522+00	149a8e2a-1e38-4504-93b1-171d450431d4	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_PURCHASE_ITEM
t	2025-03-17 21:13:10.682795+00	2025-03-17 21:13:10.682799+00	be062a10-042e-45da-884f-847e3a864953	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_PROVINCE
t	2025-03-17 21:13:10.688091+00	2025-03-17 21:13:10.6881+00	94ffe1c3-76d5-4379-aec3-e0685975f733	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ROLE
t	2025-03-17 21:13:10.694896+00	2025-03-17 21:13:10.694904+00	218990e6-326c-4629-ad2b-5cf4cf0a7bc7	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ROLE_ACCESS
t	2025-03-17 21:13:10.700786+00	2025-03-17 21:13:10.700789+00	555ad2a8-1b16-43e9-be67-348c93481c63	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_SALE_CHANNEL
t	2025-03-17 21:13:10.706372+00	2025-03-17 21:13:10.706376+00	96a12e98-4f9e-4d60-841c-b5a9b73174eb	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_PURCHASE_TYPE
t	2025-03-17 21:13:10.711832+00	2025-03-17 21:13:10.711836+00	bb2d7fa8-2360-4ed4-af53-05c601b4d1c9	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_PURCHASE_PAYMENT_TYPE
t	2025-03-17 21:13:10.716634+00	2025-03-17 21:13:10.716637+00	098baeec-f3e9-4c8e-8e66-dcbf68b52a9b	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_SIZE
t	2025-03-17 21:13:10.722207+00	2025-03-17 21:13:10.72221+00	253baf3a-43d0-4760-8813-8ef16c1109ea	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_SIZE_TYPE
t	2025-03-17 21:13:10.727556+00	2025-03-17 21:13:10.72756+00	694da52e-dcca-4371-9902-496a84f9db15	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_STOCK_REPLENISHMENT_ITEM
t	2025-03-17 21:13:10.733041+00	2025-03-17 21:13:10.733044+00	ae069812-2fc5-4497-a595-b089df9764ea	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_STOCK_TRANSACTION_TYPE
t	2025-03-17 21:13:10.73834+00	2025-03-17 21:13:10.738344+00	85024ccb-8a4f-4d85-84f4-51140232a240	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_STORE
t	2025-03-17 21:13:10.743702+00	2025-03-17 21:13:10.743706+00	5deb7350-fbde-4c7c-8a49-886724d969a5	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_STORE_TYPE
t	2025-03-17 21:13:10.748124+00	2025-03-17 21:13:10.748127+00	0207dd96-4f49-4680-865e-97776eb5a3d5	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_SUBSCRIPTION
t	2025-03-17 21:13:10.752377+00	2025-03-17 21:13:10.75238+00	90669148-ba2e-4f2f-993a-a9a31fcd263b	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_SUB_CATEGORY_PRODUCT
t	2025-03-17 21:13:10.756595+00	2025-03-17 21:13:10.756598+00	88aea706-6b3b-49f1-85f0-024a068f7499	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_SUPPLIER
t	2025-03-17 21:13:10.760045+00	2025-03-17 21:13:10.760047+00	b79e784c-07dc-4ee7-ae3b-9ee8dbdb140e	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_SUPPLIER_PRODUCT
t	2025-03-17 21:13:10.763403+00	2025-03-17 21:13:10.763405+00	f2bfa3c1-8a8e-4b4b-a576-b5d6cd631859	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_SUPPLIER_TYPE
t	2025-03-17 21:13:10.767024+00	2025-03-17 21:13:10.767026+00	8072562a-6a32-40a6-976b-93bafdd44e07	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_UNIT
t	2025-03-17 21:13:10.770121+00	2025-03-17 21:13:10.770125+00	e72a6ca6-0ef8-49de-b042-bd3df7a1b5a9	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_UNIT_TYPE
t	2025-03-17 21:13:10.773982+00	2025-03-17 21:13:10.773985+00	8c2f0d75-d8cf-4734-9e25-a914b81574f9	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_USER
t	2025-03-17 21:13:10.777653+00	2025-03-17 21:13:10.777656+00	74b379ce-b187-4c9a-bb59-32dc059080f1	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_USER_ROLE
t	2025-03-17 21:13:10.78142+00	2025-03-17 21:13:10.781423+00	02578518-c5e2-4dc7-82a2-664c54760d63	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_WAREHOUSE
t	2025-03-17 21:13:10.785398+00	2025-03-17 21:13:10.785401+00	91ae7147-578c-41f2-b36a-d6618d16a71b	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_WAREHOUSE_OUTPUT
t	2025-03-17 21:13:10.789158+00	2025-03-17 21:13:10.78916+00	2f038dd9-6ff8-4ba2-b178-3c831fba6e27	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_WAREHOUSE_OUTPUT_ITEM
t	2025-03-17 21:13:10.792312+00	2025-03-17 21:13:10.792314+00	6405f252-eb4e-45ce-8914-e04787d9986c	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ACCESS
t	2025-03-17 21:13:10.795515+00	2025-03-17 21:13:10.795516+00	4257d20d-c784-4f1a-9424-b3435351c148	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_BRAND
t	2025-03-17 21:13:10.798814+00	2025-03-17 21:13:10.798817+00	35bf0367-7d27-450e-9ee2-d0b88ada1c75	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_CANCELLATION_REASON
t	2025-03-17 21:13:10.803265+00	2025-03-17 21:13:10.803269+00	a1c35364-dea6-4814-a0e8-bbcec1d4ecca	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_CANCELLED_ORDER
t	2025-03-17 21:13:10.807489+00	2025-03-17 21:13:10.807493+00	0718e9d4-f7c7-49a7-9225-766d7135045d	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_CATEGORY
t	2025-03-17 21:13:10.81277+00	2025-03-17 21:13:10.812773+00	e4d2c617-4c80-4f09-994b-a2a4fe178d10	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_CATEGORY_PRODUCT
t	2025-03-17 21:13:10.818904+00	2025-03-17 21:13:10.818909+00	7022ba63-ca35-48ca-bf00-e7c64eaf5f04	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_CLOSING_CHANNEL
t	2025-03-17 21:13:10.82503+00	2025-03-17 21:13:10.825033+00	ab6f45f8-94e2-4026-aa94-eb25719ff3cd	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_COLOR
t	2025-03-17 21:13:10.829059+00	2025-03-17 21:13:10.829067+00	7393d709-7e1f-400c-afa2-178ee97f0c9d	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_COUNTRY
t	2025-03-17 21:13:10.836904+00	2025-03-17 21:13:10.836908+00	72b8dc69-5102-47c0-b1ca-27df51c12688	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_COURIER
t	2025-03-17 21:13:10.842663+00	2025-03-17 21:13:10.842666+00	81d56fa5-e915-478b-a878-a9011001755b	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_COURIER_PICTURE
t	2025-03-17 21:13:10.847147+00	2025-03-17 21:13:10.84715+00	253e7699-b0ff-4c31-bfcc-ad2c6eb1fe39	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_CUSTOMER
t	2025-03-17 21:13:10.851814+00	2025-03-17 21:13:10.851818+00	35de4f53-aa01-4316-9be2-33ed1f4568dd	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_CUSTOMER_TYPE
t	2025-03-17 21:13:10.857095+00	2025-03-17 21:13:10.857099+00	54aaf521-ea36-4db3-bc82-07c7cc97a737	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_DELIVERY_POINT
t	2025-03-17 21:13:10.863515+00	2025-03-17 21:13:10.863519+00	98327b97-c38f-4726-8dc4-9e52153e1e99	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_DELIVERY_COMPANY
t	2025-03-17 21:13:10.869464+00	2025-03-17 21:13:10.869469+00	471373eb-a58f-43f9-aa88-752c2512a54f	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_DELIVERY_MANIFEST
t	2025-03-17 21:13:10.875646+00	2025-03-17 21:13:10.87565+00	f78a1ea8-1e39-4c86-938a-71d6a6fe2880	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_DELIVERY_MANIFEST_ITEM
t	2025-03-17 21:13:10.88178+00	2025-03-17 21:13:10.881784+00	28d7e75c-0a14-4828-b04c-755e4b29dd5f	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_DELIVERY_STATUS
t	2025-03-17 21:13:10.888194+00	2025-03-17 21:13:10.888198+00	96ba5190-fd0a-46ce-aaf0-8004ad388473	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_DELIVERY_MANIFEST_STATUS
t	2025-03-17 21:13:10.89344+00	2025-03-17 21:13:10.893443+00	767584f4-6711-4d03-b597-ea933ac5b8a3	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_DEPARTMENT
t	2025-03-17 21:13:10.901356+00	2025-03-17 21:13:10.901362+00	382d8b14-ee36-4fae-b8d9-5f67ac02f7b0	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_DISCOUNT
t	2025-03-17 21:13:10.907412+00	2025-03-17 21:13:10.907421+00	7ae175bc-02fb-44af-9bb2-4c09dd25a842	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_DISTRICT
t	2025-03-17 21:13:10.91222+00	2025-03-17 21:13:10.912222+00	9c2b798f-5dd3-46da-9765-a27c79ccec54	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ENTRY_CHANNEL
t	2025-03-17 21:13:10.91716+00	2025-03-17 21:13:10.917162+00	36519605-dad5-4a78-8ab1-9414b5ef6b3b	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_GENERAL_STOCK
t	2025-03-17 21:13:10.92397+00	2025-03-17 21:13:10.923973+00	04b7b029-3b52-49c5-b4bf-8d6b937aa53d	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_MANAGEMENT_TYPE
t	2025-03-17 21:13:10.931219+00	2025-03-17 21:13:10.931227+00	91720731-e403-49ef-8815-d39cda1ee28f	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_MEMBERSHIP
t	2025-03-17 21:13:10.938011+00	2025-03-17 21:13:10.938017+00	2d50aa7f-5e1f-4ebf-8052-3ab70b97e005	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_MEMBERSHIP_PAYMENT
t	2025-03-17 21:13:10.94445+00	2025-03-17 21:13:10.944455+00	29eadb77-a4a1-4c19-9b4f-51c4dbcd5ab3	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_MEMBERSHIP_STATE
t	2025-03-17 21:13:10.951546+00	2025-03-17 21:13:10.951548+00	c9e2235a-c1eb-40dc-80e2-1166daac697c	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_MERCADO_PAGO_PAYMENT
t	2025-03-17 21:13:10.95859+00	2025-03-17 21:13:10.958593+00	ac969df3-5803-4243-8816-7b77c6e7f656	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_MODEL
t	2025-03-17 21:13:10.965268+00	2025-03-17 21:13:10.965275+00	b5bc68e2-75bc-4885-91e2-ea894e4522e6	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_MODULE
t	2025-03-17 21:13:10.971703+00	2025-03-17 21:13:10.971706+00	8098b8ef-40ed-4ba8-94fd-d85c1cb9ec15	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER
t	2025-03-17 21:13:10.979563+00	2025-03-17 21:13:10.979569+00	db8164b8-6b5e-47f8-8a69-3ae802030524	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_CONTACTED
t	2025-03-17 21:13:10.98724+00	2025-03-17 21:13:10.987263+00	d14d8660-112d-4e38-8ce7-1c1980942ad8	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_ITEM
t	2025-03-17 21:13:10.996563+00	2025-03-17 21:13:10.996567+00	fa71704c-097f-4fe3-a1a5-35d28db12e28	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_PAYMENT_METHOD
t	2025-03-17 21:13:11.004657+00	2025-03-17 21:13:11.00466+00	618622a5-c84e-4371-a90c-b897d6945e90	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_PAYMENT_RECEIPT
t	2025-03-17 21:13:11.009555+00	2025-03-17 21:13:11.009558+00	15b67fac-d1ab-463a-8155-0ac0e632c96f	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_PAYMENT_STATE
t	2025-03-17 21:13:11.017393+00	2025-03-17 21:13:11.017403+00	d7aab05b-bdd8-47ad-8cfb-79cfcddaf4d0	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_RETURN
t	2025-03-17 21:13:11.025198+00	2025-03-17 21:13:11.025202+00	80a48174-c790-4fbd-b21d-70583bc4d8e6	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_RETURN_ITEM
t	2025-03-17 21:13:11.030658+00	2025-03-17 21:13:11.030662+00	7bd8c91b-17bd-4c2b-b672-d574c4ae50b2	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_RETURN_EXCEL
t	2025-03-17 21:13:11.039424+00	2025-03-17 21:13:11.039432+00	a058be60-cb86-4866-bb2a-8fb89c435fce	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_RETURN_TYPE
t	2025-03-17 21:13:11.047006+00	2025-03-17 21:13:11.047011+00	efcb215f-36fb-482c-b8b2-2310ed86d654	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_STATE
t	2025-03-17 21:13:11.054659+00	2025-03-17 21:13:11.054668+00	7e13809b-2739-4a7e-9ce4-8daf9296a45b	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_STOCK
t	2025-03-17 21:13:11.064219+00	2025-03-17 21:13:11.064224+00	efa4b7e1-9459-4781-8cb2-99e2d42ac86e	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_STOCK_EXCEL
t	2025-03-17 21:13:11.070847+00	2025-03-17 21:13:11.070854+00	c0140289-63f9-4401-80de-2f21e6b99304	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ORDER_STOCK_ITEM
t	2025-03-17 21:13:11.076381+00	2025-03-17 21:13:11.076388+00	269a6efb-0b79-4019-ab8a-ab0f8ac6eb67	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PAYMENT_GATEWAY
t	2025-03-17 21:13:11.08389+00	2025-03-17 21:13:11.083895+00	63fe946b-9270-4c84-bff9-03fc512a4820	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PRODUCT
t	2025-03-17 21:13:11.09158+00	2025-03-17 21:13:11.091586+00	5622ec6d-01b6-46bf-845e-b05c6a75f3ca	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PRODUCT_EXCEL
t	2025-03-17 21:13:11.097961+00	2025-03-17 21:13:11.097963+00	044d0dac-92c2-4c00-82e2-0802c4e88c45	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PRODUCT_PICTURE
t	2025-03-17 21:13:11.105462+00	2025-03-17 21:13:11.105472+00	172596c2-4dd1-46e6-9b7e-ba042ffafa46	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PRODUCT_PRICE
t	2025-03-17 21:13:11.113568+00	2025-03-17 21:13:11.113577+00	d667b15e-6656-4970-979e-6988c24f9f51	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PROVINCE
t	2025-03-17 21:13:11.123273+00	2025-03-17 21:13:11.123278+00	173c35dc-2bd9-4d45-beb8-1201efd6a0b7	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PURCHASE
t	2025-03-17 21:13:11.129236+00	2025-03-17 21:13:11.129265+00	37861918-d8de-4580-b788-adda181d6713	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PURCHASE_DOCUMENT
t	2025-03-17 21:13:11.137835+00	2025-03-17 21:13:11.137843+00	1146bcb7-9f4d-4b0c-8a9a-107a4b2f24b3	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PURCHASE_EXCEL
t	2025-03-17 21:13:11.146451+00	2025-03-17 21:13:11.14646+00	8c28e55b-cf57-4e39-b71c-ddcd189ef428	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PURCHASE_ITEM
t	2025-03-17 21:13:11.15529+00	2025-03-17 21:13:11.155298+00	169e5931-5197-4f5d-b8df-7bbaecf78f46	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PURCHASE_PAYMENT_TYPE
t	2025-03-17 21:13:11.166447+00	2025-03-17 21:13:11.166449+00	c3d0299c-c2d2-4acf-ab22-966d7c95517c	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ROLE
t	2025-03-17 21:13:11.175188+00	2025-03-17 21:13:11.175193+00	a13b15b3-bd21-4686-b2c0-95b0e25516a1	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_ROLE_ACCESS
t	2025-03-17 21:13:11.182071+00	2025-03-17 21:13:11.182073+00	a54e4286-bedf-486d-b0d1-b155e1cf03fb	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_SALE_CHANNEL
t	2025-03-17 21:13:11.189578+00	2025-03-17 21:13:11.189584+00	bcc4ce2f-3252-4b6c-b2bc-2c573fe58fc3	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_PURCHASE_TYPE
t	2025-03-17 21:13:11.198677+00	2025-03-17 21:13:11.198686+00	f3ee36d7-5f65-437b-9c4e-726b390c8d48	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_SIZE
t	2025-03-17 21:13:11.206443+00	2025-03-17 21:13:11.206448+00	f209fb42-6aea-47ae-b7d6-70e7577fe0d5	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_SIZE_TYPE
t	2025-03-17 21:13:11.213555+00	2025-03-17 21:13:11.213558+00	44717716-0eaf-4617-a599-0ca4320f3979	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_REPLENISHMENT_EXCEL
t	2025-03-17 21:13:11.220722+00	2025-03-17 21:13:11.220725+00	ab4e42ac-32f7-4bca-8d35-b6c175e98e89	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_RETURN_EXCEL
t	2025-03-17 21:13:11.226301+00	2025-03-17 21:13:11.226304+00	6b17fd25-7981-4354-b83d-6abdbb1b0ddc	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_TRANSFER_EXCEL
t	2025-03-17 21:13:11.231634+00	2025-03-17 21:13:11.231639+00	b803a35c-0d9a-46e7-be59-b17693297c40	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_REPLENISHMENT
t	2025-03-17 21:13:11.237186+00	2025-03-17 21:13:11.237189+00	992c77fa-28d1-4f46-926d-5e4052140404	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_REPLENISHMENT_ITEM
t	2025-03-17 21:13:11.242074+00	2025-03-17 21:13:11.242077+00	a96c9edb-c7a3-435e-a201-edd8ebc7a714	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_RETURN
t	2025-03-17 21:13:11.248254+00	2025-03-17 21:13:11.24826+00	e9631b01-2ca3-4dba-9dd5-56ce333b89de	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_RETURN_ITEM
t	2025-03-17 21:13:11.255724+00	2025-03-17 21:13:11.255731+00	14d5b994-913c-4254-8c44-993eebb0bd6b	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_TRANSACTION
t	2025-03-17 21:13:11.26273+00	2025-03-17 21:13:11.26274+00	4245ce66-f453-45f0-a25d-21dc73e2b5d4	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_TRANSACTION_ITEM
t	2025-03-17 21:13:11.270917+00	2025-03-17 21:13:11.27092+00	cf5ab96b-f971-4014-a451-894992095b39	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_TRANSACTION_TYPE
t	2025-03-17 21:13:11.278044+00	2025-03-17 21:13:11.278049+00	56926b01-a60c-4390-ba04-5832fab50fd2	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_TRANSFER
t	2025-03-17 21:13:11.285373+00	2025-03-17 21:13:11.285377+00	8dcd7fb8-8110-4f29-9e27-e5787736b723	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STOCK_TRANSFER_ITEM
t	2025-03-17 21:13:11.291223+00	2025-03-17 21:13:11.291228+00	67bd7a43-54a0-46b0-8049-851fdaf13729	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STORE
t	2025-03-17 21:13:11.296066+00	2025-03-17 21:13:11.296069+00	72cf8821-6d10-49f8-ae0f-a54d9c1c7152	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_STORE_TYPE
t	2025-03-17 21:13:11.300357+00	2025-03-17 21:13:11.30036+00	4fe7179c-d752-4125-88fd-cea8ae6e064c	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_SUBSCRIPTION
t	2025-03-17 21:13:11.304035+00	2025-03-17 21:13:11.304038+00	cc531fea-a431-4953-a93f-b256e1f77f42	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_SUB_CATEGORY_PRODUCT
t	2025-03-17 21:13:11.308307+00	2025-03-17 21:13:11.30831+00	061542a4-2a05-4764-9b0b-f5e5d9d31cd0	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_SUPPLIER
t	2025-03-17 21:13:11.313497+00	2025-03-17 21:13:11.3135+00	14aa77c2-8be9-4464-93f0-1437b9adb2dc	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_SUPPLIER_PRODUCT
t	2025-03-17 21:13:11.318817+00	2025-03-17 21:13:11.31882+00	87931afa-2954-41c9-975e-d52727473948	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_SUPPLIER_PRODUCT_EXCEL
t	2025-03-17 21:13:11.324988+00	2025-03-17 21:13:11.324991+00	b2e59b0f-f69d-4792-ac9d-87b41f00c44d	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_SUPPLIER_TYPE
t	2025-03-17 21:13:11.32978+00	2025-03-17 21:13:11.329787+00	759f54f1-5374-4172-804e-56c2fabd8707	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_UNIT
t	2025-03-17 21:13:11.335488+00	2025-03-17 21:13:11.335491+00	cbf2279d-637a-4b9c-b13b-dc5fa924593e	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_UNIT_TYPE
t	2025-03-17 21:13:11.341497+00	2025-03-17 21:13:11.341501+00	7f2f55f9-9556-4546-abfb-a08643aaf02e	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_USER
t	2025-03-17 21:13:11.347331+00	2025-03-17 21:13:11.347339+00	ac5897b3-1941-40f2-af79-cdce8b773a11	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_USER_ROLE
t	2025-03-17 21:13:11.353703+00	2025-03-17 21:13:11.353706+00	93a0fb4d-8d5d-4650-b2e7-a04ae9055ba0	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_WAREHOUSE
t	2025-03-17 21:13:11.358881+00	2025-03-17 21:13:11.358884+00	51207d2c-9e93-49fb-9306-f34026cc3a2b	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_WAREHOUSE_OUTPUT
t	2025-03-17 21:13:11.364884+00	2025-03-17 21:13:11.364887+00	d2447a39-8a14-4cbd-8dc6-e503dd48dbec	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_WAREHOUSE_OUTPUT_ITEM
t	2025-03-17 21:13:11.37104+00	2025-03-17 21:13:11.371044+00	fa3c5c21-ff0b-41be-9325-f2561b8292a9	2f363ce3-e629-42d7-8bb2-7892307e0275	ADD_WAREHOUSE_STOCK
t	2025-03-17 21:13:11.377376+00	2025-03-17 21:13:11.377379+00	26a83d9d-530c-4921-a066-6569e468bd0c	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ACCESS
t	2025-03-17 21:13:11.383008+00	2025-03-17 21:13:11.383014+00	8ccf7277-96c5-4ff5-80f5-a270e311e605	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_BRAND
t	2025-03-17 21:13:11.388376+00	2025-03-17 21:13:11.388377+00	d0526052-2321-4203-baf3-a6984d0c8f63	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_CANCELLATION_REASON
t	2025-03-17 21:13:11.392189+00	2025-03-17 21:13:11.39219+00	074eede3-4e92-4cee-99b2-32fd2c5c7836	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_CATEGORY
t	2025-03-17 21:13:11.397998+00	2025-03-17 21:13:11.398001+00	62de92c5-13cf-467b-8fec-5ae6ab7e6fa8	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_CATEGORY_PRODUCT
t	2025-03-17 21:13:11.404052+00	2025-03-17 21:13:11.404056+00	f806d462-a064-4d26-96d6-d8ed354204c6	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_CLIENT
t	2025-03-17 21:13:11.410108+00	2025-03-17 21:13:11.410117+00	738425bd-f982-4633-b821-f519ea993626	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_CLOSING_CHANNEL
t	2025-03-17 21:13:11.416023+00	2025-03-17 21:13:11.416027+00	005d38ba-56fe-4850-a501-0e5a3758cacf	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_COLOR
t	2025-03-17 21:13:11.421143+00	2025-03-17 21:13:11.421146+00	f09bc7fb-46bb-4890-b8d2-2c9df47362e7	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_COURIER
t	2025-03-17 21:13:11.425484+00	2025-03-17 21:13:11.425487+00	d509c6cf-f549-4fcf-8e17-2b6d1b390f22	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_CUSTOMER_TYPE
t	2025-03-17 21:13:11.429973+00	2025-03-17 21:13:11.429977+00	c66c4774-6be4-42fc-8776-4fc5e3aae0ce	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_DELIVERY_COMPANY
t	2025-03-17 21:13:11.434874+00	2025-03-17 21:13:11.434877+00	74330361-d5a4-4a2e-8411-7bf8d0aa674c	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_DELIVERY_MANIFEST
t	2025-03-17 21:13:11.439216+00	2025-03-17 21:13:11.43922+00	a0db5e99-794e-4822-9caa-786049bd7edf	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_DELIVERY_POINT
t	2025-03-17 21:13:11.444383+00	2025-03-17 21:13:11.444387+00	de76df97-816a-41a0-b4e8-d3a567cf7d3d	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_DELIVERY_STATUS
t	2025-03-17 21:13:11.450294+00	2025-03-17 21:13:11.450297+00	d399e893-b837-4434-bc67-07b9051f9f99	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_DELIVERY_MANIFEST_STATUS
t	2025-03-17 21:13:11.456086+00	2025-03-17 21:13:11.456092+00	3ecc911d-b632-4f69-85c3-fd9359098b97	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_DEPARTMENT
t	2025-03-17 21:13:11.462387+00	2025-03-17 21:13:11.462391+00	ebc5c105-19c2-4ba5-8b98-a32d7db5180e	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_DISTRICT
t	2025-03-17 21:13:11.468452+00	2025-03-17 21:13:11.468457+00	88c6efb6-212f-4438-97fd-2cbe18923f0f	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ENTRY_CHANNEL
t	2025-03-17 21:13:11.475027+00	2025-03-17 21:13:11.475031+00	30b5ebc7-57ff-49e9-a1fb-f9ebdeb09efe	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_GENERAL_STOCK
t	2025-03-17 21:13:11.481138+00	2025-03-17 21:13:11.481144+00	2ca9c924-a469-4c6f-97db-1e2e585b618b	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_MANAGEMENT_TYPE
t	2025-03-17 21:13:11.487682+00	2025-03-17 21:13:11.487686+00	42f386d9-662b-4152-9c7c-bce4e0345b9e	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_MEMBERSHIP
t	2025-03-17 21:13:11.493461+00	2025-03-17 21:13:11.493465+00	e4a5bd0a-66ec-4977-9fc3-07a08e1e1634	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_MEMBERSHIP_STATE
t	2025-03-17 21:13:11.499445+00	2025-03-17 21:13:11.49945+00	2c718541-a2bd-4e29-ba99-5edd3a68de0b	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_MODEL
t	2025-03-17 21:13:11.504669+00	2025-03-17 21:13:11.504672+00	b37fd5ab-84a5-4fcd-8341-6ad92ed4f19a	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_MODULE
t	2025-03-17 21:13:11.510366+00	2025-03-17 21:13:11.510374+00	6f4f1ddd-a172-465d-bd29-a77192633c64	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ORDER_ITEM
t	2025-03-17 21:13:11.517287+00	2025-03-17 21:13:11.517291+00	12f0b755-6726-408b-9daa-7f725a39e8df	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ORDER_PAYMENT_METHOD
t	2025-03-17 21:13:11.522922+00	2025-03-17 21:13:11.522925+00	94874f95-568f-4788-9f77-0781ec6ec37a	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ORDER_PAYMENT_STATE
t	2025-03-17 21:13:11.528143+00	2025-03-17 21:13:11.52815+00	e8926399-91cb-404a-b71f-64f9ff3100a6	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ORDER_RETURN_ITEM
t	2025-03-17 21:13:11.533957+00	2025-03-17 21:13:11.533961+00	9fd06918-eab0-4769-85eb-7a09a1e2dd2d	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ORDER_RETURN_TYPE
t	2025-03-17 21:13:11.540473+00	2025-03-17 21:13:11.540475+00	38549ee2-2ecd-45de-9608-2e6d5b31a3b4	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ORDER_STATE
t	2025-03-17 21:13:11.54638+00	2025-03-17 21:13:11.546384+00	7c262a7c-a25a-44e5-b270-70676b7af7c4	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ORDER_STOCK_ITEM
t	2025-03-17 21:13:11.552198+00	2025-03-17 21:13:11.552204+00	63a12061-309b-430b-ad2f-2c1b4427b6e7	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_PAYMENT_GATEWAY
t	2025-03-17 21:13:11.557996+00	2025-03-17 21:13:11.558002+00	5e1c6339-6ab6-4a2e-a251-8d943845eccc	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_PRODUCT
t	2025-03-17 21:13:11.564094+00	2025-03-17 21:13:11.564101+00	6ddf58a5-4340-4dcd-949a-3a11608d77bc	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_PRODUCT_PRICE
t	2025-03-17 21:13:11.570057+00	2025-03-17 21:13:11.57006+00	3955bd1f-b64c-4939-abbe-b27c31e49437	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_PROVINCE
t	2025-03-17 21:13:11.576468+00	2025-03-17 21:13:11.576476+00	2ce9686b-aabb-4f25-80c3-56cd62f77f58	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_PURCHASE_DOCUMENT
t	2025-03-17 21:13:11.583796+00	2025-03-17 21:13:11.583805+00	7a3fe9fb-12ff-45c8-be91-30275b6bcef3	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_PURCHASE_ITEM
t	2025-03-17 21:13:11.590465+00	2025-03-17 21:13:11.590475+00	318a5746-21fb-4679-98ef-de435bb74110	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ROLE
t	2025-03-17 21:13:11.595606+00	2025-03-17 21:13:11.595609+00	1178db05-0202-45eb-b696-4843af5c1ac0	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_ROLE_ACCESS
t	2025-03-17 21:13:11.600302+00	2025-03-17 21:13:11.600304+00	d6e12134-99e7-45a7-bcc6-96aed76f4dcc	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_SALE_CHANNEL
t	2025-03-17 21:13:11.604412+00	2025-03-17 21:13:11.604414+00	5a947a6b-aab1-494f-ab40-5fef9c7e4b00	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_PURCHASE_TYPE
t	2025-03-17 21:13:11.608403+00	2025-03-17 21:13:11.608406+00	daa32505-bbad-4d35-82b5-74e106bfa2ec	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_PURCHASE_PAYMENT_TYPE
t	2025-03-17 21:13:11.613527+00	2025-03-17 21:13:11.613533+00	26c1438b-3d37-49ed-aae2-478afab92b07	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_SIZE
t	2025-03-17 21:13:11.617772+00	2025-03-17 21:13:11.617774+00	e61ddc94-0eb7-44ef-8274-08c806bbfe1c	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_SIZE_TYPE
t	2025-03-17 21:13:11.621926+00	2025-03-17 21:13:11.621929+00	fee76b07-d71f-418d-a7e0-c900ee0c55f5	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_STOCK_REPLENISHMENT_ITEM
t	2025-03-17 21:13:11.626897+00	2025-03-17 21:13:11.626902+00	736344f5-8785-4f97-a95d-869b14796a0b	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_STOCK_TRANSACTION_TYPE
t	2025-03-17 21:13:11.632063+00	2025-03-17 21:13:11.632066+00	115606c6-5b33-4ff8-b284-3965a8e0bd07	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_STORE
t	2025-03-17 21:13:11.637313+00	2025-03-17 21:13:11.637319+00	a1d6d30a-1df2-4c7e-8deb-541d059a3928	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_STORE_TYPE
t	2025-03-17 21:13:11.64234+00	2025-03-17 21:13:11.642342+00	636c210b-b6fd-4915-b124-bced1d9eb14a	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_SUBSCRIPTION
t	2025-03-17 21:13:11.646295+00	2025-03-17 21:13:11.646297+00	d8fd724d-652c-457c-a5f4-b0b0556ac894	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_SUB_CATEGORY_PRODUCT
t	2025-03-17 21:13:11.651235+00	2025-03-17 21:13:11.651239+00	a2d4ee02-50c8-4d86-a40d-f28ab3e25dcb	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_SUPPLIER
t	2025-03-17 21:13:11.655571+00	2025-03-17 21:13:11.655574+00	4d77c367-efc6-412c-aa7f-ea8c55de6559	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_SUPPLIER_PRODUCT
t	2025-03-17 21:13:11.660638+00	2025-03-17 21:13:11.660644+00	60192cc1-8b57-4343-98fe-83a81a9701a1	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_SUPPLIER_TYPE
t	2025-03-17 21:13:11.665969+00	2025-03-17 21:13:11.665974+00	189b19ef-567f-4165-a129-54f909b2c354	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_UNIT
t	2025-03-17 21:13:11.670793+00	2025-03-17 21:13:11.670795+00	2d03eab7-52ec-4c7f-b99e-d3028c087fe9	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_UNIT_TYPE
t	2025-03-17 21:13:11.674715+00	2025-03-17 21:13:11.674716+00	3ce8b691-675c-485f-bf8e-0f1d3aa03a4e	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_USER
t	2025-03-17 21:13:11.678757+00	2025-03-17 21:13:11.678761+00	7c82da32-a606-4e68-9384-2895248c445b	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_USER_ROLE
t	2025-03-17 21:13:11.686058+00	2025-03-17 21:13:11.686061+00	ca81860c-9ac9-4b02-9547-55b412ac3a2a	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_WAREHOUSE
t	2025-03-17 21:13:11.692283+00	2025-03-17 21:13:11.692289+00	909d7543-b47a-4aec-bc62-0502b400a4ae	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_WAREHOUSE_OUTPUT
t	2025-03-17 21:13:11.697414+00	2025-03-17 21:13:11.697417+00	af35838a-ef80-47f1-8c80-46d5017ba889	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_WAREHOUSE_OUTPUT_ITEM
t	2025-03-17 21:13:11.702833+00	2025-03-17 21:13:11.702836+00	2c6436c6-1800-48f1-be34-a7445b172ef8	2f363ce3-e629-42d7-8bb2-7892307e0275	DELETE_WAREHOUSE_STOCK
t	2025-03-17 21:13:11.708007+00	2025-03-17 21:13:11.708009+00	bff0c4a4-a20a-47d2-a2a0-f5bd032599a7	2f363ce3-e629-42d7-8bb2-7892307e0275	LOG_IN
t	2025-03-17 21:13:11.713251+00	2025-03-17 21:13:11.713253+00	9528945e-2952-4257-9153-82e65d8b3f83	2f363ce3-e629-42d7-8bb2-7892307e0275	LOG_OUT
t	2025-03-17 21:13:11.719648+00	2025-03-17 21:13:11.71965+00	3052e153-900c-4bb1-a928-21685dd44ec6	2f363ce3-e629-42d7-8bb2-7892307e0275	REGISTER_CLIENT
t	2025-03-17 21:13:11.726601+00	2025-03-17 21:13:11.726605+00	6f9c64e2-bff3-4e20-a65e-46e75986ed7c	2f363ce3-e629-42d7-8bb2-7892307e0275	SEND_MERCADO_PAGO_PAYMENT
t	2025-03-17 21:13:11.732465+00	2025-03-17 21:13:11.732473+00	97e5d213-0018-42bd-81d9-5c4a4f3c9f7f	2f363ce3-e629-42d7-8bb2-7892307e0275	SEND_SUBSCRIPTION_PAYMENT
t	2025-03-17 21:13:11.73911+00	2025-03-17 21:13:11.739117+00	827a90a7-7cc8-4250-9c9b-12437aa3a181	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_CATEGORY
t	2025-03-17 21:13:11.744671+00	2025-03-17 21:13:11.744674+00	c4a7559a-d155-47b5-bbf3-ad69c8319779	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_CATEGORY_PRODUCT
t	2025-03-17 21:13:11.751674+00	2025-03-17 21:13:11.751677+00	0b1fb480-e4c2-4e7f-8bae-04ba7a06e5d5	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_CLIENT
t	2025-03-17 21:13:11.758333+00	2025-03-17 21:13:11.758336+00	2f1681d9-8685-4be2-bb15-d15633e24b9b	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_COURIER_ORDER
t	2025-03-17 21:13:11.763134+00	2025-03-17 21:13:11.763137+00	c6788e13-7e8b-4b45-adff-73672fdaaa37	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_DELIVERY_MANIFEST_ITEM
t	2025-03-17 21:13:11.769563+00	2025-03-17 21:13:11.769568+00	481c4c22-e2c9-445f-a826-624c91c1da29	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_MODULE
t	2025-03-17 21:13:11.775671+00	2025-03-17 21:13:11.775675+00	1db0390d-30a5-4bdc-bfc9-76c6469ecc68	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_ORDER
t	2025-03-17 21:13:11.781388+00	2025-03-17 21:13:11.781392+00	0a5cd4e5-2aff-48b7-8d2b-5144364194d7	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_ORDER_CONTACTED
t	2025-03-17 21:13:11.787819+00	2025-03-17 21:13:11.787822+00	db7b3e22-fcba-4191-9741-9f7c44fc0be6	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_ORDER_ITEM
t	2025-03-17 21:13:11.794257+00	2025-03-17 21:13:11.794262+00	5e26b741-3fe2-49ad-9d21-cb8e8bd0770e	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_ORDER_RETURN_ITEM
t	2025-03-17 21:13:11.800918+00	2025-03-17 21:13:11.800923+00	99f9ce16-3c8f-4279-8488-c3daef5af4b0	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_ORDER_STOCK_ITEM
t	2025-03-17 21:13:11.808694+00	2025-03-17 21:13:11.808698+00	e4990a31-4e95-465a-85bc-85595f25d27b	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_PRODUCT
t	2025-03-17 21:13:11.815318+00	2025-03-17 21:13:11.815321+00	0ba909ea-7873-4147-ac55-fb43bc541b7c	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_STOCK_REPLENISHMENT_ITEM
t	2025-03-17 21:13:11.820462+00	2025-03-17 21:13:11.820465+00	59eeea51-62a7-46b8-acca-6bc071288eb3	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_STORE
t	2025-03-17 21:13:11.826135+00	2025-03-17 21:13:11.826139+00	270ed2fb-008f-4c29-8b7d-eb743ab964d0	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_USER
t	2025-03-17 21:13:11.833355+00	2025-03-17 21:13:11.833359+00	29ba384d-96da-4298-bcb6-01baf12b3359	2f363ce3-e629-42d7-8bb2-7892307e0275	UPDATE_WAREHOUSE_OUTPUT_ITEM
t	2025-03-17 21:13:14.941661+00	2025-03-17 21:13:14.941662+00	8a9447d1-06bd-4ec4-975f-f7bdada60d23	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVATE_ORDER_ITEM
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.client (status, registration_date, update_date, client_id, district_id, address, business, dni, email, mobile, name, ruc, surname) FROM stdin;
t	2025-03-17 21:12:56.833933+00	2025-03-17 21:12:56.833953+00	84a40517-458c-4933-97e7-e399d71b50e8	cd5c4e84-c711-46c9-9fc5-8ead1d1021d1	SISTEMA	SISTEMA	SISTEMA	SISTEMA	SISTEMA	SISTEMA	SISTEMA	SISTEMA
t	2025-03-17 21:13:10.470824+00	2025-03-17 21:13:10.470831+00	9e1ca542-d718-4058-83d0-abf62b73f8d1	969b4e88-78a4-4dbf-9df4-180f355f80e0	Iquique 807 - breña	CORPORACION ARANNI S.A.C	1111111	joel@aranni.com.pe	947424006	JOEL	20609605601	COILA OSNAYO
\.


--
-- Data for Name: membership_module; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.membership_module (status, registration_date, update_date, membership_id, membership_module_id, module_id, user_id) FROM stdin;
\.


--
-- Data for Name: membership_module_role; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.membership_module_role (status, registration_date, update_date, membership_module_id, membership_module_role_id, role_id, user_id) FROM stdin;
\.


--
-- Data for Name: onboarding; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.onboarding (billing, demo, ecommerce, users_maximum, users_minimum, category_id, client_id, entry_channel_id, onboard_id, comment) FROM stdin;
\.


--
-- Data for Name: onboarding_channel; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.onboarding_channel (closing_channel_id, onboard_channel_id, onboard_id) FROM stdin;
\.


--
-- Data for Name: onboarding_module; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.onboarding_module (module_id, onboard_id, onboard_module_id) FROM stdin;
\.


--
-- Data for Name: onboarding_store; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.onboarding_store (onboard_id, onboard_store_id, store_id) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.role (status, registration_date, update_date, role_id, user_id, name) FROM stdin;
t	2025-03-17 21:12:56.921822+00	2025-03-17 21:12:56.921849+00	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275	ADMINISTRACION
t	2025-03-17 21:13:12.507582+00	2025-03-17 21:13:12.507586+00	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275	NEGOCIO
t	2025-03-17 21:13:12.512598+00	2025-03-17 21:13:12.512602+00	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275	VENTAS
t	2025-03-17 21:13:12.516551+00	2025-03-17 21:13:12.516555+00	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275	STOCK
t	2025-03-17 21:13:12.521006+00	2025-03-17 21:13:12.521012+00	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275	SERVICIO_CLIENTE
t	2025-03-17 21:13:12.524795+00	2025-03-17 21:13:12.524797+00	ae79cfda-9ff2-42ae-a490-8cb44aa45fe3	2f363ce3-e629-42d7-8bb2-7892307e0275	COURIER
t	2025-03-17 21:13:12.528872+00	2025-03-17 21:13:12.528877+00	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275	MARKETING
\.


--
-- Data for Name: role_access; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.role_access (status, registration_date, update_date, access_id, role_access_id, role_id, user_id) FROM stdin;
t	2025-03-17 21:12:56.929839+00	2025-03-17 21:12:56.92986+00	601fdba2-2c1f-41b2-aeee-cd1eaeecb453	0bbdf394-191e-4e18-bd9a-e4e04dfe9951	ac30331f-90b0-4dc8-a49a-a1a441097d30	\N
t	2025-03-17 21:13:12.538127+00	2025-03-17 21:13:12.538129+00	ce0112dc-dbe7-49f5-9797-da047211929e	7da093f3-b90d-41de-9686-340649622fda	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.545771+00	2025-03-17 21:13:12.545774+00	72049c7c-90f1-45c7-99e0-5c80c376916a	65919ad2-fe2c-4190-817e-367e9dd8e555	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.553649+00	2025-03-17 21:13:12.553651+00	4c5b95eb-a24b-4383-8d0c-28a7e8e346eb	e86e932c-b74f-4519-bc5e-1d21802371fa	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.559628+00	2025-03-17 21:13:12.55963+00	5cfda39f-4237-4009-beb4-ad0a30a6edd1	2b60b678-5e37-4392-b1fb-57a74a9d7380	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.564805+00	2025-03-17 21:13:12.564806+00	0fd5a006-5e1d-4bf5-880a-2ba6f170eece	4e317199-5ca2-45b5-859d-d2a86891496e	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.570025+00	2025-03-17 21:13:12.570026+00	50b3ec1b-d098-4ee1-874a-5a5869035330	796d72f8-87b1-4580-96f9-f49bb1a135bb	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.576036+00	2025-03-17 21:13:12.576038+00	3fa140b3-6a33-414b-b0e2-24b1d723f249	17275653-9ff1-4765-a759-e5a827ff9839	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.582696+00	2025-03-17 21:13:12.582699+00	60645611-8eeb-460f-a857-3cad16efe52a	5ea79ed0-87cf-4f1a-9132-28192b3339cf	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.588081+00	2025-03-17 21:13:12.588084+00	fe4adf52-0f80-417d-b44c-e76aa909f649	93439260-0aa5-4d06-ba9f-754cb1a11f97	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.593654+00	2025-03-17 21:13:12.593657+00	64b018d3-e3a8-4397-a8de-2d40af3907a9	0f9f44cb-4156-4e53-a567-d28c7813e221	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.601394+00	2025-03-17 21:13:12.601398+00	f38f921f-1399-472d-ab89-b5c4c715dbe0	f825e095-c267-45d2-9c28-3fbcf184498e	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.607893+00	2025-03-17 21:13:12.607896+00	1beab9c0-4c9e-4a0e-a27b-6f12baeed3e0	8a5a1a8a-7f38-4e46-84bc-108fb367b694	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.613193+00	2025-03-17 21:13:12.613194+00	3328f2c6-9777-45ab-a817-0be8443b1f49	71e84264-f312-4131-8ee7-1859510be4a2	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.618747+00	2025-03-17 21:13:12.61875+00	f7a88c1c-80a7-4946-a448-509c6b117e80	cd362862-80e5-460f-bb98-de8141c090d4	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.625549+00	2025-03-17 21:13:12.625552+00	2b2d7271-b355-44bd-a418-b9fc534ab810	038d38c4-8ef1-419d-b465-274ab1cb017f	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.630785+00	2025-03-17 21:13:12.630788+00	8b3cdb4a-0c8c-45d6-b0bd-24fff9400fb9	4c927c22-1de4-4d29-aa11-c65c74c23389	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.635825+00	2025-03-17 21:13:12.635828+00	0ef60bf5-29e3-48c1-be5a-2cdaa130972b	8dfc8653-4984-41ba-a5f7-4558e88f87b4	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.640618+00	2025-03-17 21:13:12.640619+00	1b8ad6cd-131c-4b14-9af1-1b68ea36a427	f6760830-7395-4e92-95c4-c9e8b783e570	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.645915+00	2025-03-17 21:13:12.645918+00	44e615aa-e64f-4b3d-99b1-d9f34dce53ad	97a1f972-c1b2-4ba6-84c4-df6567997a82	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.650974+00	2025-03-17 21:13:12.650976+00	b4f3c9b0-1d9f-4e7c-b0e0-b925359426bf	3ea1d6a6-09f9-4a8e-a1d3-1b2739b81433	0c9562fc-1757-499f-a310-7be5e3a27ad2	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.65586+00	2025-03-17 21:13:12.655863+00	ce0112dc-dbe7-49f5-9797-da047211929e	f8018984-9ef7-4890-8fd9-927647da6944	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.661359+00	2025-03-17 21:13:12.661361+00	72049c7c-90f1-45c7-99e0-5c80c376916a	bd1305f8-270a-40e6-a43c-2482cd5316a7	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.665886+00	2025-03-17 21:13:12.665887+00	4c5b95eb-a24b-4383-8d0c-28a7e8e346eb	d77222dc-5e4d-458e-af8a-f896c5b93175	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.670619+00	2025-03-17 21:13:12.67062+00	5cfda39f-4237-4009-beb4-ad0a30a6edd1	bb3fc806-41e2-4414-aa74-8e31eff4eb8c	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.675203+00	2025-03-17 21:13:12.675206+00	50b3ec1b-d098-4ee1-874a-5a5869035330	c0c2d205-819d-4441-ae04-bfacf02573a3	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.680382+00	2025-03-17 21:13:12.680384+00	0fd5a006-5e1d-4bf5-880a-2ba6f170eece	75824a66-fb91-492c-b81c-7906e7df89a4	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.685283+00	2025-03-17 21:13:12.685286+00	3fa140b3-6a33-414b-b0e2-24b1d723f249	0f9800df-7bbf-424e-8d2d-0d4336a06a44	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.692074+00	2025-03-17 21:13:12.692078+00	fe4adf52-0f80-417d-b44c-e76aa909f649	5f72e62c-2233-4db8-b1ee-57cd2ee6cda6	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.697738+00	2025-03-17 21:13:12.69774+00	64b018d3-e3a8-4397-a8de-2d40af3907a9	b96b3be8-5f42-41c6-8538-bc24fca2f27f	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.703077+00	2025-03-17 21:13:12.70308+00	f38f921f-1399-472d-ab89-b5c4c715dbe0	9835c142-a479-4142-a640-22a0db21b799	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.709808+00	2025-03-17 21:13:12.709812+00	1beab9c0-4c9e-4a0e-a27b-6f12baeed3e0	f94d040a-b583-4e56-adf2-3e07c2a6a70c	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.714854+00	2025-03-17 21:13:12.714856+00	3328f2c6-9777-45ab-a817-0be8443b1f49	0dc7785a-5e4f-45cc-b8d1-eb607bce3f14	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.71998+00	2025-03-17 21:13:12.719982+00	f7a88c1c-80a7-4946-a448-509c6b117e80	d887f43d-9a82-4fef-a519-1cb6eaecfe84	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.724961+00	2025-03-17 21:13:12.724962+00	2b2d7271-b355-44bd-a418-b9fc534ab810	cbb345d2-3aa8-4033-9157-ed4ac797c3b1	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.729682+00	2025-03-17 21:13:12.729685+00	8b3cdb4a-0c8c-45d6-b0bd-24fff9400fb9	ad399dfa-e8fa-4e84-9f1f-8b4ea705958f	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.73453+00	2025-03-17 21:13:12.734532+00	0ef60bf5-29e3-48c1-be5a-2cdaa130972b	ce725cb9-a5a3-48ab-9e3b-60cbf19b089e	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.739369+00	2025-03-17 21:13:12.739373+00	1b8ad6cd-131c-4b14-9af1-1b68ea36a427	2a9ac129-f16c-4d57-a6c1-3aa60903f83c	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.744353+00	2025-03-17 21:13:12.744355+00	44e615aa-e64f-4b3d-99b1-d9f34dce53ad	e81422a4-0029-49c9-b891-cee4b5839e7f	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.749128+00	2025-03-17 21:13:12.749129+00	b4f3c9b0-1d9f-4e7c-b0e0-b925359426bf	983eae46-c6d4-4e81-888d-6921985f9794	dac8091e-cbb5-491a-9743-136a800893f1	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.753634+00	2025-03-17 21:13:12.753636+00	ce0112dc-dbe7-49f5-9797-da047211929e	a53a9f6d-4482-4c6a-8144-12711bca71e2	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.759357+00	2025-03-17 21:13:12.759358+00	ff88e7e5-f596-4ec2-8328-2b1573eec48b	7e0949fb-2f74-4ad2-a431-02f27e8fc20d	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.764708+00	2025-03-17 21:13:12.764709+00	1d18c9b2-ee0f-47bc-a09c-e929eafe6d7d	54cc0cbd-bdb9-4d98-9263-9d3590b6c9a6	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.769749+00	2025-03-17 21:13:12.769752+00	bfda5153-a0fc-404e-8a35-52832d35ddf5	ef2feb96-2b35-4403-9358-ffa05a276acb	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.775192+00	2025-03-17 21:13:12.775195+00	6b208f24-758d-4bef-b6b8-8caf07fbba44	f10ca58d-ded6-41ec-be01-56120dc58b86	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.780517+00	2025-03-17 21:13:12.780519+00	f309d688-40ab-42ef-b603-0c3f2b9e2534	bf4c118b-fecf-494b-a9c4-18cc3c171008	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.786595+00	2025-03-17 21:13:12.786597+00	50b3ec1b-d098-4ee1-874a-5a5869035330	4cc980d9-e61c-4971-9895-acd378e211f1	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.791598+00	2025-03-17 21:13:12.791601+00	f58ee37a-d5a0-47ea-9eb6-c71800b31981	97f58c35-80ab-4993-a450-2f07068c8269	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.796705+00	2025-03-17 21:13:12.796706+00	50ffbccd-1b55-4173-81d8-cde143552f68	6fe5a6cc-8388-4a0a-98e5-68e1609c3a85	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.801748+00	2025-03-17 21:13:12.80175+00	44e615aa-e64f-4b3d-99b1-d9f34dce53ad	07882eda-214d-4c04-a447-b98ebc6913d9	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.805818+00	2025-03-17 21:13:12.80582+00	0ddfe2d7-97da-4c70-85b9-b5e670a1a76a	d1c0e26a-9464-4ad7-affe-eba2bb4a3c35	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.8125+00	2025-03-17 21:13:12.812504+00	ac0ef897-669f-43cd-8abe-7123f4823d8f	acaa339b-965a-48e3-a14d-2031935fed33	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.81686+00	2025-03-17 21:13:12.816861+00	6291da30-c163-40a5-8a39-f21afbbe2e7c	be63f811-7535-41c7-8b84-653fb5e389c0	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.820829+00	2025-03-17 21:13:12.82083+00	f28a2287-4426-4da8-a3d4-9a12d299681d	57f81f8f-1fa4-484f-a8fc-cedf6226963c	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.825494+00	2025-03-17 21:13:12.825496+00	ac5f8671-350a-4c2d-9558-b183364c0b2c	bcc8e96e-c18f-49eb-a352-76e247f5118b	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.831653+00	2025-03-17 21:13:12.831657+00	13f44645-6a7d-4fc0-b281-81867ac78c40	e4dc7f7b-99fc-40ea-a8f5-720b9fb7b75a	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.837466+00	2025-03-17 21:13:12.837467+00	1d3f4c38-0022-4118-9d33-caf953b55c07	f3106284-64b9-4b0a-853d-e5d4a8e3fb37	48194a54-fa30-4fd2-b5f9-ec39b24ae5f5	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.841763+00	2025-03-17 21:13:12.841765+00	ce0112dc-dbe7-49f5-9797-da047211929e	2f1f2f12-25bb-4ff0-a56e-6df5b763e4b4	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.8468+00	2025-03-17 21:13:12.846802+00	f309d688-40ab-42ef-b603-0c3f2b9e2534	5da8d775-30f7-4d78-9789-e7fc514bb817	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.85113+00	2025-03-17 21:13:12.851133+00	f4038c9c-23dc-4ef2-a945-6d8d7512cfcf	eb0d4340-56e9-4726-afac-ddb37d40a507	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.856567+00	2025-03-17 21:13:12.856571+00	50b3ec1b-d098-4ee1-874a-5a5869035330	65255453-286a-4a29-927d-78454332a14e	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.86177+00	2025-03-17 21:13:12.861772+00	3fa140b3-6a33-414b-b0e2-24b1d723f249	1e52dfca-0e0c-4917-a9c3-ef8cb1642f06	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.865974+00	2025-03-17 21:13:12.865977+00	1beab9c0-4c9e-4a0e-a27b-6f12baeed3e0	de435208-1adb-4bce-9521-3a599bede55e	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.872215+00	2025-03-17 21:13:12.872217+00	e96d75ce-5f3f-4d9a-84d8-71abc9c60b05	176e0fd2-cd4c-407a-84a3-d7b74fab1b31	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.877025+00	2025-03-17 21:13:12.877027+00	5a228b93-3edb-4c79-a36d-98b767fa8c99	d88a29af-bc4f-49c7-b316-c3f4ba7fd01a	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.882013+00	2025-03-17 21:13:12.882014+00	bed16da8-3a44-47d8-868f-e5412af291b0	82460148-c169-4443-83db-6bd5d026a7de	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.886711+00	2025-03-17 21:13:12.886714+00	88a062f7-94fe-4eb3-8c0a-87ab1d2d96b1	191be1ee-6189-4d50-8b24-a4a4974bb70c	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.892482+00	2025-03-17 21:13:12.892486+00	be8e61b8-4b62-4982-bb0c-d465cddc5902	4b2dc467-4fa4-40c3-8c5e-9afc0b7919cf	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.900455+00	2025-03-17 21:13:12.900462+00	c777f82f-e995-49a2-b3b5-189e32842951	18e34c85-99c4-46a2-a8c5-c00eafd2878c	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.909465+00	2025-03-17 21:13:12.909468+00	432d20d5-8e24-4725-85a5-c429ca8f35e7	cd372c83-30c3-47c8-8a91-34dc332a389b	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.916523+00	2025-03-17 21:13:12.916525+00	f28a2287-4426-4da8-a3d4-9a12d299681d	c434f451-cb2a-4f8d-9e22-e4f01181ff94	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.923322+00	2025-03-17 21:13:12.923326+00	ac5f8671-350a-4c2d-9558-b183364c0b2c	45ad9d42-2da9-48e5-922b-95170f647fc8	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.930228+00	2025-03-17 21:13:12.930231+00	b22ddf1a-7443-4c3c-acfe-de980e805090	67e03be8-724b-4680-9477-fd977426a65e	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.936649+00	2025-03-17 21:13:12.936651+00	a6c8d911-87ad-41c4-93fb-06c22e699390	1cd83fbb-1176-4dff-b601-117a81393fe6	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.942378+00	2025-03-17 21:13:12.942382+00	571b3108-bede-4c44-86bd-451c6ed6c6bf	b9c6b117-e753-427b-9f5f-405f0700a24e	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.947278+00	2025-03-17 21:13:12.94728+00	fcd032fb-1afb-4c35-91ea-4a14bb34005b	68918842-853b-468d-9851-c95851af694e	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.953892+00	2025-03-17 21:13:12.953897+00	ecc66b66-6a58-47b9-9fde-2c6318791317	cdf220ce-2505-4145-bcf2-f4ffdd13b33c	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.959505+00	2025-03-17 21:13:12.959507+00	1f831ce3-6f6c-4c5f-9552-4dc43c87e1e2	af585a52-9a2f-4ad3-93db-ca812367f235	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.964385+00	2025-03-17 21:13:12.964387+00	dd82921f-75a7-4b67-b4be-622eeff76c2f	94854c7e-e114-4e90-8145-45106ae03ca8	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.970124+00	2025-03-17 21:13:12.970126+00	33a71750-5100-41e7-a762-fdaade16192e	39101ccb-1570-47dd-8a89-5949c994aa35	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.974906+00	2025-03-17 21:13:12.974907+00	bbc2eff9-cc73-4d97-b903-f4ba91b23e0b	bf9e13d5-c834-49c2-b770-5aec1b46d176	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.980131+00	2025-03-17 21:13:12.980133+00	648761ed-590d-4a17-9e24-d8f424e51c69	57e54f85-ec03-4052-98e9-62999d07ff3b	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.986294+00	2025-03-17 21:13:12.986298+00	15f1ec79-87d0-434d-8aca-5d8ab0e88d32	e4f72c7b-b665-4388-be29-e272a84ad629	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.993561+00	2025-03-17 21:13:12.993564+00	edf8e6ca-95b2-4602-aa73-e20a028395ff	52b407ea-60ba-42e3-9f7d-8f404d908990	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:12.99968+00	2025-03-17 21:13:12.999686+00	43b43743-04a5-4891-a0ba-b6d00d902e94	b66056cb-99da-4daa-949b-09d132fc0ebc	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.006139+00	2025-03-17 21:13:13.006143+00	8d46cb6e-b2c1-49d2-bf5b-3d27e94d3808	817b5230-4c31-4d97-9e7d-b7f9082ebdd7	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.012742+00	2025-03-17 21:13:13.012745+00	13f44645-6a7d-4fc0-b281-81867ac78c40	6d58d589-4347-47a4-ad50-cf5c2b4a755a	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.018911+00	2025-03-17 21:13:13.018912+00	1d3f4c38-0022-4118-9d33-caf953b55c07	ffa5e686-1b42-4f67-b7ad-cc3be57f6ea9	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.024557+00	2025-03-17 21:13:13.024559+00	cf130dee-2331-4adf-942b-1f6b7e316604	75f7a432-a66b-40cf-823c-cd51593c3c6f	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.030087+00	2025-03-17 21:13:13.030089+00	ecd5f308-2d97-4b92-b898-1d497b4bdfd9	20763b69-84bf-4faf-9ed4-9c22c9b83b80	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.03545+00	2025-03-17 21:13:13.035454+00	bc25d098-7452-4734-804d-5c1fd85c95be	545ccb6c-ab02-4e30-8607-2224d6d3e1d8	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.040712+00	2025-03-17 21:13:13.040714+00	cd22c913-9675-4726-b68d-6b3fceb58935	eaafb5e8-6956-43dd-929c-6d3f8a7bda4b	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.04552+00	2025-03-17 21:13:13.045523+00	58501cd5-294b-4c26-a570-d69ad39851e7	edc01c81-330e-4b47-840f-2100d2a7251e	28d80089-d7dc-4624-8f7c-6b370d442d3f	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.050764+00	2025-03-17 21:13:13.050765+00	a1d151b6-f402-4c26-a9ec-a868d09c76cb	98ae73c9-203e-4959-aa10-24a5b7ecd548	ae79cfda-9ff2-42ae-a490-8cb44aa45fe3	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.055459+00	2025-03-17 21:13:13.05546+00	ce0112dc-dbe7-49f5-9797-da047211929e	1d35345c-8e23-4a8d-8262-6dc6986358a4	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.060362+00	2025-03-17 21:13:13.060363+00	415c69a4-7743-43d5-8117-a4669ba51916	82e5b793-c41a-4e83-b5fd-938e1ee19388	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.065425+00	2025-03-17 21:13:13.065426+00	f309d688-40ab-42ef-b603-0c3f2b9e2534	ba35afe0-2549-40f0-ad0d-bdf5afeeac94	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.070419+00	2025-03-17 21:13:13.070422+00	4c5b95eb-a24b-4383-8d0c-28a7e8e346eb	ff0aafaf-4788-4d44-8a5a-b15f529c0f08	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.075941+00	2025-03-17 21:13:13.075944+00	0fd5a006-5e1d-4bf5-880a-2ba6f170eece	2f6a9900-b0cc-4fb9-8008-0a2465c393af	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.080739+00	2025-03-17 21:13:13.080742+00	5f360384-8d52-41fe-92a9-c44876f83a70	233a82e0-ae12-4870-8bc4-b60a84ed1f8a	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.085733+00	2025-03-17 21:13:13.085736+00	9bafbfb1-20a1-4fe2-a56e-1bf42046f7df	c139faca-ee15-405a-88cf-3e1af613ea53	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.090356+00	2025-03-17 21:13:13.090358+00	3f91eea3-7231-4f26-a208-c9a0cd2e8a1f	118a4699-2f0b-4def-a9bd-4ec22b574ec7	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.095148+00	2025-03-17 21:13:13.095149+00	9cb5f5ca-bb27-46a5-a8d3-e909ff05ca30	578e7edd-9d7d-494b-bb00-1400a8a42f71	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.100425+00	2025-03-17 21:13:13.100427+00	02e24c4d-50d6-4878-818f-ecee0b633220	7266eb63-ef98-4e84-91ec-c2784baf143e	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.104999+00	2025-03-17 21:13:13.105001+00	f4038c9c-23dc-4ef2-a945-6d8d7512cfcf	b82644d4-f1b7-40cc-8650-df58c00a691e	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.109818+00	2025-03-17 21:13:13.109821+00	952ecf88-cd79-4063-9d38-dd6f752c1347	da243296-d5e4-4c32-9fbc-8781659e224c	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.115566+00	2025-03-17 21:13:13.115568+00	1dd5e8e6-68e6-4f61-8d2f-20a3cd60ab0e	f2e8fc27-43d3-4bf4-ac0b-08a7ae433a59	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.121215+00	2025-03-17 21:13:13.121219+00	50b3ec1b-d098-4ee1-874a-5a5869035330	712b428c-d63d-48cc-b493-cf619ab63cd5	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.126611+00	2025-03-17 21:13:13.126612+00	3fa140b3-6a33-414b-b0e2-24b1d723f249	54f1129e-dbf8-4207-9a10-6a854119e0da	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.130908+00	2025-03-17 21:13:13.13091+00	1beab9c0-4c9e-4a0e-a27b-6f12baeed3e0	a1bf4db1-b27a-4078-a4d2-cf7ce1b1caa2	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.136458+00	2025-03-17 21:13:13.136459+00	e96d75ce-5f3f-4d9a-84d8-71abc9c60b05	3c06e41d-814b-4360-b7bf-22685e68f6c2	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.142111+00	2025-03-17 21:13:13.142112+00	bed16da8-3a44-47d8-868f-e5412af291b0	44ba6818-0a05-463e-b3e4-232008a4bd0d	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.147971+00	2025-03-17 21:13:13.147973+00	8b3cdb4a-0c8c-45d6-b0bd-24fff9400fb9	d326ffeb-b923-4753-aa55-23398db35191	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.153015+00	2025-03-17 21:13:13.153018+00	0ef60bf5-29e3-48c1-be5a-2cdaa130972b	6761a276-802d-4b1f-8703-632c4936fe11	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.159337+00	2025-03-17 21:13:13.15934+00	1b8ad6cd-131c-4b14-9af1-1b68ea36a427	fa1e66ea-7d57-4322-8d71-08d95b7a3e77	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.164835+00	2025-03-17 21:13:13.164837+00	44e615aa-e64f-4b3d-99b1-d9f34dce53ad	1d4e7092-d9ae-4259-bd15-bbedd26dcf44	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.170126+00	2025-03-17 21:13:13.170129+00	88a062f7-94fe-4eb3-8c0a-87ab1d2d96b1	9c6a151e-858e-4e4c-8023-45c74fc6b2c1	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.175422+00	2025-03-17 21:13:13.175424+00	c777f82f-e995-49a2-b3b5-189e32842951	6f8af162-dd02-4354-b6ff-cf8281ac4341	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.180345+00	2025-03-17 21:13:13.180346+00	7282d913-2667-44f5-a238-6eaa2f8d96db	64a22da3-ce15-42c6-a334-0b28f90801ea	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.18527+00	2025-03-17 21:13:13.185273+00	f28a2287-4426-4da8-a3d4-9a12d299681d	a8355cc4-8f65-43a5-bf64-9f85ff588ce9	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.191035+00	2025-03-17 21:13:13.191039+00	ac5f8671-350a-4c2d-9558-b183364c0b2c	67a3a338-3641-46f6-8813-1286bb673a5b	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.196943+00	2025-03-17 21:13:13.196946+00	b22ddf1a-7443-4c3c-acfe-de980e805090	61690e01-732e-41ad-a864-c8c022eafc76	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.202471+00	2025-03-17 21:13:13.202472+00	571b3108-bede-4c44-86bd-451c6ed6c6bf	b1f9f51b-9204-4f33-ae54-51c570463511	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.208007+00	2025-03-17 21:13:13.20801+00	fcd032fb-1afb-4c35-91ea-4a14bb34005b	a2c40d54-d775-4964-a3b9-21b22ecade1c	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.21338+00	2025-03-17 21:13:13.213382+00	1f831ce3-6f6c-4c5f-9552-4dc43c87e1e2	30edc981-d410-4d16-966c-fe6ae52c8025	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.218135+00	2025-03-17 21:13:13.218138+00	dd82921f-75a7-4b67-b4be-622eeff76c2f	759a047e-4799-41b8-9698-d5199180289a	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.223878+00	2025-03-17 21:13:13.223881+00	33a71750-5100-41e7-a762-fdaade16192e	a8f3b636-9109-4b45-af5f-7123cff16666	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.229636+00	2025-03-17 21:13:13.229639+00	e09335e3-5689-4645-83ec-3509cb6d5454	2ff29640-0cb6-4406-a141-1264fff70811	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.235046+00	2025-03-17 21:13:13.235049+00	b1660d31-fb50-4a74-ae8d-a16d7e97d7b2	8050f249-cf9f-4487-95ae-7b64d022a271	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.239826+00	2025-03-17 21:13:13.239827+00	b4f3c9b0-1d9f-4e7c-b0e0-b925359426bf	7a4e12d7-0748-417c-ae11-dcf57dbcacac	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.245185+00	2025-03-17 21:13:13.245187+00	c6afa4b7-f91d-41d8-aebb-d29d3f969187	ec26dd7e-0834-40c0-965f-e533af8fd71c	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.249952+00	2025-03-17 21:13:13.249954+00	761606db-1d96-4dd6-b90b-2a6176c25b53	5b08b016-c286-4d4b-b641-bddd93758612	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.255404+00	2025-03-17 21:13:13.255406+00	743d21b3-4ef5-489b-a838-c86066c6222e	2517a318-9fc6-402a-b743-e69e270eac1f	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.26079+00	2025-03-17 21:13:13.260794+00	296061f5-a213-4b82-af9b-112622d2c0c9	a13e5144-24a9-4615-b65b-503b1d869744	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.265959+00	2025-03-17 21:13:13.265962+00	a67aeac2-fa9e-4c12-bbd8-415aca17b70c	b2e0d679-2891-4ab0-8e98-6f50d5a68b95	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.270343+00	2025-03-17 21:13:13.270344+00	bbc2eff9-cc73-4d97-b903-f4ba91b23e0b	c983072b-ddd2-4d0e-b985-0d5a5a133740	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.275518+00	2025-03-17 21:13:13.275519+00	13f44645-6a7d-4fc0-b281-81867ac78c40	03160ce3-8ed6-4b31-80d4-4becd7626817	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.28018+00	2025-03-17 21:13:13.280181+00	1d3f4c38-0022-4118-9d33-caf953b55c07	49acdbdd-ba23-4dec-af3c-a0e06e814382	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.285719+00	2025-03-17 21:13:13.285722+00	601fdba2-2c1f-41b2-aeee-cd1eaeecb453	f9228aa1-24c2-41f3-a80d-c549d8258daa	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.290819+00	2025-03-17 21:13:13.290821+00	a909f9db-f0f5-4e8b-94bf-157f65a87cd1	78416ae5-36cc-475f-9c82-08d18a68eb38	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.2961+00	2025-03-17 21:13:13.296102+00	cf130dee-2331-4adf-942b-1f6b7e316604	c06dd98e-0122-48a2-b317-ff68e070f080	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.30129+00	2025-03-17 21:13:13.301293+00	b6ed4e45-c958-4fb4-9fbf-21814b79357c	83fc8d86-842e-4158-a7ce-e6909e6d3d11	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.306598+00	2025-03-17 21:13:13.306601+00	d43ebf59-df69-46ae-921a-2f6675ce0e52	77e3ca81-6869-4b5b-93b6-8c8c4d878912	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.311466+00	2025-03-17 21:13:13.311469+00	99395567-5b69-4e1f-a2b4-96254651f91f	61b591e4-dc15-4615-86c7-520b7697aeee	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.31788+00	2025-03-17 21:13:13.317882+00	09875317-5adb-4180-812d-187820876353	4d5ac9b9-3234-455f-9efd-ee2ce498ad80	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.323794+00	2025-03-17 21:13:13.323796+00	17df3f39-e56b-431b-86c9-fbe7b798bb89	96c53bd3-a1c3-4a96-a065-cbe8a463ac51	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.330228+00	2025-03-17 21:13:13.33023+00	ce0112dc-dbe7-49f5-9797-da047211929e	baa65ce4-b327-45e9-b19b-cbfbe023b336	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.335487+00	2025-03-17 21:13:13.335491+00	4c5b95eb-a24b-4383-8d0c-28a7e8e346eb	1ecbbab9-7569-48e8-af24-6f72b060fd4d	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.340459+00	2025-03-17 21:13:13.34046+00	72049c7c-90f1-45c7-99e0-5c80c376916a	dfcffda0-1803-43ae-b9c3-09f7868060b1	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.345388+00	2025-03-17 21:13:13.345389+00	5b566369-4e9c-4b66-b840-600c604281d9	cd297f43-a9b1-46df-901c-4edcd99856bb	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.350484+00	2025-03-17 21:13:13.350487+00	8be3ba8d-7d63-40c1-9821-c55941f56405	88470048-0715-424d-ad7d-0732d17ff1be	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.35554+00	2025-03-17 21:13:13.355542+00	2350800f-f9e0-4ba0-b32d-8849531aa0a3	5a282b94-cfb1-4020-b3f0-d3a1f57ecca9	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.360686+00	2025-03-17 21:13:13.360688+00	d8c240b4-8597-4a4c-ad70-eec4ccbe7e70	9b1b894c-4c02-49ec-85d1-071a35855c51	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.36585+00	2025-03-17 21:13:13.365851+00	6fbba35a-2204-47bc-8a84-5a09628397e6	b7f98010-7036-449b-8d98-e1e0212bfd2c	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.37094+00	2025-03-17 21:13:13.370943+00	415c69a4-7743-43d5-8117-a4669ba51916	c198f45b-0091-4645-9126-746fa6aaa59a	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.376131+00	2025-03-17 21:13:13.376134+00	f81055e8-3e96-429f-aac2-3c4e2f2dab38	e925e787-8237-4d98-897a-cdb6a4292710	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.381453+00	2025-03-17 21:13:13.381456+00	fc1d7ce9-5e51-4aba-a66c-fec03b9a795a	f6581a78-00b7-4fb0-a284-757ff9c31d54	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.386316+00	2025-03-17 21:13:13.386319+00	19c1a0f3-a177-4cb7-b106-bb7481894429	bacf342d-9779-4160-b096-3d41f5d290e3	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.391891+00	2025-03-17 21:13:13.391894+00	f309d688-40ab-42ef-b603-0c3f2b9e2534	a0eab2d1-ace4-40fd-abe1-97dab116a2b8	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.397049+00	2025-03-17 21:13:13.39705+00	bdeb0d7f-438a-4661-b17e-3f3727aa074b	78ebd7d8-cd1f-45d0-8b9f-67f83e8daf31	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.402842+00	2025-03-17 21:13:13.402845+00	a04b75ea-9ded-4e92-8163-16cdc5d836c1	7b762475-6b4d-40d7-b445-0b66f18498e7	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.409447+00	2025-03-17 21:13:13.40945+00	0fd5a006-5e1d-4bf5-880a-2ba6f170eece	9a235ed4-a92a-4af8-b9ff-9458f8673dc5	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.414345+00	2025-03-17 21:13:13.414346+00	5f360384-8d52-41fe-92a9-c44876f83a70	eed3ab00-3346-41cd-b55e-fbb275bf2360	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.418722+00	2025-03-17 21:13:13.418724+00	a6406d8d-4b54-4136-a878-03442f750a6b	ded61517-e22b-4256-b15d-06beba6a6204	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.424384+00	2025-03-17 21:13:13.424387+00	b57ceb23-f09b-417e-a1ad-215237938d61	75836571-e1cc-4188-a00e-833354b24f19	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.43011+00	2025-03-17 21:13:13.430112+00	03d59595-bc3f-4e14-9803-e7351d1e4d84	6958bfdd-caf6-4d03-8ea5-294948051f6a	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.436086+00	2025-03-17 21:13:13.436097+00	533a7162-da7e-4e3c-a83e-065ecc87ade8	6cc1cad5-718a-4cf2-a2c3-c324f478e5e1	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.440539+00	2025-03-17 21:13:13.44054+00	3d7265d1-096d-4c2c-bb11-cf5e354adabe	59226bc0-99a0-4cea-a522-d85340787ba8	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.445152+00	2025-03-17 21:13:13.445153+00	1d39ced1-ae2a-477a-a549-7aa036efb773	3b5222b7-643b-479b-962f-0a0b60f9225d	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.450184+00	2025-03-17 21:13:13.450185+00	052e1404-384c-4367-9770-23f65693f96c	c5c7133c-2ea9-4f21-af38-469610694fb6	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.455414+00	2025-03-17 21:13:13.455418+00	f4968d3f-cbb7-428d-87d1-3a79443c6df5	9d2ea600-65ff-4342-96a2-852b1cefdea8	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.460254+00	2025-03-17 21:13:13.460258+00	69facf41-2bb5-49c6-bd34-0543b038982a	f458a5de-e5fe-4c6f-b592-006f109a74cf	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.464585+00	2025-03-17 21:13:13.464587+00	555661dc-a7d9-498b-af06-e4d6c87b9d37	9329c8a4-c96d-4ea1-8f9a-9601bf34df93	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.46912+00	2025-03-17 21:13:13.469122+00	54e5918b-6a85-4f8d-bfb4-dedd0ed71dfc	7066e5c5-beb2-4040-8ddd-76581c231d0a	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.474125+00	2025-03-17 21:13:13.474128+00	eb2e4996-07db-4a90-b9cc-70e21e19761a	488cce53-ae22-403c-8098-418b0bbef665	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.4789+00	2025-03-17 21:13:13.478903+00	b4a022ab-a7fd-486c-98c0-3dfc8b875643	1218fdb4-3f24-4ac5-8b61-fc6668af16a5	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.483986+00	2025-03-17 21:13:13.483989+00	f5ea9454-fc02-4fed-bd25-bc8a626631d5	1004bcb6-e654-41ae-b36a-2b7ccb89c0d1	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.488862+00	2025-03-17 21:13:13.488864+00	7a6de0cd-d9aa-470d-8988-0a4c8c5cfa80	b0edd6ef-a02a-4d82-b1d1-aea82a35a377	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.49349+00	2025-03-17 21:13:13.493493+00	266e7a9a-1f3d-4910-98ba-e1cec47f77fe	d9913af8-03dd-42d3-93fb-d4fd027f9298	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.498906+00	2025-03-17 21:13:13.498909+00	f4038c9c-23dc-4ef2-a945-6d8d7512cfcf	7935caf3-0783-40c3-8e72-521ce07b47d2	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.504822+00	2025-03-17 21:13:13.504824+00	952ecf88-cd79-4063-9d38-dd6f752c1347	88079a37-7ea6-4642-a972-479a568e4056	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.510953+00	2025-03-17 21:13:13.510955+00	1dd5e8e6-68e6-4f61-8d2f-20a3cd60ab0e	87e5916b-71e0-4c7e-931a-ac0b1ce99388	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.515705+00	2025-03-17 21:13:13.515707+00	50b3ec1b-d098-4ee1-874a-5a5869035330	beeb6b03-1a96-4b53-82ed-b971f8cc3509	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.521076+00	2025-03-17 21:13:13.521078+00	7bf2ec2f-3564-4aa5-b376-0162d7962999	10bb0f1b-206c-4592-8d94-5391997ca34a	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.52609+00	2025-03-17 21:13:13.526092+00	4051272a-a5b4-48ab-8289-73169b527e29	77d96deb-3901-48ba-b16a-c15bbae61f8f	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.530693+00	2025-03-17 21:13:13.530695+00	0b26240a-0946-4097-ad5c-321f07f1114f	6efd1b2b-02c4-4237-bbdd-04e456c042f6	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.53603+00	2025-03-17 21:13:13.536032+00	05c5e641-0ea8-41ea-8053-939d481ada73	702a9f25-3bb9-437c-b9ec-ba19e8835753	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.541618+00	2025-03-17 21:13:13.541621+00	3fa140b3-6a33-414b-b0e2-24b1d723f249	0b5eb35c-0b58-4f7d-b32f-ae07bbc39335	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.546985+00	2025-03-17 21:13:13.546987+00	1beab9c0-4c9e-4a0e-a27b-6f12baeed3e0	a39f23f0-736c-4372-8739-484f17f04213	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.552602+00	2025-03-17 21:13:13.552604+00	e96d75ce-5f3f-4d9a-84d8-71abc9c60b05	5bbfeb4b-5706-4e49-b9c5-ff52b6d3e494	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.556624+00	2025-03-17 21:13:13.556625+00	bed16da8-3a44-47d8-868f-e5412af291b0	4e4942e6-8329-4c7d-a56e-1fc434016235	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.561842+00	2025-03-17 21:13:13.561845+00	8b3cdb4a-0c8c-45d6-b0bd-24fff9400fb9	99b3df7d-dc72-43ce-9468-28582830c30d	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.567583+00	2025-03-17 21:13:13.567586+00	9582a25f-7006-4d58-aad6-bb10a898e401	e31dcadc-a914-4504-a231-a2c13e5c95d5	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.573109+00	2025-03-17 21:13:13.573112+00	44ecd45f-ae3d-410c-ac9b-2b1aa8807858	c6f6b787-2ebf-4d3f-81ad-aac5f08c61a0	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.578668+00	2025-03-17 21:13:13.57867+00	0ef60bf5-29e3-48c1-be5a-2cdaa130972b	40fd26e9-56b5-424d-bcc4-add0d0bf2ee4	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.58468+00	2025-03-17 21:13:13.584682+00	f0e619fd-87dc-40e1-a9e6-45dfdd76be85	8acfbc42-a7e9-40d9-9d8c-6c2abb53740e	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.589807+00	2025-03-17 21:13:13.589809+00	ee2c3c3b-7b7b-4861-8c74-057b9779d80f	8c8871e7-1d01-42b1-b55d-637147c5d5da	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.59559+00	2025-03-17 21:13:13.5956+00	1b8ad6cd-131c-4b14-9af1-1b68ea36a427	d37fcee3-e1a2-4bc8-8238-23a2c695cda9	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.600105+00	2025-03-17 21:13:13.600108+00	a0a7986e-8961-471c-83a5-a14abe0e451b	39072f02-43a5-4d9b-ad45-0494cf63f6ee	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.605485+00	2025-03-17 21:13:13.605489+00	b3aa231b-8b95-453e-93b6-f405f3550e42	998b36c6-25d0-41bd-8d12-29d3c45b57fc	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.610667+00	2025-03-17 21:13:13.610669+00	3d6ab119-5dfa-4bdf-9a94-6512572f9161	732a4009-9394-4de2-92cb-ad66cb8bc423	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.615072+00	2025-03-17 21:13:13.615074+00	44e615aa-e64f-4b3d-99b1-d9f34dce53ad	d9cc1088-a4bf-4f91-8db1-a789af26bdba	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.620075+00	2025-03-17 21:13:13.620079+00	d35a6035-9f25-48cf-bca3-51f1682f85dc	cc84b967-cc65-4533-86c9-4b19005622eb	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.62633+00	2025-03-17 21:13:13.626332+00	567fb564-ce96-4231-9bb3-2d1c58c03d57	c6899adb-bac0-42e1-989c-412db8ddbe6d	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.632291+00	2025-03-17 21:13:13.632294+00	c5576e20-7b2e-4a07-ab50-91d5c9119b77	8a12594d-3855-49f1-bd9b-aabccb339874	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.637774+00	2025-03-17 21:13:13.637776+00	88a062f7-94fe-4eb3-8c0a-87ab1d2d96b1	75b84dac-54be-4847-bdbc-351f7bfd66d0	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.644293+00	2025-03-17 21:13:13.644294+00	c777f82f-e995-49a2-b3b5-189e32842951	0b6bc89d-c76b-49ba-bf10-caa3498e0f3d	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.649679+00	2025-03-17 21:13:13.649682+00	943641f5-e5cf-4f0f-be11-15058f0a7799	f3649afe-f326-473f-8209-6fb90371b7d8	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.654633+00	2025-03-17 21:13:13.654635+00	22a62606-3186-4c62-88aa-a360bd1c94b9	3a7faf5c-d9d7-4ce6-972e-952f27c56d11	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.659833+00	2025-03-17 21:13:13.659836+00	237dbbd2-34a5-4583-b565-a42a93967c95	092bd750-12f3-4cbc-b9d9-a0fc8a3cbf7b	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.664712+00	2025-03-17 21:13:13.664713+00	7282d913-2667-44f5-a238-6eaa2f8d96db	b4e044ad-f51d-4e50-af9c-c7aea2308d48	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.669593+00	2025-03-17 21:13:13.669594+00	5efa854e-3335-491a-a4dc-ca98008a464e	ba55a0f0-cefb-46ee-a775-8557fd7c8939	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.674719+00	2025-03-17 21:13:13.674721+00	2abc444c-077d-4a48-9d45-7b0fe45e85fe	e4831dd6-1ebc-4a48-bdab-e0a2e82951e0	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.679497+00	2025-03-17 21:13:13.679499+00	de0515e7-3d09-4d79-99d1-18bf1166acc9	b718380e-d51c-41d4-84ff-821ee7223c27	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.684545+00	2025-03-17 21:13:13.684546+00	7fecba35-ea6b-4e05-b031-cb0c3b22173c	3a25ddf3-2b32-403d-811b-b820bdd713a6	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.689843+00	2025-03-17 21:13:13.689845+00	faa6699a-9745-42f5-817c-4dc2e02deb01	2d3952d5-e779-479c-a2c4-bc149eb29412	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.694999+00	2025-03-17 21:13:13.695002+00	b1d07269-1e1e-434b-a41e-ba3e7feffc1d	67e0da6d-b323-4b71-81f2-0c49028b45fc	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.700067+00	2025-03-17 21:13:13.70007+00	19513df4-2496-469e-9699-3d47e46dad38	74806686-2176-40de-afa0-52f01df6a63b	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.705004+00	2025-03-17 21:13:13.705006+00	5ea84102-6420-4f79-994a-e388e99ce0d7	7e73591c-1abf-4e12-9f24-ebbe5f40385b	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.709929+00	2025-03-17 21:13:13.709931+00	6a813cf6-e958-440d-aaa1-ff8d64522bc4	f3c4d617-f4c7-4d04-8f4f-edf4ed8c7c4c	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.715126+00	2025-03-17 21:13:13.715127+00	432d20d5-8e24-4725-85a5-c429ca8f35e7	9e94a197-297f-4d53-a08b-25494047af61	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.720581+00	2025-03-17 21:13:13.720586+00	e4f05e3d-d3d4-4d13-981c-65cce8107d83	0ac8fe82-a41d-46a8-972d-4cd0ea37c632	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.726545+00	2025-03-17 21:13:13.726547+00	b567116b-dfac-43a5-80d0-d0495075ea2a	887ce4be-db2d-4542-a237-19e0176101a2	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.73044+00	2025-03-17 21:13:13.730441+00	cdc4c0cd-84b1-4818-b147-d36e9fa5d663	4d3d69da-df05-4df6-83bd-e505099eba02	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.736726+00	2025-03-17 21:13:13.736729+00	e950d598-ff71-4a71-85dc-d6a4c384b7e3	68ee8d3a-04ef-46e3-921f-c510248e5bbb	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.744328+00	2025-03-17 21:13:13.74433+00	f28a2287-4426-4da8-a3d4-9a12d299681d	441a5827-ee7b-420e-bfe6-2a0abb10e9de	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.750131+00	2025-03-17 21:13:13.750133+00	b788a4df-1a70-4ed4-a3f5-c4fc57420eab	b05b8357-dc2f-41da-92bc-513fbc19ce35	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.755765+00	2025-03-17 21:13:13.755767+00	0630d457-23dc-4a09-ace0-1dfb4cae8548	a6de8091-d9b4-4c04-986d-0df464559857	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.760739+00	2025-03-17 21:13:13.760741+00	ac5f8671-350a-4c2d-9558-b183364c0b2c	11cedd92-fe6a-4509-b8d1-bc42334d8fe6	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.766613+00	2025-03-17 21:13:13.766615+00	fdcc4524-a04b-400f-a072-c38a9098aed1	87918871-c9a4-49df-a5f9-ee794116d0a3	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.77159+00	2025-03-17 21:13:13.771592+00	45a66b55-6cc6-4821-b617-c4c091382f69	393296dd-36dd-4760-bcdf-c31621f9f881	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.776639+00	2025-03-17 21:13:13.77664+00	b22ddf1a-7443-4c3c-acfe-de980e805090	fa98f912-8ee5-4b2a-a8fb-238851706a54	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.782133+00	2025-03-17 21:13:13.782138+00	571b3108-bede-4c44-86bd-451c6ed6c6bf	f1da29b3-d79a-4c2b-a740-6d2d85e4a4c5	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.787876+00	2025-03-17 21:13:13.787878+00	fcd032fb-1afb-4c35-91ea-4a14bb34005b	a2b55b1b-10ff-4110-921a-5869729239fc	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.792161+00	2025-03-17 21:13:13.792162+00	1f831ce3-6f6c-4c5f-9552-4dc43c87e1e2	82700e77-5012-41bd-8e5d-e1bae471b1b5	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.797551+00	2025-03-17 21:13:13.797552+00	dd82921f-75a7-4b67-b4be-622eeff76c2f	5c6dff98-03e4-4795-b230-f65e6f877186	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.801749+00	2025-03-17 21:13:13.80175+00	33a71750-5100-41e7-a762-fdaade16192e	5cda26aa-1c26-4bde-b5b6-bfc44b6d5a70	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.806489+00	2025-03-17 21:13:13.80649+00	2a88d740-67aa-4a6d-8503-511eaa9bef74	e29f765f-9d70-4fb4-960d-241a8384f367	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.812091+00	2025-03-17 21:13:13.812095+00	ac501720-c960-49f1-bde6-3017eddb5bef	fc111f60-e067-4c33-a983-b724be516f0f	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.818066+00	2025-03-17 21:13:13.818069+00	e09335e3-5689-4645-83ec-3509cb6d5454	e6cd7242-4ca2-48a5-a1ff-1436410f4f66	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.823252+00	2025-03-17 21:13:13.823255+00	b1660d31-fb50-4a74-ae8d-a16d7e97d7b2	c2aad539-7a20-42ff-8d62-d7db2f1a414d	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.8284+00	2025-03-17 21:13:13.828403+00	b4f3c9b0-1d9f-4e7c-b0e0-b925359426bf	34e31656-9135-4ad5-8af7-2cd8cc4086a8	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.834786+00	2025-03-17 21:13:13.834789+00	198efb33-8a9e-45b0-b479-b8a2e0b61b20	c2dfa431-8a8a-44a9-ae77-caad167489b6	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.841822+00	2025-03-17 21:13:13.841827+00	8ed7efa7-e443-4367-b3eb-af2d5c1ab5aa	cbc37718-4110-424a-ae6b-8263b539b778	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.847254+00	2025-03-17 21:13:13.847256+00	65e9250c-6c72-461e-9e51-7f2b4b077fea	93cde493-ea64-4629-b926-87c9c2c053aa	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.852623+00	2025-03-17 21:13:13.852625+00	092770fc-9617-4c23-9c89-c9434b446897	c5b27c63-fcbd-49f6-9054-b41fd92e2d7b	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.857368+00	2025-03-17 21:13:13.857371+00	296061f5-a213-4b82-af9b-112622d2c0c9	f12e8f5f-bc86-42d1-acff-ef26a95cb025	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.862431+00	2025-03-17 21:13:13.862434+00	0492cd07-a2cf-4f14-8573-5958bc2f728a	4b0b07c7-1e6b-4096-ba32-b876136a9363	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.867204+00	2025-03-17 21:13:13.867206+00	bbc2eff9-cc73-4d97-b903-f4ba91b23e0b	d22c1ff3-d310-4e48-a066-3c0290d582fe	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.872232+00	2025-03-17 21:13:13.872235+00	13f44645-6a7d-4fc0-b281-81867ac78c40	19cf1b1f-d829-4bed-9aac-a35efea6d836	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.877102+00	2025-03-17 21:13:13.877105+00	977bc8c3-3ad4-4ac3-a989-f9bf8b196b0c	39ac58c8-85b1-4ca4-9d8d-85176da307a1	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.882235+00	2025-03-17 21:13:13.882238+00	e8c4a703-b6ff-491c-b1ad-585ffb04e063	879238ce-9918-4592-8c76-7d4e6bfe2060	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.88735+00	2025-03-17 21:13:13.887351+00	1d3f4c38-0022-4118-9d33-caf953b55c07	afef0c16-9818-4d15-a67a-86b9608d1216	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.891883+00	2025-03-17 21:13:13.891884+00	623894be-838a-4f8a-b68f-f0ea222db862	5bc0c1c2-a998-4d8b-b6b8-452f869d3310	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.899078+00	2025-03-17 21:13:13.899083+00	13ca538e-b633-4cb2-b267-da1457874d4d	90dd0a88-4b85-4540-8397-50c5f35c8ca8	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.90818+00	2025-03-17 21:13:13.908183+00	a909f9db-f0f5-4e8b-94bf-157f65a87cd1	ea6d884a-857e-4e2f-86a5-6afd12d44f89	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.916195+00	2025-03-17 21:13:13.916197+00	2fdaed97-6249-4829-9d0f-a82218d3fb05	b92fd13b-64fe-46c0-8a8d-2f35060ff0fa	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.922547+00	2025-03-17 21:13:13.922549+00	6af6fbb0-2967-458a-a6fb-7a0a1df4aae6	8ab3f273-cb11-49f8-93ec-01a3b51f1415	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.928709+00	2025-03-17 21:13:13.928712+00	5118ba64-f2d8-4db5-b24f-712dad9b6c7a	b5d5c01f-1c58-4f64-95ee-daf15c9de285	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.934087+00	2025-03-17 21:13:13.93409+00	cf130dee-2331-4adf-942b-1f6b7e316604	a6ada3ab-9f6f-4859-b889-92e52b3e5b46	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
t	2025-03-17 21:13:13.94112+00	2025-03-17 21:13:13.941124+00	b6ed4e45-c958-4fb4-9fbf-21814b79357c	247c8396-2353-45dc-ae45-08bd267969e5	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.store (status, registration_date, update_date, client_id, store_id, store_type_id, user_id, name, url) FROM stdin;
t	2025-03-17 21:13:14.831162+00	2025-03-17 21:13:14.831166+00	9e1ca542-d718-4058-83d0-abf62b73f8d1	800edb4d-cf29-46ad-a6d9-d3977844a9dc	04ff89ed-8934-49fc-901c-5f9e1a78fc29	218d8bb1-3f43-4170-9776-9adb6d7db6ed	SHOPIFY	https://shopify.com
t	2025-03-17 21:13:14.855785+00	2025-03-17 21:13:14.855787+00	9e1ca542-d718-4058-83d0-abf62b73f8d1	d1e6dede-765b-4bfc-a191-8046af60ac9c	a11e60d4-0e69-44e3-9b0b-bda5122ba53e	218d8bb1-3f43-4170-9776-9adb6d7db6ed	ARANNI	https://www.aranni.com.pe
t	2025-03-17 21:13:14.860898+00	2025-03-17 21:13:14.8609+00	9e1ca542-d718-4058-83d0-abf62b73f8d1	87ec62a9-707c-4c34-9902-70d77b8b7ad6	a11e60d4-0e69-44e3-9b0b-bda5122ba53e	218d8bb1-3f43-4170-9776-9adb6d7db6ed	KUNCA	https://kunca.pe
t	2025-03-17 21:57:47.138582+00	2025-03-17 21:57:47.138586+00	84a40517-458c-4933-97e7-e399d71b50e8	5bdcf459-185e-44b4-acc4-45783fd3b7fb	04ff89ed-8934-49fc-901c-5f9e1a78fc29	2f363ce3-e629-42d7-8bb2-7892307e0275	GNIUS	ww.gcapi.com
\.


--
-- Data for Name: user_data; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.user_data (status, registration_date, update_date, client_id, district_id, user_id, address, dni, email, gender, mobile, name, password, surname, username) FROM stdin;
t	2025-03-17 21:12:56.913448+00	2025-03-17 21:12:56.913473+00	84a40517-458c-4933-97e7-e399d71b50e8	cd5c4e84-c711-46c9-9fc5-8ead1d1021d1	2f363ce3-e629-42d7-8bb2-7892307e0275	cr 12 h 34	00000000	jca@gmail.com	M	00000000	JUAN	$2a$10$fYd20eei0.xvT4bIX0l0IO3FnSL6CFObLiz.WDp9TjAbJ6V7GNKgu	ROMERO	JROMERO
t	2025-03-17 21:12:57.008692+00	2025-03-17 21:12:57.008717+00	84a40517-458c-4933-97e7-e399d71b50e8	cd5c4e84-c711-46c9-9fc5-8ead1d1021d1	734cd5c6-d9fe-4a75-9b5e-6079e9ca31b3	REGISTER	REGISTER	REGISTER	REGISTER	00000000	REGISTER	$2a$10$ollWODzkwXU7BZdIDMWNq.lCS4pyQsmL1gl5uw.tUSHJlG84tUDri	REGISTER	REGISTER
t	2025-03-17 21:13:14.815068+00	2025-03-17 21:13:14.815071+00	9e1ca542-d718-4058-83d0-abf62b73f8d1	969b4e88-78a4-4dbf-9df4-180f355f80e0	218d8bb1-3f43-4170-9776-9adb6d7db6ed	cr 12 h 34	00000000	jca@gmail.com	M	00000000	JUAN	$2a$10$Yb2zxbEqH1piaiWbRWbTAucRpusmyZLi48I1qMC8nXMNIAxM7TeSu	ROMERO	JCOILA
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.user_role (status, registration_date, update_date, role_id, user_id, user_role_id) FROM stdin;
t	2025-03-17 21:12:56.925791+00	2025-03-17 21:12:56.925812+00	ac30331f-90b0-4dc8-a49a-a1a441097d30	2f363ce3-e629-42d7-8bb2-7892307e0275	2f2ba593-140d-4d43-9c34-982e14acd7f1
t	2025-03-17 21:13:14.823891+00	2025-03-17 21:13:14.823893+00	982ef2e6-3b9a-4d7d-855f-b3da64213466	2f363ce3-e629-42d7-8bb2-7892307e0275	f5e2728d-7919-4090-afae-296235cd571a
\.


--
-- Data for Name: brand; Type: TABLE DATA; Schema: marketing; Owner: postgres
--

COPY marketing.brand (status, registration_date, update_date, brand_id, client_id, user_id, name, sku) FROM stdin;
t	2025-03-17 21:13:14.967612+00	2025-03-17 21:13:14.967615+00	e753e00b-6589-4498-a084-2fb5e8fecd37	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ADIDAS	AX001
t	2025-03-17 21:13:14.974545+00	2025-03-17 21:13:14.974547+00	bff7497a-ea0b-4475-8997-04281b47cb20	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	NIKE	NX001
t	2025-03-17 21:13:14.978941+00	2025-03-17 21:13:14.978943+00	63610b5b-01c7-44ad-8bf4-4ddb873f8596	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	GUCCI	GX001
t	2025-03-17 21:13:14.984096+00	2025-03-17 21:13:14.9841+00	bc7d0d07-f1fd-4f1a-acd1-fffcc8a385de	84a40517-458c-4933-97e7-e399d71b50e8	2f363ce3-e629-42d7-8bb2-7892307e0275	ZARA	ZX001
\.


--
-- Data for Name: model; Type: TABLE DATA; Schema: marketing; Owner: postgres
--

COPY marketing.model (status, registration_date, update_date, brand_id, client_id, model_id, user_id, name, sku) FROM stdin;
t	2025-03-17 21:13:14.994973+00	2025-03-17 21:13:14.994977+00	e753e00b-6589-4498-a084-2fb5e8fecd37	84a40517-458c-4933-97e7-e399d71b50e8	97ced03d-888c-49cc-9f7c-06b5cd8dd120	2f363ce3-e629-42d7-8bb2-7892307e0275	AIR FORCE 1	AR001Z
t	2025-03-17 21:13:15.003125+00	2025-03-17 21:13:15.003127+00	bff7497a-ea0b-4475-8997-04281b47cb20	84a40517-458c-4933-97e7-e399d71b50e8	507921ae-bc3c-460d-8fbf-d691b9f9feca	2f363ce3-e629-42d7-8bb2-7892307e0275	SUPERSTAR	NC001CS
t	2025-03-17 22:58:47.8694+00	2025-03-17 22:58:47.869405+00	bff7497a-ea0b-4475-8997-04281b47cb20	84a40517-458c-4933-97e7-e399d71b50e8	490ee6c6-d9db-488b-9575-fb5d2c73155f	2f363ce3-e629-42d7-8bb2-7892307e0275	MODEL 1	MNI
t	2025-03-17 22:58:47.87338+00	2025-03-17 22:58:47.873384+00	bc7d0d07-f1fd-4f1a-acd1-fffcc8a385de	84a40517-458c-4933-97e7-e399d71b50e8	4e2d1156-c584-47c6-9421-b73b2bd58353	2f363ce3-e629-42d7-8bb2-7892307e0275	MODEL 2	ZMD
t	2025-03-17 22:58:47.876579+00	2025-03-17 22:58:47.876583+00	63610b5b-01c7-44ad-8bf4-4ddb873f8596	84a40517-458c-4933-97e7-e399d71b50e8	3cbccf47-b246-47fc-a171-1b1885e36b26	2f363ce3-e629-42d7-8bb2-7892307e0275	MODEL 3	GMD
t	2025-03-17 22:58:47.880029+00	2025-03-17 22:58:47.880034+00	63610b5b-01c7-44ad-8bf4-4ddb873f8596	84a40517-458c-4933-97e7-e399d71b50e8	4dceb73e-ada7-42c6-905c-a19798372282	2f363ce3-e629-42d7-8bb2-7892307e0275	MODEL 4	CCMD
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: marketing; Owner: postgres
--

COPY marketing.product (picture_flag, status, registration_date, update_date, client_id, color_id, model_id, product_id, size_id, sub_category_product_id, unit_id, user_id, name) FROM stdin;
t	t	2025-03-17 21:52:53.660658+00	2025-03-17 21:52:53.660663+00	84a40517-458c-4933-97e7-e399d71b50e8	3418e51c-cb91-4c5a-ac2f-dc78c4301e6c	97ced03d-888c-49cc-9f7c-06b5cd8dd120	931fc955-4613-404a-af2d-4459241d8f8d	b3ffbcea-5cdb-4143-9311-9054c59369a0	53e24a49-4240-4e3e-96c6-ce20039f55b5	3defdbe2-d57e-48d9-98b8-d6d5d9877840	2f363ce3-e629-42d7-8bb2-7892307e0275	CORRECTOR
f	t	2025-03-17 22:58:54.845455+00	2025-03-17 22:58:54.845467+00	84a40517-458c-4933-97e7-e399d71b50e8	b3558f36-70eb-47bd-9b8b-96eb1cd2dfd1	507921ae-bc3c-460d-8fbf-d691b9f9feca	b1b9c41f-2c2b-47c3-bf86-6ce127e85d49	b3ffbcea-5cdb-4143-9311-9054c59369a0	53e24a49-4240-4e3e-96c6-ce20039f55b5	3defdbe2-d57e-48d9-98b8-d6d5d9877840	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO1
f	t	2025-03-17 22:58:54.856381+00	2025-03-17 22:58:54.856387+00	84a40517-458c-4933-97e7-e399d71b50e8	e1a447e1-a791-4c69-b838-d3c322d32126	97ced03d-888c-49cc-9f7c-06b5cd8dd120	1839f116-2101-4f1a-bb7c-77f110114675	26c4d554-f2d2-4e1e-81ed-75dcbf1921da	09cc61b0-436c-4586-b140-1f75e8c80828	f0a929e8-ef05-4f10-9600-b0974ca45ba4	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO2
f	t	2025-03-17 22:58:54.865999+00	2025-03-17 22:58:54.866009+00	84a40517-458c-4933-97e7-e399d71b50e8	3861f2d2-39e2-4e97-8621-066a59a27244	507921ae-bc3c-460d-8fbf-d691b9f9feca	2601394e-1ca7-4878-94de-fff87aacf38b	d2acbedd-bedd-436f-96d4-4eedafd6fada	46910eb7-6e6e-47e2-987d-61f149394e6d	6eac514a-7bc9-4515-8131-bd06bfc1afbf	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO3
f	t	2025-03-17 22:58:54.876067+00	2025-03-17 22:58:54.876073+00	84a40517-458c-4933-97e7-e399d71b50e8	e1a447e1-a791-4c69-b838-d3c322d32126	97ced03d-888c-49cc-9f7c-06b5cd8dd120	e570b603-cc52-4ec2-a66f-740793f369cc	85b68194-6710-40db-971e-12cb3055e7e0	a81f9c66-5fba-4fcd-ae4c-f6d471fd0a49	b19d5c7b-4fd1-4cb5-8653-fffba2461534	2f363ce3-e629-42d7-8bb2-7892307e0275	PRODUCTO4
\.


--
-- Data for Name: product_picture; Type: TABLE DATA; Schema: marketing; Owner: postgres
--

COPY marketing.product_picture (registration_date, client_id, product_id, product_picture_id, user_id, product_picture_url) FROM stdin;
2025-03-17 21:52:55.87307+00	84a40517-458c-4933-97e7-e399d71b50e8	931fc955-4613-404a-af2d-4459241d8f8d	2fc0627f-7b16-4c4b-baf5-62bce0047bc3	2f363ce3-e629-42d7-8bb2-7892307e0275	http://res.cloudinary.com/dqzvbdf9r/image/upload/v1742248374/SISTEMA_PRODUCTOS/PRODUCTO_AX001AC001ACCAR001ZBLAA_JROMERO_2025-03-17_16-52-53_IMAGEN_1.png
\.


--
-- Data for Name: product_price; Type: TABLE DATA; Schema: marketing; Owner: postgres
--

COPY marketing.product_price (status, unit_sale_price, registration_date, update_date, product_id, product_price_id, user_id) FROM stdin;
t	12	2025-03-17 21:52:53.711696+00	2025-03-17 21:52:53.711701+00	931fc955-4613-404a-af2d-4459241d8f8d	54771c5e-2817-460b-aa10-bd204cee8313	2f363ce3-e629-42d7-8bb2-7892307e0275
t	52	2025-03-17 22:58:54.772194+00	2025-03-17 22:58:54.772196+00	b1b9c41f-2c2b-47c3-bf86-6ce127e85d49	e2be7512-e95a-46f6-8e5e-7d3cf3ad1aa0	\N
t	45	2025-03-17 22:58:54.794772+00	2025-03-17 22:58:54.794772+00	1839f116-2101-4f1a-bb7c-77f110114675	83347bd3-b5b2-44f0-b724-cca345ba1dd2	\N
t	65	2025-03-17 22:58:54.818077+00	2025-03-17 22:58:54.818077+00	2601394e-1ca7-4878-94de-fff87aacf38b	f6b21e6f-e68c-4190-9116-be45bae73cb9	\N
t	85	2025-03-17 22:58:54.84319+00	2025-03-17 22:58:54.843191+00	e570b603-cc52-4ec2-a66f-740793f369cc	7916477c-7a8f-45c0-918b-dc2d7fc56d32	\N
\.


--
-- Data for Name: cancellation_reason; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.cancellation_reason (status, registration_date, update_date, cancellation_reason_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.643719+00	2025-03-17 21:13:14.643722+00	61758158-a17c-4028-b865-3fe78d9fd698	2f363ce3-e629-42d7-8bb2-7892307e0275	NO HAY STOCK
t	2025-03-17 21:13:14.649391+00	2025-03-17 21:13:14.649394+00	e9e4a1c0-c549-4538-b3a3-31b60ab6897b	2f363ce3-e629-42d7-8bb2-7892307e0275	DEMORA EN ENTREGA
t	2025-03-17 21:13:14.655962+00	2025-03-17 21:13:14.655964+00	3f54078c-320e-45a4-a812-3b8f15cdb37b	2f363ce3-e629-42d7-8bb2-7892307e0275	MALA CALIDAD
t	2025-03-17 21:13:14.664156+00	2025-03-17 21:13:14.664161+00	c9130143-911f-494f-8afa-d2ad6fe70711	2f363ce3-e629-42d7-8bb2-7892307e0275	SE LE DAÑO EL PRODUCTO - 30 DIAS
t	2025-03-17 21:13:14.669467+00	2025-03-17 21:13:14.669471+00	eca32758-9c52-481d-babb-61ff7508995b	2f363ce3-e629-42d7-8bb2-7892307e0275	OTROS MOTIVOS
t	2025-03-17 21:13:14.673596+00	2025-03-17 21:13:14.673599+00	8831acbf-8148-49d3-a4da-d7faa987b7c1	2f363ce3-e629-42d7-8bb2-7892307e0275	MUY CARO EL ENVIO
t	2025-03-17 21:13:14.677139+00	2025-03-17 21:13:14.677142+00	c5586815-6b2d-4226-823c-6cff356928f7	2f363ce3-e629-42d7-8bb2-7892307e0275	ZONA PELIGROSA
t	2025-03-17 21:13:14.680807+00	2025-03-17 21:13:14.680811+00	d7ab29dc-7be7-4227-9e90-dc1cca8a8b38	2f363ce3-e629-42d7-8bb2-7892307e0275	CLIENTE NO CONFIABLE PARA CONTRAENTREGA
t	2025-03-17 21:13:14.684219+00	2025-03-17 21:13:14.684221+00	7b320e7e-0d48-42f2-937a-454b77ea1836	2f363ce3-e629-42d7-8bb2-7892307e0275	ROBO POR MOTORIZADO
t	2025-03-17 21:13:14.687356+00	2025-03-17 21:13:14.687359+00	396d71c1-493e-4b0c-94e9-ffab7d3f5614	2f363ce3-e629-42d7-8bb2-7892307e0275	NO LE GUSTO PRODUCTO
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.category (status, registration_date, update_date, category_id, user_id, description, name) FROM stdin;
t	2025-03-17 21:13:14.01175+00	2025-03-17 21:13:14.011752+00	b6fe4e27-6b09-445e-b198-ee91d60a5660	2f363ce3-e629-42d7-8bb2-7892307e0275	JOYAS Y BISUTERIA	JOYAS Y BISUTERIA
t	2025-03-17 21:13:14.016178+00	2025-03-17 21:13:14.016182+00	767d904f-897d-4ff5-979e-763ce8fb54df	2f363ce3-e629-42d7-8bb2-7892307e0275	MODA	MODA
t	2025-03-17 21:13:14.021867+00	2025-03-17 21:13:14.021869+00	62f07459-d182-4860-baf7-125ce407c713	2f363ce3-e629-42d7-8bb2-7892307e0275	TECNOLOGIA	TECNOLOGIA
t	2025-03-17 21:13:14.026631+00	2025-03-17 21:13:14.026634+00	8da78694-4efb-414f-a25b-7da5b5f181e6	2f363ce3-e629-42d7-8bb2-7892307e0275	COSMETICOS	COSMETICOS
t	2025-03-17 21:13:14.031007+00	2025-03-17 21:13:14.03101+00	afb1dd95-8d4e-4196-988f-92bd1b5cd9a9	2f363ce3-e629-42d7-8bb2-7892307e0275	OTRO	OTRO
\.


--
-- Data for Name: category_product; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.category_product (status, registration_date, update_date, category_product_id, client_id, size_type_id, unit_type_id, user_id, name, sku) FROM stdin;
t	2025-03-17 21:13:14.175783+00	2025-03-17 21:13:14.175786+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	0f97d517-4d28-4158-a1f7-8f6a899e505e	b19b3026-3e26-4c28-ad8a-3e6d32e25834	2f363ce3-e629-42d7-8bb2-7892307e0275	ROPA	RP001
t	2025-03-17 21:13:14.185922+00	2025-03-17 21:13:14.185925+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	07c42c20-5cbd-415d-a50f-887645aa8512	c3a898b6-176d-4b65-8dde-e39bb1941b0d	2f363ce3-e629-42d7-8bb2-7892307e0275	CALZADO	CA001
t	2025-03-17 21:13:14.195221+00	2025-03-17 21:13:14.195224+00	4f326f81-ead8-4330-b8de-0efa16882018	84a40517-458c-4933-97e7-e399d71b50e8	5169fa70-f07c-4b1e-b7a8-f70ac4b7a6e0	c95f25ff-5c4f-4464-93a6-531cebcfeb10	2f363ce3-e629-42d7-8bb2-7892307e0275	COMPLEMENTOS	CO001
t	2025-03-17 21:13:14.202727+00	2025-03-17 21:13:14.202729+00	fd2350dc-1fad-43c7-8689-c200e54866b5	84a40517-458c-4933-97e7-e399d71b50e8	752edb70-fac6-4444-982b-eb4fa42d36db	2b6f39bf-8c22-4291-b40a-b08d7ecc8943	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESORIOS	AC001
\.


--
-- Data for Name: closing_channel; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.closing_channel (status, registration_date, update_date, closing_channel_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.03617+00	2025-03-17 21:13:14.036172+00	38a4da32-f2f5-4123-9bfd-875161c508c9	2f363ce3-e629-42d7-8bb2-7892307e0275	WHATSAPP
t	2025-03-17 21:13:14.041988+00	2025-03-17 21:13:14.04199+00	b64b3550-d4bb-4ebd-998b-f0fd8718a6df	2f363ce3-e629-42d7-8bb2-7892307e0275	INSTAGRAM
t	2025-03-17 21:13:14.045782+00	2025-03-17 21:13:14.045784+00	1c45ae8d-f986-4a19-979e-69a50b55fa38	2f363ce3-e629-42d7-8bb2-7892307e0275	FACEBOOK
t	2025-03-17 21:13:14.049822+00	2025-03-17 21:13:14.049825+00	bfa30cda-abbf-47b4-8503-4f0a8ed44ae0	2f363ce3-e629-42d7-8bb2-7892307e0275	TIENDA
t	2025-03-17 21:13:14.054414+00	2025-03-17 21:13:14.054417+00	ad081ac0-c4be-43e0-befa-643f9dd0dba9	2f363ce3-e629-42d7-8bb2-7892307e0275	WEB
t	2025-03-17 21:13:14.058859+00	2025-03-17 21:13:14.058863+00	fc6bbd93-a98c-4b59-a789-1f1cac71eef0	2f363ce3-e629-42d7-8bb2-7892307e0275	MARKET PLACE
t	2025-03-17 21:13:14.062834+00	2025-03-17 21:13:14.062837+00	797a6c81-11ed-4e00-8e53-12ac0ae2d421	2f363ce3-e629-42d7-8bb2-7892307e0275	TIK TOK
t	2025-03-17 21:13:14.066291+00	2025-03-17 21:13:14.066293+00	2fabe03d-f3da-461a-83af-dbb8e464c82e	2f363ce3-e629-42d7-8bb2-7892307e0275	OTRO
\.


--
-- Data for Name: color; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.color (status, registration_date, update_date, client_id, color_id, user_id, name, sku) FROM stdin;
t	2025-03-17 21:13:14.101983+00	2025-03-17 21:13:14.101985+00	84a40517-458c-4933-97e7-e399d71b50e8	4ea6c7b7-d68f-42b6-aaca-f519b9682e3e	2f363ce3-e629-42d7-8bb2-7892307e0275	BEIGE	BEI
t	2025-03-17 21:13:14.101998+00	2025-03-17 21:13:14.102001+00	84a40517-458c-4933-97e7-e399d71b50e8	8f1334ed-db77-45db-89a1-b2508320b637	2f363ce3-e629-42d7-8bb2-7892307e0275	ROJO	ROJ
t	2025-03-17 21:13:14.104541+00	2025-03-17 21:13:14.104546+00	84a40517-458c-4933-97e7-e399d71b50e8	290b50ab-31e1-4b99-9a35-ea85f513f63b	2f363ce3-e629-42d7-8bb2-7892307e0275	NUDE	NUD
t	2025-03-17 21:13:14.110691+00	2025-03-17 21:13:14.110695+00	84a40517-458c-4933-97e7-e399d71b50e8	e66b7f9c-6953-40a2-ab18-aa9d7e43bd98	2f363ce3-e629-42d7-8bb2-7892307e0275	GRIS	GRI
t	2025-03-17 21:13:14.117889+00	2025-03-17 21:13:14.117892+00	84a40517-458c-4933-97e7-e399d71b50e8	b504a290-69cf-480f-9df8-64a08d09ac9b	2f363ce3-e629-42d7-8bb2-7892307e0275	AMARILLO	AMA
t	2025-03-17 21:13:14.941344+00	2025-03-17 21:13:14.941348+00	84a40517-458c-4933-97e7-e399d71b50e8	7d7e6d4d-0162-47be-828d-43583f6e0b5d	2f363ce3-e629-42d7-8bb2-7892307e0275	DORADO	DOR
t	2025-03-17 21:13:14.961082+00	2025-03-17 21:13:14.961086+00	84a40517-458c-4933-97e7-e399d71b50e8	d48a237c-1a5f-406d-8cbd-fe58c71858a6	2f363ce3-e629-42d7-8bb2-7892307e0275	VERDE PERA	VERP
t	2025-03-17 21:13:14.101983+00	2025-03-17 21:13:14.101985+00	84a40517-458c-4933-97e7-e399d71b50e8	8830bd3e-06b4-4a2f-8f39-ba55964570bf	2f363ce3-e629-42d7-8bb2-7892307e0275	NEGRO	NEG
t	2025-03-17 21:13:14.949982+00	2025-03-17 21:13:14.949984+00	84a40517-458c-4933-97e7-e399d71b50e8	d72d2783-b3d5-4ac8-8055-96c641f0f207	2f363ce3-e629-42d7-8bb2-7892307e0275	PLATA	PLA
t	2025-03-17 21:13:14.102013+00	2025-03-17 21:13:14.102016+00	84a40517-458c-4933-97e7-e399d71b50e8	71d36cbe-b8b2-4f7e-8ef0-9da7d1ce65b5	2f363ce3-e629-42d7-8bb2-7892307e0275	CAMEL	CAM
t	2025-03-17 21:13:14.102291+00	2025-03-17 21:13:14.102293+00	84a40517-458c-4933-97e7-e399d71b50e8	3418e51c-cb91-4c5a-ac2f-dc78c4301e6c	2f363ce3-e629-42d7-8bb2-7892307e0275	BLANCO	BLA
t	2025-03-17 21:13:14.118005+00	2025-03-17 21:13:14.118007+00	84a40517-458c-4933-97e7-e399d71b50e8	14e1fe25-e135-4cde-9b82-d0689f624671	2f363ce3-e629-42d7-8bb2-7892307e0275	COMBINADO	COM
t	2025-03-17 21:13:14.118012+00	2025-03-17 21:13:14.118015+00	84a40517-458c-4933-97e7-e399d71b50e8	d5064139-96e0-4a3d-9c31-de2f48099043	2f363ce3-e629-42d7-8bb2-7892307e0275	AZUL	AZU
t	2025-03-17 21:13:14.118375+00	2025-03-17 21:13:14.118377+00	84a40517-458c-4933-97e7-e399d71b50e8	caf5deed-2238-4a71-b6f8-022649cdd308	2f363ce3-e629-42d7-8bb2-7892307e0275	NARANJA	NAR
t	2025-03-17 21:13:14.941717+00	2025-03-17 21:13:14.941724+00	84a40517-458c-4933-97e7-e399d71b50e8	b3558f36-70eb-47bd-9b8b-96eb1cd2dfd1	2f363ce3-e629-42d7-8bb2-7892307e0275	MARRON	MAR
t	2025-03-17 21:13:14.942132+00	2025-03-17 21:13:14.94214+00	84a40517-458c-4933-97e7-e399d71b50e8	e1a447e1-a791-4c69-b838-d3c322d32126	2f363ce3-e629-42d7-8bb2-7892307e0275	LACRE	LAC
t	2025-03-17 21:13:14.948942+00	2025-03-17 21:13:14.948949+00	84a40517-458c-4933-97e7-e399d71b50e8	99922c69-feb5-439f-8aec-191a6e92883f	2f363ce3-e629-42d7-8bb2-7892307e0275	CELESTE	CEL
t	2025-03-17 21:13:14.951927+00	2025-03-17 21:13:14.95193+00	84a40517-458c-4933-97e7-e399d71b50e8	47019646-15b5-42b5-b788-e1abcc27d1ad	2f363ce3-e629-42d7-8bb2-7892307e0275	MELON	MEL
t	2025-03-17 21:13:14.957772+00	2025-03-17 21:13:14.957777+00	84a40517-458c-4933-97e7-e399d71b50e8	400e19b3-a688-4243-963a-eb977a2cd4c1	2f363ce3-e629-42d7-8bb2-7892307e0275	CHOCOLATE	CHO
t	2025-03-17 21:13:14.962466+00	2025-03-17 21:13:14.962472+00	84a40517-458c-4933-97e7-e399d71b50e8	cdf2b25d-b953-4487-a2a9-a5d2e7e04ad4	2f363ce3-e629-42d7-8bb2-7892307e0275	VERDE LORO	VERL
t	2025-03-17 21:13:14.102091+00	2025-03-17 21:13:14.102095+00	84a40517-458c-4933-97e7-e399d71b50e8	3c876710-8703-4e4b-afe2-41c4b5b0a665	2f363ce3-e629-42d7-8bb2-7892307e0275	PERLA	PER
t	2025-03-17 21:13:14.117373+00	2025-03-17 21:13:14.117377+00	84a40517-458c-4933-97e7-e399d71b50e8	0035e13c-0a14-4038-ae84-897314288e6b	2f363ce3-e629-42d7-8bb2-7892307e0275	MORADO	MOR
t	2025-03-17 21:13:14.941643+00	2025-03-17 21:13:14.941648+00	84a40517-458c-4933-97e7-e399d71b50e8	3a0c1abb-d2c8-4e87-bd9d-546f1deba293	2f363ce3-e629-42d7-8bb2-7892307e0275	FUCSIA	FUC
t	2025-03-17 21:13:14.950284+00	2025-03-17 21:13:14.950291+00	84a40517-458c-4933-97e7-e399d71b50e8	a4cef5e6-e1cc-402e-93a0-13a55162bd0b	2f363ce3-e629-42d7-8bb2-7892307e0275	PRINT	PRI
t	2025-03-17 21:13:14.102301+00	2025-03-17 21:13:14.102302+00	84a40517-458c-4933-97e7-e399d71b50e8	1b4eb7db-f486-42b6-ba24-c4ff9b91fc5c	2f363ce3-e629-42d7-8bb2-7892307e0275	HUESO	HUE
t	2025-03-17 21:13:14.118395+00	2025-03-17 21:13:14.118397+00	84a40517-458c-4933-97e7-e399d71b50e8	dc7fcf51-8763-4fc1-ae55-a0a13e0b9d6d	2f363ce3-e629-42d7-8bb2-7892307e0275	JADE	JAD
t	2025-03-17 21:13:14.941701+00	2025-03-17 21:13:14.94171+00	84a40517-458c-4933-97e7-e399d71b50e8	ec5a4494-58f6-4cce-8754-454e6cc738b9	2f363ce3-e629-42d7-8bb2-7892307e0275	PLATA QUEMADA	PLAQ
t	2025-03-17 21:13:14.941643+00	2025-03-17 21:13:14.941645+00	84a40517-458c-4933-97e7-e399d71b50e8	3861f2d2-39e2-4e97-8621-066a59a27244	2f363ce3-e629-42d7-8bb2-7892307e0275	ROSADO	ROS
t	2025-03-17 21:13:14.951521+00	2025-03-17 21:13:14.951523+00	84a40517-458c-4933-97e7-e399d71b50e8	df98c077-ac92-4f54-992f-9fcdd3e79d4a	2f363ce3-e629-42d7-8bb2-7892307e0275	LILA	LIL
t	2025-03-17 21:13:14.95822+00	2025-03-17 21:13:14.958227+00	84a40517-458c-4933-97e7-e399d71b50e8	4f5783c1-0bdc-4155-b3dd-436f6ec7f261	2f363ce3-e629-42d7-8bb2-7892307e0275	MOSTAZA	MOS
t	2025-03-17 21:13:14.103337+00	2025-03-17 21:13:14.103341+00	84a40517-458c-4933-97e7-e399d71b50e8	f7950638-6b9f-4f7a-a52c-7f79f94be453	2f363ce3-e629-42d7-8bb2-7892307e0275	VERDE	VER
t	2025-03-17 21:13:14.105401+00	2025-03-17 21:13:14.105407+00	84a40517-458c-4933-97e7-e399d71b50e8	2914b764-8bce-42af-a7f5-726cf9ea29b7	2f363ce3-e629-42d7-8bb2-7892307e0275	VINO	VIN
t	2025-03-17 21:13:14.118027+00	2025-03-17 21:13:14.118029+00	84a40517-458c-4933-97e7-e399d71b50e8	70f2c735-90c4-4d68-af6d-07c4ec1ab08e	2f363ce3-e629-42d7-8bb2-7892307e0275	ACERO	ACE
t	2025-03-17 21:13:14.961034+00	2025-03-17 21:13:14.961035+00	84a40517-458c-4933-97e7-e399d71b50e8	6d3ed7bf-74fd-4233-af67-cd19830c64eb	2f363ce3-e629-42d7-8bb2-7892307e0275	AZUL ELECTRICO	AZUL
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.country (status, registration_date, update_date, country_id, name) FROM stdin;
t	2025-03-17 21:12:56.806922+00	2025-03-17 21:12:56.807014+00	c950726e-4cf8-45fc-bac8-c5a799ced841	SISTEMA
t	2025-03-17 21:12:57.118101+00	2025-03-17 21:12:57.118131+00	e9f68e76-7959-4ffd-9807-a29031b1f752	TURQUÍA
t	2025-03-17 21:12:57.129166+00	2025-03-17 21:12:57.129203+00	ceea7e83-f691-4ac7-8a95-5413d7bde22f	ISLAS FEROE
t	2025-03-17 21:12:57.137854+00	2025-03-17 21:12:57.137868+00	9f6509a7-f4ae-44ef-a951-d3b66fb11b0b	PARAGUAY
t	2025-03-17 21:12:57.149049+00	2025-03-17 21:12:57.149067+00	7f9cb18a-567d-4009-9ea7-9721e1e75527	POLINESIA FRANCESA
t	2025-03-17 21:12:57.159874+00	2025-03-17 21:12:57.159888+00	f498beb7-9ae0-4bad-ab5c-78f1d66033bf	OMÁN
t	2025-03-17 21:12:57.168262+00	2025-03-17 21:12:57.168274+00	53cd66af-9cee-4aff-8229-3ad8ffef4a1e	DINAMARCA
t	2025-03-17 21:12:57.175557+00	2025-03-17 21:12:57.175568+00	c533f266-5a24-447d-9459-6c0bc09e63b1	CÔTE D’IVOIRE
t	2025-03-17 21:12:57.183806+00	2025-03-17 21:12:57.183822+00	c5e7a4eb-4ea6-40fb-a001-7e5a1d14c21c	BAHAMAS
t	2025-03-17 21:12:57.192318+00	2025-03-17 21:12:57.192332+00	07278bfe-11ca-403e-b965-7def94156b1b	MONTSERRAT
t	2025-03-17 21:12:57.199164+00	2025-03-17 21:12:57.199179+00	f92568cf-a915-4c72-897c-a785e5602683	MARRUECOS
t	2025-03-17 21:12:57.206887+00	2025-03-17 21:12:57.2069+00	c6f4ff6c-c903-41e5-9da6-0afa0178ffeb	MALI
t	2025-03-17 21:12:57.214499+00	2025-03-17 21:12:57.214509+00	64ca0120-c9c2-4773-8c6e-772f8c0c4511	SIRIA
t	2025-03-17 21:12:57.221581+00	2025-03-17 21:12:57.221599+00	7f264afd-e3d7-4b66-8a39-22e1bf55b885	BUTÁN
t	2025-03-17 21:12:57.230196+00	2025-03-17 21:12:57.230212+00	c1b82c42-2f20-4661-803d-851f452707cb	CURAZAO
t	2025-03-17 21:12:57.237747+00	2025-03-17 21:12:57.237759+00	f131980c-9408-49ef-8ecc-fd2ecb1ff9ba	KENIA
t	2025-03-17 21:12:57.244624+00	2025-03-17 21:12:57.24464+00	b944fc75-e74d-409c-9d4d-8733667aeeb1	LAOS
t	2025-03-17 21:12:57.252862+00	2025-03-17 21:12:57.252881+00	ac7ab26a-fbe9-4cf8-87c7-c10bd9fcf6db	LUXEMBURGO
t	2025-03-17 21:12:57.261083+00	2025-03-17 21:12:57.261094+00	b4dbc4b1-0628-4b8d-8064-f72302f672fc	ISLA NORFOLK
t	2025-03-17 21:12:57.268207+00	2025-03-17 21:12:57.268216+00	702d1417-43d5-4c28-b263-47b834db4f01	ARGENTINA
t	2025-03-17 21:12:57.275835+00	2025-03-17 21:12:57.275847+00	246d124d-5775-43bb-9891-9f203986554a	SEYCHELLES
t	2025-03-17 21:12:57.284372+00	2025-03-17 21:12:57.284386+00	59fb7d3e-8e2a-45b8-9c81-1530f6ff850d	ZAMBIA
t	2025-03-17 21:12:57.29286+00	2025-03-17 21:12:57.292871+00	bfdee16d-58d6-48e8-aee7-ea067d34c94b	NÍGER
t	2025-03-17 21:12:57.301239+00	2025-03-17 21:12:57.301259+00	1c5a13fb-6cbf-4c75-b6ca-18b65dee1a6a	CONGO
t	2025-03-17 21:12:57.309696+00	2025-03-17 21:12:57.309712+00	ea4b0d21-9c53-46cd-a098-89bf69389da4	NAMIBIA
t	2025-03-17 21:12:57.31876+00	2025-03-17 21:12:57.318768+00	4652fc61-9a48-40ce-8e59-ce18f5eca8bb	KAZAJISTÁN
t	2025-03-17 21:12:57.327302+00	2025-03-17 21:12:57.327326+00	59f9ca8e-f0f2-4a70-9b5a-73a8bbb5cc13	LITUANIA
t	2025-03-17 21:12:57.336729+00	2025-03-17 21:12:57.336752+00	e4d7bc41-4c45-4110-b478-597ac3821097	GEORGIA
t	2025-03-17 21:12:57.345206+00	2025-03-17 21:12:57.345218+00	70193746-b35f-4545-995f-37d1cbf6b0ac	YEMEN
t	2025-03-17 21:12:57.351151+00	2025-03-17 21:12:57.351162+00	2ef2cbec-cc1a-4daf-8e5f-098c8525f617	EGIPTO
t	2025-03-17 21:12:57.35761+00	2025-03-17 21:12:57.357624+00	01c4d682-89ed-4ba7-8721-6e80ad89f720	GUADALUPE
t	2025-03-17 21:12:57.36535+00	2025-03-17 21:12:57.365359+00	3faba1e3-cdfc-4087-97d1-bfb268f23a96	PUERTO RICO
t	2025-03-17 21:12:57.372459+00	2025-03-17 21:12:57.37247+00	a53ad0db-5937-427c-9bf8-515d008ed454	ERITREA
t	2025-03-17 21:12:57.381609+00	2025-03-17 21:12:57.381617+00	01e7c6f4-761c-4944-b3d7-c94dcb44dfbb	MADAGASCAR
t	2025-03-17 21:12:57.389442+00	2025-03-17 21:12:57.389455+00	ddc4ee87-f2e4-4b13-93c5-92026ab41f5a	ARUBA
t	2025-03-17 21:12:57.39673+00	2025-03-17 21:12:57.396739+00	26764e2c-597e-445c-8939-10ec69196236	BRASIL
t	2025-03-17 21:12:57.405342+00	2025-03-17 21:12:57.405354+00	45db8403-d838-4b50-b3cf-1ebbefc5c99e	ANDORRA
t	2025-03-17 21:12:57.41345+00	2025-03-17 21:12:57.413462+00	43ce756b-41bc-4c00-9e00-56d97cadfba0	LIECHTENSTEIN
t	2025-03-17 21:12:57.419481+00	2025-03-17 21:12:57.419489+00	f14862cf-7f8d-426c-ba1f-b9e49fa04a7a	UCRANIA
t	2025-03-17 21:12:57.425997+00	2025-03-17 21:12:57.426027+00	901151f9-a983-4bf5-a647-4c28c614a355	GRECIA
t	2025-03-17 21:12:57.433422+00	2025-03-17 21:12:57.433432+00	eb9d18a4-4f5a-4573-b300-9cd4a668ab2f	FILIPINAS
t	2025-03-17 21:12:57.43978+00	2025-03-17 21:12:57.43979+00	4d5fc469-5915-4728-a25f-2f9a8a7089cb	BULGARIA
t	2025-03-17 21:12:57.44744+00	2025-03-17 21:12:57.447455+00	a40fa80b-16b6-4b51-ba8d-367928bf3c17	MÓNACO
t	2025-03-17 21:12:57.453546+00	2025-03-17 21:12:57.453557+00	1a62df4c-c220-4b88-835a-45efc16bb17b	LIBIA
t	2025-03-17 21:12:57.462742+00	2025-03-17 21:12:57.462759+00	97f497c4-0fe6-49b5-9f8b-b24d62d36286	ISLAS VÍRGENES DE EE. UU.
t	2025-03-17 21:12:57.473502+00	2025-03-17 21:12:57.473514+00	62c2aa43-4dbf-4f48-850d-c2ea5edc4cd7	ISLAS TURCAS Y CAICOS
t	2025-03-17 21:12:57.482505+00	2025-03-17 21:12:57.482537+00	00984cbe-8775-4f6f-9836-0722b3f8cf14	IRLANDA
t	2025-03-17 21:12:57.490668+00	2025-03-17 21:12:57.490687+00	8dd6a873-90bc-46e4-87b1-049cb8dbce3a	TUVALU
t	2025-03-17 21:12:57.498357+00	2025-03-17 21:12:57.498367+00	1c25ee61-56bb-4bcd-8858-3e90661d5651	SÁHARA OCCIDENTAL
t	2025-03-17 21:12:57.504776+00	2025-03-17 21:12:57.504795+00	76c2ee84-211b-4be6-a1b9-eb2dfc65d435	ISLA DE MAN
t	2025-03-17 21:12:57.513655+00	2025-03-17 21:12:57.513669+00	24303323-00f0-42e2-bf27-9b0e3071ee9b	CUBA
t	2025-03-17 21:12:57.521621+00	2025-03-17 21:12:57.521642+00	88fbea02-bf11-48d0-aa2a-aad4f47cee84	REPÚBLICA CENTROAFRICANA
t	2025-03-17 21:12:57.529831+00	2025-03-17 21:12:57.52984+00	bdc4baa3-fa44-498a-8a95-bf4076cfc0a3	MAURITANIA
t	2025-03-17 21:12:57.538866+00	2025-03-17 21:12:57.53888+00	edaa101c-7055-4f45-b29d-64bd466fa877	GUERNSEY
t	2025-03-17 21:12:57.54652+00	2025-03-17 21:12:57.546528+00	87c6d26e-a21e-45ba-9cf8-2a6b99ee4706	BRUNÉI
t	2025-03-17 21:12:57.551956+00	2025-03-17 21:12:57.551963+00	27d8d3c6-5abc-4452-a092-3a5562e245e2	ISLANDIA
t	2025-03-17 21:12:57.557309+00	2025-03-17 21:12:57.557324+00	1878332d-1379-4a78-8c6e-fbcc1cc8b4c7	KIRGUISTÁN
t	2025-03-17 21:12:57.563847+00	2025-03-17 21:12:57.563858+00	b72646dd-7541-4127-a1de-ab21326ed495	MAYOTTE
t	2025-03-17 21:12:57.570466+00	2025-03-17 21:12:57.570488+00	0dcfa287-4bdf-499c-8a9e-5389423bfe44	SAN CRISTÓBAL Y NIEVES
t	2025-03-17 21:12:57.576093+00	2025-03-17 21:12:57.576101+00	5a600b93-9c5b-4037-9b94-574d86120317	SAN MARINO
t	2025-03-17 21:12:57.582158+00	2025-03-17 21:12:57.58217+00	a7099795-da3c-4876-a602-bf659e475a74	ISRAEL
t	2025-03-17 21:12:57.588234+00	2025-03-17 21:12:57.588241+00	58ae3321-5372-4cf4-9082-1b925d60b2ee	AUSTRALIA
t	2025-03-17 21:12:57.594026+00	2025-03-17 21:12:57.594037+00	7b667de5-e9d1-45f0-bea0-6e095424b0fb	BERMUDAS
t	2025-03-17 21:12:57.599972+00	2025-03-17 21:12:57.599994+00	75308a93-959f-4796-91a0-93f3517b938f	ISLAS MARSHALL
t	2025-03-17 21:12:57.60698+00	2025-03-17 21:12:57.606999+00	a4203131-c790-47de-a585-615467b10628	GIBRALTAR
t	2025-03-17 21:12:57.614808+00	2025-03-17 21:12:57.61482+00	932e191d-0feb-4230-a053-d97df6aa8c54	MAURICIO
t	2025-03-17 21:12:57.623164+00	2025-03-17 21:12:57.623173+00	40c30735-ae6a-4856-8982-7c5f5cccd6e1	SURINAM
t	2025-03-17 21:12:57.630722+00	2025-03-17 21:12:57.630739+00	952b66e8-458b-4ada-aac0-3c1497f27084	WALLIS Y FUTUNA
t	2025-03-17 21:12:57.639806+00	2025-03-17 21:12:57.639821+00	f25674b5-33c6-4261-9b14-2aa8056afb30	ARMENIA
t	2025-03-17 21:12:57.646985+00	2025-03-17 21:12:57.646994+00	7f93c66c-520d-4bc9-acd0-04c0c06be0c9	MALAUI
t	2025-03-17 21:12:57.653239+00	2025-03-17 21:12:57.653264+00	24ef4fe8-6bc5-4a8f-adac-8bd50ce0a006	IRÁN
t	2025-03-17 21:12:57.659523+00	2025-03-17 21:12:57.659536+00	67492761-b7c2-4cbb-9b18-d281d67bb828	GABÓN
t	2025-03-17 21:12:57.664626+00	2025-03-17 21:12:57.664637+00	27b8e011-fa48-4406-837b-4ffafa8653f9	PANAMÁ
t	2025-03-17 21:12:57.668979+00	2025-03-17 21:12:57.668987+00	579dc172-1c48-44cb-b208-7e0965b7afac	GROENLANDIA
t	2025-03-17 21:12:57.673917+00	2025-03-17 21:12:57.673924+00	77d4a2d4-fe1f-424f-a1b0-f6c002eeaffb	JERSEY
t	2025-03-17 21:12:57.67909+00	2025-03-17 21:12:57.679099+00	f20ae077-ad4e-4a66-8124-05062cbb99ac	CABO VERDE
t	2025-03-17 21:12:57.684935+00	2025-03-17 21:12:57.684945+00	f3ec11e9-5851-4fe1-ac9a-f4d7c95c507f	CARIBE NEERLANDÉS
t	2025-03-17 21:12:57.690234+00	2025-03-17 21:12:57.690257+00	6b0938be-ccf8-4a0e-be25-501e9b914cc9	RAE DE HONG KONG (CHINA)
t	2025-03-17 21:12:57.69497+00	2025-03-17 21:12:57.694977+00	a7be6de9-28f3-42a7-b80d-4b68d41db286	NUEVA CALEDONIA
t	2025-03-17 21:12:57.700069+00	2025-03-17 21:12:57.700081+00	f1706162-c1a8-457e-aa41-d40f867d0d4f	ECUADOR
t	2025-03-17 21:12:57.705331+00	2025-03-17 21:12:57.705342+00	8cca9387-e311-42a5-ae8d-a88150e90859	COLOMBIA
t	2025-03-17 21:12:57.710123+00	2025-03-17 21:12:57.710138+00	20973fe9-e358-4f8f-b198-aba8e5b83ead	ISLAS MARIANAS DEL NORTE
t	2025-03-17 21:12:57.715766+00	2025-03-17 21:12:57.715776+00	7b09a10f-bc5e-45b6-8c35-d48c3048c8cd	SUDÁN DEL SUR
t	2025-03-17 21:12:57.72145+00	2025-03-17 21:12:57.721459+00	b01a5b4d-ec66-48aa-9729-3ec79de2792a	CANADÁ
t	2025-03-17 21:12:57.726425+00	2025-03-17 21:12:57.726432+00	ac10b8d4-a377-4b7c-b9ff-57a5153527eb	VANUATU
t	2025-03-17 21:12:57.731411+00	2025-03-17 21:12:57.731424+00	89fee53f-d8bf-43cc-b643-0eb2abe7efca	BOTSUANA
t	2025-03-17 21:12:57.736896+00	2025-03-17 21:12:57.736912+00	b8d1c93d-a1f9-4f3c-90d2-f8e735f67808	HONDURAS
t	2025-03-17 21:12:57.743388+00	2025-03-17 21:12:57.743412+00	05be8311-dff2-4fb6-b996-6d9a8fd5f1e9	NAURU
t	2025-03-17 21:12:57.749364+00	2025-03-17 21:12:57.749374+00	45e7465d-9813-4926-b504-abff9b6562f0	TAYIKISTÁN
t	2025-03-17 21:12:57.754945+00	2025-03-17 21:12:57.754966+00	b45105c8-4e20-4942-a5d1-3a482a14d239	ZIMBABUE
t	2025-03-17 21:12:57.76023+00	2025-03-17 21:12:57.76025+00	5740e8ef-35c8-49d1-8ab3-6fb2fa875a58	ISLAS CAIMÁN
t	2025-03-17 21:12:57.766008+00	2025-03-17 21:12:57.766019+00	99059084-4971-4095-8b18-a62bf37cc9e5	BURUNDI
t	2025-03-17 21:12:57.771059+00	2025-03-17 21:12:57.771069+00	ec8486ab-8501-4063-963b-945d56c5b976	RUANDA
t	2025-03-17 21:12:57.776432+00	2025-03-17 21:12:57.776442+00	474374ef-4354-49fb-9910-38828f2b64ac	GRANADA
t	2025-03-17 21:12:57.781221+00	2025-03-17 21:12:57.78123+00	87267ed1-5124-407d-bf2c-802c12318d32	SAN MARTÍN
t	2025-03-17 21:12:57.786605+00	2025-03-17 21:12:57.786616+00	ceadff02-33ac-41e6-8094-3c4d5f25bae8	ISLAS MALVINAS
t	2025-03-17 21:12:57.792257+00	2025-03-17 21:12:57.792304+00	8e0681f8-0c2d-41ef-a4a8-7f339dd0c831	ETIOPÍA
t	2025-03-17 21:12:57.797844+00	2025-03-17 21:12:57.797854+00	46e1ea84-deba-481a-a4cd-40f3dc3b5ba9	BARÉIN
t	2025-03-17 21:12:57.802925+00	2025-03-17 21:12:57.802933+00	fd1420bb-c9b8-43a3-90ee-7ec038c36ad8	SAN VICENTE Y LAS GRANADINAS
t	2025-03-17 21:12:57.809495+00	2025-03-17 21:12:57.809506+00	464f54af-8a21-4b49-98db-b3e08528f216	CHINA
t	2025-03-17 21:12:57.815659+00	2025-03-17 21:12:57.81567+00	e6bf68c1-e6a5-455b-ac35-4d67a7079805	SINT MAARTEN
t	2025-03-17 21:12:57.823325+00	2025-03-17 21:12:57.823337+00	fb8c8a79-8217-4ab8-a940-0e11ca99fbf7	AFGANISTÁN
t	2025-03-17 21:12:57.831377+00	2025-03-17 21:12:57.831406+00	681d0854-24a6-40a4-a46b-9b4bbb96f4d4	ISLA BOUVET
t	2025-03-17 21:12:57.838554+00	2025-03-17 21:12:57.838567+00	d2ed8916-d00f-491c-a590-cdd12c7b9e43	GUINEA-BISÁU
t	2025-03-17 21:12:57.844623+00	2025-03-17 21:12:57.84463+00	322fc7ab-c3d3-43c1-91cf-314bb8553a08	TOGO
t	2025-03-17 21:12:57.849187+00	2025-03-17 21:12:57.849195+00	e8887e64-7a21-48f6-bb6b-48f02c17f5d0	REUNIÓN
t	2025-03-17 21:12:57.85346+00	2025-03-17 21:12:57.853467+00	bf0c1af3-8a57-4019-9b1f-4586e5c47477	MALASIA
t	2025-03-17 21:12:57.857211+00	2025-03-17 21:12:57.857218+00	9e9c065d-25d0-4a35-b89c-3edce1ad9c03	YIBUTI
t	2025-03-17 21:12:57.86088+00	2025-03-17 21:12:57.86089+00	3b363290-0e77-4e10-93be-54a4d56a6ea9	TERRITORIO BRITÁNICO DEL OCÉANO ÍNDICO
t	2025-03-17 21:12:57.865647+00	2025-03-17 21:12:57.865656+00	a6863a98-1923-4894-98ff-059e4f5004c5	REPÚBLICA DOMINICANA
t	2025-03-17 21:12:57.869933+00	2025-03-17 21:12:57.869943+00	a606be43-f8c2-4dab-a0f7-e5b22062a834	REINO UNIDO
t	2025-03-17 21:12:57.874116+00	2025-03-17 21:12:57.874123+00	360289c2-6c91-4a10-ab23-647ca6def473	SAMOA AMERICANA
t	2025-03-17 21:12:57.878542+00	2025-03-17 21:12:57.878549+00	51ab83bd-71a5-4900-bd07-fb8bec5ce24c	RAE DE MACAO (CHINA)
t	2025-03-17 21:12:57.882563+00	2025-03-17 21:12:57.882569+00	5a0fb9ca-576e-4b80-8f10-9a2b74f2d88a	RUMANÍA
t	2025-03-17 21:12:57.886291+00	2025-03-17 21:12:57.886298+00	f5f9e762-b557-46cf-ae68-ee77ca8646c4	LETONIA
t	2025-03-17 21:12:57.890921+00	2025-03-17 21:12:57.890931+00	80144789-4c6e-4c43-881b-50bc690bfa5e	ISLAS GEORGIA DEL SUR Y SANDWICH DEL SUR
t	2025-03-17 21:12:57.897048+00	2025-03-17 21:12:57.897062+00	bd6c80ba-abcb-4983-afaa-1e6b33fe181e	MONTENEGRO
t	2025-03-17 21:12:57.904479+00	2025-03-17 21:12:57.904512+00	7bd426f4-6f3f-4bb6-a2e9-5b58cf490faa	INDONESIA
t	2025-03-17 21:12:57.910839+00	2025-03-17 21:12:57.910847+00	28378811-f526-4244-a889-9f2ae1fd1b10	DOMINICA
t	2025-03-17 21:12:57.915701+00	2025-03-17 21:12:57.915709+00	8d6e80bf-fec2-4319-af4e-902a2966da58	MACEDONIA DEL NORTE
t	2025-03-17 21:12:57.919523+00	2025-03-17 21:12:57.919532+00	5789255c-1d4e-4e0b-a17b-5afc3eee7bfa	PAPÚA NUEVA GUINEA
t	2025-03-17 21:12:57.924422+00	2025-03-17 21:12:57.924432+00	b6b9f57a-ecd4-48fb-983b-d1771065cbd4	ANGOLA
t	2025-03-17 21:12:57.928971+00	2025-03-17 21:12:57.928981+00	b6a917b2-94ec-4f37-a9aa-983f65945c00	FRANCIA
t	2025-03-17 21:12:57.933593+00	2025-03-17 21:12:57.933601+00	5920e9d5-6ef2-4f55-a870-3d739a4d8a38	HUNGRÍA
t	2025-03-17 21:12:57.93795+00	2025-03-17 21:12:57.937962+00	f5286bd0-dd81-4541-a512-f60e6afca245	LÍBANO
t	2025-03-17 21:12:57.943682+00	2025-03-17 21:12:57.943695+00	6faba1c2-3305-4bd1-9390-9c11f87ab4fa	PORTUGAL
t	2025-03-17 21:12:57.949354+00	2025-03-17 21:12:57.949363+00	f1f4f359-6bbf-43dd-b5f6-8fda645a3ba7	REPÚBLICA DEMOCRÁTICA DEL CONGO
t	2025-03-17 21:12:57.954286+00	2025-03-17 21:12:57.954331+00	b701c66a-46a7-44ea-996b-1395787b29d5	IRAK
t	2025-03-17 21:12:57.959207+00	2025-03-17 21:12:57.959214+00	c969ced1-ec78-4045-9dd5-111f3afec022	MONGOLIA
t	2025-03-17 21:12:57.963413+00	2025-03-17 21:12:57.963423+00	9daf8ae5-3b6d-4b71-b707-01a1fc7458a3	FIYI
t	2025-03-17 21:12:57.968129+00	2025-03-17 21:12:57.968139+00	c0faa3b1-7048-47f4-9f61-de12b29a8588	ESLOVENIA
t	2025-03-17 21:12:57.972481+00	2025-03-17 21:12:57.972489+00	beddd2e9-28a9-4aa3-bcc3-7f8785f795f2	GUYANA
t	2025-03-17 21:12:57.977136+00	2025-03-17 21:12:57.977146+00	fb98effe-e811-44b4-bc97-e0140536d93b	GUATEMALA
t	2025-03-17 21:12:57.982053+00	2025-03-17 21:12:57.982063+00	5dc32706-8b20-4edf-8df7-cd235f46ea93	SANTA LUCÍA
t	2025-03-17 21:12:57.98883+00	2025-03-17 21:12:57.988844+00	debb5346-cee0-40d8-a922-40b9248de515	CHILE
t	2025-03-17 21:12:57.996175+00	2025-03-17 21:12:57.996186+00	b1adad80-d766-48c0-9fdb-3c8f52c89511	BENÍN
t	2025-03-17 21:12:58.003053+00	2025-03-17 21:12:58.003081+00	669a1e76-5c68-40c2-a982-073e4b36abdc	NEPAL
t	2025-03-17 21:12:58.009993+00	2025-03-17 21:12:58.010003+00	6f1dbc13-fd3f-4eaa-b0f0-f4464dc11f1f	CIUDAD DEL VATICANO
t	2025-03-17 21:12:58.015167+00	2025-03-17 21:12:58.015175+00	33c93453-2d91-4cd5-b08b-dadb68b0909b	TERRITORIOS PALESTINOS
t	2025-03-17 21:12:58.020299+00	2025-03-17 21:12:58.020312+00	2afd9fa8-838f-45e7-8406-5e9fdd7bad29	TANZANIA
t	2025-03-17 21:12:58.025114+00	2025-03-17 21:12:58.025121+00	03d3b9dd-d3fd-42f3-8739-1a37ecc294a9	MÉXICO
t	2025-03-17 21:12:58.029428+00	2025-03-17 21:12:58.029436+00	d1ff6cad-da9e-45a1-85a7-57bd4f53d603	ANTIGUA Y BARBUDA
t	2025-03-17 21:12:58.035514+00	2025-03-17 21:12:58.035525+00	2d636ef7-23ef-44d5-89df-522d51b7aa39	GHANA
t	2025-03-17 21:12:58.041124+00	2025-03-17 21:12:58.041138+00	38ab9e2b-c6a2-4058-9bd6-0e735f482619	ESTADOS UNIDOS
t	2025-03-17 21:12:58.047474+00	2025-03-17 21:12:58.047485+00	87600d33-59d2-4884-8b2d-5fbabc288d29	INDIA
t	2025-03-17 21:12:58.053105+00	2025-03-17 21:12:58.053118+00	44e1c51b-f1f5-4776-aebd-5f4d74b43d35	RUSIA
t	2025-03-17 21:12:58.057914+00	2025-03-17 21:12:58.057925+00	1fae9434-a94b-47fa-8df1-2288140a5287	BOSNIA Y HERZEGOVINA
t	2025-03-17 21:12:58.06223+00	2025-03-17 21:12:58.062238+00	621751de-22c9-466b-83aa-8586ed554364	SVALBARD Y JAN MAYEN
t	2025-03-17 21:12:58.066731+00	2025-03-17 21:12:58.066744+00	922b0e06-346c-4663-921c-29a212e72350	FINLANDIA
t	2025-03-17 21:12:58.07149+00	2025-03-17 21:12:58.071499+00	fd55d1cd-f174-4557-bb1d-45aa5364632e	ESLOVAQUIA
t	2025-03-17 21:12:58.075894+00	2025-03-17 21:12:58.075905+00	ee3bdae3-a943-4bcd-ac86-bf2576dd05f0	JAMAICA
t	2025-03-17 21:12:58.080585+00	2025-03-17 21:12:58.080595+00	8d2aafd5-23d1-4f29-a3e0-e6188687792c	MYANMAR (BIRMANIA)
t	2025-03-17 21:12:58.08505+00	2025-03-17 21:12:58.08506+00	25c44ee4-586f-4903-b369-eb365579acc8	ISLAS COCOS
t	2025-03-17 21:12:58.089408+00	2025-03-17 21:12:58.089418+00	48178b49-adbf-4a9c-8811-36a59b673602	TOKELAU
t	2025-03-17 21:12:58.093616+00	2025-03-17 21:12:58.093626+00	5fe31522-d33b-4b44-95c1-adb8252ed158	ISLAS SALOMÓN
t	2025-03-17 21:12:58.097914+00	2025-03-17 21:12:58.097921+00	2890948c-5518-4c1c-9173-03a4edda56c6	GUINEA
t	2025-03-17 21:12:58.101963+00	2025-03-17 21:12:58.101972+00	7b7dcc2c-3d8d-4845-944b-35976062237f	SUIZA
t	2025-03-17 21:12:58.106424+00	2025-03-17 21:12:58.106434+00	43151717-64a7-4c4c-adc0-3844160a4a52	SOMALIA
t	2025-03-17 21:12:58.11058+00	2025-03-17 21:12:58.110589+00	3433c0cd-77a8-45ca-b997-374519e82353	ESPAÑA
t	2025-03-17 21:12:58.115213+00	2025-03-17 21:12:58.115224+00	54db2cd3-4f92-4f25-8edf-a11c4a1eb0bb	CHAD
t	2025-03-17 21:12:58.119427+00	2025-03-17 21:12:58.119438+00	cad850b3-64e8-4c59-bbb5-946153813c13	KIRIBATI
t	2025-03-17 21:12:58.123625+00	2025-03-17 21:12:58.123634+00	690d65da-1cee-4256-afaa-65663ba9df5f	HAITÍ
t	2025-03-17 21:12:58.128729+00	2025-03-17 21:12:58.128739+00	714bcef8-7715-4d4c-b6e2-e5f2b30993bc	GUINEA ECUATORIAL
t	2025-03-17 21:12:58.132749+00	2025-03-17 21:12:58.132756+00	62df9877-d945-4954-8589-e52d61f2b496	MOLDAVIA
t	2025-03-17 21:12:58.138305+00	2025-03-17 21:12:58.138316+00	8ffe2bd9-8f7d-42b3-9f46-db46afeb700d	COSTA RICA
t	2025-03-17 21:12:58.143327+00	2025-03-17 21:12:58.143337+00	fdeb59cb-0142-4093-baef-4b33c4f78454	SUDÁFRICA
t	2025-03-17 21:12:58.149272+00	2025-03-17 21:12:58.149281+00	ac2ef564-dc52-4534-9307-66519804a2fa	VIETNAM
t	2025-03-17 21:12:58.155131+00	2025-03-17 21:12:58.155142+00	831e9f4c-d78f-4dc5-955d-b3e16b977609	PAKISTÁN
t	2025-03-17 21:12:58.1602+00	2025-03-17 21:12:58.160212+00	9a574be8-7ae4-4887-a564-7a809e399124	ISLAS ÅLAND
t	2025-03-17 21:12:58.164652+00	2025-03-17 21:12:58.164663+00	c4e49a70-46a2-4486-afff-a7b3eef1551a	MARTINICA
t	2025-03-17 21:12:58.169442+00	2025-03-17 21:12:58.169454+00	21dd4b52-0ee2-4077-a619-70baf5729536	NIGERIA
t	2025-03-17 21:12:58.174201+00	2025-03-17 21:12:58.174211+00	dcbd82ae-1212-4d4f-9f2b-2e12e25111fb	KUWAIT
t	2025-03-17 21:12:58.179154+00	2025-03-17 21:12:58.179164+00	ccb812fc-071c-474b-8320-a32194aa006e	URUGUAY
t	2025-03-17 21:12:58.184798+00	2025-03-17 21:12:58.184809+00	eca91d91-94d4-4ecb-b6d0-677c5edb5e39	SRI LANKA
t	2025-03-17 21:12:58.190203+00	2025-03-17 21:12:58.190216+00	1bf4413e-6a44-4b71-808a-05cda100e6de	POLONIA
t	2025-03-17 21:12:58.195196+00	2025-03-17 21:12:58.195207+00	232f8b8d-240b-4aba-9aeb-3346f68d0817	TIMOR-LESTE
t	2025-03-17 21:12:58.199615+00	2025-03-17 21:12:58.199625+00	80d3776b-8321-45a3-a041-beaf02fb64f3	UZBEKISTÁN
t	2025-03-17 21:12:58.204429+00	2025-03-17 21:12:58.20444+00	98c1edf1-d5bf-463c-bd1e-dfd0d4b7b0e8	CROACIA
t	2025-03-17 21:12:58.20882+00	2025-03-17 21:12:58.20883+00	99524c3a-6933-4eed-a3af-cda8d016bb1f	ITALIA
t	2025-03-17 21:12:58.213391+00	2025-03-17 21:12:58.213402+00	cd534d73-be1c-4e16-81c8-f946f767dc6d	ISLAS MENORES ALEJADAS DE EE. UU.
t	2025-03-17 21:12:58.217809+00	2025-03-17 21:12:58.217819+00	9f9e9b9b-6e4b-42fe-a0fa-ddb7e7f0d282	ALEMANIA
t	2025-03-17 21:12:58.222422+00	2025-03-17 21:12:58.222437+00	0c14d7c2-a07e-4204-b65e-55aaf4cda46e	SAMOA
t	2025-03-17 21:12:58.227441+00	2025-03-17 21:12:58.227455+00	e2ada8be-dfc7-416e-b0a8-8e38a73ba347	SAN PEDRO Y MIQUELÓN
t	2025-03-17 21:12:58.231834+00	2025-03-17 21:12:58.231843+00	687fc344-641d-4059-a768-c7ee97f0d79d	VENEZUELA
t	2025-03-17 21:12:58.236419+00	2025-03-17 21:12:58.236431+00	b7fa65c9-cc96-4e22-9ad7-c8a9e5f9d3d9	LIBERIA
t	2025-03-17 21:12:58.241029+00	2025-03-17 21:12:58.241038+00	b8cd858e-80d5-4629-9ab3-882cb19b563d	ISLA DE NAVIDAD
t	2025-03-17 21:12:58.245579+00	2025-03-17 21:12:58.245588+00	9328ebcb-48e9-494f-8b12-32d35a78c9cd	TERRITORIOS AUSTRALES FRANCESES
t	2025-03-17 21:12:58.249495+00	2025-03-17 21:12:58.249501+00	1bb99f88-0ee8-4daf-93f9-cab446a2824a	BURKINA FASO
t	2025-03-17 21:12:58.254383+00	2025-03-17 21:12:58.254393+00	c9141422-4bdc-4813-aa61-303b3b9f47b1	EMIRATOS ÁRABES UNIDOS
t	2025-03-17 21:12:58.260348+00	2025-03-17 21:12:58.260358+00	2e8721b1-c8c9-495f-a677-473a4f547200	NUEVA ZELANDA
t	2025-03-17 21:12:58.264577+00	2025-03-17 21:12:58.264584+00	526dc25c-101c-41a9-b2cb-3ca2dc80fb1f	BIELORRUSIA
t	2025-03-17 21:12:58.268028+00	2025-03-17 21:12:58.268035+00	bd77cc79-2898-4f7d-99f6-78a33e9bc84f	ISLAS VÍRGENES BRITÁNICAS
t	2025-03-17 21:12:58.272456+00	2025-03-17 21:12:58.272465+00	da4568f2-4726-4956-9bfc-8ea8c1c1cba8	COREA DEL SUR
t	2025-03-17 21:12:58.276983+00	2025-03-17 21:12:58.276992+00	8ef38fe0-c96f-4808-b5f1-616d749b9d3a	ESTONIA
t	2025-03-17 21:12:58.281369+00	2025-03-17 21:12:58.281376+00	17f4532f-afab-4db8-8e97-35f1c31696c2	PAÍSES BAJOS
t	2025-03-17 21:12:58.285569+00	2025-03-17 21:12:58.28558+00	d9c92549-e2cf-4392-83a6-fee0ebed6012	AZERBAIYÁN
t	2025-03-17 21:12:58.290132+00	2025-03-17 21:12:58.29014+00	eac37c30-5041-4308-8d09-7286410019f7	LESOTO
t	2025-03-17 21:12:58.293877+00	2025-03-17 21:12:58.293885+00	83579738-56cb-4ec3-82fa-0ee2c4bf7a97	SUDÁN
t	2025-03-17 21:12:58.298322+00	2025-03-17 21:12:58.298328+00	93ce6914-d118-43a6-96c3-b4a6c698a99d	ANTÁRTIDA
t	2025-03-17 21:12:58.302265+00	2025-03-17 21:12:58.302273+00	e6e0b458-b88b-44d3-a714-0a81992395f4	NIUE
t	2025-03-17 21:12:58.306037+00	2025-03-17 21:12:58.306043+00	e4f6022f-9aa9-4c6c-9ceb-0c967b2254da	AUSTRIA
t	2025-03-17 21:12:58.310389+00	2025-03-17 21:12:58.310395+00	5f91804e-6049-40e5-a8a8-39a538ee8be8	MOZAMBIQUE
t	2025-03-17 21:12:58.314272+00	2025-03-17 21:12:58.314281+00	4abf2025-613d-45d8-a853-aa80dc213707	EL SALVADOR
t	2025-03-17 21:12:58.318399+00	2025-03-17 21:12:58.318408+00	3c0210c2-4515-44c3-88fe-f018e8e04c05	NORUEGA
t	2025-03-17 21:12:58.322635+00	2025-03-17 21:12:58.322643+00	04cc2fc9-eddb-41d0-b5f7-329f79adf55f	GUAM
t	2025-03-17 21:12:58.326292+00	2025-03-17 21:12:58.326298+00	6da2abd1-7671-49cb-8763-af34f6165bd2	ESUATINI
t	2025-03-17 21:12:58.330454+00	2025-03-17 21:12:58.33046+00	6a98d587-7ebe-47e8-a08d-fdf3b9c85e1a	TONGA
t	2025-03-17 21:12:58.334304+00	2025-03-17 21:12:58.33431+00	caee495c-1d02-46fe-b8da-26239b1b5c1d	CHIPRE
t	2025-03-17 21:12:58.337887+00	2025-03-17 21:12:58.337896+00	9d6038eb-c73c-4444-b404-c3eb7576cf74	ISLAS PITCAIRN
t	2025-03-17 21:12:58.341875+00	2025-03-17 21:12:58.341881+00	fd198243-3382-4f0e-8a19-91bfe94ec991	PALAOS
t	2025-03-17 21:12:58.346069+00	2025-03-17 21:12:58.346079+00	6010b3a3-499a-44f8-934f-406c71b85ccb	CAMERÚN
t	2025-03-17 21:12:58.350421+00	2025-03-17 21:12:58.350432+00	153b03d7-8fba-4ac7-9b62-2c907180d803	TÚNEZ
t	2025-03-17 21:12:58.354401+00	2025-03-17 21:12:58.354408+00	f38cd819-145c-466f-b85f-78f7ffc694f2	ISLAS HEARD Y MCDONALD
t	2025-03-17 21:12:58.359484+00	2025-03-17 21:12:58.359493+00	79496bf0-70df-4c9b-9759-fab31d60fb06	ALBANIA
t	2025-03-17 21:12:58.364126+00	2025-03-17 21:12:58.364134+00	2d7281db-b6cd-4f2f-8fca-e1910a463c5b	CAMBOYA
t	2025-03-17 21:12:58.368082+00	2025-03-17 21:12:58.368089+00	26b4a512-86d3-4f2d-b828-736d546b128b	BÉLGICA
t	2025-03-17 21:12:58.37256+00	2025-03-17 21:12:58.372566+00	22217e0c-1667-4c08-b401-7c1676a430a2	TAILANDIA
t	2025-03-17 21:12:58.376347+00	2025-03-17 21:12:58.376354+00	172a9b8c-3f83-4a20-bd1a-5bc689460752	SENEGAL
t	2025-03-17 21:12:58.380506+00	2025-03-17 21:12:58.380515+00	fd15a15b-1159-4408-b1d9-2d05c60b326f	TAIWÁN
t	2025-03-17 21:12:58.384645+00	2025-03-17 21:12:58.384653+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	PERÚ
t	2025-03-17 21:12:58.388341+00	2025-03-17 21:12:58.388351+00	cbb8eeb1-bc53-4147-b1e1-5f298cde6047	CATAR
t	2025-03-17 21:12:58.39197+00	2025-03-17 21:12:58.391979+00	295f5ab4-e03c-4d94-ab2e-4ed3029272f3	TURKMENISTÁN
t	2025-03-17 21:12:58.395974+00	2025-03-17 21:12:58.395983+00	93883a25-94b5-4638-83f7-e96bb02eeb73	SANTA ELENA
t	2025-03-17 21:12:58.400955+00	2025-03-17 21:12:58.400964+00	a4a9055e-ed80-49d7-8a15-fe38a486cfdd	MALDIVAS
t	2025-03-17 21:12:58.405632+00	2025-03-17 21:12:58.40564+00	c03bf35e-357e-4aee-862c-ebf7fd440c85	CHEQUIA
t	2025-03-17 21:12:58.409717+00	2025-03-17 21:12:58.409725+00	d3dfd18b-037b-40d8-81d3-21550e91c77f	SINGAPUR
t	2025-03-17 21:12:58.413935+00	2025-03-17 21:12:58.413942+00	f53a486a-186d-4c7e-ac99-994392152eea	COREA DEL NORTE
t	2025-03-17 21:12:58.41758+00	2025-03-17 21:12:58.417587+00	5e9fcd9c-b206-4970-99f7-bed8bfcfaf6c	BOLIVIA
t	2025-03-17 21:12:58.421613+00	2025-03-17 21:12:58.421622+00	d2611960-f394-4796-a11a-7d70fefe0829	SIERRA LEONA
t	2025-03-17 21:12:58.425878+00	2025-03-17 21:12:58.425887+00	dba30e24-0f93-4503-9e52-cc2f81894628	MALTA
t	2025-03-17 21:12:58.430212+00	2025-03-17 21:12:58.430218+00	417c2994-750c-48d3-8a4a-6c5ae094f2a1	ANGUILA
t	2025-03-17 21:12:58.434418+00	2025-03-17 21:12:58.434426+00	73de2af3-b8c4-4b8f-80d3-ccb1ece8426f	ARABIA SAUDÍ
t	2025-03-17 21:12:58.439063+00	2025-03-17 21:12:58.439075+00	cb9a812c-ee1f-4142-99de-4e529416340f	TRINIDAD Y TOBAGO
t	2025-03-17 21:12:58.444119+00	2025-03-17 21:12:58.44413+00	bd2ff82f-c07b-445a-b073-e859686e1764	JAPÓN
t	2025-03-17 21:12:58.449127+00	2025-03-17 21:12:58.449138+00	d3fb06bf-d64a-4f5a-8d08-7bb752887e99	GAMBIA
t	2025-03-17 21:12:58.453645+00	2025-03-17 21:12:58.453655+00	279d284a-39aa-4826-b8bb-41d31957d770	SAN BARTOLOMÉ
t	2025-03-17 21:12:58.458267+00	2025-03-17 21:12:58.458277+00	cfeef820-b75b-4a66-895a-bcd559fd26b1	SERBIA
t	2025-03-17 21:12:58.462946+00	2025-03-17 21:12:58.462962+00	c07b9174-61e3-41e3-b92d-75b3c4338275	GUAYANA FRANCESA
t	2025-03-17 21:12:58.468505+00	2025-03-17 21:12:58.468515+00	9bd16fc9-d6a2-4fd8-a597-7db90293faef	SANTO TOMÉ Y PRÍNCIPE
t	2025-03-17 21:12:58.472986+00	2025-03-17 21:12:58.472997+00	c7726fc3-0e31-4648-8b19-084db12f81b9	BELICE
t	2025-03-17 21:12:58.477345+00	2025-03-17 21:12:58.477361+00	8255b8c8-00df-48e8-889c-5e219c427292	BANGLADÉS
t	2025-03-17 21:12:58.482625+00	2025-03-17 21:12:58.482634+00	08169391-63bc-4160-aa13-02344ba02bb5	COMORAS
t	2025-03-17 21:12:58.486635+00	2025-03-17 21:12:58.486644+00	fd7a1476-529f-4416-8e4a-a9e3f0156596	ARGELIA
t	2025-03-17 21:12:58.491095+00	2025-03-17 21:12:58.491103+00	e81f05ab-320f-4bd2-8a8d-c9be1e73dbdf	NICARAGUA
t	2025-03-17 21:12:58.495323+00	2025-03-17 21:12:58.495351+00	68a392ef-5f50-4afd-bc19-39089e412c24	BARBADOS
t	2025-03-17 21:12:58.499713+00	2025-03-17 21:12:58.499725+00	45c7379d-072c-4aff-b591-0f0efcd91665	UGANDA
t	2025-03-17 21:12:58.506326+00	2025-03-17 21:12:58.506356+00	90d060b9-3959-42cc-a210-f2c10cf19ad8	SUECIA
t	2025-03-17 21:12:58.51189+00	2025-03-17 21:12:58.511893+00	edab53fd-7b7d-4557-9406-37a7f6a8cff3	MICRONESIA
t	2025-03-17 21:12:58.516188+00	2025-03-17 21:12:58.516191+00	595d274f-8a3a-4481-8c60-34200b68028c	JORDANIA
t	2025-03-17 21:12:58.520272+00	2025-03-17 21:12:58.520274+00	8171ad94-fc08-4724-8c48-0e5a97b3430c	ISLAS COOK
t	2025-03-17 21:12:58.525069+00	2025-03-17 21:12:58.525073+00	c95fe659-ff6b-449b-a808-db95004c38ec	NO APLICA
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.department (status, registration_date, update_date, country_id, department_id, name) FROM stdin;
t	2025-03-17 21:12:56.822162+00	2025-03-17 21:12:56.822186+00	c950726e-4cf8-45fc-bac8-c5a799ced841	e54cbf4b-fb48-4748-94b9-59c0213fa6cb	SISTEMA
t	2025-03-17 21:12:58.554512+00	2025-03-17 21:12:58.554516+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	8466176d-7fec-439d-a138-60eb019be911	CALLAO
t	2025-03-17 21:12:58.561734+00	2025-03-17 21:12:58.561738+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	6e05b190-f77c-4493-8b73-8d7b145f775e	MADRE DE DIOS
t	2025-03-17 21:12:58.569142+00	2025-03-17 21:12:58.569146+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	HUANUCO
t	2025-03-17 21:12:58.575217+00	2025-03-17 21:12:58.57522+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	1a5d0888-418f-4901-8ce3-58b7a0082455	APURIMAC
t	2025-03-17 21:12:58.582385+00	2025-03-17 21:12:58.582391+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	5714c637-0118-434a-adb7-845e053679de	AMAZONAS
t	2025-03-17 21:12:58.58958+00	2025-03-17 21:12:58.589584+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	671ad43a-a97f-4b3e-b88e-31d57bb9da7d	LAMBAYEQUE
t	2025-03-17 21:12:58.597494+00	2025-03-17 21:12:58.597498+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	c2cec227-4f27-48ba-ae84-97baf7053980	CAJAMARCA
t	2025-03-17 21:12:58.603759+00	2025-03-17 21:12:58.603762+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	9d0864a4-e335-49e2-849d-34c3ffcf431d	CUSCO
t	2025-03-17 21:12:58.610101+00	2025-03-17 21:12:58.610104+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	585eedab-682a-4f38-abf5-2f1a20048d81	AYACUCHO
t	2025-03-17 21:12:58.616858+00	2025-03-17 21:12:58.616862+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	4d831775-ae37-4dd6-bf75-1238d20e75c0	TACNA
t	2025-03-17 21:12:58.623271+00	2025-03-17 21:12:58.623273+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	eac57f95-0120-4f3a-8a43-52547da7141e	LA LIBERTAD
t	2025-03-17 21:12:58.629848+00	2025-03-17 21:12:58.629852+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	9b18a617-06d6-47ef-a808-086d455baad5	HUANCAVELICA
t	2025-03-17 21:12:58.635291+00	2025-03-17 21:12:58.635294+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	cc1ebf53-c458-4848-ae03-00f173fd7d91	LORETO
t	2025-03-17 21:12:58.643175+00	2025-03-17 21:12:58.643181+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	01bd3b5d-a13b-455e-a68d-fcda3e51b67f	PIURA
t	2025-03-17 21:12:58.650913+00	2025-03-17 21:12:58.650917+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	a0251865-288a-4fc7-b9fd-f9650fae1df6	PUNO
t	2025-03-17 21:12:58.657464+00	2025-03-17 21:12:58.657468+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	4b5c4963-89d4-4d53-bf18-6d9326b1b107	AREQUIPA
t	2025-03-17 21:12:58.664777+00	2025-03-17 21:12:58.664784+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	71dda8ea-3972-4c5b-867b-d5d905ce7f7c	ICA
t	2025-03-17 21:12:58.672165+00	2025-03-17 21:12:58.67217+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	a6dcff66-1d61-4879-8b19-7e8dbc15cb8d	PASCO
t	2025-03-17 21:12:58.679037+00	2025-03-17 21:12:58.67904+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	008109f1-ef93-443c-8615-36d6154f4363	SAN MARTIN
t	2025-03-17 21:12:58.686579+00	2025-03-17 21:12:58.686582+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	b6f7696e-ecf0-489f-bcd0-2ef7762fd854	TUMBES
t	2025-03-17 21:12:58.693076+00	2025-03-17 21:12:58.693082+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	LIMA
t	2025-03-17 21:12:58.698213+00	2025-03-17 21:12:58.698215+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	f529af54-448a-4109-a46d-104ff28f07c0	JUNIN
t	2025-03-17 21:12:58.703749+00	2025-03-17 21:12:58.703753+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	ANCASH
t	2025-03-17 21:12:58.708465+00	2025-03-17 21:12:58.708468+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	9fed89ae-eb4d-4bac-8f4c-b59cd4712cfa	MOQUEGUA
t	2025-03-17 21:12:58.7133+00	2025-03-17 21:12:58.713302+00	5c8cc3da-8ea8-43b1-92d4-6616a8908aa3	05c5be37-e302-4ec4-9d60-71e3baf7afcc	UCAYALI
t	2025-03-17 21:12:58.718559+00	2025-03-17 21:12:58.718562+00	c95fe659-ff6b-449b-a808-db95004c38ec	43ddd4e7-033f-483d-9bad-bc4e2db954a1	NO APLICA
\.


--
-- Data for Name: discount; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.discount (status, registration_date, update_date, discount_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.694097+00	2025-03-17 21:13:14.6941+00	65fcb0dd-c1d1-454b-a424-026405d35946	2f363ce3-e629-42d7-8bb2-7892307e0275	MONTO
t	2025-03-17 21:13:14.69865+00	2025-03-17 21:13:14.698651+00	948b95c1-3168-49e9-a26b-20fbfa277a23	2f363ce3-e629-42d7-8bb2-7892307e0275	PORCENTAJE
t	2025-03-17 21:13:14.703256+00	2025-03-17 21:13:14.70326+00	99e795f4-bfbb-4d0d-8fe0-56485cccc486	2f363ce3-e629-42d7-8bb2-7892307e0275	NO APLICA
\.


--
-- Data for Name: district; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.district (status, registration_date, update_date, district_id, province_id, name) FROM stdin;
t	2025-03-17 21:12:56.830236+00	2025-03-17 21:12:56.830269+00	cd5c4e84-c711-46c9-9fc5-8ead1d1021d1	\N	SISTEMA
t	2025-03-17 21:12:59.929233+00	2025-03-17 21:12:59.929237+00	b0051b1b-4ada-4043-a35c-79381cfaa936	56ad5343-c9f9-4787-a151-0f3d01c21dbb	PAMPAROMAS
t	2025-03-17 21:12:59.935028+00	2025-03-17 21:12:59.93503+00	8c1d0d3a-f7e1-44cf-a1c5-afd99dcc7b40	ea1da671-28f3-4192-ac87-6c6d5c9f5967	JAEN
t	2025-03-17 21:12:59.942345+00	2025-03-17 21:12:59.942348+00	a0fc8f58-265f-4efe-a296-4344485d034d	8bc9c85c-cc74-48be-979d-07938df4de67	CHUCATAMANI
t	2025-03-17 21:12:59.950277+00	2025-03-17 21:12:59.950283+00	20aa5765-45ed-4834-9b96-f5ad0b5d2321	87e9d712-7fef-4f4e-a7d1-111e719950ce	OCONGATE
t	2025-03-17 21:12:59.956959+00	2025-03-17 21:12:59.956962+00	7d7c32f3-3d4c-4bcd-a5b4-b447bb97fe93	b1206fd6-020d-42a0-a864-feb8643f0013	PUCACACA
t	2025-03-17 21:12:59.963124+00	2025-03-17 21:12:59.963128+00	184d0605-1d0f-4ace-afe7-12716e8fe0b8	b1206fd6-020d-42a0-a864-feb8643f0013	TRES UNIDOS
t	2025-03-17 21:12:59.968302+00	2025-03-17 21:12:59.968304+00	072d1cf5-1bdd-4652-8317-67aaeaa58c4a	960e79f6-51c7-4335-b07a-7721b638f576	TAMBURCO
t	2025-03-17 21:12:59.973461+00	2025-03-17 21:12:59.973464+00	c5d5fee8-da7e-4849-8884-e7f39a5d263e	cc76f1f4-59f8-477e-ab55-63ef31302138	SAN NICOLAS
t	2025-03-17 21:12:59.979165+00	2025-03-17 21:12:59.979168+00	536f2e52-d67c-42d6-9c47-6a3bb2790e26	6e015257-6f7e-48cf-b9c0-a24502cdcc21	CULLHUAS
t	2025-03-17 21:12:59.985635+00	2025-03-17 21:12:59.985639+00	e3032a0b-a1c2-4771-a3b5-1cc447d9f669	b1206fd6-020d-42a0-a864-feb8643f0013	SAN HILARION
t	2025-03-17 21:12:59.993941+00	2025-03-17 21:12:59.993946+00	9df7dcae-f012-4616-b342-66287f1a0673	c35d368a-d376-4211-876e-9a3feb37e400	TABALOSOS
t	2025-03-17 21:13:00.001045+00	2025-03-17 21:13:00.001049+00	9592edd7-d3e5-4f86-bb82-b185a560daea	4c515df3-386f-4376-a901-eb9876ac20da	SHUPLUY
t	2025-03-17 21:13:00.006522+00	2025-03-17 21:13:00.006525+00	0e0b4a2e-eb33-46f5-aa73-1edf7ca9a947	6198f919-cc14-48e2-bc8f-cd4799b8f49b	KOSÑIPATA
t	2025-03-17 21:13:00.013196+00	2025-03-17 21:13:00.013201+00	d69e97a2-97d7-4421-ab2d-86ad168d644e	dce0a035-d91c-4f0a-a10f-aefa48915118	TOTOS
t	2025-03-17 21:13:00.018747+00	2025-03-17 21:13:00.018751+00	210719b5-6da6-4baa-855d-441da6177b26	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	CAPAYA
t	2025-03-17 21:13:00.024179+00	2025-03-17 21:13:00.024181+00	86789d81-5ae0-4f10-810d-22adebbe5fca	f6729187-58e1-4607-8b37-0b2db196f283	COCAS
t	2025-03-17 21:13:00.029165+00	2025-03-17 21:13:00.029168+00	25a58576-1a57-4443-bff4-59c94366835e	e524e2e5-2c3d-4249-9d1d-7611d8538050	SAN ANDRES
t	2025-03-17 21:13:00.033979+00	2025-03-17 21:13:00.033983+00	b9e86802-033c-4973-aa72-585abdf98de2	fb3b3950-928c-4345-8bb6-8f89054c2e9b	LLAPA
t	2025-03-17 21:13:00.039948+00	2025-03-17 21:13:00.039952+00	cfa04620-04d0-4493-90b8-47489682c542	3c8af264-3631-4747-a2a2-7b153fa4b672	JOSE MARIA ARGUEDAS
t	2025-03-17 21:13:00.044426+00	2025-03-17 21:13:00.044428+00	96696bcf-7238-4425-ab26-bda018ea15a8	994de1db-2a15-4db0-80a6-4efa76422c2c	MANGAS
t	2025-03-17 21:13:00.049017+00	2025-03-17 21:13:00.049021+00	1937b4b8-c9b6-4c5d-93e5-418a9c33ffa0	c790e80f-15e1-4e44-b272-1ef57bb9c991	USQUIL
t	2025-03-17 21:13:00.053906+00	2025-03-17 21:13:00.05391+00	28a8e94e-f747-4078-800a-fc0db08c2e1d	46a0b504-382b-4799-85d6-225617d83360	LAJAS
t	2025-03-17 21:13:00.059369+00	2025-03-17 21:13:00.059378+00	75c13dc7-9c6e-4cf6-bfff-df66c8c8cb04	c1ae25de-54dd-4d24-90bd-2a41a350a944	ISLAY
t	2025-03-17 21:13:00.064255+00	2025-03-17 21:13:00.06426+00	8a984d1e-c2fc-4e5a-87b3-f26d80861b5b	d7ef5212-068e-4c9d-82ca-3a4aa4d5a2e5	TIBILLO
t	2025-03-17 21:13:00.069523+00	2025-03-17 21:13:00.069527+00	d0a7fb43-727d-4d86-84f5-acb5fb281fac	cc0ea4e4-1184-4e35-8056-ce01bdb4f473	SAN SEBASTIAN
t	2025-03-17 21:13:00.076726+00	2025-03-17 21:13:00.07673+00	5f7eb8d9-56fe-4455-a3a5-151af462497f	e7815c4d-9487-4bbf-aa91-b30ca9896721	QUECHUALLA
t	2025-03-17 21:13:00.082757+00	2025-03-17 21:13:00.08276+00	9c8c7fbc-3cb9-47f3-b014-79a7d0a2e3b0	9d7bb05d-7107-41b7-8fc0-29d110e2992d	CHINCHEROS
t	2025-03-17 21:13:00.088946+00	2025-03-17 21:13:00.088951+00	82de9bef-be78-498b-9981-1e2ab9b4d0ea	3af19559-c0e0-469f-9660-92f10b46789e	CORANI
t	2025-03-17 21:13:00.096573+00	2025-03-17 21:13:00.096576+00	24b34478-eb41-464e-8760-3c67233578c4	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	CHAPIMARCA
t	2025-03-17 21:13:00.102262+00	2025-03-17 21:13:00.102265+00	37e5620e-3da7-4bff-b88a-422e47a536af	74f3454f-27d1-4e37-aac7-283f27a56308	BUENA VISTA ALTA
t	2025-03-17 21:13:00.106954+00	2025-03-17 21:13:00.106957+00	e25cad7f-dd4a-479e-b017-fcb86bbae44e	da261af9-5596-4188-b73d-5c091ad57d8b	LLAMA
t	2025-03-17 21:13:00.114606+00	2025-03-17 21:13:00.114611+00	22b359a0-0a09-4690-9d54-f37e8ec3c805	03fb2350-5ceb-4af7-9e21-98ba632a11c3	CAPAZO
t	2025-03-17 21:13:00.12186+00	2025-03-17 21:13:00.121865+00	81a195a0-491e-4c62-97f5-3490535b5f89	071e4b6b-e409-45e8-ab65-9ae4cc94f1b3	HUANCHACO
t	2025-03-17 21:13:00.127622+00	2025-03-17 21:13:00.127625+00	52863d98-9e5a-4bdd-ab06-3bc9f21c55bf	cf7fa8b0-e545-40b4-99eb-d431d72c6c8d	CUMBA
t	2025-03-17 21:13:00.132541+00	2025-03-17 21:13:00.132545+00	3de7b0ef-be7d-4bb0-958b-de1628f843af	c9678f77-84c7-4648-9a0c-4e6c0bba1844	CORRALES
t	2025-03-17 21:13:00.138369+00	2025-03-17 21:13:00.138374+00	8378b274-c9a8-4b2d-bbe3-551559a6ca2c	0653b015-1f1e-4073-b4a6-eddacd4d0018	SHAPAJA
t	2025-03-17 21:13:00.145773+00	2025-03-17 21:13:00.145777+00	cd61a2c9-09c1-4936-8e75-ab9937324deb	8eb85dc7-057c-4c9c-890b-3fc9f739fba7	OMACHA
t	2025-03-17 21:13:00.152123+00	2025-03-17 21:13:00.152128+00	c6ea6ad5-1463-4066-bd22-f6430b2be01c	fae002ab-c99a-457d-8f6d-9e9964312caf	PLATERIA
t	2025-03-17 21:13:00.159847+00	2025-03-17 21:13:00.15985+00	f2e9594b-3e1d-4c2e-bd67-7c27908ff04a	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	LUIS CARRANZA
t	2025-03-17 21:13:00.165805+00	2025-03-17 21:13:00.165808+00	07a17bd8-170f-44b6-a9c5-32686a1fbaae	fb3b3950-928c-4345-8bb6-8f89054c2e9b	UNION AGUA BLANCA
t	2025-03-17 21:13:00.172107+00	2025-03-17 21:13:00.17211+00	f81e0c9d-afc0-4480-b2b5-d72b6f9c012d	a154aa5a-7dee-47d6-8448-b6744a59812d	HUAURA
t	2025-03-17 21:13:00.177607+00	2025-03-17 21:13:00.177609+00	144a4d1b-879c-45d9-a2a1-6f44046eb190	a3e76f78-476b-4191-8337-9b5b285b15de	CHAVIN DE PARIARCA
t	2025-03-17 21:13:00.182722+00	2025-03-17 21:13:00.182725+00	e32fbc2e-e894-42b1-a036-6402accb40f1	46a0b504-382b-4799-85d6-225617d83360	QUEROCOTO
t	2025-03-17 21:13:00.189083+00	2025-03-17 21:13:00.189087+00	ba37d053-82c7-4cff-9367-2e1c5daab2c9	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	CERRO COLORADO
t	2025-03-17 21:13:00.196191+00	2025-03-17 21:13:00.196196+00	03a349f3-30be-4f8b-8f4b-2aeca87a05fb	2c09bf48-31df-47d1-bf45-11d7695ea002	LANGA
t	2025-03-17 21:13:00.202349+00	2025-03-17 21:13:00.202351+00	de972ea4-ec53-46c9-ac26-1bb7d49bcf3b	994de1db-2a15-4db0-80a6-4efa76422c2c	ABELARDO PARDO LEZAMETA
t	2025-03-17 21:13:00.208384+00	2025-03-17 21:13:00.208388+00	3e536840-4dae-47c9-bb4a-80a3dc47d59c	5250e4c2-488d-4a7d-bdc9-d2633361c510	ANANEA
t	2025-03-17 21:13:00.215606+00	2025-03-17 21:13:00.21561+00	2d050768-0849-47a3-bea9-b161caeacc53	792fb1cf-e799-4ec9-8dbf-339f60cf3179	CODO DEL POZUZO
t	2025-03-17 21:13:00.222458+00	2025-03-17 21:13:00.222461+00	c06e3f2e-0149-4157-b0ed-e628f45a7c23	c790e80f-15e1-4e44-b272-1ef57bb9c991	CHARAT
t	2025-03-17 21:13:00.230102+00	2025-03-17 21:13:00.23011+00	01d9a21a-85af-49f6-a1f7-db5c3c4dbc17	46a0b504-382b-4799-85d6-225617d83360	MIRACOSTA
t	2025-03-17 21:13:00.2387+00	2025-03-17 21:13:00.238704+00	35cb93e7-6d79-464d-83a2-9296829c018b	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	ALTO SELVA ALEGRE
t	2025-03-17 21:13:00.247686+00	2025-03-17 21:13:00.247694+00	9ffaef82-0f45-4ec8-9ec5-21fe5705a21a	2bc54a70-eee6-4d04-90b9-06503d3b6067	JOSE DOMINGO CHOQUEHUANCA
t	2025-03-17 21:13:00.257221+00	2025-03-17 21:13:00.257229+00	119ca36f-df46-40a8-9f6e-df18dc8487b2	55340ef0-3d04-40ea-a070-cbb80d5755a5	TINTA
t	2025-03-17 21:13:00.266375+00	2025-03-17 21:13:00.266381+00	7947c5ba-656b-429f-ac46-b511e00e70fa	915063a0-1172-48a3-8b31-33715e1f2e3c	QUERECOTILLO
t	2025-03-17 21:13:00.275136+00	2025-03-17 21:13:00.275141+00	350f9392-0463-4d95-b586-c79c3fa1754d	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	APATA
t	2025-03-17 21:13:00.283629+00	2025-03-17 21:13:00.283633+00	de965ff9-a706-4aa5-ae18-20e3e6f18b49	e7815c4d-9487-4bbf-aa91-b30ca9896721	HUAYNACOTAS
t	2025-03-17 21:13:00.290966+00	2025-03-17 21:13:00.29097+00	9d0cf2a8-ec74-4f4e-b3bb-16353efba29b	b5c477ac-5c22-4641-a743-47ccf2ee8c59	CARHUAZ
t	2025-03-17 21:13:00.299601+00	2025-03-17 21:13:00.29961+00	323fd0b4-7c61-4d8c-8589-d4c736bcae47	56ad5343-c9f9-4787-a151-0f3d01c21dbb	PUEBLO LIBRE
t	2025-03-17 21:13:00.306969+00	2025-03-17 21:13:00.306973+00	4eba7182-8fa3-4c2d-96f9-e53a7a2f9a3e	c745de6d-713a-4613-951f-05d16e86739b	JOSE MARIA QUIMPER
t	2025-03-17 21:13:00.315738+00	2025-03-17 21:13:00.315747+00	3afd237c-36f1-4a61-8373-01dab9377119	8bc9c85c-cc74-48be-979d-07938df4de67	ESTIQUE
t	2025-03-17 21:13:00.323118+00	2025-03-17 21:13:00.323122+00	70140c49-52c3-4254-9a9a-d2df6c350694	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	MORCOLLA
t	2025-03-17 21:13:00.329218+00	2025-03-17 21:13:00.329225+00	f9be98df-9876-4db5-adb1-5c6869acfc0d	6f01c2b3-c170-49f4-a21b-c1fae42b9815	SAN JUAN
t	2025-03-17 21:13:00.337361+00	2025-03-17 21:13:00.337376+00	5c10c943-5ac1-40cd-b4f3-bd676907a501	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	HUAÑEC
t	2025-03-17 21:13:00.345763+00	2025-03-17 21:13:00.345768+00	d88d5f81-a540-44ef-a46e-a18f702e2839	6e015257-6f7e-48cf-b9c0-a24502cdcc21	EL TAMBO
t	2025-03-17 21:13:00.353997+00	2025-03-17 21:13:00.354003+00	c1a0e671-eac9-484b-bf81-3246ea32a67d	42a3655b-687b-424b-a374-b0ab58d4f011	CACERES DEL PERU
t	2025-03-17 21:13:00.364534+00	2025-03-17 21:13:00.364541+00	7aa7b8bf-8011-4180-a3a6-39b956ad3f40	029d4c57-b401-421f-beeb-7d0fef5c0dbb	SANTA ANA DE HUAYCAHUACHO
t	2025-03-17 21:13:00.372876+00	2025-03-17 21:13:00.372881+00	51334bb5-0ce6-4b61-a2bb-7f59b0e086d8	4867fc63-7654-417d-8cb7-fd0de85acb77	PADRE ABAD
t	2025-03-17 21:13:00.381652+00	2025-03-17 21:13:00.381657+00	c9f032e2-2faf-4623-b4c9-209858d569ed	846cebba-a2b2-4b4c-85bb-c79e1ae2600c	MADRE DE DIOS
t	2025-03-17 21:13:00.387285+00	2025-03-17 21:13:00.38729+00	a948df76-adc2-405e-98f9-c5d6abd2537b	e7815c4d-9487-4bbf-aa91-b30ca9896721	PAMPAMARCA
t	2025-03-17 21:13:00.392409+00	2025-03-17 21:13:00.392413+00	78f563f0-3eed-4473-bd5a-9eb4ba04e807	a3e76f78-476b-4191-8337-9b5b285b15de	JACAS GRANDE
t	2025-03-17 21:13:00.397712+00	2025-03-17 21:13:00.397717+00	f5a36f7a-0bce-42e4-b1e7-210c585d7810	a0671457-1dd6-4137-b054-4f8a0d6515e5	LACABAMBA
t	2025-03-17 21:13:00.404494+00	2025-03-17 21:13:00.404499+00	20a1b9d3-09af-4de0-ac20-96c2746ff681	187d7e64-5269-4ebb-953a-949acc68acd7	HUICUNGO
t	2025-03-17 21:13:00.411471+00	2025-03-17 21:13:00.411475+00	b4895f89-e531-434a-bd36-59b69e8f6524	63916004-9475-4b57-a40b-f707c2be8d2d	SAN JUAN DE YANAC
t	2025-03-17 21:13:00.417359+00	2025-03-17 21:13:00.417364+00	429f4ec4-545e-4e70-a164-07a39e4df591	2bc54a70-eee6-4d04-90b9-06503d3b6067	SAMAN
t	2025-03-17 21:13:00.424733+00	2025-03-17 21:13:00.424737+00	cf3a0d14-5a58-422d-b8a7-eab41fb21667	5d4ee5b0-d0ff-4516-b31d-dfda81b61b02	SITACOCHA
t	2025-03-17 21:13:00.431972+00	2025-03-17 21:13:00.431976+00	86b2569b-d5bc-47a5-a995-07d0893e17ab	6f01c2b3-c170-49f4-a21b-c1fae42b9815	SIHUAS
t	2025-03-17 21:13:00.43704+00	2025-03-17 21:13:00.437042+00	81462225-3b66-47a9-9c17-ae11455fca9d	cd1a779c-e303-4241-b40f-3a8bd328ae2a	SAN JERONIMO
t	2025-03-17 21:13:00.441792+00	2025-03-17 21:13:00.441795+00	ffe883c3-4dd4-4f0c-ad7a-174735c72166	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	SORAS
t	2025-03-17 21:13:00.447046+00	2025-03-17 21:13:00.44705+00	9734ea36-96e6-4cf9-b6bd-db93ec7ca6d3	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	MATAHUASI
t	2025-03-17 21:13:00.454066+00	2025-03-17 21:13:00.454071+00	0dd04d2c-a81d-4e61-943d-ef131751105b	186355ca-8fe2-4aa6-8445-132b479de1b5	SAN BUENAVENTURA
t	2025-03-17 21:13:00.46106+00	2025-03-17 21:13:00.461064+00	0a54577d-9e88-4ee6-bba5-b6e1e6c56294	960e79f6-51c7-4335-b07a-7721b638f576	HUANIPACA
t	2025-03-17 21:13:00.467231+00	2025-03-17 21:13:00.467233+00	e4f7a543-9ab3-4bf8-bd48-946c368b2955	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	GRANADA
t	2025-03-17 21:13:00.472092+00	2025-03-17 21:13:00.472095+00	c7437dd2-844a-46f3-abb2-9ef1ed637733	e524e2e5-2c3d-4249-9d1d-7611d8538050	PARACAS
t	2025-03-17 21:13:00.479208+00	2025-03-17 21:13:00.479213+00	906547fe-81e6-4d5f-a07e-4f6b7b0df4fe	cd1a779c-e303-4241-b40f-3a8bd328ae2a	PISUQUIA
t	2025-03-17 21:13:00.484136+00	2025-03-17 21:13:00.48414+00	c226bd4e-d597-41d6-bf75-2bb317877750	adc985f9-78c3-4def-a9a0-4138987c6537	ROSA PANDURO
t	2025-03-17 21:13:00.489932+00	2025-03-17 21:13:00.489936+00	ff6e7c64-41dd-4942-8b3f-7e3d76137b99	aa997785-178f-4ee0-ae0b-199383726bc3	TROMPETEROS
t	2025-03-17 21:13:00.495343+00	2025-03-17 21:13:00.495356+00	b4ea9659-85b8-4aca-876c-f9e065938b44	2c09bf48-31df-47d1-bf45-11d7695ea002	SAN LORENZO DE QUINTI
t	2025-03-17 21:13:00.500503+00	2025-03-17 21:13:00.500507+00	1c380e15-21ec-41f8-8d5c-e05e7fef2743	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	TAPAIRIHUA
t	2025-03-17 21:13:00.506869+00	2025-03-17 21:13:00.506874+00	4678c262-d347-4684-a896-cc857cc355a2	f6729187-58e1-4607-8b37-0b2db196f283	AURAHUA
t	2025-03-17 21:13:00.514117+00	2025-03-17 21:13:00.51412+00	ce9ac0b4-c564-41f5-8a1b-0b878f717651	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	HUACHOCOLPA
t	2025-03-17 21:13:00.518955+00	2025-03-17 21:13:00.518957+00	daa0b2d0-7757-4d51-b6f2-d7c17b6dfdd0	5d4ee5b0-d0ff-4516-b31d-dfda81b61b02	CONDEBAMBA
t	2025-03-17 21:13:00.524283+00	2025-03-17 21:13:00.524286+00	b35c147e-1c65-4908-ada0-176c427020f2	74b3890f-d58c-4d92-b653-e1ceec0d1b55	OCUCAJE
t	2025-03-17 21:13:00.529907+00	2025-03-17 21:13:00.52991+00	f7b25b1d-1383-4066-b567-46e93b29ef53	b6200a73-f2d4-4543-8e14-909a4f3e7f32	SAN FRANCISCO DE ASIS
t	2025-03-17 21:13:00.534799+00	2025-03-17 21:13:00.534802+00	268c1177-69c5-4dc9-a9b7-fdee4d42158b	a3e76f78-476b-4191-8337-9b5b285b15de	LLATA
t	2025-03-17 21:13:00.539699+00	2025-03-17 21:13:00.539702+00	94bec6e7-fb57-4328-b544-76d9c094c751	802f9e1a-4b36-4787-ae41-e5aaca68da54	HUAMANCACA CHICO
t	2025-03-17 21:13:00.54432+00	2025-03-17 21:13:00.544322+00	3658f347-7c7a-4497-8255-54c679c51605	a3e76f78-476b-4191-8337-9b5b285b15de	ARANCAY
t	2025-03-17 21:13:00.549262+00	2025-03-17 21:13:00.549265+00	1f925818-bd1e-4157-b013-e40feec19a53	1a124fda-ccb8-45b3-b69b-e0453133d8d8	PUEBLO NUEVO
t	2025-03-17 21:13:00.554396+00	2025-03-17 21:13:00.554401+00	9c120ec9-5b1b-48ae-b7e9-3f3f145e84f1	aa61d159-135e-4d97-a318-d721d0ccd135	PACHACONAS
t	2025-03-17 21:13:00.560005+00	2025-03-17 21:13:00.560008+00	4a8e3e5d-bcac-4438-a5b7-57bced3ed16c	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	UNION PROGRESO
t	2025-03-17 21:13:00.565538+00	2025-03-17 21:13:00.565545+00	29b74007-9005-4b52-a11f-7d0ed7d33116	a0671457-1dd6-4137-b054-4f8a0d6515e5	LLAPO
t	2025-03-17 21:13:00.571525+00	2025-03-17 21:13:00.571531+00	286671cd-2d74-4436-a857-45eae2f5e4ef	35972dee-bd82-40d7-aad3-b6f032924ddd	PROGRESO
t	2025-03-17 21:13:00.576741+00	2025-03-17 21:13:00.576744+00	7e59a893-d340-42ea-a5a3-bb83eb7a0bec	14ecad5d-903d-42ac-b037-7f9cdcec77b2	SUCCHA
t	2025-03-17 21:13:00.582338+00	2025-03-17 21:13:00.582342+00	94982602-e4ae-40ce-b941-bbe973d2b3f5	cbc121ea-f1b1-4a06-97cb-c010f63ee492	SITABAMBA
t	2025-03-17 21:13:00.587811+00	2025-03-17 21:13:00.587815+00	2c79fea3-f174-4f84-aa0f-5c0d48932e46	b42841e0-44d6-4122-9396-858f0fbf2b1d	RAPAYAN
t	2025-03-17 21:13:00.592832+00	2025-03-17 21:13:00.592834+00	557b39cd-a5b8-4a85-9450-b5d8e077af4d	071e4b6b-e409-45e8-ab65-9ae4cc94f1b3	SALAVERRY
t	2025-03-17 21:13:00.597231+00	2025-03-17 21:13:00.597235+00	b06e9ffb-1e77-4bbc-9ff5-ae907ff304bd	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	SAUSA
t	2025-03-17 21:13:00.603294+00	2025-03-17 21:13:00.603298+00	bfe7e041-0584-4893-9504-c9f51f0c7cf4	109a4db0-2e12-4674-ab1f-9417d1664661	CAMPOVERDE
t	2025-03-17 21:13:00.608892+00	2025-03-17 21:13:00.608895+00	e347c418-1fb2-4a52-a5ac-ea4f32f87128	384003f9-fd40-42d7-bbcb-42d84f70c15d	CHUGUR
t	2025-03-17 21:13:00.614881+00	2025-03-17 21:13:00.614884+00	d8035952-c08e-4c1e-a182-790c356e8860	5f06e473-5acd-475a-b17f-aa63c7fa9783	VALERA
t	2025-03-17 21:13:00.62081+00	2025-03-17 21:13:00.620813+00	2b305ad9-aca3-4b96-b36e-5a751955b315	cd1a779c-e303-4241-b40f-3a8bd328ae2a	PROVIDENCIA
t	2025-03-17 21:13:00.626887+00	2025-03-17 21:13:00.626891+00	5d8bbd87-858a-4ab0-a2a4-1b89a53b5bd3	2c09bf48-31df-47d1-bf45-11d7695ea002	CALLAHUANCA
t	2025-03-17 21:13:00.633976+00	2025-03-17 21:13:00.633981+00	8c3e3f88-99a8-4a65-a02a-e56ce3cdac49	6f01c2b3-c170-49f4-a21b-c1fae42b9815	SICSIBAMBA
t	2025-03-17 21:13:00.639853+00	2025-03-17 21:13:00.639856+00	d0ebf08f-a4a7-40e4-9e8a-46bd67270fa0	e7d5b8b6-66d7-4611-ad0f-4ea3be3ebeec	SAN PEDRO DE PILLAO
t	2025-03-17 21:13:00.646087+00	2025-03-17 21:13:00.64609+00	65e8371a-7066-4e7f-875a-f379fb9349c3	e6121f54-624d-44b3-ba2e-d07a7cfe7226	SAN ISIDRO
t	2025-03-17 21:13:00.652186+00	2025-03-17 21:13:00.652191+00	d52fb9ac-c0d3-42f0-889b-1784d1761661	3c8af264-3631-4747-a2a2-7b153fa4b672	ANDAHUAYLAS
t	2025-03-17 21:13:00.658812+00	2025-03-17 21:13:00.658815+00	3b32b16c-4cde-4b2b-a4d0-bfd743a03527	8ae34c95-7c05-4880-915b-49c44ac13bd1	GUADALUPE
t	2025-03-17 21:13:00.665362+00	2025-03-17 21:13:00.665368+00	8618708d-bb4a-4ac4-8ac7-083644459529	26dfbd86-1b08-4168-8d5b-0f468fe9bbc9	ANDOAS
t	2025-03-17 21:13:00.671016+00	2025-03-17 21:13:00.67102+00	3a0608fb-dc40-4fa3-b82a-b71189becf1f	6f01c2b3-c170-49f4-a21b-c1fae42b9815	RAGASH
t	2025-03-17 21:13:00.677039+00	2025-03-17 21:13:00.677043+00	48af3be3-0d31-46f0-a67e-4b44cd853cc3	187d7e64-5269-4ebb-953a-949acc68acd7	PAJARILLO
t	2025-03-17 21:13:00.682486+00	2025-03-17 21:13:00.68249+00	c5a780ef-a265-47a9-a2cc-754d741fac4b	4867fc63-7654-417d-8cb7-fd0de85acb77	ALEXANDER VON HUMBOLDT
t	2025-03-17 21:13:00.689051+00	2025-03-17 21:13:00.689057+00	7251276e-5b93-4bc2-a265-2113899ffbc5	aa8c638e-2ea0-4a72-9668-8057261bbfee	LA UNION
t	2025-03-17 21:13:00.69489+00	2025-03-17 21:13:00.694894+00	35b252c7-8b24-4476-83da-851395b42135	e479934c-2453-4ba8-a477-47d8f7b30704	CAIRANI
t	2025-03-17 21:13:00.700212+00	2025-03-17 21:13:00.700216+00	ae912f15-1551-444d-b99c-91502bf25334	4c515df3-386f-4376-a901-eb9876ac20da	QUILLO
t	2025-03-17 21:13:00.706103+00	2025-03-17 21:13:00.706107+00	94481c1f-aa72-4735-bf25-4017cde09d0d	fae002ab-c99a-457d-8f6d-9e9964312caf	AMANTANI
t	2025-03-17 21:13:00.712526+00	2025-03-17 21:13:00.71253+00	18c8614d-c61d-40f8-bee1-7664ee01c362	e61f54ef-373f-46b9-b05e-bfe23561ec46	PICHARI
t	2025-03-17 21:13:00.717373+00	2025-03-17 21:13:00.717376+00	b0b7d97b-cd45-4c67-b105-9c9fbfd0d16a	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	BELEN
t	2025-03-17 21:13:00.722855+00	2025-03-17 21:13:00.722859+00	2ea62444-a9c6-4832-b198-59cde2567bf1	da261af9-5596-4188-b73d-5c091ad57d8b	CASCA
t	2025-03-17 21:13:00.730396+00	2025-03-17 21:13:00.730401+00	4a9fa037-fac1-4750-8c9c-8d6ae447bac0	50381126-eaca-4e9d-9688-2d0ed3c35612	CHICLAYO
t	2025-03-17 21:13:00.736105+00	2025-03-17 21:13:00.736109+00	0a749d80-70bb-4e2e-96a0-12d7eb26bf32	186355ca-8fe2-4aa6-8445-132b479de1b5	HUACRACHUCO
t	2025-03-17 21:13:00.742188+00	2025-03-17 21:13:00.742191+00	9a68a684-8851-4571-9334-fd0e40eea87d	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	PAUCARPATA
t	2025-03-17 21:13:00.748136+00	2025-03-17 21:13:00.748143+00	fc4a4919-f0ec-4504-8899-986b2120ed3b	cc76f1f4-59f8-477e-ab55-63ef31302138	CHIRIMOTO
t	2025-03-17 21:13:00.753837+00	2025-03-17 21:13:00.75384+00	f408cbcc-07a8-495b-940b-368f134e2e17	956d4ecd-a18c-4758-bb6a-cb38c449e32c	SUMBILCA
t	2025-03-17 21:13:00.759025+00	2025-03-17 21:13:00.759028+00	f51f74df-cab0-4841-935a-b8017486ebe2	3c8af264-3631-4747-a2a2-7b153fa4b672	SAN MIGUEL DE CHACCRAMPA
t	2025-03-17 21:13:00.76526+00	2025-03-17 21:13:00.765263+00	fb522066-b12d-4b38-a5b9-a52f228cf006	4f439eb6-7ff6-4f79-b681-05e3601f1b33	SAN MIGUEL DE MAYOCC
t	2025-03-17 21:13:00.77086+00	2025-03-17 21:13:00.770864+00	b3fa359f-f6dd-42eb-b3e5-b9324264ee5c	c35d368a-d376-4211-876e-9a3feb37e400	ALONSO DE ALVARADO
t	2025-03-17 21:13:00.777009+00	2025-03-17 21:13:00.777013+00	9ff90f20-e281-4439-9413-790cf53ad7b0	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	PATIBAMBA
t	2025-03-17 21:13:00.783124+00	2025-03-17 21:13:00.783127+00	f13d1603-be3a-43c3-a08c-5e0733946014	aa8c638e-2ea0-4a72-9668-8057261bbfee	CHUQUIS
t	2025-03-17 21:13:00.78829+00	2025-03-17 21:13:00.788293+00	f01acfba-34e2-4c44-981b-4bf6595aa233	fb3b3950-928c-4345-8bb6-8f89054c2e9b	NIEPOS
t	2025-03-17 21:13:00.794453+00	2025-03-17 21:13:00.794457+00	67610fb3-e728-4639-bad1-c96516bf3a90	0653b015-1f1e-4073-b4a6-eddacd4d0018	CACATACHI
t	2025-03-17 21:13:00.80001+00	2025-03-17 21:13:00.800013+00	ab653776-be74-4699-8a71-38444431fe9d	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	SAN JUAN DE SIGUAS
t	2025-03-17 21:13:00.80627+00	2025-03-17 21:13:00.806274+00	7acbdc27-ec7b-4cef-ad29-a197fcbbc158	c3464dda-3d6f-443f-a987-ad215194f703	ACHOMA
t	2025-03-17 21:13:00.811881+00	2025-03-17 21:13:00.811884+00	7858f4f7-e65c-4536-8546-3ebc89eafdb7	e479934c-2453-4ba8-a477-47d8f7b30704	CURIBAYA
t	2025-03-17 21:13:00.818823+00	2025-03-17 21:13:00.818826+00	584411fa-62b6-4edc-b379-e02bdbf72cd1	35972dee-bd82-40d7-aad3-b6f032924ddd	PATAYPAMPA
t	2025-03-17 21:13:00.823662+00	2025-03-17 21:13:00.823664+00	c73a7e9b-729b-4eee-8a19-2b04150cf2d4	56ad5343-c9f9-4787-a151-0f3d01c21dbb	SANTA CRUZ
t	2025-03-17 21:13:00.830865+00	2025-03-17 21:13:00.83087+00	4434ade2-28c6-40d2-b0f1-89f78e306f03	e7d5b8b6-66d7-4611-ad0f-4ea3be3ebeec	CHACAYAN
t	2025-03-17 21:13:00.837958+00	2025-03-17 21:13:00.837962+00	e950232e-0770-40b2-a966-814ac38b323a	3c8af264-3631-4747-a2a2-7b153fa4b672	TUMAY HUARACA
t	2025-03-17 21:13:00.843349+00	2025-03-17 21:13:00.843353+00	e4f072ef-e6f0-4847-bcf0-8eadddd18463	c35d368a-d376-4211-876e-9a3feb37e400	SHANAO
t	2025-03-17 21:13:00.848597+00	2025-03-17 21:13:00.8486+00	4f989e4f-defb-4235-b6de-c62cc09fdf81	994de1db-2a15-4db0-80a6-4efa76422c2c	LA PRIMAVERA
t	2025-03-17 21:13:00.854056+00	2025-03-17 21:13:00.854059+00	67ea90be-0c36-44f3-9298-c1c4ef0b489a	c5f4a998-3e9d-40be-a280-2d993d49b686	CACHIMAYO
t	2025-03-17 21:13:00.859747+00	2025-03-17 21:13:00.859751+00	363550ef-081d-47ef-84fb-b24a8ea37c72	e25f8297-7651-4d13-b583-e83edec11bc7	OXAMARCA
t	2025-03-17 21:13:00.864382+00	2025-03-17 21:13:00.864385+00	678010de-7034-4282-9554-19bfc4192681	0f00ebe8-c4f5-448e-a160-9c459750cf50	POLVORA
t	2025-03-17 21:13:00.869573+00	2025-03-17 21:13:00.869576+00	5e488933-4c3c-4351-b489-cfdd17679798	3c8af264-3631-4747-a2a2-7b153fa4b672	HUANCARAY
t	2025-03-17 21:13:00.874963+00	2025-03-17 21:13:00.874966+00	4e8af320-42b6-484b-a557-d8765396ef53	40cd7264-e177-460b-81e7-fd1c04a3d1dd	PEBAS
t	2025-03-17 21:13:00.881972+00	2025-03-17 21:13:00.881976+00	4c6e8e3d-9447-4ef1-9692-f5e2c9e8eeee	83a45ddf-481f-4760-86f7-5d5ba4423a89	CASTILLA
t	2025-03-17 21:13:00.887803+00	2025-03-17 21:13:00.887806+00	bf3fe143-44d3-45b2-841d-5ef4a0be9bc5	fb3b3950-928c-4345-8bb6-8f89054c2e9b	LA FLORIDA
t	2025-03-17 21:13:00.895617+00	2025-03-17 21:13:00.895622+00	baf27d18-d2f6-47cd-966a-3ffa574d76e9	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	PILLCO MARCA
t	2025-03-17 21:13:00.906945+00	2025-03-17 21:13:00.906953+00	42a80372-55ee-41ab-a749-ab5057b247cd	bc89669e-ca8f-4a78-8a5a-f601b64fc944	OYON
t	2025-03-17 21:13:00.914873+00	2025-03-17 21:13:00.914878+00	ab8ac9a0-3130-4a68-9348-b141c5bdb888	fb3b3950-928c-4345-8bb6-8f89054c2e9b	SAN SILVESTRE DE COCHAN
t	2025-03-17 21:13:00.921756+00	2025-03-17 21:13:00.921759+00	2cffd95c-0b5c-4bda-a04b-17e08be92b78	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	CHUNGUI
t	2025-03-17 21:13:00.927966+00	2025-03-17 21:13:00.927969+00	93de8285-f921-41e6-976c-c4eaa532d3b5	6a63b22a-2f1a-4c61-bf16-53cd00081db0	LA PAMPA
t	2025-03-17 21:13:00.93401+00	2025-03-17 21:13:00.934013+00	216a8dc7-9a8d-4b1f-a8b6-637adefb89c2	802f9e1a-4b36-4787-ae41-e5aaca68da54	CHUPACA
t	2025-03-17 21:13:00.939989+00	2025-03-17 21:13:00.939991+00	bf463ecd-5c89-4445-bdb9-a7db3bd96359	62bc063a-ebad-48e0-8d45-7ed5c604ed27	CHOCOPE
t	2025-03-17 21:13:00.945369+00	2025-03-17 21:13:00.945372+00	676f3505-5e71-413d-bb95-9c8b8d4cfb93	c5f4a998-3e9d-40be-a280-2d993d49b686	CHINCHAYPUJIO
t	2025-03-17 21:13:00.951884+00	2025-03-17 21:13:00.951888+00	5161866e-3da8-458f-9de5-57d688dd79c9	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	SAN JOSE DE QUERO
t	2025-03-17 21:13:00.957222+00	2025-03-17 21:13:00.957226+00	f53cdc78-6285-4ef1-88f5-04c1877512ea	5250e4c2-488d-4a7d-bdc9-d2633361c510	QUILCAPUNCU
t	2025-03-17 21:13:00.962202+00	2025-03-17 21:13:00.962205+00	90e5caf0-2fd0-4917-ae71-10cc4378184a	cc76f1f4-59f8-477e-ab55-63ef31302138	LONGAR
t	2025-03-17 21:13:00.96661+00	2025-03-17 21:13:00.966612+00	ca97a1d6-c5a5-4f9e-96b9-838816ca2626	b5c477ac-5c22-4641-a743-47ccf2ee8c59	MARCARA
t	2025-03-17 21:13:00.971598+00	2025-03-17 21:13:00.971601+00	63130181-aee8-406c-9253-a3f558f6f9a7	645a24ad-797e-4a8f-8376-d9b0a7afe5b2	MATAPALO
t	2025-03-17 21:13:00.976225+00	2025-03-17 21:13:00.976227+00	70bcbc04-1277-4916-b6a5-12ad3da342be	cbc121ea-f1b1-4a06-97cb-c010f63ee492	SANTIAGO DE CHUCO
t	2025-03-17 21:13:00.980931+00	2025-03-17 21:13:00.980934+00	969b4e88-78a4-4dbf-9df4-180f355f80e0	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	BREÑA
t	2025-03-17 21:13:00.987655+00	2025-03-17 21:13:00.987662+00	23c1f4c8-28e9-4d77-90f6-db8124d52cf8	46a0b504-382b-4799-85d6-225617d83360	CHOROPAMPA
t	2025-03-17 21:13:00.994161+00	2025-03-17 21:13:00.994165+00	10ed1e6d-dbc2-4739-8413-e939d5971f9d	e7815c4d-9487-4bbf-aa91-b30ca9896721	TOMEPAMPA
t	2025-03-17 21:13:00.999898+00	2025-03-17 21:13:00.999905+00	6b794172-63b2-4365-bcf8-5b29f2004a68	e42231e6-aaee-4ff1-b63a-6fe0f1417241	LA BREA
t	2025-03-17 21:13:01.004976+00	2025-03-17 21:13:01.00498+00	c0d7448f-4e05-4924-833b-8e3867fbecdf	57eae5d9-fae5-40b0-808f-4699285c2a8e	QUEHUE
t	2025-03-17 21:13:01.010347+00	2025-03-17 21:13:01.01035+00	5bf9a2ba-ce72-4946-9f33-104dd39dcb17	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	LA MATANZA
t	2025-03-17 21:13:01.015593+00	2025-03-17 21:13:01.015597+00	e686facc-e1e4-4fb6-8e97-ec0650257694	a0671457-1dd6-4137-b054-4f8a0d6515e5	CABANA
t	2025-03-17 21:13:01.022005+00	2025-03-17 21:13:01.022009+00	271f5b5f-2b51-4c4b-bfb7-7c02f7c40fd2	5b08eab1-14c5-448c-8832-40f39e2a1840	ACOS
t	2025-03-17 21:13:01.027484+00	2025-03-17 21:13:01.027488+00	22398e07-6d38-4931-a2df-d035bdc049e5	e61f54ef-373f-46b9-b05e-bfe23561ec46	CIELO PUNCO
t	2025-03-17 21:13:01.032871+00	2025-03-17 21:13:01.032874+00	c1e2fcb1-0a8a-4334-a9ca-53236cdbbc5b	4302c314-c6b8-4319-adfa-220b32d49c8d	BALSAPUERTO
t	2025-03-17 21:13:01.038857+00	2025-03-17 21:13:01.038862+00	aa533dc6-f757-47c2-8d5a-f47290bb371b	6a5cf9a4-6f24-4a7e-b672-4b80cc5aecf7	ONDORES
t	2025-03-17 21:13:01.04533+00	2025-03-17 21:13:01.045332+00	f0318e17-25e3-4d3d-ba9b-64eaefb15827	da261af9-5596-4188-b73d-5c091ad57d8b	MUSGA
t	2025-03-17 21:13:01.051127+00	2025-03-17 21:13:01.05113+00	774ab1e1-c205-451a-84c2-2f91b7137235	fb3b3950-928c-4345-8bb6-8f89054c2e9b	EL PRADO
t	2025-03-17 21:13:01.056322+00	2025-03-17 21:13:01.056326+00	b2992471-efd5-45ba-af26-9e6ad0a38904	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	CHOCO
t	2025-03-17 21:13:01.061812+00	2025-03-17 21:13:01.061815+00	fba61f57-64ae-4079-a028-ce4c15aacb8d	6f01c2b3-c170-49f4-a21b-c1fae42b9815	HUAYLLABAMBA
t	2025-03-17 21:13:01.066176+00	2025-03-17 21:13:01.066179+00	58c8bb0f-18fc-4718-b7bf-dc775f42afde	c3464dda-3d6f-443f-a987-ad215194f703	TISCO
t	2025-03-17 21:13:01.072218+00	2025-03-17 21:13:01.072221+00	0b5e492d-7405-4c1b-ba0d-cf81629fa723	83a45ddf-481f-4760-86f7-5d5ba4423a89	TAMBO GRANDE
t	2025-03-17 21:13:01.077285+00	2025-03-17 21:13:01.077288+00	1314fbb5-b75e-4bdd-9754-5c16c61e3873	55340ef0-3d04-40ea-a070-cbb80d5755a5	PITUMARCA
t	2025-03-17 21:13:01.083013+00	2025-03-17 21:13:01.083016+00	e2fcde9a-dd75-4ad3-954c-87e31c8f504c	c745de6d-713a-4613-951f-05d16e86739b	CAMANA
t	2025-03-17 21:13:01.087719+00	2025-03-17 21:13:01.087722+00	c8ea0072-47ee-4819-83fb-f687b488828c	4f439eb6-7ff6-4f79-b681-05e3601f1b33	LOCROJA
t	2025-03-17 21:13:01.092633+00	2025-03-17 21:13:01.092636+00	a6a3657e-2c15-432c-80b5-345e06b5fd86	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	ANCON
t	2025-03-17 21:13:01.097233+00	2025-03-17 21:13:01.097235+00	3185f2f1-dbe6-4726-8db8-a3ebc02dad82	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	SAN PEDRO DE LARCAY
t	2025-03-17 21:13:01.102069+00	2025-03-17 21:13:01.102072+00	168ef72b-53d9-4501-9bf7-357d83a8fd09	14ecad5d-903d-42ac-b037-7f9cdcec77b2	LA MERCED
t	2025-03-17 21:13:01.106895+00	2025-03-17 21:13:01.106898+00	c463a824-c1e4-4f19-adf1-39f419180351	23397af4-baff-4db8-b639-166478d622d1	SANTA CRUZ DE TOLEDO
t	2025-03-17 21:13:01.111714+00	2025-03-17 21:13:01.111716+00	5ccae0a3-8532-4802-bd4c-e144c1c3d540	50381126-eaca-4e9d-9688-2d0ed3c35612	ETEN
t	2025-03-17 21:13:01.116705+00	2025-03-17 21:13:01.116708+00	c5fc6200-9d01-40e1-af92-d6b4894b8e01	0653b015-1f1e-4073-b4a6-eddacd4d0018	MORALES
t	2025-03-17 21:13:01.121415+00	2025-03-17 21:13:01.121418+00	a1a4c836-4dbb-4d8d-81c1-7c023518c664	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	PUNTA HERMOSA
t	2025-03-17 21:13:01.126724+00	2025-03-17 21:13:01.126727+00	4cd26002-d7de-40c4-a6fd-c21db3d0f15e	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	PACHACAMAC
t	2025-03-17 21:13:01.132102+00	2025-03-17 21:13:01.132104+00	526e26cf-1247-469b-b78b-5cf291be1ef6	23397af4-baff-4db8-b639-166478d622d1	SAN BENITO
t	2025-03-17 21:13:01.136734+00	2025-03-17 21:13:01.136736+00	b09a7cbd-150f-45ee-ae19-e00478e99a0d	b6200a73-f2d4-4543-8e14-909a4f3e7f32	RONDOS
t	2025-03-17 21:13:01.14229+00	2025-03-17 21:13:01.142294+00	e647d2b0-5364-4a6a-88f1-dc99d7130996	994de1db-2a15-4db0-80a6-4efa76422c2c	ANTONIO RAYMONDI
t	2025-03-17 21:13:01.148158+00	2025-03-17 21:13:01.148161+00	f6e202b0-40aa-4007-8f99-21bc42266b2e	6eca8b97-dbde-4058-8fc8-4b86feb3307c	SANDIA
t	2025-03-17 21:13:01.152256+00	2025-03-17 21:13:01.152259+00	a768ab5d-dc0d-49e2-9fc3-e51c207b8e00	a154aa5a-7dee-47d6-8448-b6744a59812d	HUALMAY
t	2025-03-17 21:13:01.157356+00	2025-03-17 21:13:01.157359+00	7e740994-d40b-41b8-ab11-765dcab889cb	98e65496-68d3-4d43-bddc-22c7631c5b27	ARENAL
t	2025-03-17 21:13:01.162688+00	2025-03-17 21:13:01.16269+00	5c977c0b-c31e-4bb3-84a9-644313acd8c6	2c09bf48-31df-47d1-bf45-11d7695ea002	SAN PEDRO DE CASTA
t	2025-03-17 21:13:01.168596+00	2025-03-17 21:13:01.1686+00	23646b02-5188-4414-a224-ea1717940846	25fae8ef-3678-4898-9063-605c52bdc629	MALVAS
t	2025-03-17 21:13:01.174068+00	2025-03-17 21:13:01.17407+00	db75bb79-db78-48ec-8bb2-877d2a13149b	c44b2db0-1ce6-4816-b16c-975486d5db85	CANTA
t	2025-03-17 21:13:01.180003+00	2025-03-17 21:13:01.180006+00	eef46dd4-ddc2-4cb2-a2ad-b242dd765b74	e7815c4d-9487-4bbf-aa91-b30ca9896721	ALCA
t	2025-03-17 21:13:01.186225+00	2025-03-17 21:13:01.186228+00	6c2a2349-ec8b-4760-88a5-a7d766502f3e	960e79f6-51c7-4335-b07a-7721b638f576	CIRCA
t	2025-03-17 21:13:01.192288+00	2025-03-17 21:13:01.192292+00	670821e1-7d0c-4976-9e11-56a0facfb2ea	ae046f24-a6bc-4f31-a81c-2bca0c494b67	REQUENA
t	2025-03-17 21:13:01.197906+00	2025-03-17 21:13:01.19791+00	31af3003-9368-4046-922f-44c50261e09d	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	HUANCAVELICA
t	2025-03-17 21:13:01.20383+00	2025-03-17 21:13:01.203833+00	91e3fdb9-84dc-4f6c-99db-1100f69863da	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	POLOBAYA
t	2025-03-17 21:13:01.209071+00	2025-03-17 21:13:01.209074+00	b490bd5c-f179-437a-b8e0-8e853d1bc931	e7815c4d-9487-4bbf-aa91-b30ca9896721	TORO
t	2025-03-17 21:13:01.214414+00	2025-03-17 21:13:01.214417+00	b47ef6fb-5bef-47cc-9605-e79ddcedb4d9	e09f0261-1ea3-4fd7-a601-d7077e27ff43	CONSTITUCION
t	2025-03-17 21:13:01.220355+00	2025-03-17 21:13:01.220363+00	ed1c1b8d-fd25-42ca-9d8f-84bd90bf8a20	c3464dda-3d6f-443f-a987-ad215194f703	ICHUPAMPA
t	2025-03-17 21:13:01.227151+00	2025-03-17 21:13:01.227162+00	fa6c4127-e4af-4797-89f5-09a7a12c719a	2c09bf48-31df-47d1-bf45-11d7695ea002	SAN JUAN DE IRIS
t	2025-03-17 21:13:01.233885+00	2025-03-17 21:13:01.23389+00	368503f0-98bd-485e-868a-ea6e51a6dcb2	2c09bf48-31df-47d1-bf45-11d7695ea002	HUACHUPAMPA
t	2025-03-17 21:13:01.242133+00	2025-03-17 21:13:01.242138+00	d1b187e7-03c7-4339-8649-83b95e422acc	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	ORCOPAMPA
t	2025-03-17 21:13:01.249199+00	2025-03-17 21:13:01.249203+00	183707b5-e805-437a-8d69-42898e4b6b1f	6a63b22a-2f1a-4c61-bf16-53cd00081db0	YANAC
t	2025-03-17 21:13:01.255454+00	2025-03-17 21:13:01.255458+00	70d8fd36-a967-48a0-8234-94a2527d94ce	48baea8d-1683-43d2-80ed-35ccb06c4f37	CASCAS
t	2025-03-17 21:13:01.262855+00	2025-03-17 21:13:01.262859+00	84d15ed1-6273-429d-ac19-1a116400881c	b1206fd6-020d-42a0-a864-feb8643f0013	PICOTA
t	2025-03-17 21:13:01.268401+00	2025-03-17 21:13:01.268404+00	4d798d7a-404e-4dc1-9c66-ffa266778b73	46a0b504-382b-4799-85d6-225617d83360	SAN JUAN DE LICUPIS
t	2025-03-17 21:13:01.273913+00	2025-03-17 21:13:01.273916+00	b7ea2f03-fc32-4651-9f12-cc43dd2736a1	1a124fda-ccb8-45b3-b69b-e0453133d8d8	PUCAYACU
t	2025-03-17 21:13:01.279617+00	2025-03-17 21:13:01.279621+00	cbcff42b-f3c2-4d5a-9a70-d95e9c7b3966	aa8c638e-2ea0-4a72-9668-8057261bbfee	YANAS
t	2025-03-17 21:13:01.286073+00	2025-03-17 21:13:01.286076+00	4a3d45f8-751b-4b9c-89a0-f54423862167	c1ae25de-54dd-4d24-90bd-2a41a350a944	DEAN VALDIVIA
t	2025-03-17 21:13:01.293456+00	2025-03-17 21:13:01.293461+00	365ea6f6-f36a-46a1-8747-3d234c371437	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	SAN ANDRES DE CUTERVO
t	2025-03-17 21:13:01.301+00	2025-03-17 21:13:01.301007+00	9d487559-0633-4f1b-805e-2833b978568a	6e015257-6f7e-48cf-b9c0-a24502cdcc21	QUILCAS
t	2025-03-17 21:13:01.31042+00	2025-03-17 21:13:01.310425+00	f4cb833f-878b-440c-b019-411ee8fe6f96	fcd7819a-4504-4907-b6e9-87e79982326b	TAHUAMANU
t	2025-03-17 21:13:01.318923+00	2025-03-17 21:13:01.318931+00	393b9067-720a-4eb8-a484-046d52b9644b	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	PUNTA NEGRA
t	2025-03-17 21:13:01.328298+00	2025-03-17 21:13:01.328304+00	56d3eb9c-74e5-44d0-a8c2-706e82d0b21c	39b5f4f6-da10-4e59-90a1-ca1e4c8877dc	CAJA
t	2025-03-17 21:13:01.338075+00	2025-03-17 21:13:01.338083+00	1cf1e432-cfd9-4069-a95f-96c20907ef36	a0671457-1dd6-4137-b054-4f8a0d6515e5	HUACASCHUQUE
t	2025-03-17 21:13:01.347333+00	2025-03-17 21:13:01.347338+00	03bea21b-41a7-49e9-adf2-1227050bf429	2dc69e0d-998b-495d-87a4-64f98a9260cd	MOHO
t	2025-03-17 21:13:01.356038+00	2025-03-17 21:13:01.356047+00	b869f8dd-ddbc-4e50-a2ce-dc2ae13c148a	ea1da671-28f3-4192-ac87-6c6d5c9f5967	COLASAY
t	2025-03-17 21:13:01.363558+00	2025-03-17 21:13:01.363562+00	a9139b41-41c5-42b1-9caa-86c2623a0e3f	ae046f24-a6bc-4f31-a81c-2bca0c494b67	PUINAHUA
t	2025-03-17 21:13:01.371503+00	2025-03-17 21:13:01.371508+00	103420f0-2ae6-47e1-b341-c84a6cdca525	4c515df3-386f-4376-a901-eb9876ac20da	YANAMA
t	2025-03-17 21:13:01.378524+00	2025-03-17 21:13:01.378529+00	dcebc472-c416-46e7-9025-2f781651476a	a8a4b3eb-833f-4269-98b8-d5e76c3fb74c	LA COIPA
t	2025-03-17 21:13:01.386438+00	2025-03-17 21:13:01.386441+00	5e3f5be9-5bd8-443f-bfa1-ba8a9498c52f	cf7fa8b0-e545-40b4-99eb-d431d72c6c8d	LONYA GRANDE
t	2025-03-17 21:13:01.394379+00	2025-03-17 21:13:01.394383+00	feded6a3-ca30-4807-8777-ba762fc67c7f	956d4ecd-a18c-4758-bb6a-cb38c449e32c	SANTA CRUZ DE ANDAMARCA
t	2025-03-17 21:13:01.402036+00	2025-03-17 21:13:01.402042+00	2420572e-f135-4e88-9fd1-d02d7f42ce0e	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	HUARIPAMPA
t	2025-03-17 21:13:01.408523+00	2025-03-17 21:13:01.408526+00	de477b17-6d31-4388-93ae-751651134986	029d4c57-b401-421f-beeb-7d0fef5c0dbb	CARMEN SALCEDO
t	2025-03-17 21:13:01.413546+00	2025-03-17 21:13:01.41355+00	540d73ea-4814-4fca-bd61-c834725873bf	c3464dda-3d6f-443f-a987-ad215194f703	CALLALLI
t	2025-03-17 21:13:01.418554+00	2025-03-17 21:13:01.418559+00	733793ba-d94b-4abf-ba22-a4ce60327cb2	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	QUICHUAS
t	2025-03-17 21:13:01.424412+00	2025-03-17 21:13:01.424416+00	2d5b7ad3-19ca-4092-9b5e-47e00a313cbc	2dc69e0d-998b-495d-87a4-64f98a9260cd	HUAYRAPATA
t	2025-03-17 21:13:01.430484+00	2025-03-17 21:13:01.430489+00	553a5786-989f-4df2-9d4c-4c5343154110	1535087f-84f1-4173-955d-c6bc686c7306	SAURAMA
t	2025-03-17 21:13:01.436496+00	2025-03-17 21:13:01.4365+00	d14312c5-43a5-4a2e-81d1-50697a6215b4	aa61d159-135e-4d97-a318-d721d0ccd135	EL ORO
t	2025-03-17 21:13:01.442981+00	2025-03-17 21:13:01.442987+00	2f4a0d84-b62a-42f2-b6de-6958ee130e8c	3c8af264-3631-4747-a2a2-7b153fa4b672	KISHUARA
t	2025-03-17 21:13:01.45066+00	2025-03-17 21:13:01.450666+00	5e98f9e6-b066-4d4e-aaf5-537c7641d6a5	63916004-9475-4b57-a40b-f707c2be8d2d	CHINCHA BAJA
t	2025-03-17 21:13:01.457924+00	2025-03-17 21:13:01.457929+00	3dc61b9d-9113-4290-b703-cda2c554b60d	3c8af264-3631-4747-a2a2-7b153fa4b672	KAQUIABAMBA
t	2025-03-17 21:13:01.463766+00	2025-03-17 21:13:01.463768+00	6de451ec-71fc-483e-b458-585dd4232f9e	1bdc26fa-d3e6-4ac9-92f0-4270e897cee0	MOQUEGUA
t	2025-03-17 21:13:01.468783+00	2025-03-17 21:13:01.468787+00	1729ef2f-fb00-4df2-a4c8-5365f80d4799	0c319822-58c6-435a-ab75-c3c72db37ed8	TICLACAYAN
t	2025-03-17 21:13:01.474483+00	2025-03-17 21:13:01.474491+00	3a50eb73-5395-4344-a0c8-535e473bee44	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	JESUS MARIA
t	2025-03-17 21:13:01.480982+00	2025-03-17 21:13:01.480988+00	13923541-7ad6-4df7-b08e-1a4a67b65477	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	HUANGASCAR
t	2025-03-17 21:13:01.487548+00	2025-03-17 21:13:01.487551+00	07496d67-e915-4c4e-829f-451d221b55a3	a4dc3a42-25f5-4178-a9e7-66ef66e42aeb	MARCAPOMACOCHA
t	2025-03-17 21:13:01.493376+00	2025-03-17 21:13:01.493379+00	0ad60551-c668-48ab-ad46-326f1c838ead	26dfbd86-1b08-4168-8d5b-0f468fe9bbc9	MANSERICHE
t	2025-03-17 21:13:01.500067+00	2025-03-17 21:13:01.500073+00	ddfbcb41-81f8-4396-bcac-2d32d374a657	c3464dda-3d6f-443f-a987-ad215194f703	TAPAY
t	2025-03-17 21:13:01.507308+00	2025-03-17 21:13:01.507313+00	be7def4d-6b93-477c-b15e-4c06c0bfeb4f	994de1db-2a15-4db0-80a6-4efa76422c2c	AQUIA
t	2025-03-17 21:13:01.516736+00	2025-03-17 21:13:01.51674+00	25fe87b6-a07d-4098-9c99-7309fe061701	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	HUAMPARA
t	2025-03-17 21:13:01.524956+00	2025-03-17 21:13:01.524962+00	c093d55b-fe81-4621-b6bd-e7e3bab579bd	da261af9-5596-4188-b73d-5c091ad57d8b	PISCOBAMBA
t	2025-03-17 21:13:01.532493+00	2025-03-17 21:13:01.532499+00	0f4499a0-7d6a-4722-8166-b2ff3e6ac3f2	029d4c57-b401-421f-beeb-7d0fef5c0dbb	SANTA LUCIA
t	2025-03-17 21:13:01.539982+00	2025-03-17 21:13:01.539986+00	7cabbea3-48c3-44e7-bb35-20ea355bef36	efdcbed4-4e80-48e7-8992-8191ea2939b8	HUAYLLAY GRANDE
t	2025-03-17 21:13:01.547492+00	2025-03-17 21:13:01.547496+00	f8381f3c-f4da-4676-9322-9a8a331a8bbb	b1206fd6-020d-42a0-a864-feb8643f0013	SHAMBOYACU
t	2025-03-17 21:13:01.55555+00	2025-03-17 21:13:01.555554+00	44c67daa-9667-4851-8a7e-3777ef2686e1	6e015257-6f7e-48cf-b9c0-a24502cdcc21	QUICHUAY
t	2025-03-17 21:13:01.562426+00	2025-03-17 21:13:01.562431+00	14d1f7d1-fb02-4024-a0ce-33c1d9315031	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	LAMBRAS
t	2025-03-17 21:13:01.568629+00	2025-03-17 21:13:01.568633+00	e4cd8709-9cc0-442c-aaa3-a94d6e05e04f	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	CHILLIA
t	2025-03-17 21:13:01.57511+00	2025-03-17 21:13:01.575113+00	d1057aaf-3ff4-4f6d-b8cc-4d72a5e04bc5	ae046f24-a6bc-4f31-a81c-2bca0c494b67	SOPLIN
t	2025-03-17 21:13:01.581677+00	2025-03-17 21:13:01.581684+00	75eeb87e-6fd3-4c2c-8349-3e2980b36ca2	25d0ad5a-7f16-4975-bcd1-dc9b1d18f30a	CHUGAY
t	2025-03-17 21:13:01.588922+00	2025-03-17 21:13:01.588926+00	01cbf4d7-492e-41bd-b713-ceffee6024bf	2bc54a70-eee6-4d04-90b9-06503d3b6067	ACHAYA
t	2025-03-17 21:13:01.594808+00	2025-03-17 21:13:01.594811+00	4ea8e9bc-d145-4cf5-bd20-3ab093e1df6f	aed4ea90-0fa5-4394-9819-85ab6fdc76a5	GORGOR
t	2025-03-17 21:13:01.600783+00	2025-03-17 21:13:01.600787+00	4dcbb1f8-b748-4606-ba35-9924f9654b20	3802be26-bb36-4da3-9d01-4b889d15548f	VILAVILA
t	2025-03-17 21:13:01.606794+00	2025-03-17 21:13:01.606797+00	46cd994c-3203-41f7-bb3f-7f6f6c051311	1a124fda-ccb8-45b3-b69b-e0453133d8d8	JOSE CRESPO Y CASTILLO
t	2025-03-17 21:13:01.613338+00	2025-03-17 21:13:01.613343+00	551dfeca-4511-427e-87d9-4494e15e6574	a154aa5a-7dee-47d6-8448-b6744a59812d	CHECRAS
t	2025-03-17 21:13:01.620456+00	2025-03-17 21:13:01.62046+00	b5743049-a0bb-4583-956c-44af03a97750	fdbbb089-cb94-4751-b70e-8bb8f82bdd28	CARACOTO
t	2025-03-17 21:13:01.628096+00	2025-03-17 21:13:01.628102+00	ae2ec4ec-69b9-4456-a696-0a4576c1d50d	5b797ca5-ff5a-496b-bfce-d18fb4e97a04	RAYMONDI
t	2025-03-17 21:13:01.634479+00	2025-03-17 21:13:01.634482+00	7e38d95c-9fa9-43d9-aa4d-1e2701532e58	043c2412-4dba-427d-800e-a374fffd45f7	NIEVA
t	2025-03-17 21:13:01.642914+00	2025-03-17 21:13:01.642923+00	ffdde3c6-f0ae-4753-9946-fb1120895e2b	b6200a73-f2d4-4543-8e14-909a4f3e7f32	JIVIA
t	2025-03-17 21:13:01.650576+00	2025-03-17 21:13:01.65058+00	5b4c0f07-891a-446c-98ac-dd7746f61757	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	CUJILLO
t	2025-03-17 21:13:01.658775+00	2025-03-17 21:13:01.65878+00	83899d77-c3ab-44af-8fcf-6a08a7b32acb	719ca1e2-85aa-4811-87f1-ee903712f816	VICE
t	2025-03-17 21:13:01.665599+00	2025-03-17 21:13:01.665603+00	9cdeb7f0-0f14-4bc5-bf2f-4736197a2e66	6a0799ec-1dab-4d4c-9e30-0a4123d28996	PARAMONGA
t	2025-03-17 21:13:01.67339+00	2025-03-17 21:13:01.673402+00	709106d4-930a-4354-a094-550245ae9c1b	f25dcc28-5abe-4b1a-bcfe-9de19ced6787	COJATA
t	2025-03-17 21:13:01.679128+00	2025-03-17 21:13:01.679132+00	4fe6b2b1-dae3-4c63-88c0-e2bac05d3ee7	454a9077-d285-43fb-8f73-9898bccb31bb	CHACABAMBA
t	2025-03-17 21:13:01.685375+00	2025-03-17 21:13:01.68538+00	90fa8b7d-0a31-4304-8f0f-00c11350d725	0c319822-58c6-435a-ab75-c3c72db37ed8	HUAYLLAY
t	2025-03-17 21:13:01.69127+00	2025-03-17 21:13:01.691273+00	827141d8-96ed-422d-8894-7021fd698578	6c20eceb-ede1-430a-b724-bfe76c2701ad	HUAYLLAN
t	2025-03-17 21:13:01.696858+00	2025-03-17 21:13:01.696861+00	c939fe43-6c54-4eaf-b4f3-37f468e9ef5e	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	ALIS
t	2025-03-17 21:13:01.702785+00	2025-03-17 21:13:01.702789+00	bc4f263e-7736-4aac-b3c5-e79a077a794b	aed4ea90-0fa5-4394-9819-85ab6fdc76a5	CAJATAMBO
t	2025-03-17 21:13:01.708605+00	2025-03-17 21:13:01.708609+00	c093ae68-bcea-410a-b2d9-30e57091bc01	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	CURICACA
t	2025-03-17 21:13:01.716413+00	2025-03-17 21:13:01.716418+00	9a97885d-0add-4e4d-84c8-61688113ebd0	b8e4d98a-e502-47a8-af92-8fdab0b88e60	SAN JUAN DE RONTOY
t	2025-03-17 21:13:01.722926+00	2025-03-17 21:13:01.72293+00	00478e89-d45e-48aa-8fab-02d6907360d8	fbc0bd2f-d800-4706-b300-4eca7a818b49	QUILMANA
t	2025-03-17 21:13:01.72813+00	2025-03-17 21:13:01.728133+00	3534e615-2bd6-4c32-a4bf-0df3e2877b58	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	CHOROS
t	2025-03-17 21:13:01.733288+00	2025-03-17 21:13:01.733292+00	79e0439c-2bc4-4c41-b14b-e65676275a43	e5987227-df60-4b9e-a9c8-ef624979e917	ASQUIPATA
t	2025-03-17 21:13:01.73909+00	2025-03-17 21:13:01.739092+00	ef709faf-4755-43a0-9e6a-c55f62dbe1d3	8eb85dc7-057c-4c9c-890b-3fc9f739fba7	ACCHA
t	2025-03-17 21:13:01.746052+00	2025-03-17 21:13:01.746056+00	694adb81-062a-4cf2-ba25-5db31e9b988b	c86c46dc-e039-43dc-9913-86e623472583	SARA SARA
t	2025-03-17 21:13:01.752605+00	2025-03-17 21:13:01.752608+00	b5d135f2-4ca8-437a-b777-d8013106a198	109a4db0-2e12-4674-ab1f-9417d1664661	YARINACOCHA
t	2025-03-17 21:13:01.7614+00	2025-03-17 21:13:01.761405+00	2a123758-dde8-4bad-9807-d3144a7c8ba1	e5987227-df60-4b9e-a9c8-ef624979e917	HUAMANQUIQUIA
t	2025-03-17 21:13:01.768073+00	2025-03-17 21:13:01.768077+00	75ef3329-c6e0-4fee-b160-f338df0b2328	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	OMAS
t	2025-03-17 21:13:01.774098+00	2025-03-17 21:13:01.774101+00	efc6463d-cc27-4847-9d85-a39e2d3423f1	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	SANTA MARIA DEL VALLE
t	2025-03-17 21:13:01.779747+00	2025-03-17 21:13:01.77975+00	992dcfab-9dd9-45b8-b07c-48e24b40aac4	6e015257-6f7e-48cf-b9c0-a24502cdcc21	HUASICANCHA
t	2025-03-17 21:13:01.785638+00	2025-03-17 21:13:01.785642+00	23e84259-0914-4af9-a8e6-de6bfdc02cb8	013c5ed1-ba41-4d8c-a7da-845849a7efb9	PAMPAS
t	2025-03-17 21:13:01.791116+00	2025-03-17 21:13:01.791119+00	42a88e58-7c68-4e82-b9b4-635135baf9f0	2c09bf48-31df-47d1-bf45-11d7695ea002	SAN JUAN DE TANTARANCHE
t	2025-03-17 21:13:01.797342+00	2025-03-17 21:13:01.797346+00	c91e794d-4e77-4ccf-a427-d9f6e37dd13c	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	CATACHE
t	2025-03-17 21:13:01.803436+00	2025-03-17 21:13:01.803439+00	4fc9103d-b7b3-45e3-857e-6e7c09b3e9e3	a3e76f78-476b-4191-8337-9b5b285b15de	PUÑOS
t	2025-03-17 21:13:01.81059+00	2025-03-17 21:13:01.810593+00	aad3aa21-43aa-42fe-9464-61a79df182fe	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	HUANTAN
t	2025-03-17 21:13:01.817837+00	2025-03-17 21:13:01.81784+00	5e223103-9e14-413a-b0f9-5d9719119ca4	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	LINCE
t	2025-03-17 21:13:01.82468+00	2025-03-17 21:13:01.824683+00	07c50b5b-3182-43ba-8b41-1ee440a1229a	b8e4d98a-e502-47a8-af92-8fdab0b88e60	ACZO
t	2025-03-17 21:13:01.83194+00	2025-03-17 21:13:01.831944+00	8b39f838-ade4-47da-9d56-f2a8ba352578	62bc063a-ebad-48e0-8d45-7ed5c604ed27	RAZURI
t	2025-03-17 21:13:01.8397+00	2025-03-17 21:13:01.839704+00	8ef16636-dd94-4c46-b770-d7870088fcff	b8e4d98a-e502-47a8-af92-8fdab0b88e60	LLAMELLIN
t	2025-03-17 21:13:01.846928+00	2025-03-17 21:13:01.846932+00	42af890e-97a3-4e97-94b4-a6d425b22790	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	YAMANGO
t	2025-03-17 21:13:01.854872+00	2025-03-17 21:13:01.854876+00	03cce91e-3575-4fa6-bc9e-b90069cc1793	8bc9c85c-cc74-48be-979d-07938df4de67	TARUCACHI
t	2025-03-17 21:13:01.862448+00	2025-03-17 21:13:01.862453+00	411b7fe4-ed99-437f-955f-4163202b962f	50381126-eaca-4e9d-9688-2d0ed3c35612	NUEVA ARICA
t	2025-03-17 21:13:01.871164+00	2025-03-17 21:13:01.87117+00	87809c04-cd44-492e-9d8c-9a6762c9ffcb	b42841e0-44d6-4122-9396-858f0fbf2b1d	HUANTAR
t	2025-03-17 21:13:01.87973+00	2025-03-17 21:13:01.879733+00	878c97bf-521b-4873-8208-7325b9f4a897	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	TAYABAMBA
t	2025-03-17 21:13:01.887716+00	2025-03-17 21:13:01.887719+00	d771ad64-0956-417e-ab4a-2c52b5a952ec	957c7796-925d-4e7a-a997-1c18b7f41201	NAPO
t	2025-03-17 21:13:01.893096+00	2025-03-17 21:13:01.893098+00	6b776487-2af7-4003-8d3a-9b41ddd5a04a	fbc0bd2f-d800-4706-b300-4eca7a818b49	IMPERIAL
t	2025-03-17 21:13:01.90122+00	2025-03-17 21:13:01.901225+00	48169f24-bfee-4cb5-8827-aca8c55d6714	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	ÑAHUIMPUQUIO
t	2025-03-17 21:13:01.908553+00	2025-03-17 21:13:01.908557+00	fb390ca1-c510-4125-810e-8148e6039f6b	4d11370d-0157-4af4-b89d-731e4516658a	POCOLLAY
t	2025-03-17 21:13:01.914234+00	2025-03-17 21:13:01.914237+00	76a3acf2-6c37-484a-b72b-30116162aff6	2dc69e0d-998b-495d-87a4-64f98a9260cd	TILALI
t	2025-03-17 21:13:01.919596+00	2025-03-17 21:13:01.919598+00	97d85c1c-7617-4cf4-b0ff-c3e490df5217	fae002ab-c99a-457d-8f6d-9e9964312caf	PAUCARCOLLA
t	2025-03-17 21:13:01.925471+00	2025-03-17 21:13:01.925476+00	b8f75ae2-53c0-4499-ae91-d2704a9cdbbe	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	ATICO
t	2025-03-17 21:13:01.931435+00	2025-03-17 21:13:01.931438+00	bd024309-30ad-44d6-8c50-ff83c725b07d	42a3655b-687b-424b-a374-b0ab58d4f011	CHIMBOTE
t	2025-03-17 21:13:01.937417+00	2025-03-17 21:13:01.937421+00	a8f2e460-9a34-4533-8b48-492a462ed62e	745905a9-8826-4ae2-bbeb-334a668eebe1	OCORURO
t	2025-03-17 21:13:01.943725+00	2025-03-17 21:13:01.943728+00	00e91290-3619-44e8-8a82-9cce103ad388	1535087f-84f1-4173-955d-c6bc686c7306	HUAMBALPA
t	2025-03-17 21:13:01.951825+00	2025-03-17 21:13:01.951829+00	af2eb822-e399-46e0-8bb0-e25c603fa469	63916004-9475-4b57-a40b-f707c2be8d2d	TAMBO DE MORA
t	2025-03-17 21:13:01.958866+00	2025-03-17 21:13:01.95887+00	74ee3d36-d4f1-4c4b-9935-7bd0d779b7f5	50381126-eaca-4e9d-9688-2d0ed3c35612	PIMENTEL
t	2025-03-17 21:13:01.965448+00	2025-03-17 21:13:01.965452+00	7aedc753-0b49-403e-a502-43d309526267	4f439eb6-7ff6-4f79-b681-05e3601f1b33	COSME
t	2025-03-17 21:13:01.971826+00	2025-03-17 21:13:01.97183+00	07b2d94d-1671-4fae-8da3-f7d1ce0b99f8	e61f54ef-373f-46b9-b05e-bfe23561ec46	MEGANTONI
t	2025-03-17 21:13:01.977666+00	2025-03-17 21:13:01.97767+00	27b5322a-f5f5-41cd-b2a8-3d369b4bd482	83446550-f9ab-4a22-a1f0-308929aad66c	UCUNCHA
t	2025-03-17 21:13:01.983119+00	2025-03-17 21:13:01.983122+00	6956c308-9743-40b7-a3ee-f2099a4503b3	ccad1c7a-1947-451e-8728-01cf9e71c3f0	PINRA
t	2025-03-17 21:13:01.991779+00	2025-03-17 21:13:01.991788+00	84fbfc06-a9df-4f14-a3c8-7c1fa1d1d5bb	a8a4b3eb-833f-4269-98b8-d5e76c3fb74c	CHIRINOS
t	2025-03-17 21:13:01.999434+00	2025-03-17 21:13:01.999437+00	3fe2bad5-16b6-4a4e-b90c-9c251cd116a4	109a4db0-2e12-4674-ab1f-9417d1664661	NUEVA REQUENA
t	2025-03-17 21:13:02.003987+00	2025-03-17 21:13:02.003989+00	199d3700-0d9d-4220-abb6-2abeff3059c5	6e015257-6f7e-48cf-b9c0-a24502cdcc21	HUANCAN
t	2025-03-17 21:13:02.008357+00	2025-03-17 21:13:02.008361+00	9ad80484-8472-4967-a234-e5f5d57bfc02	12f1d3ac-6d49-46b4-8553-07f33b5be588	SAN PABLO
t	2025-03-17 21:13:02.014283+00	2025-03-17 21:13:02.014286+00	f6f2162b-4a3c-406b-8d30-e09dd28e34d0	c9678f77-84c7-4648-9a0c-4e6c0bba1844	SAN JACINTO
t	2025-03-17 21:13:02.018706+00	2025-03-17 21:13:02.018708+00	d8867e01-e75b-49d2-9611-2313f121ca93	029d4c57-b401-421f-beeb-7d0fef5c0dbb	AUCARA
t	2025-03-17 21:13:02.023705+00	2025-03-17 21:13:02.023708+00	2f9effca-3a9e-4ce8-b14d-978a1d467c1c	6e015257-6f7e-48cf-b9c0-a24502cdcc21	SICAYA
t	2025-03-17 21:13:02.028239+00	2025-03-17 21:13:02.028249+00	9fcd31ca-3f56-4278-a402-2bf74ae78307	cf7fa8b0-e545-40b4-99eb-d431d72c6c8d	EL MILAGRO
t	2025-03-17 21:13:02.033051+00	2025-03-17 21:13:02.033054+00	efed40ed-4239-433d-baa9-4405664db4fa	957c7796-925d-4e7a-a997-1c18b7f41201	TORRES CAUSANA
t	2025-03-17 21:13:02.036839+00	2025-03-17 21:13:02.036842+00	4545ed2d-cc0d-4fd5-916e-cf5f79fa46a0	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	HUANCAS
t	2025-03-17 21:13:02.042005+00	2025-03-17 21:13:02.042008+00	800538da-532f-41b2-b478-e9a7ad5eb27b	1bdc26fa-d3e6-4ac9-92f0-4270e897cee0	SAMEGUA
t	2025-03-17 21:13:02.047784+00	2025-03-17 21:13:02.047788+00	90bf41fb-47c1-41b4-b52b-0b789ad84213	1a124fda-ccb8-45b3-b69b-e0453133d8d8	LUYANDO
t	2025-03-17 21:13:02.054117+00	2025-03-17 21:13:02.05412+00	3abb55a8-377d-4791-91a3-857d1bda49f4	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	RIO MAGDALENA
t	2025-03-17 21:13:02.059278+00	2025-03-17 21:13:02.059282+00	67df3625-d0c8-4b68-aedc-4723a4ea6933	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	POMACANCHA
t	2025-03-17 21:13:02.064593+00	2025-03-17 21:13:02.064595+00	8bfe6085-6fb3-4c43-8c07-b088d555f846	f6729187-58e1-4607-8b37-0b2db196f283	HUAMATAMBO
t	2025-03-17 21:13:02.070119+00	2025-03-17 21:13:02.070122+00	b302d65c-37f7-4c8c-af90-5eec269055dc	994de1db-2a15-4db0-80a6-4efa76422c2c	CANIS
t	2025-03-17 21:13:02.075119+00	2025-03-17 21:13:02.075121+00	ed853895-29fe-4dd3-9e39-adc6f91899a9	4d11370d-0157-4af4-b89d-731e4516658a	TACNA
t	2025-03-17 21:13:02.0799+00	2025-03-17 21:13:02.079904+00	a937cb8e-4bc4-45d0-9759-97c705dd104b	2c09bf48-31df-47d1-bf45-11d7695ea002	SANTIAGO DE TUNA
t	2025-03-17 21:13:02.085551+00	2025-03-17 21:13:02.085554+00	dfc739eb-fdf2-4436-bfaf-f11537533e3c	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	MADEAN
t	2025-03-17 21:13:02.090842+00	2025-03-17 21:13:02.090845+00	6eadde2d-814c-4527-906f-9b10d8aef0db	37fe07d1-74f8-4777-941d-ba51afc1c160	DESAGUADERO
t	2025-03-17 21:13:02.095906+00	2025-03-17 21:13:02.095909+00	4f8c8148-b33b-499a-937c-925fe3151ada	c1ae25de-54dd-4d24-90bd-2a41a350a944	COCACHACRA
t	2025-03-17 21:13:02.100696+00	2025-03-17 21:13:02.1007+00	b4325d71-22fb-435a-905f-13febe702dd4	193709f4-bd72-4989-8455-e92a7593cf92	COYLLURQUI
t	2025-03-17 21:13:02.104927+00	2025-03-17 21:13:02.10493+00	fc044d8a-cc3b-4c21-a3ba-a4caf4aa1cd3	5b08eab1-14c5-448c-8832-40f39e2a1840	POMACANCHI
t	2025-03-17 21:13:02.110262+00	2025-03-17 21:13:02.110265+00	139d311b-0296-45f0-94f9-f57adbb4aad2	b42841e0-44d6-4122-9396-858f0fbf2b1d	CAJAY
t	2025-03-17 21:13:02.11548+00	2025-03-17 21:13:02.115484+00	d4ba4e9a-00f0-4b87-93b6-c8ef79914825	0653b015-1f1e-4073-b4a6-eddacd4d0018	HUIMBAYOC
t	2025-03-17 21:13:02.120588+00	2025-03-17 21:13:02.12059+00	03115e75-2351-44ab-b423-8b59cf08302d	cd1a779c-e303-4241-b40f-3a8bd328ae2a	CAMPORREDONDO
t	2025-03-17 21:13:02.125729+00	2025-03-17 21:13:02.125733+00	c847dce7-2024-48f8-9521-57b3297d40bb	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	CHINCHAO
t	2025-03-17 21:13:02.130001+00	2025-03-17 21:13:02.130003+00	a1c90bd9-cc5f-483f-83b4-5fa9750c255d	2bc54a70-eee6-4d04-90b9-06503d3b6067	CAMINACA
t	2025-03-17 21:13:02.134686+00	2025-03-17 21:13:02.134688+00	22d9d7ad-052b-4dd2-a09e-e562022fdc20	10923be8-8983-423b-9d2e-5cceef4d9ebd	ANDRES AVELINO CACERES DORREGARAY
t	2025-03-17 21:13:02.140761+00	2025-03-17 21:13:02.140765+00	9e7c1289-6af6-4659-8b18-8470fbc691c2	e5987227-df60-4b9e-a9c8-ef624979e917	HUANCARAYLLA
t	2025-03-17 21:13:02.147006+00	2025-03-17 21:13:02.147009+00	8ca4f931-294c-4c0d-ba63-9cf2035969e5	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	SANTIAGO DE PAUCARAY
t	2025-03-17 21:13:02.152581+00	2025-03-17 21:13:02.152584+00	3f17d828-f0fb-4c39-844c-210fe8bb8eee	4b571beb-3d2d-4889-ad57-fd15c191be22	CARABAMBA
t	2025-03-17 21:13:02.158879+00	2025-03-17 21:13:02.158883+00	4ef66c7b-fcd3-4280-9f82-473404267ebc	802f9e1a-4b36-4787-ae41-e5aaca68da54	YANACANCHA
t	2025-03-17 21:13:02.163668+00	2025-03-17 21:13:02.163671+00	a72c8830-adf7-4fbf-90c5-93d2ddcfacad	f1f444d7-6007-4f07-be39-a71d94b84ca7	NUÑOA
t	2025-03-17 21:13:02.168419+00	2025-03-17 21:13:02.168422+00	b40e7aca-9e7d-4a3a-9428-960a50773b49	e61f54ef-373f-46b9-b05e-bfe23561ec46	INKAWASI
t	2025-03-17 21:13:02.175778+00	2025-03-17 21:13:02.175782+00	c83d96c4-2e14-48c9-a23f-44e23d3691e0	cd1a779c-e303-4241-b40f-3a8bd328ae2a	SANTO TOMAS
t	2025-03-17 21:13:02.18213+00	2025-03-17 21:13:02.182133+00	04f197b4-b8d6-4e90-b33d-6b99a133c84d	f6729187-58e1-4607-8b37-0b2db196f283	CHUPAMARCA
t	2025-03-17 21:13:02.189207+00	2025-03-17 21:13:02.189211+00	f6bbe650-0da0-4f35-9f75-8e7bf240b118	b8e4d98a-e502-47a8-af92-8fdab0b88e60	MIRGAS
t	2025-03-17 21:13:02.194466+00	2025-03-17 21:13:02.194469+00	d7e22017-ac11-405d-a1a0-bb831993402b	013c5ed1-ba41-4d8c-a7da-845849a7efb9	PARIACOTO
t	2025-03-17 21:13:02.199361+00	2025-03-17 21:13:02.199364+00	4a3f283a-84a3-43c4-a82d-16543d0d330b	cc76f1f4-59f8-477e-ab55-63ef31302138	OMIA
t	2025-03-17 21:13:02.20354+00	2025-03-17 21:13:02.203543+00	9a720f22-3ec9-4bd1-989c-fa2b9d58d388	c5c7cd7a-16fd-4b52-bc0d-440a4b9ab23c	NAMORA
t	2025-03-17 21:13:02.207796+00	2025-03-17 21:13:02.207798+00	980df533-d143-4f71-b4c5-c9538b82e1cb	25d0ad5a-7f16-4975-bcd1-dc9b1d18f30a	SARIN
t	2025-03-17 21:13:02.21231+00	2025-03-17 21:13:02.212314+00	0131ba88-2de6-46d1-9897-cc6d2332625c	25fae8ef-3678-4898-9063-605c52bdc629	HUAYAN
t	2025-03-17 21:13:02.216903+00	2025-03-17 21:13:02.216905+00	cd9724e6-6658-4674-946c-f925944be0ba	b763ddbd-4a9c-4883-bf39-ccabfca1f3b7	CHINCHERO
t	2025-03-17 21:13:02.222494+00	2025-03-17 21:13:02.222498+00	19e161bf-318e-4de9-84f4-eb7c10e16c0f	e61f54ef-373f-46b9-b05e-bfe23561ec46	VILLA KINTIARINA
t	2025-03-17 21:13:02.227249+00	2025-03-17 21:13:02.227251+00	fb2674cb-5750-4066-ab21-a066261a33f4	87327c56-b236-4368-b80b-34d9952243ac	SAPOSOA
t	2025-03-17 21:13:02.23201+00	2025-03-17 21:13:02.232012+00	da5e990a-f419-4b63-86b4-d1e42d07d1ed	f16f9945-52da-4a72-a49a-a94a3f113146	CHANGUILLO
t	2025-03-17 21:13:02.238752+00	2025-03-17 21:13:02.238756+00	5c4e7af5-5293-4615-b229-5fd0fde22d06	ae046f24-a6bc-4f31-a81c-2bca0c494b67	TAPICHE
t	2025-03-17 21:13:02.244895+00	2025-03-17 21:13:02.244898+00	baff27a6-6dce-4927-8a6e-3eb628d69bc2	42a3655b-687b-424b-a374-b0ab58d4f011	COISHCO
t	2025-03-17 21:13:02.250435+00	2025-03-17 21:13:02.250437+00	e53aad6a-ed6c-4cd2-8349-244e69db5b9e	4d11370d-0157-4af4-b89d-731e4516658a	CIUDAD NUEVA
t	2025-03-17 21:13:02.255637+00	2025-03-17 21:13:02.255639+00	1c253d68-3a34-44ef-a32e-4540b5aa95c8	c86c46dc-e039-43dc-9913-86e623472583	OYOLO
t	2025-03-17 21:13:02.259379+00	2025-03-17 21:13:02.259382+00	08b74d62-905b-4914-bfb4-8119adb6a5ec	e61f54ef-373f-46b9-b05e-bfe23561ec46	UNION ASHÁNINKA
t	2025-03-17 21:13:02.264655+00	2025-03-17 21:13:02.264659+00	393f90cd-7ddf-45f4-8f1c-9927b561a250	e25f8297-7651-4d13-b583-e83edec11bc7	CHUMUCH
t	2025-03-17 21:13:02.270033+00	2025-03-17 21:13:02.270036+00	ff977e90-765d-4435-9d3e-538eae9be126	cd1a779c-e303-4241-b40f-3a8bd328ae2a	LONGUITA
t	2025-03-17 21:13:02.275761+00	2025-03-17 21:13:02.275766+00	3fc7264b-6176-4b36-8eab-7ed73280e9a5	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	HUERTAS
t	2025-03-17 21:13:02.281103+00	2025-03-17 21:13:02.281107+00	d76f229d-6367-46ca-b401-be0bb1bf75c2	3c8af264-3631-4747-a2a2-7b153fa4b672	TURPO
t	2025-03-17 21:13:02.286097+00	2025-03-17 21:13:02.2861+00	6532b5db-4066-4525-b757-57ebc6b3f236	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	LLOCLLAPAMPA
t	2025-03-17 21:13:02.291761+00	2025-03-17 21:13:02.291764+00	0db6e210-fab1-4b28-aedb-999bf1c2e881	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	PATAZ
t	2025-03-17 21:13:02.297124+00	2025-03-17 21:13:02.297128+00	1c84ccd3-2f8b-4873-8502-2220dd937216	a75e913b-1a31-4ba6-89c1-ef135099a204	YANATILE
t	2025-03-17 21:13:02.302168+00	2025-03-17 21:13:02.302171+00	db9d0844-9731-40d6-9c25-c433f8ad9eff	42a3655b-687b-424b-a374-b0ab58d4f011	MORO
t	2025-03-17 21:13:02.306952+00	2025-03-17 21:13:02.306955+00	b28d89fb-1611-4282-83fa-1b503711c517	34ab58b2-509d-451d-91db-da1dd6aa3a8e	MAZAMARI
t	2025-03-17 21:13:02.31179+00	2025-03-17 21:13:02.311793+00	d35c646d-458f-47ee-9c5f-768a44bb4cab	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	CHURUBAMBA
t	2025-03-17 21:13:02.316277+00	2025-03-17 21:13:02.31628+00	13147ba9-d43f-4a00-8595-cee51db240ef	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	SAN JUAN DE CHACÑA
t	2025-03-17 21:13:02.320459+00	2025-03-17 21:13:02.320462+00	c04553fc-ecea-4154-b1af-dc851585b059	454a9077-d285-43fb-8f73-9898bccb31bb	JACAS CHICO
t	2025-03-17 21:13:02.324862+00	2025-03-17 21:13:02.324865+00	43b022ce-03af-4406-addc-ee2f659fd4fe	e8f3629d-e44f-4811-a9cb-78896582c0f4	OLMOS
t	2025-03-17 21:13:02.329131+00	2025-03-17 21:13:02.329133+00	c2826e00-0433-47a6-a3cf-99b8bd20ee04	efdcbed4-4e80-48e7-8992-8191ea2939b8	ANCHONGA
t	2025-03-17 21:13:02.333081+00	2025-03-17 21:13:02.333084+00	3a913103-8781-4ed7-9717-8b7900437538	25d0ad5a-7f16-4975-bcd1-dc9b1d18f30a	COCHORCO
t	2025-03-17 21:13:02.337448+00	2025-03-17 21:13:02.33745+00	26e8e822-9b37-444c-a042-3ee7f6ce8700	49d2b1fe-f699-429b-b6d9-384cb23f8b04	CONTAMANA
t	2025-03-17 21:13:02.342161+00	2025-03-17 21:13:02.342164+00	4546d0db-5bbb-4623-95f2-17fc734d4f7b	1baa3fa5-23b2-4611-b753-c56dd60b5f0d	PACOCHA
t	2025-03-17 21:13:02.34636+00	2025-03-17 21:13:02.346362+00	36488322-301d-4327-a17e-75d09a17960d	e524e2e5-2c3d-4249-9d1d-7611d8538050	TUPAC AMARU INCA
t	2025-03-17 21:13:02.351221+00	2025-03-17 21:13:02.351225+00	e76e6200-761f-4f62-aa97-b3b6e556a01f	46a0b504-382b-4799-85d6-225617d83360	CHALAMARCA
t	2025-03-17 21:13:02.355534+00	2025-03-17 21:13:02.355537+00	c1d239b7-fe34-40d9-834b-a4c44ab2dee5	63916004-9475-4b57-a40b-f707c2be8d2d	CHAVIN
t	2025-03-17 21:13:02.36032+00	2025-03-17 21:13:02.360322+00	11733a51-7b27-43fa-afd1-605b88c296c9	a75e913b-1a31-4ba6-89c1-ef135099a204	PISAC
t	2025-03-17 21:13:02.365622+00	2025-03-17 21:13:02.365625+00	cda0fd25-597d-4b03-8e91-3324ed425ef7	956d4ecd-a18c-4758-bb6a-cb38c449e32c	ATAVILLOS BAJO
t	2025-03-17 21:13:02.369923+00	2025-03-17 21:13:02.369926+00	6279b921-0133-4e6f-bc19-9311b5b14bca	719ca1e2-85aa-4811-87f1-ee903712f816	SECHURA
t	2025-03-17 21:13:02.374904+00	2025-03-17 21:13:02.374906+00	22f92f6a-6f24-4a00-ae2b-64a57dd772a9	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	ACRAQUIA
t	2025-03-17 21:13:02.380345+00	2025-03-17 21:13:02.380348+00	feb8995f-a2f7-4c38-ad36-0ba42596ddc4	c1ae25de-54dd-4d24-90bd-2a41a350a944	PUNTA DE BOMBON
t	2025-03-17 21:13:02.385407+00	2025-03-17 21:13:02.38541+00	933a34c0-7d5a-4f1f-9dbb-71469f8d33cd	efdcbed4-4e80-48e7-8992-8191ea2939b8	CONGALLA
t	2025-03-17 21:13:02.389937+00	2025-03-17 21:13:02.38994+00	84676e6d-c801-4a02-91fa-7ea21c77a192	029d4c57-b401-421f-beeb-7d0fef5c0dbb	LARAMATE
t	2025-03-17 21:13:02.394675+00	2025-03-17 21:13:02.394677+00	f14382b6-d546-4e5b-a218-0cf363e2941a	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	IZCUCHACA
t	2025-03-17 21:13:02.399843+00	2025-03-17 21:13:02.399847+00	969b9398-7f0d-4e21-83cf-a3ff42b98262	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	MACHAGUAY
t	2025-03-17 21:13:02.405084+00	2025-03-17 21:13:02.405087+00	a1a7a8e8-0b17-4830-a6bd-098820b369c6	bc89669e-ca8f-4a78-8a5a-f601b64fc944	ANDAJES
t	2025-03-17 21:13:02.410825+00	2025-03-17 21:13:02.410828+00	4de5ef0f-35db-416f-bef4-33e3a20c690a	957c7796-925d-4e7a-a997-1c18b7f41201	MAZAN
t	2025-03-17 21:13:02.416043+00	2025-03-17 21:13:02.416046+00	dfaedced-1380-4fcd-a073-68a9a52cac1d	10923be8-8983-423b-9d2e-5cceef4d9ebd	SAN JOSE DE TICLLAS
t	2025-03-17 21:13:02.420546+00	2025-03-17 21:13:02.420549+00	ab1255fa-7a15-4ac7-8d93-c914f52c9fe4	c745de6d-713a-4613-951f-05d16e86739b	OCOÑA
t	2025-03-17 21:13:02.425018+00	2025-03-17 21:13:02.425025+00	d6ee260d-4b5f-479b-afc3-bcf84a321ff7	62bc063a-ebad-48e0-8d45-7ed5c604ed27	CHICAMA
t	2025-03-17 21:13:02.429949+00	2025-03-17 21:13:02.429952+00	64a7cb5d-6b25-491b-b86c-07f4ce044145	35972dee-bd82-40d7-aad3-b6f032924ddd	CURPAHUASI
t	2025-03-17 21:13:02.437063+00	2025-03-17 21:13:02.437066+00	4096c7ca-38b4-467d-b6b6-0a11ef4a9da7	b5c477ac-5c22-4641-a743-47ccf2ee8c59	SAN MIGUEL DE ACO
t	2025-03-17 21:13:02.442427+00	2025-03-17 21:13:02.442431+00	edfb4a2e-eb47-4ecc-ae6b-1c03c662bc31	8f671c0f-3e82-43ae-ad5a-480f8bc815d4	BAGUA
t	2025-03-17 21:13:02.448606+00	2025-03-17 21:13:02.44861+00	e8ba6c8b-7ed2-49e5-8638-4fa8fb50504f	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	VILLA MARIA DEL TRIUNFO
t	2025-03-17 21:13:02.453119+00	2025-03-17 21:13:02.453121+00	60a6bb7a-3d77-492b-8680-5a77bc68007b	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	MORROPON
t	2025-03-17 21:13:02.458925+00	2025-03-17 21:13:02.458928+00	f23d5c04-5df0-4a4b-bf7d-f468cfcab926	2c09bf48-31df-47d1-bf45-11d7695ea002	SANTA CRUZ DE COCACHACRA
t	2025-03-17 21:13:02.464731+00	2025-03-17 21:13:02.464734+00	59aa7e73-036e-4038-8304-7139faac5594	aa61d159-135e-4d97-a318-d721d0ccd135	HUAQUIRCA
t	2025-03-17 21:13:02.470225+00	2025-03-17 21:13:02.470228+00	339c7911-e18a-4543-85b6-3c50d7c3a183	f6729187-58e1-4607-8b37-0b2db196f283	MOLLEPAMPA
t	2025-03-17 21:13:02.475887+00	2025-03-17 21:13:02.475892+00	69ffa5eb-ee1d-4dbf-88af-b48637ce9391	2c09bf48-31df-47d1-bf45-11d7695ea002	SANGALLAYA
t	2025-03-17 21:13:02.482532+00	2025-03-17 21:13:02.482537+00	e3983731-0c25-4ff0-bc83-d759940e2b3c	e5987227-df60-4b9e-a9c8-ef624979e917	SARHUA
t	2025-03-17 21:13:02.488885+00	2025-03-17 21:13:02.48889+00	d9e7e615-4f49-4324-8bd4-2d0407394077	cc76f1f4-59f8-477e-ab55-63ef31302138	COCHAMAL
t	2025-03-17 21:13:02.495184+00	2025-03-17 21:13:02.495188+00	5b9f7547-c0a5-4c90-b5c9-be41c7c91f23	34ab58b2-509d-451d-91db-da1dd6aa3a8e	LLAYLLA
t	2025-03-17 21:13:02.501855+00	2025-03-17 21:13:02.501858+00	7698ceb3-5e96-441a-b4a8-038f4420995d	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	YANACA
t	2025-03-17 21:13:02.508232+00	2025-03-17 21:13:02.508235+00	3ef3832f-2dbb-4286-b24b-847ddce4fb98	956d4ecd-a18c-4758-bb6a-cb38c449e32c	IHUARI
t	2025-03-17 21:13:02.516499+00	2025-03-17 21:13:02.516504+00	67a5a453-b782-4bab-8eac-e47f29a1bb15	54874897-aa17-4f9d-aa01-926f71b3bfdc	LA CAPILLA
t	2025-03-17 21:13:02.521405+00	2025-03-17 21:13:02.521408+00	149e2f0a-76f5-4903-ad51-36cb79e105b5	8bc9c85c-cc74-48be-979d-07938df4de67	TARATA
t	2025-03-17 21:13:02.525786+00	2025-03-17 21:13:02.525791+00	640638a8-9783-4cae-b958-75fae88e8fb8	187d7e64-5269-4ebb-953a-949acc68acd7	CAMPANILLA
t	2025-03-17 21:13:02.530345+00	2025-03-17 21:13:02.530347+00	a8ec3030-c257-45a6-8aa2-bbeb1982c2ca	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SAN BORJA
t	2025-03-17 21:13:02.53528+00	2025-03-17 21:13:02.535283+00	c9da52c8-1ddc-46f2-9fd8-afc78c77f55c	e61f54ef-373f-46b9-b05e-bfe23561ec46	MANITEA
t	2025-03-17 21:13:02.539404+00	2025-03-17 21:13:02.539406+00	31d5ded9-7a9e-4ba9-94e8-e3daff86cc14	83a45ddf-481f-4760-86f7-5d5ba4423a89	LA ARENA
t	2025-03-17 21:13:02.544175+00	2025-03-17 21:13:02.544178+00	09582511-385a-431b-9750-e2195a1192cb	10923be8-8983-423b-9d2e-5cceef4d9ebd	SAN JUAN BAUTISTA
t	2025-03-17 21:13:02.549115+00	2025-03-17 21:13:02.549118+00	2449a84c-76ba-497c-8df9-61b41f8138b9	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	MONTEVIDEO
t	2025-03-17 21:13:02.554834+00	2025-03-17 21:13:02.554837+00	c73eb49d-102e-49ec-a15a-8e720830505c	0653b015-1f1e-4073-b4a6-eddacd4d0018	TARAPOTO
t	2025-03-17 21:13:02.56116+00	2025-03-17 21:13:02.561163+00	10672d27-8997-44b9-99bd-45d72e178202	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	CHORRILLOS
t	2025-03-17 21:13:02.568159+00	2025-03-17 21:13:02.568163+00	d1e49f93-02fa-45de-9005-683218da2ee3	50381126-eaca-4e9d-9688-2d0ed3c35612	POMALCA
t	2025-03-17 21:13:02.575802+00	2025-03-17 21:13:02.575805+00	6affd72b-da80-4581-be1a-ee14498a7ccd	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	SANTIAGO DE CHALLAS
t	2025-03-17 21:13:02.582419+00	2025-03-17 21:13:02.582423+00	25eea6c4-a69f-41db-89ea-7e1cb978ace3	c745de6d-713a-4613-951f-05d16e86739b	QUILCA
t	2025-03-17 21:13:02.589108+00	2025-03-17 21:13:02.589111+00	58b4fafb-4ae3-4f33-8414-7943aa2e47af	e524e2e5-2c3d-4249-9d1d-7611d8538050	PISCO
t	2025-03-17 21:13:02.59397+00	2025-03-17 21:13:02.593975+00	b5cc468d-ad4a-4511-b10b-e7610fe53037	6a0799ec-1dab-4d4c-9e30-0a4123d28996	SUPE
t	2025-03-17 21:13:02.599387+00	2025-03-17 21:13:02.59939+00	be921e8a-eeb0-4893-97f0-1fa0b80ac416	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	SORAYA
t	2025-03-17 21:13:02.604195+00	2025-03-17 21:13:02.604198+00	98f3f760-5f80-4c2a-9226-ead1d537d023	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	TINTAY
t	2025-03-17 21:13:02.609723+00	2025-03-17 21:13:02.609728+00	4ae4eeb4-2cb4-41a9-9793-ef597c128a5b	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	EL MANTARO
t	2025-03-17 21:13:02.614719+00	2025-03-17 21:13:02.614722+00	90918909-9bc2-41a6-ba59-3b0642bc158f	6e015257-6f7e-48cf-b9c0-a24502cdcc21	HUANCAYO
t	2025-03-17 21:13:02.619451+00	2025-03-17 21:13:02.619455+00	c70fb2cd-d634-4c37-afe2-78afaa8af054	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	AYNA
t	2025-03-17 21:13:02.624683+00	2025-03-17 21:13:02.624686+00	e2d03969-c469-4e63-bf91-30c8807f5f75	1535087f-84f1-4173-955d-c6bc686c7306	VILCAS HUAMAN
t	2025-03-17 21:13:02.629799+00	2025-03-17 21:13:02.629801+00	b998a1b5-8d26-400b-982c-649da3ab92e4	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	POCSI
t	2025-03-17 21:13:02.633709+00	2025-03-17 21:13:02.633711+00	69943f13-2eca-490f-aaad-2ca5d60e97a0	35972dee-bd82-40d7-aad3-b6f032924ddd	VIRUNDO
t	2025-03-17 21:13:02.637456+00	2025-03-17 21:13:02.637459+00	501429c7-dcd3-43ca-997b-cc66fe7a7b6b	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	LURIGANCHO
t	2025-03-17 21:13:02.642846+00	2025-03-17 21:13:02.642847+00	3a4b2667-eb62-4d4a-b025-658015f83d14	029d4c57-b401-421f-beeb-7d0fef5c0dbb	SAISA
t	2025-03-17 21:13:02.648464+00	2025-03-17 21:13:02.648467+00	acb0f13e-5ed6-48e5-a8bb-db6b566ff6b7	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	HUANCAYA
t	2025-03-17 21:13:02.653821+00	2025-03-17 21:13:02.653826+00	67b4ccd3-0192-481c-8d72-9e946a534ae9	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	SANTO DOMINGO
t	2025-03-17 21:13:02.660733+00	2025-03-17 21:13:02.660736+00	8e0004b5-2fa1-4695-9acd-2976aa185e36	fae002ab-c99a-457d-8f6d-9e9964312caf	TIQUILLACA
t	2025-03-17 21:13:02.665677+00	2025-03-17 21:13:02.665682+00	bbbe9bbb-9dfe-46f8-8b0e-75261e83ac0a	645a24ad-797e-4a8f-8376-d9b0a7afe5b2	PAPAYAL
t	2025-03-17 21:13:02.670869+00	2025-03-17 21:13:02.670873+00	439f1a05-ebcd-46ba-9126-496b26827b8d	fb3b3950-928c-4345-8bb6-8f89054c2e9b	CATILLUC
t	2025-03-17 21:13:02.677131+00	2025-03-17 21:13:02.677134+00	4be83f73-eb54-45b9-9b46-da1647906f27	956d4ecd-a18c-4758-bb6a-cb38c449e32c	PACARAOS
t	2025-03-17 21:13:02.683011+00	2025-03-17 21:13:02.683015+00	eeb0b660-b7a5-4555-af99-8036b57de87e	157ac8ce-05cf-4107-81ff-6c697fac45fd	HUALLAGA
t	2025-03-17 21:13:02.689499+00	2025-03-17 21:13:02.689502+00	6d03f2a0-ae76-4ebe-b7de-fe7bca7f2028	46a0b504-382b-4799-85d6-225617d83360	CHADIN
t	2025-03-17 21:13:02.695399+00	2025-03-17 21:13:02.695403+00	fe417747-bccd-49bd-8509-794a61d16b67	3c8af264-3631-4747-a2a2-7b153fa4b672	HUAYANA
t	2025-03-17 21:13:02.700765+00	2025-03-17 21:13:02.700769+00	498b1775-4e4c-4a1c-9b26-f65759613a03	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	MOYA
t	2025-03-17 21:13:02.705432+00	2025-03-17 21:13:02.705436+00	0804d100-7378-4d24-8bf1-d96a8dcae47a	cd1a779c-e303-4241-b40f-3a8bd328ae2a	CONILA
t	2025-03-17 21:13:02.710331+00	2025-03-17 21:13:02.710333+00	d0fa7e02-7e3a-4e17-85cc-59875835e65f	6eca8b97-dbde-4058-8fc8-4b86feb3307c	PATAMBUCO
t	2025-03-17 21:13:02.71542+00	2025-03-17 21:13:02.715422+00	39724774-f897-431d-95f6-146486d5f36d	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	LEVANTO
t	2025-03-17 21:13:02.719785+00	2025-03-17 21:13:02.719787+00	27122d80-007f-49c4-b748-4bcf2fbc5f68	c86c46dc-e039-43dc-9913-86e623472583	COLTA
t	2025-03-17 21:13:02.724837+00	2025-03-17 21:13:02.724839+00	bdbc4109-accf-4463-88ef-ed830ec8beea	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	CHULUCANAS
t	2025-03-17 21:13:02.729381+00	2025-03-17 21:13:02.729385+00	d0c62b39-aca0-4a24-b8ce-55ce42bf3f3f	87e9d712-7fef-4f4e-a7d1-111e719950ce	CAMANTI
t	2025-03-17 21:13:02.733611+00	2025-03-17 21:13:02.733614+00	98737533-a844-4f0d-8d51-7278759b833a	bc89669e-ca8f-4a78-8a5a-f601b64fc944	NAVAN
t	2025-03-17 21:13:02.738205+00	2025-03-17 21:13:02.738208+00	dd070293-a541-47e0-8ba8-bd88c47edfbf	846cebba-a2b2-4b4c-85bb-c79e1ae2600c	FITZCARRALD
t	2025-03-17 21:13:02.7426+00	2025-03-17 21:13:02.742603+00	54e7d11f-303e-4b44-9c97-6d7b41febf53	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	HUARIBAMBA
t	2025-03-17 21:13:02.746982+00	2025-03-17 21:13:02.746984+00	007dc8a5-a84a-4f3b-8850-fb17fa83fbf0	3141399d-6c64-4abc-9890-83e3edff88a1	VIRU
t	2025-03-17 21:13:02.751375+00	2025-03-17 21:13:02.751377+00	f7374ef8-14fc-4f5c-9ad9-8220303ffbd3	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SAN JUAN DE MIRAFLORES
t	2025-03-17 21:13:02.756329+00	2025-03-17 21:13:02.756332+00	4730f5c2-6760-41dc-a7ae-dfc01fe14903	83a45ddf-481f-4760-86f7-5d5ba4423a89	PIURA
t	2025-03-17 21:13:02.76102+00	2025-03-17 21:13:02.761024+00	1e2b6d9d-1d86-4e8f-9a18-05698f2a73ae	6eca8b97-dbde-4058-8fc8-4b86feb3307c	YANAHUAYA
t	2025-03-17 21:13:02.766082+00	2025-03-17 21:13:02.766086+00	e9053d0e-2c7c-4d45-9aa5-16daa6bb9794	2dc69e0d-998b-495d-87a4-64f98a9260cd	CONIMA
t	2025-03-17 21:13:02.771094+00	2025-03-17 21:13:02.771097+00	d2e8fbfc-0096-4838-9f67-0badc3f114ef	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	PARCO
t	2025-03-17 21:13:02.775763+00	2025-03-17 21:13:02.775766+00	d4473da8-3a5f-4709-b924-fa8e4ddcb7f9	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SANTA MARIA DEL MAR
t	2025-03-17 21:13:02.780867+00	2025-03-17 21:13:02.780873+00	dcaa5dde-8a35-47fb-bcee-aa6b436c79c1	87e9d712-7fef-4f4e-a7d1-111e719950ce	QUIQUIJANA
t	2025-03-17 21:13:02.785858+00	2025-03-17 21:13:02.785862+00	de7ed953-7832-4b5e-8729-29ea18aeb0b0	b42841e0-44d6-4122-9396-858f0fbf2b1d	HUACCHIS
t	2025-03-17 21:13:02.791006+00	2025-03-17 21:13:02.791009+00	c5095882-1718-4e1b-93e3-e2617801da46	46a0b504-382b-4799-85d6-225617d83360	CHIMBAN
t	2025-03-17 21:13:02.795266+00	2025-03-17 21:13:02.795268+00	c4c40743-4e60-4ee8-b072-93ea7e124d2f	5f06e473-5acd-475a-b17f-aa63c7fa9783	YAMBRASBAMBA
t	2025-03-17 21:13:02.799815+00	2025-03-17 21:13:02.799817+00	c749ba73-fb29-4713-b7f3-7f4ef40a1eb5	87327c56-b236-4368-b80b-34d9952243ac	ALTO SAPOSOA
t	2025-03-17 21:13:02.804611+00	2025-03-17 21:13:02.804615+00	f291665b-ce58-4e2b-bc43-5f572291ab7a	084770c6-2080-4213-abe1-08c62f0eb28b	LALAQUIZ
t	2025-03-17 21:13:02.810838+00	2025-03-17 21:13:02.810841+00	c343b0ce-cf90-44c4-9d7f-0c145327f3fd	e09f0261-1ea3-4fd7-a601-d7077e27ff43	HUANCABAMBA
t	2025-03-17 21:13:02.815842+00	2025-03-17 21:13:02.815845+00	f8a06e93-5bec-4cd4-a90f-a5cfa71d4375	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	SANTIAGO DE TUCUMA
t	2025-03-17 21:13:02.820967+00	2025-03-17 21:13:02.82097+00	41c4ba70-906c-4a02-ba2c-6b11cd7c0d06	87e9d712-7fef-4f4e-a7d1-111e719950ce	CUSIPATA
t	2025-03-17 21:13:02.826012+00	2025-03-17 21:13:02.826015+00	776b6d4b-8782-4103-ac09-0ad5404e846e	c3464dda-3d6f-443f-a987-ad215194f703	LLUTA
t	2025-03-17 21:13:02.832594+00	2025-03-17 21:13:02.832598+00	7b57db0f-f44d-4fa5-92f4-3218329119d8	5f06e473-5acd-475a-b17f-aa63c7fa9783	CHISQUILLA
t	2025-03-17 21:13:02.838335+00	2025-03-17 21:13:02.838338+00	384f94b9-08cc-4b6d-b04e-2106fce13491	63916004-9475-4b57-a40b-f707c2be8d2d	CHINCHA ALTA
t	2025-03-17 21:13:02.844536+00	2025-03-17 21:13:02.844541+00	3e3b67c9-f3bc-42bb-a6ea-c52b50cd171e	fbc0bd2f-d800-4706-b300-4eca7a818b49	CERRO AZUL
t	2025-03-17 21:13:02.850436+00	2025-03-17 21:13:02.850439+00	1f33da75-568d-4e47-a847-8a7150ed17c2	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	SALCAHUASI
t	2025-03-17 21:13:02.857047+00	2025-03-17 21:13:02.857051+00	7a05f00b-f7af-4b98-a6ab-5c70924cf63c	2c09bf48-31df-47d1-bf45-11d7695ea002	SAN MATEO DE OTAO
t	2025-03-17 21:13:02.864531+00	2025-03-17 21:13:02.864535+00	5a391d02-6aff-4ae6-aa84-c028040d391b	994de1db-2a15-4db0-80a6-4efa76422c2c	PACLLON
t	2025-03-17 21:13:02.869979+00	2025-03-17 21:13:02.869981+00	c76873fb-ef67-414e-9d15-80e7539c1af0	6b370b4c-d286-40a1-8217-ee8f69ab0c0f	PACAPAUSA
t	2025-03-17 21:13:02.87542+00	2025-03-17 21:13:02.875424+00	29b91912-2f7e-417e-a93f-e309af1b7378	98e65496-68d3-4d43-bddc-22c7631c5b27	PAITA
t	2025-03-17 21:13:02.881109+00	2025-03-17 21:13:02.881114+00	0a62658e-1f68-4c54-8f79-aece721d8c7a	6e015257-6f7e-48cf-b9c0-a24502cdcc21	CHUPURO
t	2025-03-17 21:13:02.886399+00	2025-03-17 21:13:02.886402+00	532df5e5-626a-410b-be45-ad87165481bb	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	SANTA CATALINA DE MOSSA
t	2025-03-17 21:13:02.89296+00	2025-03-17 21:13:02.892964+00	b5448815-9aaa-4118-8091-243def839cbc	b42841e0-44d6-4122-9396-858f0fbf2b1d	PONTO
t	2025-03-17 21:13:02.902033+00	2025-03-17 21:13:02.902037+00	0a0af936-b885-4e6f-97bd-8e04a49f872c	029d4c57-b401-421f-beeb-7d0fef5c0dbb	OTOCA
t	2025-03-17 21:13:02.910179+00	2025-03-17 21:13:02.910183+00	8d9d46f3-0c3d-4923-9f44-1261b6182371	57eae5d9-fae5-40b0-808f-4699285c2a8e	LANGUI
t	2025-03-17 21:13:02.917544+00	2025-03-17 21:13:02.917547+00	7345e19c-7834-4229-acb1-45dc50bd8f96	745905a9-8826-4ae2-bbeb-334a668eebe1	CONDOROMA
t	2025-03-17 21:13:02.923591+00	2025-03-17 21:13:02.923595+00	0d84472c-f75f-4cd1-aa23-9c0f4bcaa178	2c09bf48-31df-47d1-bf45-11d7695ea002	ANTIOQUIA
t	2025-03-17 21:13:02.929865+00	2025-03-17 21:13:02.929868+00	a2246b2d-69f6-42d1-9cd0-c06ed257633d	35972dee-bd82-40d7-aad3-b6f032924ddd	GAMARRA
t	2025-03-17 21:13:02.935438+00	2025-03-17 21:13:02.93544+00	60ad1cbd-e951-4c40-96ca-9d260bde6880	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	URACA
t	2025-03-17 21:13:02.941109+00	2025-03-17 21:13:02.941112+00	56a52e37-4b19-4465-98fb-c11603eb9127	55340ef0-3d04-40ea-a070-cbb80d5755a5	SICUANI
t	2025-03-17 21:13:02.946801+00	2025-03-17 21:13:02.946804+00	10e3c7b6-ca1f-4b26-8ff4-61b295a0cb68	956d4ecd-a18c-4758-bb6a-cb38c449e32c	VEINTISIETE DE NOVIEMBRE
t	2025-03-17 21:13:02.952192+00	2025-03-17 21:13:02.952196+00	251856ac-fe43-4d81-885f-5d743790ac6c	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	LLOCHEGUA
t	2025-03-17 21:13:02.956999+00	2025-03-17 21:13:02.957002+00	934270ce-45ea-43b5-8095-7931a1cb5098	25fae8ef-3678-4898-9063-605c52bdc629	COCHAPETI
t	2025-03-17 21:13:02.962318+00	2025-03-17 21:13:02.962321+00	a3cdc865-b6c0-42f9-9220-697a50190e9d	915063a0-1172-48a3-8b31-33715e1f2e3c	MARCAVELICA
t	2025-03-17 21:13:02.969841+00	2025-03-17 21:13:02.969844+00	f3d84067-24c6-4582-9ff3-3eb4eb839e4c	46a0b504-382b-4799-85d6-225617d83360	HUAMBOS
t	2025-03-17 21:13:02.975341+00	2025-03-17 21:13:02.975343+00	1b860254-9e09-46ed-a665-5d6a76d9b294	4f439eb6-7ff6-4f79-b681-05e3601f1b33	CHINCHIHUASI
t	2025-03-17 21:13:02.980178+00	2025-03-17 21:13:02.980181+00	870a569f-9178-4246-a17b-b664b71664cf	029d4c57-b401-421f-beeb-7d0fef5c0dbb	PUQUIO
t	2025-03-17 21:13:02.984897+00	2025-03-17 21:13:02.984901+00	5076a39f-34e6-45a4-b97a-b1cf27656ebc	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	TINTAY PUNCU
t	2025-03-17 21:13:02.991095+00	2025-03-17 21:13:02.991097+00	73b1b872-3673-418a-a2c8-20a1150bc28e	6f01c2b3-c170-49f4-a21b-c1fae42b9815	ALFONSO UGARTE
t	2025-03-17 21:13:02.997394+00	2025-03-17 21:13:02.997397+00	d2eeb999-b667-4ee8-8cf8-a14d78290d57	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	MARIANO MELGAR
t	2025-03-17 21:13:03.003569+00	2025-03-17 21:13:03.003571+00	4cb7887c-2259-49f4-8492-3314765bf56f	9d7bb05d-7107-41b7-8fc0-29d110e2992d	AHUAYRO
t	2025-03-17 21:13:03.007808+00	2025-03-17 21:13:03.007809+00	58d37ccb-d0f0-4a92-846a-1d82c08ae61f	c35d368a-d376-4211-876e-9a3feb37e400	SAN ROQUE DE CUMBAZA
t	2025-03-17 21:13:03.013628+00	2025-03-17 21:13:03.013631+00	64915690-0c4a-4d65-a7d8-379f7d12b6cc	a154aa5a-7dee-47d6-8448-b6744a59812d	HUACHO
t	2025-03-17 21:13:03.018785+00	2025-03-17 21:13:03.018787+00	6ad52bd1-15ae-4979-bd1f-66dd75dcb62a	87e9d712-7fef-4f4e-a7d1-111e719950ce	CCARHUAYO
t	2025-03-17 21:13:03.024358+00	2025-03-17 21:13:03.024361+00	a48677d4-e955-4422-90ba-fe78c1059d1d	084770c6-2080-4213-abe1-08c62f0eb28b	HUARMACA
t	2025-03-17 21:13:03.029299+00	2025-03-17 21:13:03.029302+00	4d0d9396-94db-4fe5-a44a-098c1ad7c8cd	a0671457-1dd6-4137-b054-4f8a0d6515e5	HUANDOVAL
t	2025-03-17 21:13:03.033653+00	2025-03-17 21:13:03.033655+00	6322a5eb-94bf-410e-be1b-5c04214d17c7	3af19559-c0e0-469f-9660-92f10b46789e	AYAPATA
t	2025-03-17 21:13:03.03771+00	2025-03-17 21:13:03.037712+00	6177c39e-322b-4d10-8043-b2fc6c2fe2b6	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	PAZOS
t	2025-03-17 21:13:03.041873+00	2025-03-17 21:13:03.041876+00	61043ee4-9834-4573-a819-bfd1ad8e1d4c	454a9077-d285-43fb-8f73-9898bccb31bb	APARICIO POMARES
t	2025-03-17 21:13:03.046475+00	2025-03-17 21:13:03.046478+00	511f4fd2-8f5a-4c5b-af5e-b2cb830fabee	e9ccabb0-d482-4488-845c-94f1fd0e96e6	LA PERLA
t	2025-03-17 21:13:03.050791+00	2025-03-17 21:13:03.050793+00	5612a5c4-7b0c-4593-8b52-a468b8d1b6f6	960e79f6-51c7-4335-b07a-7721b638f576	LAMBRAMA
t	2025-03-17 21:13:03.055652+00	2025-03-17 21:13:03.055654+00	4834c731-9064-4fc6-877b-12446f2671b9	aa61d159-135e-4d97-a318-d721d0ccd135	OROPESA
t	2025-03-17 21:13:03.06069+00	2025-03-17 21:13:03.060694+00	36b93c0e-41a9-41c3-90d5-6b997be6cab4	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	CHACLACAYO
t	2025-03-17 21:13:03.06639+00	2025-03-17 21:13:03.066394+00	fa9bdbe1-e2e7-4bf1-bce3-191b5ef7f760	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	ACOSTAMBO
t	2025-03-17 21:13:03.072585+00	2025-03-17 21:13:03.072588+00	15b9f70a-011c-44a6-8531-a3280cd14dd0	994de1db-2a15-4db0-80a6-4efa76422c2c	SAN MIGUEL DE CORPANQUI
t	2025-03-17 21:13:03.078578+00	2025-03-17 21:13:03.078581+00	b4687875-8d17-49ef-b55e-d55ca74d362d	8ae34c95-7c05-4880-915b-49c44ac13bd1	PACASMAYO
t	2025-03-17 21:13:03.084596+00	2025-03-17 21:13:03.084599+00	4da77e16-4d5e-40e5-9ac9-9f2fc8626b5d	74b3890f-d58c-4d92-b653-e1ceec0d1b55	SALAS
t	2025-03-17 21:13:03.090955+00	2025-03-17 21:13:03.090958+00	9ae7f4c9-7624-4ae3-b62c-52ca9389489c	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	HUACAÑA
t	2025-03-17 21:13:03.103219+00	2025-03-17 21:13:03.103221+00	1f891d1e-e75a-4520-b4c5-6e7d8aea3ee6	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	TUNAN MARCA
t	2025-03-17 21:13:03.109115+00	2025-03-17 21:13:03.109117+00	cfc6ba28-0347-4742-9a07-7d659df13aaa	6e015257-6f7e-48cf-b9c0-a24502cdcc21	SAPALLANGA
t	2025-03-17 21:13:03.114555+00	2025-03-17 21:13:03.114558+00	4cfadc9a-e1cc-49b0-9246-74172b321deb	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	QUICACHA
t	2025-03-17 21:13:03.12045+00	2025-03-17 21:13:03.120453+00	2636b21c-4e4a-4623-8e5f-4c8727a075e3	4f006a58-9e1b-4e72-85ce-4ae912b8cc5c	OLLARAYA
t	2025-03-17 21:13:03.125624+00	2025-03-17 21:13:03.125627+00	12157bc7-ea74-4b86-b1d9-cad52f3b5d68	6e015257-6f7e-48cf-b9c0-a24502cdcc21	CHILCA
t	2025-03-17 21:13:03.130684+00	2025-03-17 21:13:03.130687+00	cde08cb2-73ac-4b03-961b-ccc344c8abaa	aa61d159-135e-4d97-a318-d721d0ccd135	SABAINO
t	2025-03-17 21:13:03.135662+00	2025-03-17 21:13:03.135665+00	dfe3cd60-fd69-4869-bfec-5d54eb21706f	87327c56-b236-4368-b80b-34d9952243ac	TINGO DE SAPOSOA
t	2025-03-17 21:13:03.147027+00	2025-03-17 21:13:03.14703+00	02d2fd53-19de-433a-ab97-df4820e3e23f	98e65496-68d3-4d43-bddc-22c7631c5b27	TAMARINDO
t	2025-03-17 21:13:03.152277+00	2025-03-17 21:13:03.152279+00	0ca3caed-a02b-4248-9dd9-7bee6dc8b1ac	a8a4b3eb-833f-4269-98b8-d5e76c3fb74c	SAN JOSE DE LOURDES
t	2025-03-17 21:13:03.15738+00	2025-03-17 21:13:03.157383+00	5b070fc0-cf1d-4a3e-b8f2-874420157c46	f16f9945-52da-4a72-a49a-a94a3f113146	EL INGENIO
t	2025-03-17 21:13:03.162848+00	2025-03-17 21:13:03.16285+00	66687924-08f4-430b-bdfb-49bbdd42897f	da261af9-5596-4188-b73d-5c091ad57d8b	ELEAZAR GUZMAN BARRON
t	2025-03-17 21:13:03.168015+00	2025-03-17 21:13:03.168019+00	dc16b848-5a05-439c-a7cf-13442d983898	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	PUTIS
t	2025-03-17 21:13:03.173455+00	2025-03-17 21:13:03.173459+00	ee37102d-0dc4-4693-93be-cdf75d6b3713	c790e80f-15e1-4e44-b272-1ef57bb9c991	HUARANCHAL
t	2025-03-17 21:13:03.180713+00	2025-03-17 21:13:03.180718+00	4e1a5740-6707-4c11-a67b-3c5c998155ae	1e747a8b-ad85-4e35-ad63-70fb3ad6da2d	SUYO
t	2025-03-17 21:13:03.188318+00	2025-03-17 21:13:03.188321+00	a40ea871-820c-4292-a3f5-52003cfd1cce	e9ccabb0-d482-4488-845c-94f1fd0e96e6	VENTANILLA
t	2025-03-17 21:13:03.193915+00	2025-03-17 21:13:03.193918+00	f2140e0b-86c4-4496-afd4-1b6b8c99a0a8	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	OLLEROS
t	2025-03-17 21:13:03.199313+00	2025-03-17 21:13:03.199315+00	237f5148-8335-49fd-ac77-0015353ee0a9	10923be8-8983-423b-9d2e-5cceef4d9ebd	ACOCRO
t	2025-03-17 21:13:03.205525+00	2025-03-17 21:13:03.205528+00	c6380a5d-900d-46f0-bcb7-735175a42bd8	384003f9-fd40-42d7-bbcb-42d84f70c15d	HUALGAYOC
t	2025-03-17 21:13:03.210959+00	2025-03-17 21:13:03.210961+00	7a68cbc8-b1a4-42b7-8f77-068421883d0d	dce0a035-d91c-4f0a-a10f-aefa48915118	PARAS
t	2025-03-17 21:13:03.216679+00	2025-03-17 21:13:03.216682+00	65107be3-0da2-4764-a9c0-d95f95228621	3c8af264-3631-4747-a2a2-7b153fa4b672	SANTA MARIA DE CHICMO
t	2025-03-17 21:13:03.221979+00	2025-03-17 21:13:03.221982+00	0402cea5-f45a-445a-8ec6-d5c022862f46	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	SANTA ISABEL DE SIGUAS
t	2025-03-17 21:13:03.227299+00	2025-03-17 21:13:03.227302+00	57caa5cb-8c58-4417-9efa-efdd87cc03ca	3802be26-bb36-4da3-9d01-4b889d15548f	CALAPUJA
t	2025-03-17 21:13:03.232026+00	2025-03-17 21:13:03.232029+00	e26e03f1-b373-4e2f-b3b5-e287e6c2481b	6eca8b97-dbde-4058-8fc8-4b86feb3307c	SAN JUAN DEL ORO
t	2025-03-17 21:13:03.237485+00	2025-03-17 21:13:03.237488+00	c0e0c829-e0a6-404e-9c96-399f30748da9	b42841e0-44d6-4122-9396-858f0fbf2b1d	CHAVIN DE HUANTAR
t	2025-03-17 21:13:03.242968+00	2025-03-17 21:13:03.242971+00	c7a40592-1cd6-4986-b805-e10fcc267cc9	c2c1f083-00f1-42dc-b34b-7c274675fe6f	ANDARAY
t	2025-03-17 21:13:03.248213+00	2025-03-17 21:13:03.248216+00	90fef935-0e53-4252-a7dc-7e6994b9bf46	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	YANAHUARA
t	2025-03-17 21:13:03.253789+00	2025-03-17 21:13:03.253791+00	cbff81bb-6131-4afa-b0c2-050c3f48ccbd	62bc063a-ebad-48e0-8d45-7ed5c604ed27	ASCOPE
t	2025-03-17 21:13:03.259158+00	2025-03-17 21:13:03.259161+00	b863de13-768c-4080-bba7-0d3a571cf6bc	8eb85dc7-057c-4c9c-890b-3fc9f739fba7	PARURO
t	2025-03-17 21:13:03.264768+00	2025-03-17 21:13:03.264771+00	fa7b9382-69e8-4db8-a360-4520fa60d766	fb3b3950-928c-4345-8bb6-8f89054c2e9b	NANCHOC
t	2025-03-17 21:13:03.270065+00	2025-03-17 21:13:03.270067+00	729693b5-f255-46d9-b441-8bec94f1a318	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	TANTA
t	2025-03-17 21:13:03.275831+00	2025-03-17 21:13:03.275834+00	504cbe32-369b-40db-96af-2d2906efc937	e25f8297-7651-4d13-b583-e83edec11bc7	LA LIBERTAD DE PALLAN
t	2025-03-17 21:13:03.282691+00	2025-03-17 21:13:03.282695+00	d23636d0-8b81-4a4a-a5aa-0de42808d74d	6a63b22a-2f1a-4c61-bf16-53cd00081db0	BAMBAS
t	2025-03-17 21:13:03.290184+00	2025-03-17 21:13:03.290188+00	44fe6fed-822b-4c91-85e7-1c55da39689b	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	SABANDIA
t	2025-03-17 21:13:03.296566+00	2025-03-17 21:13:03.296569+00	c8a28dd9-c50c-48c9-ac62-be1b5e5af2f8	0c319822-58c6-435a-ab75-c3c72db37ed8	HUARIACA
t	2025-03-17 21:13:03.303395+00	2025-03-17 21:13:03.303398+00	a4180574-45cb-48a0-be4b-cd72b53eba7b	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	COTARUSE
t	2025-03-17 21:13:03.31149+00	2025-03-17 21:13:03.311496+00	f3081d54-acc9-4055-9753-680f7a324f94	c86c46dc-e039-43dc-9913-86e623472583	LAMPA
t	2025-03-17 21:13:03.317398+00	2025-03-17 21:13:03.317401+00	8d540b3e-5fa8-43e3-a03f-a184197bd991	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	CHILCAS
t	2025-03-17 21:13:03.323216+00	2025-03-17 21:13:03.323218+00	ed2609d8-42fb-4223-9b14-3577bdf85832	42a3655b-687b-424b-a374-b0ab58d4f011	NUEVO CHIMBOTE
t	2025-03-17 21:13:03.329171+00	2025-03-17 21:13:03.329174+00	5d2874d9-260d-430e-8f22-54fb3e5dd4ba	6a5cf9a4-6f24-4a7e-b672-4b80cc5aecf7	ULCUMAYO
t	2025-03-17 21:13:03.335136+00	2025-03-17 21:13:03.335139+00	b4fe1799-2add-4b8f-b19c-8fe5d314c72c	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	YAUYUCAN
t	2025-03-17 21:13:03.340602+00	2025-03-17 21:13:03.340605+00	12e41ffc-d03c-4414-9789-af9300e7c72e	cc76f1f4-59f8-477e-ab55-63ef31302138	TOTORA
t	2025-03-17 21:13:03.345808+00	2025-03-17 21:13:03.345811+00	18cbbb56-7155-4cc8-95d5-d6ccc82d9539	e479934c-2453-4ba8-a477-47d8f7b30704	CANDARAVE
t	2025-03-17 21:13:03.351142+00	2025-03-17 21:13:03.351145+00	e18af1de-d630-4fcc-90eb-6304527d1dcd	62bc063a-ebad-48e0-8d45-7ed5c604ed27	SANTIAGO DE CAO
t	2025-03-17 21:13:03.35625+00	2025-03-17 21:13:03.356252+00	202583af-8d26-4c7e-952c-6346e07c432b	a4dc3a42-25f5-4178-a9e7-66ef66e42aeb	HUAY-HUAY
t	2025-03-17 21:13:03.361661+00	2025-03-17 21:13:03.361664+00	50be973b-be53-44c6-a493-20b29629ce27	5f06e473-5acd-475a-b17f-aa63c7fa9783	JAZAN
t	2025-03-17 21:13:03.367006+00	2025-03-17 21:13:03.367009+00	e1245b7b-1adb-46e0-8c44-bdcb4b34f614	e02ca1a8-e500-491d-9a6d-69149df77156	CHAGLLA
t	2025-03-17 21:13:03.372795+00	2025-03-17 21:13:03.372798+00	ab49528f-be84-4515-b748-04c0b82d8769	e9ccabb0-d482-4488-845c-94f1fd0e96e6	MI PERU
t	2025-03-17 21:13:03.379477+00	2025-03-17 21:13:03.37948+00	f6990d5d-f40f-4be4-b84d-5bd41f6bae4f	956d4ecd-a18c-4758-bb6a-cb38c449e32c	ATAVILLOS ALTO
t	2025-03-17 21:13:03.385174+00	2025-03-17 21:13:03.385177+00	9913cb29-11d3-4677-9a1b-fb0ee8b53da6	4d11370d-0157-4af4-b89d-731e4516658a	CALANA
t	2025-03-17 21:13:03.391316+00	2025-03-17 21:13:03.39132+00	3eee18be-dfcf-489c-bf5e-6372d62a70a3	454a9077-d285-43fb-8f73-9898bccb31bb	CHORAS
t	2025-03-17 21:13:03.397262+00	2025-03-17 21:13:03.397265+00	4c70b2d2-92d3-4870-bcac-540d00a50db7	792fb1cf-e799-4ec9-8dbf-339f60cf3179	YUYAPICHIS
t	2025-03-17 21:13:03.404863+00	2025-03-17 21:13:03.404867+00	95535283-3fbd-4056-8243-08950cf667a2	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	ACOBAMBILLA
t	2025-03-17 21:13:03.412332+00	2025-03-17 21:13:03.412337+00	226e5ae5-0936-4118-bd25-6b248f8874e6	fbc0bd2f-d800-4706-b300-4eca7a818b49	LUNAHUANA
t	2025-03-17 21:13:03.418385+00	2025-03-17 21:13:03.418388+00	43137c4c-f41e-4f34-b994-a44a773d96e3	957c7796-925d-4e7a-a997-1c18b7f41201	IQUITOS
t	2025-03-17 21:13:03.423825+00	2025-03-17 21:13:03.423828+00	295082d9-d28b-439c-9752-456a878954fe	50381126-eaca-4e9d-9688-2d0ed3c35612	JOSE LEONARDO ORTIZ
t	2025-03-17 21:13:03.429561+00	2025-03-17 21:13:03.429563+00	09f23661-58f7-420a-88a2-b9dcc4e9a4ed	956d4ecd-a18c-4758-bb6a-cb38c449e32c	AUCALLAMA
t	2025-03-17 21:13:03.43378+00	2025-03-17 21:13:03.433783+00	a85be2e6-5ed0-48ef-aaf6-bd34da54e4ef	1e747a8b-ad85-4e35-ad63-70fb3ad6da2d	AYABACA
t	2025-03-17 21:13:03.43852+00	2025-03-17 21:13:03.438524+00	3b7204ee-b011-453b-a056-9c176e6d31fa	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	JOSE LUIS BUSTAMANTE Y RIVERO
t	2025-03-17 21:13:03.443193+00	2025-03-17 21:13:03.443196+00	fa7aa0e4-5e3b-4fb7-a06f-b6ef544940b4	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	QUINOCAY
t	2025-03-17 21:13:03.449125+00	2025-03-17 21:13:03.449128+00	791f741f-59d6-45ac-8545-bfa8aa722874	cf4cb352-ae23-46de-9fc3-a94554ae89dd	AMBO
t	2025-03-17 21:13:03.454714+00	2025-03-17 21:13:03.454717+00	02a96c2b-e406-40e4-9c2d-87bb6cc17da3	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	ROBLE
t	2025-03-17 21:13:03.459944+00	2025-03-17 21:13:03.459947+00	a3be858c-1102-4714-929e-37a03359fdd1	e6121f54-624d-44b3-ba2e-d07a7cfe7226	SANTIAGO DE CHOCORVOS
t	2025-03-17 21:13:03.46706+00	2025-03-17 21:13:03.467064+00	8ef1cb56-6b10-4b6b-811b-0c451ef62d65	5f06e473-5acd-475a-b17f-aa63c7fa9783	SHIPASBAMBA
t	2025-03-17 21:13:03.474842+00	2025-03-17 21:13:03.474849+00	dfb26581-77fe-47a3-8488-57c38022b0dd	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	SAN LORENZO
t	2025-03-17 21:13:03.482561+00	2025-03-17 21:13:03.482566+00	9cad10ae-8cbd-4db1-9545-305801177be4	c86c46dc-e039-43dc-9913-86e623472583	SAN JAVIER DE ALPABAMBA
t	2025-03-17 21:13:03.493371+00	2025-03-17 21:13:03.493376+00	475d61b1-c7de-409f-988c-97a404df7c0d	dce0a035-d91c-4f0a-a10f-aefa48915118	CANGALLO
t	2025-03-17 21:13:03.502197+00	2025-03-17 21:13:03.5022+00	f6fc30bf-6c93-4a68-9b92-079166d49443	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	CONAYCA
t	2025-03-17 21:13:03.510074+00	2025-03-17 21:13:03.510077+00	cb9df922-fdbb-4028-ba2e-bfcfbc2d93c5	cf4cb352-ae23-46de-9fc3-a94554ae89dd	SAN RAFAEL
t	2025-03-17 21:13:03.517222+00	2025-03-17 21:13:03.517225+00	41471573-accd-4128-a229-99a06f8bbee0	74b3890f-d58c-4d92-b653-e1ceec0d1b55	SAN JOSE DE LOS MOLINOS
t	2025-03-17 21:13:03.52313+00	2025-03-17 21:13:03.523133+00	3207e91c-2c34-46af-bfe5-a3ee74800357	a154aa5a-7dee-47d6-8448-b6744a59812d	SAYAN
t	2025-03-17 21:13:03.530716+00	2025-03-17 21:13:03.530722+00	cdfd0594-e946-423a-9ac3-4e509d7e8229	915063a0-1172-48a3-8b31-33715e1f2e3c	LANCONES
t	2025-03-17 21:13:03.53744+00	2025-03-17 21:13:03.537443+00	0513fc80-02f1-48d4-a88d-b22e45c75903	cc0ea4e4-1184-4e35-8056-ce01bdb4f473	WANCHAQ
t	2025-03-17 21:13:03.545037+00	2025-03-17 21:13:03.545043+00	e298b2d7-dddd-4a32-92f6-5d1dde3b41d0	c5f4a998-3e9d-40be-a280-2d993d49b686	MOLLEPATA
t	2025-03-17 21:13:03.551543+00	2025-03-17 21:13:03.551546+00	0092babd-db51-4cf2-af66-fa6d2882a65b	9d7bb05d-7107-41b7-8fc0-29d110e2992d	COCHARCAS
t	2025-03-17 21:13:03.559001+00	2025-03-17 21:13:03.559007+00	8481bffe-84b0-489d-9a82-51cbfddfc2b1	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	YAULI
t	2025-03-17 21:13:03.565792+00	2025-03-17 21:13:03.565796+00	1317c17a-dee3-4f67-b275-3aa8ca53a513	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	CHALHUANCA
t	2025-03-17 21:13:03.573189+00	2025-03-17 21:13:03.573192+00	9b83aaa6-483d-4b68-9db3-da2818d1e3e3	74f3454f-27d1-4e37-aac7-283f27a56308	YAUTAN
t	2025-03-17 21:13:03.579865+00	2025-03-17 21:13:03.579868+00	74c80a71-5137-461c-a16f-44fa934dcb87	50381126-eaca-4e9d-9688-2d0ed3c35612	LA VICTORIA
t	2025-03-17 21:13:03.587604+00	2025-03-17 21:13:03.587609+00	5a46e076-fc25-496f-881e-1d032467422d	b1166054-2099-441c-ba5d-e67d7e1d0645	CATAC
t	2025-03-17 21:13:03.59449+00	2025-03-17 21:13:03.594493+00	350ca706-6513-40eb-a7fe-d0a6771875b3	ae046f24-a6bc-4f31-a81c-2bca0c494b67	CAPELO
t	2025-03-17 21:13:03.602004+00	2025-03-17 21:13:03.602007+00	3a50e765-8e40-4971-b5dd-9fce173113b4	87327c56-b236-4368-b80b-34d9952243ac	EL ESLABON
t	2025-03-17 21:13:03.61007+00	2025-03-17 21:13:03.610074+00	f83e9f20-8dea-4a52-ade2-6f0c42c2bba2	b763ddbd-4a9c-4883-bf39-ccabfca1f3b7	MACHUPICCHU
t	2025-03-17 21:13:03.617455+00	2025-03-17 21:13:03.61746+00	94ae03f1-3534-4e41-b20c-eddd37841ee7	8ae34c95-7c05-4880-915b-49c44ac13bd1	SAN PEDRO DE LLOC
t	2025-03-17 21:13:03.624802+00	2025-03-17 21:13:03.624806+00	98fdde43-9883-4726-bb1f-a5779a2fb7bf	186355ca-8fe2-4aa6-8445-132b479de1b5	LA MORADA
t	2025-03-17 21:13:03.630488+00	2025-03-17 21:13:03.630491+00	7ab193ee-0569-489b-83d8-b1c1bf6f07d3	6eca8b97-dbde-4058-8fc8-4b86feb3307c	PHARA
t	2025-03-17 21:13:03.636008+00	2025-03-17 21:13:03.636011+00	347f9de2-6083-4bc0-9248-50cd371938e8	f1f444d7-6007-4f07-be39-a71d94b84ca7	MACARI
t	2025-03-17 21:13:03.64221+00	2025-03-17 21:13:03.642215+00	78d33244-7223-4c61-95be-12785d4f0f08	e6121f54-624d-44b3-ba2e-d07a7cfe7226	SAN ANTONIO DE CUSICANCHA
t	2025-03-17 21:13:03.648568+00	2025-03-17 21:13:03.648571+00	7b44fdd4-c612-490d-b417-b92654d40020	9b57564f-d3d6-466b-8a32-2eb5fab33e6b	CHAMACA
t	2025-03-17 21:13:03.655444+00	2025-03-17 21:13:03.655449+00	8a8db849-b67c-4f35-9a11-01da4edec650	35972dee-bd82-40d7-aad3-b6f032924ddd	HUAYLLATI
t	2025-03-17 21:13:03.66253+00	2025-03-17 21:13:03.662535+00	2b3a0872-99b1-44fd-8ccf-9bf4799d658d	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	ASCENSION
t	2025-03-17 21:13:03.669191+00	2025-03-17 21:13:03.669196+00	a828d0d2-b644-405a-98a8-fba84dcb559e	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SAN JUAN DE LURIGANCHO
t	2025-03-17 21:13:03.675724+00	2025-03-17 21:13:03.675727+00	428208e8-934f-48c9-befe-acf9d702ced3	9b57564f-d3d6-466b-8a32-2eb5fab33e6b	VELILLE
t	2025-03-17 21:13:03.682062+00	2025-03-17 21:13:03.682066+00	6b430931-2b49-40da-ac62-dd27b5e1037d	b6ee8d13-7dc2-42e1-b9f8-4f689751a272	CHANCHAMAYO
t	2025-03-17 21:13:03.690997+00	2025-03-17 21:13:03.691+00	f5fd0cb9-d31d-4b91-907b-104657a56f01	cf4cb352-ae23-46de-9fc3-a94554ae89dd	HUACAR
t	2025-03-17 21:13:03.697037+00	2025-03-17 21:13:03.69704+00	b0040915-b4db-4199-91e3-8e968ace6136	8eb85dc7-057c-4c9c-890b-3fc9f739fba7	COLCHA
t	2025-03-17 21:13:03.703677+00	2025-03-17 21:13:03.70368+00	10d3fb37-e372-4edb-a024-905f2e5db502	4bf4170f-e0ab-484c-8fbf-368ef843dc61	SAN PEDRO DE CAJAS
t	2025-03-17 21:13:03.710959+00	2025-03-17 21:13:03.710963+00	ffc98dc7-57b3-4c3f-9950-726f760a430c	4f006a58-9e1b-4e72-85ce-4ae912b8cc5c	CUTURAPI
t	2025-03-17 21:13:03.718455+00	2025-03-17 21:13:03.718459+00	7f98598e-108d-4ce4-9ddc-f3e91ea0cf49	10923be8-8983-423b-9d2e-5cceef4d9ebd	VINCHOS
t	2025-03-17 21:13:03.725554+00	2025-03-17 21:13:03.725558+00	8f1970b0-cac6-4c5e-a636-9700817b6b7f	ea1da671-28f3-4192-ac87-6c6d5c9f5967	BELLAVISTA
t	2025-03-17 21:13:03.732809+00	2025-03-17 21:13:03.732812+00	0173c7b9-04d4-4e9b-8f1f-c0a6a5c626f4	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	MAGDALENA DEL MAR
t	2025-03-17 21:13:03.739073+00	2025-03-17 21:13:03.739076+00	f7196ead-6a75-4f6c-bb76-2a99621333bd	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	MIRAFLORES
t	2025-03-17 21:13:03.744608+00	2025-03-17 21:13:03.74461+00	cc2dca19-20bc-49e9-8390-e193ba507081	a4dc3a42-25f5-4178-a9e7-66ef66e42aeb	SUITUCANCHA
t	2025-03-17 21:13:03.75068+00	2025-03-17 21:13:03.750683+00	772ea6c2-c9fa-458b-b7d7-bf7135432ed0	6198f919-cc14-48e2-bc8f-cd4799b8f49b	COLQUEPATA
t	2025-03-17 21:13:03.756125+00	2025-03-17 21:13:03.756128+00	5fdc0db7-9b41-47ce-9467-12fdd3f82fab	9d7bb05d-7107-41b7-8fc0-29d110e2992d	RANRACANCHA
t	2025-03-17 21:13:03.761187+00	2025-03-17 21:13:03.761191+00	07d80ae1-9f6b-4a44-9880-099500c6a905	1e747a8b-ad85-4e35-ad63-70fb3ad6da2d	MONTERO
t	2025-03-17 21:13:03.766769+00	2025-03-17 21:13:03.766772+00	3dd0bf5a-53b6-4ffb-a738-13515a3cfaf6	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	PULAN
t	2025-03-17 21:13:03.772487+00	2025-03-17 21:13:03.772491+00	7245326a-0013-44ba-9894-56d2c646f7b0	34ab58b2-509d-451d-91db-da1dd6aa3a8e	COVIRIALI
t	2025-03-17 21:13:03.778271+00	2025-03-17 21:13:03.778276+00	62d67eef-e4b4-49c1-9cdb-790885345579	6b370b4c-d286-40a1-8217-ee8f69ab0c0f	SAN FRANCISCO DE RAVACAYCO
t	2025-03-17 21:13:03.784852+00	2025-03-17 21:13:03.784854+00	2ec9194f-0c27-4811-9bb5-276af8adcf56	e02ca1a8-e500-491d-9a6d-69149df77156	PANAO
t	2025-03-17 21:13:03.790367+00	2025-03-17 21:13:03.790371+00	884481bd-ee9c-49d5-b43c-e66c9031c633	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	CHIGUATA
t	2025-03-17 21:13:03.79617+00	2025-03-17 21:13:03.796173+00	9a5b011f-1bc0-4b67-bf27-478cf0d290cc	4d11370d-0157-4af4-b89d-731e4516658a	CORONEL GREGORIO ALBARRACIN LANCHIP
t	2025-03-17 21:13:03.802016+00	2025-03-17 21:13:03.802019+00	bab1be34-1350-44c6-a1da-1f99ca27a5eb	6e015257-6f7e-48cf-b9c0-a24502cdcc21	VIQUES
t	2025-03-17 21:13:03.808359+00	2025-03-17 21:13:03.808363+00	7f07aa9a-1c3d-4120-aac9-78f2922e4a53	35972dee-bd82-40d7-aad3-b6f032924ddd	MICAELA BASTIDAS
t	2025-03-17 21:13:03.814223+00	2025-03-17 21:13:03.814226+00	1eb49354-ce67-4652-9582-22a6e7807f85	8f671c0f-3e82-43ae-ad5a-480f8bc815d4	LA PECA
t	2025-03-17 21:13:03.819793+00	2025-03-17 21:13:03.819796+00	a0a87def-dad7-41ee-9fed-3ec526ef3186	cf4cb352-ae23-46de-9fc3-a94554ae89dd	COLPAS
t	2025-03-17 21:13:03.82586+00	2025-03-17 21:13:03.825863+00	2f24e808-83d4-4736-a93a-e875b89dd5ed	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	ACOLLA
t	2025-03-17 21:13:03.831961+00	2025-03-17 21:13:03.831965+00	08492b0c-57f1-492f-80f4-7d739fc5d895	bbf8aad6-4dd0-482a-884b-0b42f2179319	NUEVA CAJAMARCA
t	2025-03-17 21:13:03.837763+00	2025-03-17 21:13:03.837766+00	417425bd-0799-46e4-afbb-17fdc7a73508	187d7e64-5269-4ebb-953a-949acc68acd7	JUANJUI
t	2025-03-17 21:13:03.843132+00	2025-03-17 21:13:03.843135+00	b67ce77c-454a-42ef-aced-7195d6124a8b	42a3655b-687b-424b-a374-b0ab58d4f011	MACATE
t	2025-03-17 21:13:03.84871+00	2025-03-17 21:13:03.848713+00	1e8fceda-3704-4317-b039-6ba6208b799c	e61f54ef-373f-46b9-b05e-bfe23561ec46	ECHARATE
t	2025-03-17 21:13:03.854103+00	2025-03-17 21:13:03.854107+00	35996c72-e8c3-4bce-aa6b-41aba32c2826	5f06e473-5acd-475a-b17f-aa63c7fa9783	SAN CARLOS
t	2025-03-17 21:13:03.859663+00	2025-03-17 21:13:03.859666+00	7d602828-8d62-4a51-b16d-6c3678e2d35f	6e015257-6f7e-48cf-b9c0-a24502cdcc21	HUAYUCACHI
t	2025-03-17 21:13:03.864394+00	2025-03-17 21:13:03.864396+00	204652b2-8e7d-442d-9579-7136d6dcf753	50381126-eaca-4e9d-9688-2d0ed3c35612	ETEN PUERTO
t	2025-03-17 21:13:03.869496+00	2025-03-17 21:13:03.869499+00	5ff4bca0-806b-4739-b94a-b6d8ddcece86	3c65165b-fec3-4cac-a995-07815d72b599	CHEPEN
t	2025-03-17 21:13:03.874098+00	2025-03-17 21:13:03.874101+00	4b87491f-85b9-4e56-a0e7-5562f565af63	b763ddbd-4a9c-4883-bf39-ccabfca1f3b7	YUCAY
t	2025-03-17 21:13:03.879256+00	2025-03-17 21:13:03.87926+00	957d6f60-a9e6-4d67-8123-9fdaa2594d83	b6200a73-f2d4-4543-8e14-909a4f3e7f32	BAÑOS
t	2025-03-17 21:13:03.885378+00	2025-03-17 21:13:03.88538+00	e42960b3-616c-46d6-92fe-62cfa51f2640	37fe07d1-74f8-4777-941d-ba51afc1c160	KELLUYO
t	2025-03-17 21:13:03.890669+00	2025-03-17 21:13:03.890672+00	84680f84-d1a3-44af-b6ac-e8e5daa7fec0	b6ee8d13-7dc2-42e1-b9f8-4f689751a272	SAN LUIS DE SHUARO
t	2025-03-17 21:13:03.896705+00	2025-03-17 21:13:03.89671+00	0a38d7b9-4a0e-48b8-92ca-1c265d7ec984	b763ddbd-4a9c-4883-bf39-ccabfca1f3b7	URUBAMBA
t	2025-03-17 21:13:03.904159+00	2025-03-17 21:13:03.904163+00	022cf3fb-ca65-431b-9557-f0c340ac9ab6	bbf8aad6-4dd0-482a-884b-0b42f2179319	SAN FERNANDO
t	2025-03-17 21:13:03.910401+00	2025-03-17 21:13:03.910404+00	14dfb9d5-52a3-4497-bfbe-019b6c1c3bc0	4b571beb-3d2d-4889-ad57-fd15c191be22	CALAMARCA
t	2025-03-17 21:13:03.916484+00	2025-03-17 21:13:03.91649+00	5cd8b826-0bcc-4a8a-81bd-e4c1b07ef009	5b08eab1-14c5-448c-8832-40f39e2a1840	RONDOCAN
t	2025-03-17 21:13:03.921809+00	2025-03-17 21:13:03.921811+00	47bfbf1f-7a8a-4514-bcaf-9a21a80ac3ad	960e79f6-51c7-4335-b07a-7721b638f576	ABANCAY
t	2025-03-17 21:13:03.926397+00	2025-03-17 21:13:03.9264+00	9e569c11-a62b-4c15-b2d6-436d737170ff	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	TIABAYA
t	2025-03-17 21:13:03.931128+00	2025-03-17 21:13:03.931131+00	784d36cb-e2e5-4b33-8dac-2adcb53cb430	6b370b4c-d286-40a1-8217-ee8f69ab0c0f	PULLO
t	2025-03-17 21:13:03.936407+00	2025-03-17 21:13:03.936411+00	faeb3896-52f7-4e28-a58e-f3598e7381c0	74b3890f-d58c-4d92-b653-e1ceec0d1b55	LOS AQUIJES
t	2025-03-17 21:13:03.94125+00	2025-03-17 21:13:03.94127+00	7e645aa3-ec36-46f2-b9ec-dea0d06e96fb	6e015257-6f7e-48cf-b9c0-a24502cdcc21	CHONGOS ALTO
t	2025-03-17 21:13:03.946835+00	2025-03-17 21:13:03.946841+00	b3324609-0a9f-47e1-856b-d5a26bc49933	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	LLIPA
t	2025-03-17 21:13:03.95337+00	2025-03-17 21:13:03.953373+00	4c47f798-9caa-44ed-b9ce-c46260bd8287	e8f3629d-e44f-4811-a9cb-78896582c0f4	MOCHUMI
t	2025-03-17 21:13:03.957203+00	2025-03-17 21:13:03.957205+00	6f18c3f3-aba9-4aec-93c6-34ba5d12afc4	c44b2db0-1ce6-4816-b16c-975486d5db85	ARAHUAY
t	2025-03-17 21:13:03.962012+00	2025-03-17 21:13:03.962015+00	f1cc5d33-828a-421d-a66d-460ca7467030	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	SOCOTA
t	2025-03-17 21:13:03.966657+00	2025-03-17 21:13:03.966659+00	34e0083f-be90-4a98-97ef-19142ebd3bba	e7815c4d-9487-4bbf-aa91-b30ca9896721	SAYLA
t	2025-03-17 21:13:03.9704+00	2025-03-17 21:13:03.970402+00	2f11fe35-e848-4b28-bf2f-79bd8832765d	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	QUINCHES
t	2025-03-17 21:13:03.975813+00	2025-03-17 21:13:03.975817+00	f4e8802f-2350-426b-800f-4e408394575d	cd1a779c-e303-4241-b40f-3a8bd328ae2a	OCUMAL
t	2025-03-17 21:13:03.980017+00	2025-03-17 21:13:03.980019+00	439a48fb-5707-4c4a-b39c-6b43da7c6ef0	83446550-f9ab-4a22-a1f0-308929aad66c	CONDORMARCA
t	2025-03-17 21:13:03.98502+00	2025-03-17 21:13:03.985022+00	32b4c3f4-2fb6-4039-b56b-5e51bf0d4923	c790e80f-15e1-4e44-b272-1ef57bb9c991	MACHE
t	2025-03-17 21:13:03.991129+00	2025-03-17 21:13:03.991133+00	fc8264d1-5178-4de0-a953-26e6b24111fa	8eb85dc7-057c-4c9c-890b-3fc9f739fba7	PILLPINTO
t	2025-03-17 21:13:03.995685+00	2025-03-17 21:13:03.995687+00	8e79ffaa-95e2-4c4d-a8b5-fee92836f6b6	e61f54ef-373f-46b9-b05e-bfe23561ec46	SANTA ANA
t	2025-03-17 21:13:04.000699+00	2025-03-17 21:13:04.000701+00	a8e2f6d6-307d-43ca-a008-856a79400bc7	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	JAQUI
t	2025-03-17 21:13:04.005953+00	2025-03-17 21:13:04.005955+00	91aff10e-6462-45a1-b1f9-4654b25ee68b	56ad5343-c9f9-4787-a151-0f3d01c21dbb	YURACMARCA
t	2025-03-17 21:13:04.01055+00	2025-03-17 21:13:04.010554+00	fefc2340-9d95-4912-b628-b433b9a4200d	4f006a58-9e1b-4e72-85ce-4ae912b8cc5c	TINICACHI
t	2025-03-17 21:13:04.016051+00	2025-03-17 21:13:04.016055+00	0a6e4b9c-a772-4f97-b843-e4dac7b9a6f5	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	ATIQUIPA
t	2025-03-17 21:13:04.020536+00	2025-03-17 21:13:04.02054+00	1e49850f-e31f-4ac6-b5e9-75dc15e5ee58	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	HUAMANGUILLA
t	2025-03-17 21:13:04.025362+00	2025-03-17 21:13:04.025365+00	ed83eb92-5320-4fae-accb-faf66adaee34	cd1a779c-e303-4241-b40f-3a8bd328ae2a	LAMUD
t	2025-03-17 21:13:04.030233+00	2025-03-17 21:13:04.030236+00	a0e1f72f-ce9d-44ac-a58f-13ab0b0c377c	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	ANDABAMBA
t	2025-03-17 21:13:04.035538+00	2025-03-17 21:13:04.035541+00	2260bd15-d2e7-4cb9-ac14-089120d7b161	960e79f6-51c7-4335-b07a-7721b638f576	PICHIRHUA
t	2025-03-17 21:13:04.040655+00	2025-03-17 21:13:04.040659+00	80bc4343-dd0f-4813-8fdb-c6657d2ba062	4d11370d-0157-4af4-b89d-731e4516658a	LA YARADA LOS PALOS
t	2025-03-17 21:13:04.045601+00	2025-03-17 21:13:04.045604+00	e5078d21-6483-4ebc-90a2-1b4183f1a6dd	e25f8297-7651-4d13-b583-e83edec11bc7	HUASMIN
t	2025-03-17 21:13:04.050385+00	2025-03-17 21:13:04.050387+00	e7c70898-4c56-4e95-acfe-bb5917ade5c2	b42841e0-44d6-4122-9396-858f0fbf2b1d	RAHUAPAMPA
t	2025-03-17 21:13:04.05451+00	2025-03-17 21:13:04.054512+00	9a05b612-6ce9-4243-bb53-d899282ceb74	98e65496-68d3-4d43-bddc-22c7631c5b27	COLAN
t	2025-03-17 21:13:04.059469+00	2025-03-17 21:13:04.059472+00	2b1a70fc-856b-467a-b7ce-5de014211c5f	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	SAN MARCOS DE ROCCHAC
t	2025-03-17 21:13:04.064733+00	2025-03-17 21:13:04.064737+00	8b5b930c-545b-4ff4-a3af-28fc70680d08	a8a4b3eb-833f-4269-98b8-d5e76c3fb74c	SAN IGNACIO
t	2025-03-17 21:13:04.07008+00	2025-03-17 21:13:04.070083+00	bbf588a7-45b2-44ba-80d8-214789bfdce6	186355ca-8fe2-4aa6-8445-132b479de1b5	SANTA ROSA DE ALTO YANAJANCA
t	2025-03-17 21:13:04.074793+00	2025-03-17 21:13:04.074796+00	ad803565-65ee-4dcb-bd35-e1a0bad7fc59	aa8c638e-2ea0-4a72-9668-8057261bbfee	SHUNQUI
t	2025-03-17 21:13:04.079833+00	2025-03-17 21:13:04.079835+00	2f464c7e-9be0-43de-a054-62166a5657e4	b5c477ac-5c22-4641-a743-47ccf2ee8c59	TINCO
t	2025-03-17 21:13:04.084409+00	2025-03-17 21:13:04.084411+00	bbd2484d-b09d-467f-b8e5-5499372101af	e5987227-df60-4b9e-a9c8-ef624979e917	COLCA
t	2025-03-17 21:13:04.08978+00	2025-03-17 21:13:04.089783+00	da622487-7f74-4173-aa86-25755dbd73b8	c745de6d-713a-4613-951f-05d16e86739b	MARISCAL CACERES
t	2025-03-17 21:13:04.094945+00	2025-03-17 21:13:04.094947+00	75de54ee-67cc-4419-b6ea-4e3f73b8eb2a	e25f8297-7651-4d13-b583-e83edec11bc7	MIGUEL IGLESIAS
t	2025-03-17 21:13:04.099996+00	2025-03-17 21:13:04.099999+00	4505f070-3445-43a9-b610-853e061b56bf	cd1a779c-e303-4241-b40f-3a8bd328ae2a	LUYA
t	2025-03-17 21:13:04.104912+00	2025-03-17 21:13:04.104914+00	93898964-b03a-43e4-a8ba-1cc8ba9c7ac0	6f01c2b3-c170-49f4-a21b-c1fae42b9815	CASHAPAMPA
t	2025-03-17 21:13:04.108837+00	2025-03-17 21:13:04.108839+00	487dfa42-128c-4b88-801b-abfc9db9e9cb	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	TORIBIO CASANOVA
t	2025-03-17 21:13:04.113705+00	2025-03-17 21:13:04.113708+00	99403805-837d-40d8-9eb3-af5495bb3e61	2c09bf48-31df-47d1-bf45-11d7695ea002	MARIATANA
t	2025-03-17 21:13:04.118526+00	2025-03-17 21:13:04.118529+00	817e8985-0d8b-4782-8a50-78b2a60d8136	2bc54a70-eee6-4d04-90b9-06503d3b6067	ASILLO
t	2025-03-17 21:13:04.124898+00	2025-03-17 21:13:04.124901+00	2599bf25-7cb5-45e0-9f3c-e93445ccfa85	4d11370d-0157-4af4-b89d-731e4516658a	ALTO DE LA ALIANZA
t	2025-03-17 21:13:04.131713+00	2025-03-17 21:13:04.131716+00	ca0bb53c-f03a-4696-8932-e5bd4c8dc6de	c790e80f-15e1-4e44-b272-1ef57bb9c991	SALPO
t	2025-03-17 21:13:04.13807+00	2025-03-17 21:13:04.138073+00	93e96379-16cb-4bfe-bf5b-c8897693f0d8	55340ef0-3d04-40ea-a070-cbb80d5755a5	CHECACUPE
t	2025-03-17 21:13:04.144865+00	2025-03-17 21:13:04.144869+00	959e98c0-f215-4dab-8774-e65e80ab1884	3802be26-bb36-4da3-9d01-4b889d15548f	OCUVIRI
t	2025-03-17 21:13:04.150164+00	2025-03-17 21:13:04.150166+00	13bae5f1-8de3-4490-a400-4cf073da0b2d	6f01c2b3-c170-49f4-a21b-c1fae42b9815	ACOBAMBA
t	2025-03-17 21:13:04.15626+00	2025-03-17 21:13:04.156263+00	04a3d3e3-c278-4941-a4d5-3bf3460ad713	c790e80f-15e1-4e44-b272-1ef57bb9c991	OTUZCO
t	2025-03-17 21:13:04.161931+00	2025-03-17 21:13:04.161934+00	44ec3084-7d6f-4763-b2eb-abcae040a482	fae002ab-c99a-457d-8f6d-9e9964312caf	PUNO
t	2025-03-17 21:13:04.167112+00	2025-03-17 21:13:04.167115+00	9afd2b8d-dcdf-49f5-9096-b6cbc75f8d90	a4dc3a42-25f5-4178-a9e7-66ef66e42aeb	SANTA ROSA DE SACCO
t	2025-03-17 21:13:04.172867+00	2025-03-17 21:13:04.17287+00	5ae727b3-b6a0-4ef5-903e-aad9b4df4773	a75e913b-1a31-4ba6-89c1-ef135099a204	LARES
t	2025-03-17 21:13:04.178091+00	2025-03-17 21:13:04.178094+00	a8e05d7d-7809-45be-9d04-f6030ce293d9	6eca8b97-dbde-4058-8fc8-4b86feb3307c	CUYOCUYO
t	2025-03-17 21:13:04.18294+00	2025-03-17 21:13:04.182942+00	bac24be3-9efa-45d6-8018-1e4dd6a08110	efdcbed4-4e80-48e7-8992-8191ea2939b8	JULCAMARCA
t	2025-03-17 21:13:04.190343+00	2025-03-17 21:13:04.190349+00	74ecb2cb-04e0-4807-b913-50593dfeaa6f	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	SAMUGARI
t	2025-03-17 21:13:04.196447+00	2025-03-17 21:13:04.196449+00	64cf3294-ac02-4c75-9952-5e12ddfb4839	5250e4c2-488d-4a7d-bdc9-d2633361c510	SINA
t	2025-03-17 21:13:04.20189+00	2025-03-17 21:13:04.201893+00	a6ce5368-a40e-45eb-983a-7be34942929d	e09f0261-1ea3-4fd7-a601-d7077e27ff43	VILLA RICA
t	2025-03-17 21:13:04.207034+00	2025-03-17 21:13:04.207037+00	5182f31d-ef11-4cd4-b060-f1fc6b243e0b	40cd7264-e177-460b-81e7-fd1c04a3d1dd	YAVARI
t	2025-03-17 21:13:04.212137+00	2025-03-17 21:13:04.212139+00	7c3529b3-177a-402c-af5f-bc84c51cc0bd	e6121f54-624d-44b3-ba2e-d07a7cfe7226	SAN FRANCISCO DE SANGAYAICO
t	2025-03-17 21:13:04.216462+00	2025-03-17 21:13:04.216464+00	eab0b048-a085-487b-b39c-a41061a13923	f6729187-58e1-4607-8b37-0b2db196f283	TANTARA
t	2025-03-17 21:13:04.221403+00	2025-03-17 21:13:04.221406+00	18113b6b-a8af-45d7-9158-af13a9810f20	26dfbd86-1b08-4168-8d5b-0f468fe9bbc9	MORONA
t	2025-03-17 21:13:04.227185+00	2025-03-17 21:13:04.227188+00	a8cab72b-b93b-42c1-8e7a-7a849068ff06	c35d368a-d376-4211-876e-9a3feb37e400	PINTO RECODO
t	2025-03-17 21:13:04.232844+00	2025-03-17 21:13:04.232847+00	9d03b26a-13b3-4345-bcd0-9826799240f2	719ca1e2-85aa-4811-87f1-ee903712f816	BERNAL
t	2025-03-17 21:13:04.23765+00	2025-03-17 21:13:04.237654+00	e97135b8-0bdc-4d75-b16a-24ad7ba858c6	da261af9-5596-4188-b73d-5c091ad57d8b	LUCMA
t	2025-03-17 21:13:04.242518+00	2025-03-17 21:13:04.24252+00	cce07e22-93c0-4b39-a2af-5072af9bece7	bbf8aad6-4dd0-482a-884b-0b42f2179319	POSIC
t	2025-03-17 21:13:04.247302+00	2025-03-17 21:13:04.247305+00	0a63f076-d7a1-45d8-a595-e0d8f6576ca7	0653b015-1f1e-4073-b4a6-eddacd4d0018	JUAN GUERRA
t	2025-03-17 21:13:04.252714+00	2025-03-17 21:13:04.252718+00	2c4bb909-0a63-4f30-8f5d-893234c82ba1	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	DANIEL HERNANDEZ
t	2025-03-17 21:13:04.257253+00	2025-03-17 21:13:04.257255+00	19a4afba-627f-4775-aacb-febdd67a0a77	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	LOS OLIVOS
t	2025-03-17 21:13:04.263043+00	2025-03-17 21:13:04.263048+00	e406bf01-961c-4b52-8cd3-b704c1e98622	c5f4a998-3e9d-40be-a280-2d993d49b686	ZURITE
t	2025-03-17 21:13:04.269087+00	2025-03-17 21:13:04.26909+00	7fc92e08-551e-4868-b476-ddfa558dee3f	719ca1e2-85aa-4811-87f1-ee903712f816	BELLAVISTA DE LA UNION
t	2025-03-17 21:13:04.274308+00	2025-03-17 21:13:04.27431+00	fb3e1baa-ecdd-48f5-a768-2efceee60f06	ab26eff7-de79-4815-9cd6-d53359f9d7f1	ZORRITOS
t	2025-03-17 21:13:04.278649+00	2025-03-17 21:13:04.278651+00	530e33de-47c7-460c-b605-63d0dff006dd	c5c7cd7a-16fd-4b52-bc0d-440a4b9ab23c	CAJAMARCA
t	2025-03-17 21:13:04.283366+00	2025-03-17 21:13:04.28337+00	68b5285f-f41e-49c9-869b-13f618fed4ab	3af19559-c0e0-469f-9660-92f10b46789e	MACUSANI
t	2025-03-17 21:13:04.287374+00	2025-03-17 21:13:04.287376+00	e184157b-15df-4b7c-8cd8-74297c3cf693	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	CHARACATO
t	2025-03-17 21:13:04.292748+00	2025-03-17 21:13:04.292751+00	0fcebb6b-d5c9-44b0-94c2-32e9ff0cbed5	5b797ca5-ff5a-496b-bfce-d18fb4e97a04	SEPAHUA
t	2025-03-17 21:13:04.298362+00	2025-03-17 21:13:04.298366+00	2eacb522-4a42-4ff6-807a-22e9d5fa1e74	0653b015-1f1e-4073-b4a6-eddacd4d0018	SAUCE
t	2025-03-17 21:13:04.303508+00	2025-03-17 21:13:04.303511+00	da3e71e2-2f3e-47ee-8de8-20d047c249e5	a6dc953c-4d00-40b8-b291-34929747c50c	MOYOBAMBA
t	2025-03-17 21:13:04.308718+00	2025-03-17 21:13:04.308722+00	f5a01a25-ce71-4c05-9a8e-19e0221c7809	e7815c4d-9487-4bbf-aa91-b30ca9896721	CHARCANA
t	2025-03-17 21:13:04.313611+00	2025-03-17 21:13:04.313614+00	6f7231f0-dcdf-485a-9177-4091136c6fcc	9b57564f-d3d6-466b-8a32-2eb5fab33e6b	COLQUEMARCA
t	2025-03-17 21:13:04.318481+00	2025-03-17 21:13:04.318483+00	8bd4d361-12b0-4284-8850-3beccec80d51	994de1db-2a15-4db0-80a6-4efa76422c2c	CAJACAY
t	2025-03-17 21:13:04.322882+00	2025-03-17 21:13:04.322886+00	4926de98-527d-440b-9c8b-b31f503a4058	e7815c4d-9487-4bbf-aa91-b30ca9896721	PUYCA
t	2025-03-17 21:13:04.32812+00	2025-03-17 21:13:04.328123+00	f9da147b-d9c2-4fcf-8901-ac8d4e13b5a9	fae002ab-c99a-457d-8f6d-9e9964312caf	VILQUE
t	2025-03-17 21:13:04.334457+00	2025-03-17 21:13:04.33446+00	35a24a7e-1162-45b0-93b3-bb087094dedf	ebe625dc-5bbd-47b5-bc9f-797ec65eedef	SAN JOSE DE SISA
t	2025-03-17 21:13:04.34012+00	2025-03-17 21:13:04.340123+00	f78d2774-9e31-4eee-b3ea-d7e0578fbff1	c3464dda-3d6f-443f-a987-ad215194f703	CABANACONDE
t	2025-03-17 21:13:04.345696+00	2025-03-17 21:13:04.345699+00	1dcc0091-d67b-44f0-8987-2036af3b96d5	c44b2db0-1ce6-4816-b16c-975486d5db85	HUAMANTANGA
t	2025-03-17 21:13:04.350757+00	2025-03-17 21:13:04.35076+00	5b9b7617-72c8-4c89-bfda-1609a7031bc6	b6ee8d13-7dc2-42e1-b9f8-4f689751a272	PERENE
t	2025-03-17 21:13:04.356327+00	2025-03-17 21:13:04.35633+00	c340f0eb-4541-4c73-ab8d-eea63b0c486b	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	MOLLEBAYA
t	2025-03-17 21:13:04.361578+00	2025-03-17 21:13:04.361582+00	ff0bf4d2-e44b-497c-b1fb-ea8f5f944f43	6a63b22a-2f1a-4c61-bf16-53cd00081db0	YUPAN
t	2025-03-17 21:13:04.366626+00	2025-03-17 21:13:04.366629+00	11963aba-dd1d-48c0-a05e-67e774fb9e8e	084770c6-2080-4213-abe1-08c62f0eb28b	CANCHAQUE
t	2025-03-17 21:13:04.371642+00	2025-03-17 21:13:04.371644+00	db87b0ef-ad2a-4447-bdc7-e8af0b6d71bd	39b5f4f6-da10-4e59-90a1-ca1e4c8877dc	ROSARIO
t	2025-03-17 21:13:04.376474+00	2025-03-17 21:13:04.376478+00	5000c247-f6ed-41c2-97a1-6f14f84741b2	54874897-aa17-4f9d-aa01-926f71b3bfdc	CHOJATA
t	2025-03-17 21:13:04.382214+00	2025-03-17 21:13:04.382217+00	d9bd61b0-fb57-4aa6-8815-907642af1aa6	071e4b6b-e409-45e8-ab65-9ae4cc94f1b3	POROTO
t	2025-03-17 21:13:04.387515+00	2025-03-17 21:13:04.387517+00	37517f2c-8142-4108-9a92-3035bfdbcab5	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	CARAVELI
t	2025-03-17 21:13:04.392241+00	2025-03-17 21:13:04.392249+00	ae9b7723-be89-488e-91e1-a188979ad79c	e61f54ef-373f-46b9-b05e-bfe23561ec46	QUELLOUNO
t	2025-03-17 21:13:04.396632+00	2025-03-17 21:13:04.396633+00	dd158eb0-220c-497b-8500-6f13445e576d	956d4ecd-a18c-4758-bb6a-cb38c449e32c	LAMPIAN
t	2025-03-17 21:13:04.401669+00	2025-03-17 21:13:04.401671+00	53b14e3d-33ac-4c86-a6f8-a51dd001ba0a	9b57564f-d3d6-466b-8a32-2eb5fab33e6b	QUIÑOTA
t	2025-03-17 21:13:04.40688+00	2025-03-17 21:13:04.406883+00	2d046f01-f9ff-4d30-8664-2cdda915180c	fae002ab-c99a-457d-8f6d-9e9964312caf	MAÑAZO
t	2025-03-17 21:13:04.412046+00	2025-03-17 21:13:04.412049+00	02e1b828-0bb4-4463-9c31-b7d1b179f7fa	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	CHACHAS
t	2025-03-17 21:13:04.416887+00	2025-03-17 21:13:04.41689+00	1237dd73-1e61-491f-a662-55ea3f684315	1baa3fa5-23b2-4611-b753-c56dd60b5f0d	EL ALGARROBAL
t	2025-03-17 21:13:04.422185+00	2025-03-17 21:13:04.422189+00	0e2a34e8-3cca-4b88-972c-2f0999f9bcca	cbc121ea-f1b1-4a06-97cb-c010f63ee492	CACHICADAN
t	2025-03-17 21:13:04.427193+00	2025-03-17 21:13:04.427196+00	3ee831b1-cecc-4672-8e4a-1e40e47f9e4c	994de1db-2a15-4db0-80a6-4efa76422c2c	HUASTA
t	2025-03-17 21:13:04.432607+00	2025-03-17 21:13:04.432609+00	1acd7522-db4a-489f-bda9-92e67f0129d2	e6121f54-624d-44b3-ba2e-d07a7cfe7226	PILPICHACA
t	2025-03-17 21:13:04.437135+00	2025-03-17 21:13:04.437138+00	4933f765-23c8-4027-bf25-61959e409595	57eae5d9-fae5-40b0-808f-4699285c2a8e	YANAOCA
t	2025-03-17 21:13:04.443408+00	2025-03-17 21:13:04.443412+00	835c3b48-dfd5-44f2-bf9e-4e2e1203b0b1	a1f38acb-98af-4cf8-8788-1d479a1e26e3	ILABAYA
t	2025-03-17 21:13:04.449661+00	2025-03-17 21:13:04.449664+00	040263ef-28fd-48b9-8579-77d43487348f	afde374b-f6de-4e26-9694-e2e7378ee275	YAUYA
t	2025-03-17 21:13:04.454356+00	2025-03-17 21:13:04.454359+00	7d86a1e3-7f0c-4ac4-a910-88cdc18ca8b4	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	SAN PEDRO DE CHAULAN
t	2025-03-17 21:13:04.45885+00	2025-03-17 21:13:04.458853+00	8f327c41-fc46-493c-8b0f-d436e11c2c9b	4f439eb6-7ff6-4f79-b681-05e3601f1b33	PAUCARBAMBA
t	2025-03-17 21:13:04.464089+00	2025-03-17 21:13:04.464092+00	8b304af7-08cd-4c8f-8987-7b4579bd6011	029d4c57-b401-421f-beeb-7d0fef5c0dbb	CHIPAO
t	2025-03-17 21:13:04.468898+00	2025-03-17 21:13:04.468901+00	7f8ae1e1-bdf6-40d3-ab8e-ec5d3f636b43	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	LARIA
t	2025-03-17 21:13:04.47375+00	2025-03-17 21:13:04.473753+00	7c4b8abd-6d93-4332-a901-a1e083ca28fc	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	OCROS
t	2025-03-17 21:13:04.478717+00	2025-03-17 21:13:04.47872+00	6f3837f0-ade5-4a7d-bab4-10c3d2291570	5b08eab1-14c5-448c-8832-40f39e2a1840	ACOPIA
t	2025-03-17 21:13:04.483096+00	2025-03-17 21:13:04.483099+00	19a83ee9-4ef7-4d41-9503-23cd1148334f	25d0ad5a-7f16-4975-bcd1-dc9b1d18f30a	HUAMACHUCO
t	2025-03-17 21:13:04.487982+00	2025-03-17 21:13:04.487985+00	7c2c438f-a066-4cb9-a075-0d3d00e573e3	98e65496-68d3-4d43-bddc-22c7631c5b27	AMOTAPE
t	2025-03-17 21:13:04.494209+00	2025-03-17 21:13:04.494213+00	9d51fc92-1e77-47a2-a3dd-30d8511a3e15	4bf4170f-e0ab-484c-8fbf-368ef843dc61	HUARICOLCA
t	2025-03-17 21:13:04.499356+00	2025-03-17 21:13:04.499359+00	e6b79145-d7a2-404f-8e3e-3539afc24cc7	aa8c638e-2ea0-4a72-9668-8057261bbfee	MARIAS
t	2025-03-17 21:13:04.504284+00	2025-03-17 21:13:04.504288+00	0ffe34be-d07e-4173-a2c1-ff69519f5172	8bc9c85c-cc74-48be-979d-07938df4de67	SUSAPAYA
t	2025-03-17 21:13:04.509957+00	2025-03-17 21:13:04.509961+00	1b47d247-2997-46e6-98c3-73d124c9b0c2	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	JACOBO HUNTER
t	2025-03-17 21:13:04.519236+00	2025-03-17 21:13:04.519249+00	0fc945bc-8beb-4cda-bf6f-41fd2b55939a	c9678f77-84c7-4648-9a0c-4e6c0bba1844	TUMBES
t	2025-03-17 21:13:04.525584+00	2025-03-17 21:13:04.525588+00	95470ba8-1084-4d28-8277-a41f9a7c5000	b5c477ac-5c22-4641-a743-47ccf2ee8c59	PARIAHUANCA
t	2025-03-17 21:13:04.531105+00	2025-03-17 21:13:04.531107+00	b4baa756-6f64-476b-90e0-247aa7d3a773	23397af4-baff-4db8-b639-166478d622d1	YONAN
t	2025-03-17 21:13:04.535784+00	2025-03-17 21:13:04.535786+00	4685488c-5778-4416-8c5b-b90cbef5d29b	5250e4c2-488d-4a7d-bdc9-d2633361c510	PUTINA
t	2025-03-17 21:13:04.540127+00	2025-03-17 21:13:04.54013+00	2d962526-0b30-4686-98b4-34beb319a2cb	efdcbed4-4e80-48e7-8992-8191ea2939b8	SAN ANTONIO DE ANTAPARCO
t	2025-03-17 21:13:04.545004+00	2025-03-17 21:13:04.545008+00	e342fab5-f093-4389-8bc8-1ff748916b1c	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	QUEROBAMBA
t	2025-03-17 21:13:04.550129+00	2025-03-17 21:13:04.550132+00	97118920-0781-4aa9-a04f-8e6641fbbcd7	6a0799ec-1dab-4d4c-9e30-0a4123d28996	PATIVILCA
t	2025-03-17 21:13:04.555093+00	2025-03-17 21:13:04.555096+00	5d37d5ce-a330-4ff0-b673-0a1c6bafaf48	e8f3629d-e44f-4811-a9cb-78896582c0f4	MOTUPE
t	2025-03-17 21:13:04.560712+00	2025-03-17 21:13:04.560715+00	c897b4dc-abd9-4f69-b4b2-8cb142d4235c	f25dcc28-5abe-4b1a-bcfe-9de19ced6787	PUSI
t	2025-03-17 21:13:04.565713+00	2025-03-17 21:13:04.565715+00	bea5e212-152e-4e26-b9f1-9fcf8ab4cfa8	14ecad5d-903d-42ac-b037-7f9cdcec77b2	AIJA
t	2025-03-17 21:13:04.571211+00	2025-03-17 21:13:04.571213+00	55da0c8d-f690-47d5-806c-13e9ea12956b	aed4ea90-0fa5-4394-9819-85ab6fdc76a5	COPA
t	2025-03-17 21:13:04.575459+00	2025-03-17 21:13:04.575461+00	db427f07-1aa2-41b9-ad2f-3bae13f9bb86	e02ca1a8-e500-491d-9a6d-69149df77156	MOLINO
t	2025-03-17 21:13:04.581204+00	2025-03-17 21:13:04.581208+00	82598d2f-f6fe-453c-8f9e-ff91da39f6e0	b1206fd6-020d-42a0-a864-feb8643f0013	CASPISAPA
t	2025-03-17 21:13:04.587802+00	2025-03-17 21:13:04.587805+00	228708dd-ec47-4fd9-8722-cc75a813aa51	d49d555e-7431-4c64-a327-7c0eef9a1dc8	JOSE SABOGAL
t	2025-03-17 21:13:04.59375+00	2025-03-17 21:13:04.593753+00	883ab70b-60d9-479e-a62d-46b25a9242bb	029d4c57-b401-421f-beeb-7d0fef5c0dbb	OCAÑA
t	2025-03-17 21:13:04.598606+00	2025-03-17 21:13:04.598609+00	c2f2e8f6-5058-402a-a759-9195c1ea1ce6	071e4b6b-e409-45e8-ab65-9ae4cc94f1b3	VICTOR LARCO HERRERA
t	2025-03-17 21:13:04.603732+00	2025-03-17 21:13:04.603735+00	e226c137-2242-46b1-b23e-0a6f256395cb	cbc121ea-f1b1-4a06-97cb-c010f63ee492	MOLLEBAMBA
t	2025-03-17 21:13:04.608708+00	2025-03-17 21:13:04.608711+00	70df583b-436e-43c9-8475-0cd846f3eeb2	1a124fda-ccb8-45b3-b69b-e0453133d8d8	CASTILLO GRANDE
t	2025-03-17 21:13:04.613721+00	2025-03-17 21:13:04.613724+00	62607a3d-66ce-4724-90be-513c14199464	9b57564f-d3d6-466b-8a32-2eb5fab33e6b	CAPACMARCA
t	2025-03-17 21:13:04.618466+00	2025-03-17 21:13:04.618469+00	8b8fe1c6-0d07-4bd9-8dda-42a0de3424c2	46a0b504-382b-4799-85d6-225617d83360	CHIGUIRIP
t	2025-03-17 21:13:04.623199+00	2025-03-17 21:13:04.623202+00	3fb51cb7-49a0-4016-a9ef-efd91ab570a6	c5c7cd7a-16fd-4b52-bc0d-440a4b9ab23c	COSPAN
t	2025-03-17 21:13:04.628343+00	2025-03-17 21:13:04.628346+00	76e22783-2024-4965-9735-d77681317e33	e8f3629d-e44f-4811-a9cb-78896582c0f4	ILLIMO
t	2025-03-17 21:13:04.632179+00	2025-03-17 21:13:04.632181+00	f44fbc34-18f6-4e93-8ea2-93ddd23a648a	e25f8297-7651-4d13-b583-e83edec11bc7	UTCO
t	2025-03-17 21:13:04.637214+00	2025-03-17 21:13:04.637217+00	7f413703-d8bc-4497-bf04-267920f3e731	48baea8d-1683-43d2-80ed-35ccb06c4f37	SAYAPULLO
t	2025-03-17 21:13:04.641717+00	2025-03-17 21:13:04.641719+00	32bced8d-4213-4739-8583-6d30a32144ee	a8a4b3eb-833f-4269-98b8-d5e76c3fb74c	HUARANGO
t	2025-03-17 21:13:04.64655+00	2025-03-17 21:13:04.646553+00	9e4c344b-530e-4a49-8172-a00b4c427fe6	b42841e0-44d6-4122-9396-858f0fbf2b1d	UCO
t	2025-03-17 21:13:04.651559+00	2025-03-17 21:13:04.651562+00	44258ff0-5382-4ec7-bdd4-bcc7818fa974	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	RICRAN
t	2025-03-17 21:13:04.657024+00	2025-03-17 21:13:04.657026+00	b1358848-5f5d-4fa8-9e4e-31ffd331f80f	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	HUAYLILLAS
t	2025-03-17 21:13:04.661802+00	2025-03-17 21:13:04.661805+00	92d019d3-aed5-434f-ad83-e36168b3fa59	b42841e0-44d6-4122-9396-858f0fbf2b1d	SAN PEDRO DE CHANA
t	2025-03-17 21:13:04.666925+00	2025-03-17 21:13:04.666927+00	1cf23657-32cc-4a01-a3a3-396131364e4a	6e015257-6f7e-48cf-b9c0-a24502cdcc21	CHACAPAMPA
t	2025-03-17 21:13:04.671498+00	2025-03-17 21:13:04.6715+00	c9db644a-67c2-4af2-b5ad-10f3909d4488	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	QUISQUI
t	2025-03-17 21:13:04.6761+00	2025-03-17 21:13:04.676102+00	d6003305-c1ad-4e5f-877e-f51c430d2633	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	BARRANCO
t	2025-03-17 21:13:04.681589+00	2025-03-17 21:13:04.681594+00	49c11f15-6b17-4417-9e87-20780a3ae9f8	12f1d3ac-6d49-46b4-8553-07f33b5be588	SAN BERNARDINO
t	2025-03-17 21:13:04.686925+00	2025-03-17 21:13:04.686928+00	9f8bebf5-0402-4a43-9e42-d9ce31218c4a	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	SAN FRANCISCO DE DAGUAS
t	2025-03-17 21:13:04.692562+00	2025-03-17 21:13:04.692565+00	404f8dd5-d64a-439a-8a2d-03604fc3d4c5	10923be8-8983-423b-9d2e-5cceef4d9ebd	PACAYCASA
t	2025-03-17 21:13:04.697861+00	2025-03-17 21:13:04.697864+00	0a3ff9d1-94bd-42db-ad93-1d69b568e3b7	6a0799ec-1dab-4d4c-9e30-0a4123d28996	BARRANCA
t	2025-03-17 21:13:04.703758+00	2025-03-17 21:13:04.703762+00	f74b69ce-5617-4798-a116-a8f95c5ab7eb	2c09bf48-31df-47d1-bf45-11d7695ea002	CHICLA
t	2025-03-17 21:13:04.709016+00	2025-03-17 21:13:04.709018+00	5f898f76-7c1e-4f9a-bd90-19b6016994a9	57eae5d9-fae5-40b0-808f-4699285c2a8e	TUPAC AMARU
t	2025-03-17 21:13:04.713052+00	2025-03-17 21:13:04.713054+00	d6556185-4724-4ca2-9152-aedb7b1b6eee	b1166054-2099-441c-ba5d-e67d7e1d0645	PAMPAS CHICO
t	2025-03-17 21:13:04.717527+00	2025-03-17 21:13:04.717528+00	806700f8-5d3d-4f82-a23a-d8ce179d71bf	ae046f24-a6bc-4f31-a81c-2bca0c494b67	EMILIO SAN MARTIN
t	2025-03-17 21:13:04.722928+00	2025-03-17 21:13:04.722932+00	70988611-e8e6-44e2-be5c-74130d1a6f69	f6729187-58e1-4607-8b37-0b2db196f283	CASTROVIRREYNA
t	2025-03-17 21:13:04.728721+00	2025-03-17 21:13:04.728726+00	edac83dd-7332-4617-93f7-5dc5a75343d5	46a0b504-382b-4799-85d6-225617d83360	CHOTA
t	2025-03-17 21:13:04.733879+00	2025-03-17 21:13:04.733883+00	6293cfd2-47d4-48e5-a77b-40e5d7893f45	6eca8b97-dbde-4058-8fc8-4b86feb3307c	ALTO INAMBARI
t	2025-03-17 21:13:04.738741+00	2025-03-17 21:13:04.738743+00	b693638f-fbb1-41af-9b69-39860a0284f6	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	SALITRAL
t	2025-03-17 21:13:04.743186+00	2025-03-17 21:13:04.743188+00	18691bd3-b793-4d8f-8642-ce0431c60af9	109a4db0-2e12-4674-ab1f-9417d1664661	IPARIA
t	2025-03-17 21:13:04.748669+00	2025-03-17 21:13:04.748674+00	9ad8c713-fa31-4a61-a123-06e4e683a196	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	BULDIBUYO
t	2025-03-17 21:13:04.754795+00	2025-03-17 21:13:04.754798+00	b0e394c3-2734-4733-99af-2db55ef4555e	e5987227-df60-4b9e-a9c8-ef624979e917	ALCAMENCA
t	2025-03-17 21:13:04.759855+00	2025-03-17 21:13:04.759858+00	e6af338d-64c0-44d2-a236-2150a8dcd04e	dce0a035-d91c-4f0a-a10f-aefa48915118	LOS MOROCHUCOS
t	2025-03-17 21:13:04.765331+00	2025-03-17 21:13:04.765334+00	11cc97f8-43a7-4c63-94bd-18b41255765f	8f671c0f-3e82-43ae-ad5a-480f8bc815d4	IMAZA
t	2025-03-17 21:13:04.771204+00	2025-03-17 21:13:04.771207+00	bf7b334a-c210-43a0-bb8d-e05bb6b107e2	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	PAMPACOLCA
t	2025-03-17 21:13:04.776169+00	2025-03-17 21:13:04.776171+00	7fb76634-2860-4e7b-adcf-ff6080a4e096	013c5ed1-ba41-4d8c-a7da-845849a7efb9	COLCABAMBA
t	2025-03-17 21:13:04.781041+00	2025-03-17 21:13:04.781044+00	627c7fe4-decb-4bc9-b026-6797f1ce560c	1e747a8b-ad85-4e35-ad63-70fb3ad6da2d	SAPILLICA
t	2025-03-17 21:13:04.786986+00	2025-03-17 21:13:04.786988+00	00482ca6-ca40-4da0-ab4f-9700eef0d17e	aa997785-178f-4ee0-ae0b-199383726bc3	URARINAS
t	2025-03-17 21:13:04.791318+00	2025-03-17 21:13:04.791321+00	15b69d62-7bcc-4bb5-8594-e3bad64f8f9c	e6121f54-624d-44b3-ba2e-d07a7cfe7226	LARAMARCA
t	2025-03-17 21:13:04.79607+00	2025-03-17 21:13:04.796073+00	ef75293e-2624-427b-9a05-7ab1319766bc	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	PUCUSANA
t	2025-03-17 21:13:04.80047+00	2025-03-17 21:13:04.800473+00	7e722485-6740-4c5f-bdc2-4fd06107a9fc	74f3454f-27d1-4e37-aac7-283f27a56308	CASMA
t	2025-03-17 21:13:04.805602+00	2025-03-17 21:13:04.805604+00	522bb961-d595-4398-aa0f-6786c3fafb7f	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	SAN LUIS DE LUCMA
t	2025-03-17 21:13:04.811723+00	2025-03-17 21:13:04.811726+00	c76a4b6b-0aa7-414a-962c-32c612f775a4	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	SAN JUAN DE CUTERVO
t	2025-03-17 21:13:04.816759+00	2025-03-17 21:13:04.816761+00	a5f49b70-c561-4806-b0a0-0c25b52a5913	e7d5b8b6-66d7-4611-ad0f-4ea3be3ebeec	GOYLLARISQUIZGA
t	2025-03-17 21:13:04.820663+00	2025-03-17 21:13:04.820665+00	4394da26-7314-4b01-9a83-5115033ff53e	6e015257-6f7e-48cf-b9c0-a24502cdcc21	HUACRAPUQUIO
t	2025-03-17 21:13:04.82494+00	2025-03-17 21:13:04.824944+00	22e430a3-6dd2-4f11-a799-4f7c6cf15bd8	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	PIAS
t	2025-03-17 21:13:04.830926+00	2025-03-17 21:13:04.830929+00	00a73dfa-ebdd-4102-b95a-3d658168ee70	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	PIMPINGOS
t	2025-03-17 21:13:04.836939+00	2025-03-17 21:13:04.836942+00	c4b765e4-5037-481f-bae1-d5ce17655ae2	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	SONCHE
t	2025-03-17 21:13:04.842325+00	2025-03-17 21:13:04.842327+00	aaf960f9-4a19-4949-81ef-3322b3cec639	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	MOLINOS
t	2025-03-17 21:13:04.847129+00	2025-03-17 21:13:04.847131+00	a514fc9d-927a-45e0-a017-f38dcdeb2e43	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	LUCRE
t	2025-03-17 21:13:04.851523+00	2025-03-17 21:13:04.851526+00	b4b5c588-fab3-4d22-8fa1-dd36b85246ac	4867fc63-7654-417d-8cb7-fd0de85acb77	BOQUERON
t	2025-03-17 21:13:04.855976+00	2025-03-17 21:13:04.855979+00	1a5fcd6b-290e-4522-a8b5-8aceedb5f006	50381126-eaca-4e9d-9688-2d0ed3c35612	TUMAN
t	2025-03-17 21:13:04.860807+00	2025-03-17 21:13:04.86081+00	12d5f9f0-837f-4d27-88d4-d2921651c5b8	802f9e1a-4b36-4787-ae41-e5aaca68da54	SAN JUAN DE JARPA
t	2025-03-17 21:13:04.865577+00	2025-03-17 21:13:04.86558+00	4a1fa90a-2abc-40f1-a0f7-e0a1a08ef5fc	cf7fa8b0-e545-40b4-99eb-d431d72c6c8d	YAMON
t	2025-03-17 21:13:04.870496+00	2025-03-17 21:13:04.870499+00	5ae29ce9-7e23-4630-87a1-db3de1c82616	cd1a779c-e303-4241-b40f-3a8bd328ae2a	TINGO
t	2025-03-17 21:13:04.876537+00	2025-03-17 21:13:04.876541+00	8942b635-850a-420d-b2a9-4dbbc71d841c	a4dc3a42-25f5-4178-a9e7-66ef66e42aeb	MOROCOCHA
t	2025-03-17 21:13:04.882364+00	2025-03-17 21:13:04.882367+00	e93b8d91-922b-4637-a26a-f3c591b8679d	e09f0261-1ea3-4fd7-a601-d7077e27ff43	OXAPAMPA
t	2025-03-17 21:13:04.888395+00	2025-03-17 21:13:04.888399+00	537319ac-9efa-4076-a289-a4dc7d03a0d4	48baea8d-1683-43d2-80ed-35ccb06c4f37	MARMOT
t	2025-03-17 21:13:04.894401+00	2025-03-17 21:13:04.894406+00	611eca56-18ff-486c-94ab-0f2895d123f1	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SAN BARTOLO
t	2025-03-17 21:13:04.903004+00	2025-03-17 21:13:04.903008+00	3de962fc-6b34-4d7d-b15f-f34f739d6f39	0f00ebe8-c4f5-448e-a160-9c459750cf50	TOCACHE
t	2025-03-17 21:13:04.910481+00	2025-03-17 21:13:04.910485+00	237521c7-ba2c-44de-a168-60e39f24d4be	63916004-9475-4b57-a40b-f707c2be8d2d	SAN PEDRO DE HUACARPANA
t	2025-03-17 21:13:04.916817+00	2025-03-17 21:13:04.91682+00	bba4846c-5e11-4fdb-912a-1c845e08ed2f	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	UCHUMAYO
t	2025-03-17 21:13:04.922714+00	2025-03-17 21:13:04.922717+00	8a9d4cb3-407b-4ae3-99d9-d9a1798e9e1e	a154aa5a-7dee-47d6-8448-b6744a59812d	CALETA DE CARQUIN
t	2025-03-17 21:13:04.929019+00	2025-03-17 21:13:04.929022+00	f5fa2fd4-f6c5-4488-bde9-52d2d01a6bad	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	LIMA
t	2025-03-17 21:13:04.934405+00	2025-03-17 21:13:04.934408+00	9478054b-953d-4af7-b4e3-9af9092609fd	b1206fd6-020d-42a0-a864-feb8643f0013	PILLUANA
t	2025-03-17 21:13:04.939837+00	2025-03-17 21:13:04.93984+00	06ea1c8c-7447-49f3-ade3-25526be7b64e	3802be26-bb36-4da3-9d01-4b889d15548f	PARATIA
t	2025-03-17 21:13:04.945183+00	2025-03-17 21:13:04.945184+00	9abc5464-249b-47d7-95e2-f35332bd675b	87327c56-b236-4368-b80b-34d9952243ac	PISCOYACU
t	2025-03-17 21:13:04.952589+00	2025-03-17 21:13:04.952594+00	1ba8677e-4e56-4565-9e15-1d1badadbe18	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	SAN PEDRO DE CHUNAN
t	2025-03-17 21:13:04.958567+00	2025-03-17 21:13:04.958569+00	d6fd2747-3367-4e6a-abf4-305b28aa4e3c	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	LA ESPERANZA
t	2025-03-17 21:13:04.964202+00	2025-03-17 21:13:04.964204+00	6d0a1e62-703c-45bc-a866-9ccd33bf0301	4c515df3-386f-4376-a901-eb9876ac20da	CASCAPARA
t	2025-03-17 21:13:04.970357+00	2025-03-17 21:13:04.97036+00	3605fb4c-70d7-40d3-91b0-61e6d2cffd25	e5987227-df60-4b9e-a9c8-ef624979e917	VILCANCHOS
t	2025-03-17 21:13:04.975557+00	2025-03-17 21:13:04.97556+00	0a3dc00f-dff6-4352-9d56-95362362b2ef	54874897-aa17-4f9d-aa01-926f71b3bfdc	YUNGA
t	2025-03-17 21:13:04.980794+00	2025-03-17 21:13:04.980797+00	5052e8c9-0355-4f49-a23a-a3483e549911	8ae34c95-7c05-4880-915b-49c44ac13bd1	JEQUETEPEQUE
t	2025-03-17 21:13:04.987495+00	2025-03-17 21:13:04.987498+00	872ed0a2-4df6-47c7-9ffb-900daf7a4f47	802f9e1a-4b36-4787-ae41-e5aaca68da54	CHONGOS BAJO
t	2025-03-17 21:13:04.994895+00	2025-03-17 21:13:04.994899+00	33f04c31-62f4-4427-aab0-daf57e5e79e2	4d11370d-0157-4af4-b89d-731e4516658a	INCLAN
t	2025-03-17 21:13:05.000983+00	2025-03-17 21:13:05.000986+00	ed51788d-68b8-4ab7-8f8d-a16247f1e279	74f3454f-27d1-4e37-aac7-283f27a56308	COMANDANTE NOEL
t	2025-03-17 21:13:05.008176+00	2025-03-17 21:13:05.008181+00	99665d0f-279a-43e0-8c57-79c482cc9b1f	cc76f1f4-59f8-477e-ab55-63ef31302138	LIMABAMBA
t	2025-03-17 21:13:05.014211+00	2025-03-17 21:13:05.014215+00	8d9841d6-a4f8-4014-ae7d-c5aefb2fd0bc	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	TUPE
t	2025-03-17 21:13:05.021395+00	2025-03-17 21:13:05.021399+00	f72bf59b-332e-43d2-9e0d-3d29656b3442	186355ca-8fe2-4aa6-8445-132b479de1b5	CHOLON
t	2025-03-17 21:13:05.028277+00	2025-03-17 21:13:05.028286+00	da1c51c8-248f-427a-bc83-8ae3b70e662e	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	LEIMEBAMBA
t	2025-03-17 21:13:05.033486+00	2025-03-17 21:13:05.033488+00	61430f52-0145-43ed-9bc9-3c919fa5bd52	9d7bb05d-7107-41b7-8fc0-29d110e2992d	URANMARCA
t	2025-03-17 21:13:05.03785+00	2025-03-17 21:13:05.037853+00	279c6732-668a-453a-ad0a-b0bea72c5d77	ea1da671-28f3-4192-ac87-6c6d5c9f5967	POMAHUACA
t	2025-03-17 21:13:05.043737+00	2025-03-17 21:13:05.04374+00	117c5341-d923-4af6-a8d8-eb473b534ce1	3c8af264-3631-4747-a2a2-7b153fa4b672	HUANCARAMA
t	2025-03-17 21:13:05.04896+00	2025-03-17 21:13:05.048963+00	214c3637-bef9-4b0e-b536-6572a9f9c3e0	c35d368a-d376-4211-876e-9a3feb37e400	ZAPATERO
t	2025-03-17 21:13:05.055151+00	2025-03-17 21:13:05.055156+00	08c45ceb-1fb6-482b-b67d-356178619bb8	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	VILLA EL SALVADOR
t	2025-03-17 21:13:05.061015+00	2025-03-17 21:13:05.061019+00	562b3b64-e8d5-495f-a3bb-acc8b21f0a55	87327c56-b236-4368-b80b-34d9952243ac	SACANCHE
t	2025-03-17 21:13:05.066493+00	2025-03-17 21:13:05.066496+00	52d58f04-4f1b-4086-a029-2d4cd0dbea36	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	LA RAMADA
t	2025-03-17 21:13:05.071867+00	2025-03-17 21:13:05.071869+00	483c19b2-3305-42b4-a0bf-cf853710b5ba	cd1a779c-e303-4241-b40f-3a8bd328ae2a	OCALLI
t	2025-03-17 21:13:05.076961+00	2025-03-17 21:13:05.076966+00	7a73b2a4-7c3b-4090-87cc-55ff2706d0b6	956d4ecd-a18c-4758-bb6a-cb38c449e32c	SAN MIGUEL DE ACOS
t	2025-03-17 21:13:05.084729+00	2025-03-17 21:13:05.084734+00	cf01869a-f7f2-40ac-a3d2-37801bd8399b	e8f3629d-e44f-4811-a9cb-78896582c0f4	JAYANCA
t	2025-03-17 21:13:05.090878+00	2025-03-17 21:13:05.090881+00	49c82785-531d-4e5a-8b11-c7c0ddc3d513	ab26eff7-de79-4815-9cd6-d53359f9d7f1	CASITAS
t	2025-03-17 21:13:05.098209+00	2025-03-17 21:13:05.098212+00	59a8f122-1e04-4373-b190-ad9048317734	8eb85dc7-057c-4c9c-890b-3fc9f739fba7	YAURISQUE
t	2025-03-17 21:13:05.10533+00	2025-03-17 21:13:05.105336+00	47a15ef8-0514-491c-b671-35cd966d68e0	dd0e7397-1a90-4e9b-b393-7faa473b1ad5	SACSAMARCA
t	2025-03-17 21:13:05.112065+00	2025-03-17 21:13:05.112071+00	24a6ffe1-032f-4ab7-9539-509f7914c1f9	c3464dda-3d6f-443f-a987-ad215194f703	MADRIGAL
t	2025-03-17 21:13:05.119318+00	2025-03-17 21:13:05.119321+00	3c55e094-2b25-4770-b0b9-fd0386d87213	23397af4-baff-4db8-b639-166478d622d1	CUPISNIQUE
t	2025-03-17 21:13:05.126644+00	2025-03-17 21:13:05.126649+00	646392cd-a4e8-4c21-84a8-bacec361b2a1	0c319822-58c6-435a-ab75-c3c72db37ed8	PALLANCHACRA
t	2025-03-17 21:13:05.132853+00	2025-03-17 21:13:05.132855+00	5456b2ae-5384-4ba2-ae37-3c285b228474	e09f0261-1ea3-4fd7-a601-d7077e27ff43	PALCAZU
t	2025-03-17 21:13:05.138296+00	2025-03-17 21:13:05.138299+00	f44ad57a-f601-405b-8b9b-5638a69d7b08	c3464dda-3d6f-443f-a987-ad215194f703	MAJES
t	2025-03-17 21:13:05.144639+00	2025-03-17 21:13:05.144644+00	87189ec9-d4ef-4ba2-80af-a7b89a0e4d69	c745de6d-713a-4613-951f-05d16e86739b	MARIANO NICOLAS VALCARCEL
t	2025-03-17 21:13:05.15083+00	2025-03-17 21:13:05.150833+00	d93fd3b0-a78d-4872-8e8f-89179b255f64	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	JANJAILLO
t	2025-03-17 21:13:05.157193+00	2025-03-17 21:13:05.157196+00	d5bdf3e3-e660-44d7-af0b-2765d117df9d	4d11370d-0157-4af4-b89d-731e4516658a	SAMA
t	2025-03-17 21:13:05.162558+00	2025-03-17 21:13:05.162562+00	f865b0c6-fde9-470e-98bd-e5a6ebd9a65e	a4dc3a42-25f5-4178-a9e7-66ef66e42aeb	CHACAPALPA
t	2025-03-17 21:13:05.169361+00	2025-03-17 21:13:05.169366+00	02dbab46-a044-436a-9f13-ea9650dd3e94	3802be26-bb36-4da3-9d01-4b889d15548f	NICASIO
t	2025-03-17 21:13:05.175152+00	2025-03-17 21:13:05.175154+00	428bd9a9-3f7e-461d-aea9-3c2be0baa75b	6e015257-6f7e-48cf-b9c0-a24502cdcc21	SAÑO
t	2025-03-17 21:13:05.180291+00	2025-03-17 21:13:05.180297+00	f048fc99-9e5b-4598-a7dc-2a269dbfcf3c	f1f444d7-6007-4f07-be39-a71d94b84ca7	ORURILLO
t	2025-03-17 21:13:05.185685+00	2025-03-17 21:13:05.185688+00	68e1f94c-f56e-42d8-b63d-995e13766bce	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	SANTA RITA DE SIGUAS
t	2025-03-17 21:13:05.19104+00	2025-03-17 21:13:05.191042+00	7b2c6536-759c-444d-be41-6094322d5368	e42231e6-aaee-4ff1-b63a-6fe0f1417241	PARIÑAS
t	2025-03-17 21:13:05.197235+00	2025-03-17 21:13:05.197237+00	d266d245-455e-4a46-b375-d3e012a86fab	4f006a58-9e1b-4e72-85ce-4ae912b8cc5c	ANAPIA
t	2025-03-17 21:13:05.203554+00	2025-03-17 21:13:05.203556+00	6e4b56ed-1375-4b93-adcc-ab14914d79fa	aa8c638e-2ea0-4a72-9668-8057261bbfee	SILLAPATA
t	2025-03-17 21:13:05.209461+00	2025-03-17 21:13:05.209464+00	305c2908-9d17-4064-934c-b232aaf25271	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	BELLA UNION
t	2025-03-17 21:13:05.214007+00	2025-03-17 21:13:05.214009+00	f777f738-c8e2-4037-ab26-c4d40672c93a	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	SINCOS
t	2025-03-17 21:13:05.218379+00	2025-03-17 21:13:05.218381+00	7d0a17e2-6f31-4da5-9725-33881a302380	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	SAÑAYCA
t	2025-03-17 21:13:05.223036+00	2025-03-17 21:13:05.223039+00	f7df0164-039e-475a-9a6c-c2a14c4fb103	084770c6-2080-4213-abe1-08c62f0eb28b	SONDOR
t	2025-03-17 21:13:05.228428+00	2025-03-17 21:13:05.228432+00	526928b4-8389-4b63-91c1-f54c5afe4e48	a75e913b-1a31-4ba6-89c1-ef135099a204	COYA
t	2025-03-17 21:13:05.23407+00	2025-03-17 21:13:05.234074+00	dd74177f-ef10-4365-8eaa-25fe405d6966	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	MONOBAMBA
t	2025-03-17 21:13:05.238692+00	2025-03-17 21:13:05.238694+00	cb5a8860-f4b3-4c72-8015-11990077cb55	e02ca1a8-e500-491d-9a6d-69149df77156	UMARI
t	2025-03-17 21:13:05.243736+00	2025-03-17 21:13:05.243738+00	1227d839-36e4-4c49-aa70-969beb04e443	b6ee8d13-7dc2-42e1-b9f8-4f689751a272	PICHANAQUI
t	2025-03-17 21:13:05.24864+00	2025-03-17 21:13:05.248641+00	52f3c0bb-239e-4aee-a5bb-7f86592de6e8	d49d555e-7431-4c64-a327-7c0eef9a1dc8	PEDRO GALVEZ
t	2025-03-17 21:13:05.253129+00	2025-03-17 21:13:05.253132+00	598b9014-4bc2-4539-8a02-ec69a5f13297	42a3655b-687b-424b-a374-b0ab58d4f011	SAMANCO
t	2025-03-17 21:13:05.2584+00	2025-03-17 21:13:05.258401+00	2bcb8956-a047-4eab-ac46-f5169afe6d18	c66aef47-44ba-4f3a-bbf9-d3c3f463de54	FERREÑAFE
t	2025-03-17 21:13:05.26339+00	2025-03-17 21:13:05.263393+00	da11d66d-ff1b-4db8-8bbd-5e0477c050d6	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	CARANIA
t	2025-03-17 21:13:05.268279+00	2025-03-17 21:13:05.268283+00	b701dc54-8101-4728-9df4-54c366ad3746	6a5cf9a4-6f24-4a7e-b672-4b80cc5aecf7	CARHUAMAYO
t	2025-03-17 21:13:05.273842+00	2025-03-17 21:13:05.273843+00	ca4695cb-d70d-4acf-b24d-36da0ae41422	b5c477ac-5c22-4641-a743-47ccf2ee8c59	YUNGAR
t	2025-03-17 21:13:05.277834+00	2025-03-17 21:13:05.277836+00	71f6659d-ed6d-4367-a3d3-156b16ca59dc	50381126-eaca-4e9d-9688-2d0ed3c35612	SAÑA
t	2025-03-17 21:13:05.282093+00	2025-03-17 21:13:05.282096+00	e7934575-7fe0-41de-b186-97f4b04406c7	b42841e0-44d6-4122-9396-858f0fbf2b1d	SAN MARCOS
t	2025-03-17 21:13:05.287144+00	2025-03-17 21:13:05.287147+00	d1287d20-12eb-4991-b1a1-d7812ccdfaac	4c515df3-386f-4376-a901-eb9876ac20da	YUNGAY
t	2025-03-17 21:13:05.292514+00	2025-03-17 21:13:05.292519+00	87430096-4a92-4229-b938-e21d78891f95	c790e80f-15e1-4e44-b272-1ef57bb9c991	LA CUESTA
t	2025-03-17 21:13:05.29883+00	2025-03-17 21:13:05.298835+00	d6ca3341-7344-4c30-abb4-805f335fd0e0	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	LOMAS
t	2025-03-17 21:13:05.304413+00	2025-03-17 21:13:05.304418+00	148b63d4-a930-4b58-8977-cb165dd24ca2	6b370b4c-d286-40a1-8217-ee8f69ab0c0f	UPAHUACHO
t	2025-03-17 21:13:05.310514+00	2025-03-17 21:13:05.310516+00	6fded946-df74-4963-b7b6-eddd36b7a242	cf4cb352-ae23-46de-9fc3-a94554ae89dd	SAN FRANCISCO
t	2025-03-17 21:13:05.315768+00	2025-03-17 21:13:05.315777+00	4dc7ee03-380f-4029-9782-1ae0b083daea	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	SAN PEDRO DE PILAS
t	2025-03-17 21:13:05.321454+00	2025-03-17 21:13:05.321456+00	dc36652a-1093-4a19-91c1-1846820fb05a	cd1a779c-e303-4241-b40f-3a8bd328ae2a	LONYA CHICO
t	2025-03-17 21:13:05.326814+00	2025-03-17 21:13:05.326817+00	eb38cf32-173c-488f-914d-2a4b9f37e43d	a6dc953c-4d00-40b8-b291-34929747c50c	YANTALO
t	2025-03-17 21:13:05.332278+00	2025-03-17 21:13:05.332282+00	ba1b165a-22c2-4469-a720-0340888794bb	c3464dda-3d6f-443f-a987-ad215194f703	TUTI
t	2025-03-17 21:13:05.337947+00	2025-03-17 21:13:05.337951+00	91bec491-fb5c-49a5-b534-b6270c564168	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	AMARILIS
t	2025-03-17 21:13:05.343858+00	2025-03-17 21:13:05.343862+00	96b025c7-02ce-4de9-b9c9-40a2824fa9a1	6e015257-6f7e-48cf-b9c0-a24502cdcc21	INGENIO
t	2025-03-17 21:13:05.348738+00	2025-03-17 21:13:05.34874+00	e03ba09e-0a31-4848-9dec-5f11fd132319	3af19559-c0e0-469f-9660-92f10b46789e	USICAYOS
t	2025-03-17 21:13:05.353343+00	2025-03-17 21:13:05.353346+00	e8427866-8c94-4f48-ac04-1113cb230608	74b3890f-d58c-4d92-b653-e1ceec0d1b55	PARCONA
t	2025-03-17 21:13:05.358558+00	2025-03-17 21:13:05.358561+00	b01d3b5b-8704-45cc-bc11-d0d4ce749e51	9d7bb05d-7107-41b7-8fc0-29d110e2992d	ROCCHACC
t	2025-03-17 21:13:05.364079+00	2025-03-17 21:13:05.364082+00	233796b9-2acd-4e5a-a068-5c4aa95b1275	26dfbd86-1b08-4168-8d5b-0f468fe9bbc9	CAHUAPANAS
t	2025-03-17 21:13:05.369225+00	2025-03-17 21:13:05.369231+00	53adb771-bf60-4c3d-8b35-07e0aa6c6dae	10923be8-8983-423b-9d2e-5cceef4d9ebd	JESUS NAZARENO
t	2025-03-17 21:13:05.373859+00	2025-03-17 21:13:05.37386+00	4cd51281-808c-47e3-9af1-10c8957eec85	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	SAN PEDRO
t	2025-03-17 21:13:05.378077+00	2025-03-17 21:13:05.378079+00	40aaed14-690b-4e97-abfd-93ce7607b47a	87e9d712-7fef-4f4e-a7d1-111e719950ce	MARCAPATA
t	2025-03-17 21:13:05.382724+00	2025-03-17 21:13:05.382726+00	66208d4f-391a-4413-8640-44e818ee8a77	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	JULCAN
t	2025-03-17 21:13:05.387379+00	2025-03-17 21:13:05.387382+00	3acccae3-f047-4075-9254-5bdeb7f10dd1	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	LA MOLINA
t	2025-03-17 21:13:05.392954+00	2025-03-17 21:13:05.392958+00	eb042c82-58de-4d2d-b2ba-646124c84ee7	e6121f54-624d-44b3-ba2e-d07a7cfe7226	AYAVI
t	2025-03-17 21:13:05.398338+00	2025-03-17 21:13:05.398341+00	6ecf50c0-7bdf-4856-b0ea-edfbacc87195	cd1a779c-e303-4241-b40f-3a8bd328ae2a	INGUILPATA
t	2025-03-17 21:13:05.404547+00	2025-03-17 21:13:05.404549+00	e042fc70-935d-4e38-aa64-1f739bf896e2	49d2b1fe-f699-429b-b6d9-384cb23f8b04	INAHUAYA
t	2025-03-17 21:13:05.409377+00	2025-03-17 21:13:05.409379+00	aadf6a17-718f-4feb-8504-0f0c378dd0a1	f25dcc28-5abe-4b1a-bcfe-9de19ced6787	INCHUPALLA
t	2025-03-17 21:13:05.414107+00	2025-03-17 21:13:05.41411+00	fcd36c10-f295-4996-9686-6e02a79028b4	6198f919-cc14-48e2-bc8f-cd4799b8f49b	CHALLABAMBA
t	2025-03-17 21:13:05.418576+00	2025-03-17 21:13:05.418579+00	cae03bf5-c220-4a4b-aa97-6d14d7ae0c86	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	SAN JUAN DE TARUCANI
t	2025-03-17 21:13:05.423802+00	2025-03-17 21:13:05.423805+00	01a1b9a4-c2f1-4342-8267-5cb8ebeb1ee2	83a45ddf-481f-4760-86f7-5d5ba4423a89	VEINTISEIS DE OCTUBRE
t	2025-03-17 21:13:05.428853+00	2025-03-17 21:13:05.428855+00	c6c217c8-2bd6-46c0-b69d-533aa65b1fe7	5b797ca5-ff5a-496b-bfce-d18fb4e97a04	YURUA
t	2025-03-17 21:13:05.433484+00	2025-03-17 21:13:05.433487+00	9c10f97e-d426-4cf2-abc8-44b18e9500d1	5b08eab1-14c5-448c-8832-40f39e2a1840	ACOMAYO
t	2025-03-17 21:13:05.438071+00	2025-03-17 21:13:05.438073+00	f651e421-100c-490b-ad6a-2af8b593c014	a3e76f78-476b-4191-8337-9b5b285b15de	PUNCHAO
t	2025-03-17 21:13:05.443767+00	2025-03-17 21:13:05.443776+00	a4f95ce9-5a93-4776-9fd0-c7cc4d1f0b24	35972dee-bd82-40d7-aad3-b6f032924ddd	TURPAY
t	2025-03-17 21:13:05.449889+00	2025-03-17 21:13:05.449892+00	10e1fe2c-6d60-461e-b2b7-86be2c5aaa40	37fe07d1-74f8-4777-941d-ba51afc1c160	PISACOMA
t	2025-03-17 21:13:05.455948+00	2025-03-17 21:13:05.455951+00	30063f5e-1673-4715-a43b-df6672662e96	a6dc953c-4d00-40b8-b291-34929747c50c	SORITOR
t	2025-03-17 21:13:05.46088+00	2025-03-17 21:13:05.460883+00	aedb43bf-5180-40c9-b284-6cd2edd17c0e	e61f54ef-373f-46b9-b05e-bfe23561ec46	VILLA VIRGEN
t	2025-03-17 21:13:05.465482+00	2025-03-17 21:13:05.465484+00	7154424b-1531-4111-bd5c-b040df763e17	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	SEXI
t	2025-03-17 21:13:05.470114+00	2025-03-17 21:13:05.470116+00	ed5287f2-d143-4729-8237-b710411f202b	b1166054-2099-441c-ba5d-e67d7e1d0645	TICAPAMPA
t	2025-03-17 21:13:05.474272+00	2025-03-17 21:13:05.474274+00	6a1ec223-f4fb-4387-b420-7c61fefddb2d	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	AYAHUANCO
t	2025-03-17 21:13:05.478743+00	2025-03-17 21:13:05.478747+00	f51060d6-968b-41e4-869f-9d2f6137e73b	fae002ab-c99a-457d-8f6d-9e9964312caf	ATUNCOLLA
t	2025-03-17 21:13:05.482997+00	2025-03-17 21:13:05.482999+00	c13c0860-7607-487c-b6f5-425e6e47bcb6	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	BALSAS
t	2025-03-17 21:13:05.488027+00	2025-03-17 21:13:05.488029+00	83cd786a-961c-4384-bcc6-3166b16825fc	6a5cf9a4-6f24-4a7e-b672-4b80cc5aecf7	JUNIN
t	2025-03-17 21:13:05.492267+00	2025-03-17 21:13:05.492269+00	0601830e-2b4c-4b3f-b651-cee5b21a4018	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	QUEQUEÑA
t	2025-03-17 21:13:05.496757+00	2025-03-17 21:13:05.496759+00	ce48b9b2-2025-40ad-b880-b5ad8c224bf7	40cd7264-e177-460b-81e7-fd1c04a3d1dd	RAMON CASTILLA
t	2025-03-17 21:13:05.501156+00	2025-03-17 21:13:05.501158+00	2ef46a60-d30e-4945-9d4a-a5adc9db4abb	efdcbed4-4e80-48e7-8992-8191ea2939b8	LIRCAY
t	2025-03-17 21:13:05.505943+00	2025-03-17 21:13:05.505945+00	899fb117-5dc7-41bf-ad03-d8a00ab2b9f7	fbc0bd2f-d800-4706-b300-4eca7a818b49	SANTA CRUZ DE FLORES
t	2025-03-17 21:13:05.511872+00	2025-03-17 21:13:05.511876+00	44bfb16e-5d36-4f67-b8ee-102aa1cef790	aa8c638e-2ea0-4a72-9668-8057261bbfee	PACHAS
t	2025-03-17 21:13:05.516991+00	2025-03-17 21:13:05.516994+00	68bee41b-79c4-4866-9f71-97e0b5baecaa	35972dee-bd82-40d7-aad3-b6f032924ddd	VILCABAMBA
t	2025-03-17 21:13:05.522352+00	2025-03-17 21:13:05.522355+00	58f05417-dd4f-459f-9c08-8ed4c8b87a44	1e747a8b-ad85-4e35-ad63-70fb3ad6da2d	SICCHEZ
t	2025-03-17 21:13:05.526862+00	2025-03-17 21:13:05.526865+00	e3393f82-8067-4ccb-adfd-0b61b84f7b28	c66aef47-44ba-4f3a-bbf9-d3c3f463de54	CAÑARIS
t	2025-03-17 21:13:05.532429+00	2025-03-17 21:13:05.532433+00	ce407f8c-e59e-4850-ac88-bfb46b6d931c	c5c7cd7a-16fd-4b52-bc0d-440a4b9ab23c	LOS BAÑOS DEL INCA
t	2025-03-17 21:13:05.537547+00	2025-03-17 21:13:05.53755+00	54b58d4a-46b2-4413-9961-f73a244af066	957c7796-925d-4e7a-a997-1c18b7f41201	LAS AMAZONAS
t	2025-03-17 21:13:05.542858+00	2025-03-17 21:13:05.54286+00	69d0b363-8c3e-4546-aaed-5399308090d5	3c8af264-3631-4747-a2a2-7b153fa4b672	TALAVERA
t	2025-03-17 21:13:05.548065+00	2025-03-17 21:13:05.548067+00	75e7c8ac-2c5c-43ea-9c18-98b26301cb02	957c7796-925d-4e7a-a997-1c18b7f41201	TENIENTE MANUEL CLAVERO
t	2025-03-17 21:13:05.553018+00	2025-03-17 21:13:05.55302+00	240f2ea5-5c0e-45be-86e9-60b029fdaa26	957c7796-925d-4e7a-a997-1c18b7f41201	PUTUMAYO
t	2025-03-17 21:13:05.558928+00	2025-03-17 21:13:05.558933+00	568130f1-e827-4d1a-8ffd-402df3d63c84	2c09bf48-31df-47d1-bf45-11d7695ea002	HUANZA
t	2025-03-17 21:13:05.564657+00	2025-03-17 21:13:05.56466+00	64e79b10-b24b-44c1-8a1f-314a9b905f8e	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	YARUMAYO
t	2025-03-17 21:13:05.57051+00	2025-03-17 21:13:05.570513+00	c2fd8ed3-9930-449b-b9b9-b2ba75ac2496	57eae5d9-fae5-40b0-808f-4699285c2a8e	CHECCA
t	2025-03-17 21:13:05.576102+00	2025-03-17 21:13:05.576105+00	0521e3c1-7c6d-44bf-ab46-2fce547af74a	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	YAUYOS
t	2025-03-17 21:13:05.581041+00	2025-03-17 21:13:05.581044+00	c3b49dea-989d-429a-ba73-e3b46e9e2c82	98e65496-68d3-4d43-bddc-22c7631c5b27	VICHAYAL
t	2025-03-17 21:13:05.585376+00	2025-03-17 21:13:05.585378+00	e86d32fd-9837-44a0-9f49-94bfc9c9519d	2bc54a70-eee6-4d04-90b9-06503d3b6067	SANTIAGO DE PUPUJA
t	2025-03-17 21:13:05.589973+00	2025-03-17 21:13:05.589977+00	a5ca3801-8034-444c-b1cb-55076f00172d	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	ORCOTUNA
t	2025-03-17 21:13:05.595122+00	2025-03-17 21:13:05.595126+00	ea701606-739d-42c3-8734-9c8d7e5b64aa	ea1da671-28f3-4192-ac87-6c6d5c9f5967	SAN JOSE DEL ALTO
t	2025-03-17 21:13:05.599941+00	2025-03-17 21:13:05.599943+00	2a8602d2-02c7-4afb-8911-86de590ac43a	043c2412-4dba-427d-800e-a374fffd45f7	RIO SANTIAGO
t	2025-03-17 21:13:05.605373+00	2025-03-17 21:13:05.605376+00	b79cebab-6303-4df4-9043-2dffddb7e920	a6dc953c-4d00-40b8-b291-34929747c50c	CALZADA
t	2025-03-17 21:13:05.610975+00	2025-03-17 21:13:05.610978+00	ec3d194d-de41-4e4d-86f5-63892de13949	fdbbb089-cb94-4751-b70e-8bb8f82bdd28	CABANILLAS
t	2025-03-17 21:13:05.616421+00	2025-03-17 21:13:05.61643+00	8ac4dc2e-9fa6-482e-90c9-b53a8ae43113	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	CHANCAYBAÑOS
t	2025-03-17 21:13:05.621883+00	2025-03-17 21:13:05.621885+00	0565021f-b128-46e5-bd30-0caa6dd8564c	c2c1f083-00f1-42dc-b34b-7c274675fe6f	RIO GRANDE
t	2025-03-17 21:13:05.628513+00	2025-03-17 21:13:05.628516+00	8dfc930c-00f5-4f56-8e65-badcec20bf9e	b5c477ac-5c22-4641-a743-47ccf2ee8c59	AMASHCA
t	2025-03-17 21:13:05.634881+00	2025-03-17 21:13:05.634884+00	b19b02d5-657c-4a16-b85d-9ede256e8710	792fb1cf-e799-4ec9-8dbf-339f60cf3179	HONORIA
t	2025-03-17 21:13:05.640926+00	2025-03-17 21:13:05.640929+00	09efb3f9-7caf-4719-9470-b20dce901be5	34ab58b2-509d-451d-91db-da1dd6aa3a8e	RIO TAMBO
t	2025-03-17 21:13:05.647933+00	2025-03-17 21:13:05.647937+00	8bf2e141-5444-4ae8-a735-44e84722b10c	e6121f54-624d-44b3-ba2e-d07a7cfe7226	SANTIAGO DE QUIRAHUARA
t	2025-03-17 21:13:05.654441+00	2025-03-17 21:13:05.654444+00	64d07d12-85d9-4532-b879-20bfe3ee469b	cc76f1f4-59f8-477e-ab55-63ef31302138	MILPUC
t	2025-03-17 21:13:05.661105+00	2025-03-17 21:13:05.66111+00	f33a29e8-075f-4338-893f-ec453acb079c	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SANTA ANITA
t	2025-03-17 21:13:05.668228+00	2025-03-17 21:13:05.668231+00	be894ca0-9639-4cd5-aa68-b9aa40e0fbca	ea1da671-28f3-4192-ac87-6c6d5c9f5967	HUABAL
t	2025-03-17 21:13:05.675087+00	2025-03-17 21:13:05.67509+00	67c0197b-a940-41a6-967f-0098415b00f8	b8e4d98a-e502-47a8-af92-8fdab0b88e60	CHACCHO
t	2025-03-17 21:13:05.68145+00	2025-03-17 21:13:05.681455+00	32e58ba1-d114-4c89-a0e5-4c74b0bbf568	fbc0bd2f-d800-4706-b300-4eca7a818b49	PACARAN
t	2025-03-17 21:13:05.688304+00	2025-03-17 21:13:05.688309+00	b71a5135-a12c-4085-a73a-c2472c278e9a	10923be8-8983-423b-9d2e-5cceef4d9ebd	SOCOS
t	2025-03-17 21:13:05.694837+00	2025-03-17 21:13:05.69484+00	de420039-54cb-458f-b1a7-e2d987ce1d5e	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	SANTIAGO DE CHILCAS
t	2025-03-17 21:13:05.702351+00	2025-03-17 21:13:05.702355+00	c6e444e8-29ac-49b6-b427-c6ca2f2abdfe	e42231e6-aaee-4ff1-b63a-6fe0f1417241	LOS ORGANOS
t	2025-03-17 21:13:05.707509+00	2025-03-17 21:13:05.707511+00	8c7faad9-56c0-4fc7-b86e-8021df3f8ae0	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	AHUAYCHA
t	2025-03-17 21:13:05.713319+00	2025-03-17 21:13:05.713322+00	2daa7407-d04d-43bb-8a6f-f7812ae72d8b	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	CAYMA
t	2025-03-17 21:13:05.718598+00	2025-03-17 21:13:05.718601+00	5127b90f-fe15-42bb-a3c3-bb9267017636	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	ANCO
t	2025-03-17 21:13:05.724402+00	2025-03-17 21:13:05.724405+00	46d661a5-ca29-4296-8215-13e65d6c868e	35972dee-bd82-40d7-aad3-b6f032924ddd	MAMARA
t	2025-03-17 21:13:05.729597+00	2025-03-17 21:13:05.7296+00	061cbd34-bf07-4b5c-9d9e-aa049b6485fd	c5c7cd7a-16fd-4b52-bc0d-440a4b9ab23c	ENCAÑADA
t	2025-03-17 21:13:05.735008+00	2025-03-17 21:13:05.735011+00	f45e11cc-899e-44d6-95e5-324e77ec8395	63916004-9475-4b57-a40b-f707c2be8d2d	GROCIO PRADO
t	2025-03-17 21:13:05.740828+00	2025-03-17 21:13:05.740831+00	682e65f3-c7fe-4db0-aed9-7793984df278	25d0ad5a-7f16-4975-bcd1-dc9b1d18f30a	SANAGORAN
t	2025-03-17 21:13:05.745826+00	2025-03-17 21:13:05.745829+00	9b521000-9d80-401d-b391-a0d8353f73a6	e9ccabb0-d482-4488-845c-94f1fd0e96e6	CARMEN DE LA LEGUA REYNOSO
t	2025-03-17 21:13:05.750062+00	2025-03-17 21:13:05.750064+00	939d8534-2e48-45e0-8a71-3d873d1cfb3f	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	APLAO
t	2025-03-17 21:13:05.754841+00	2025-03-17 21:13:05.754843+00	79182be3-d4a9-442c-a039-9e621020f98e	2bc54a70-eee6-4d04-90b9-06503d3b6067	CHUPA
t	2025-03-17 21:13:05.759828+00	2025-03-17 21:13:05.759832+00	b49903e5-360a-4615-a59a-025d1cf132a1	c86c46dc-e039-43dc-9913-86e623472583	PAUSA
t	2025-03-17 21:13:05.765282+00	2025-03-17 21:13:05.765285+00	6f886251-028a-46f6-8cb1-602ce4747816	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	SOCABAYA
t	2025-03-17 21:13:05.772126+00	2025-03-17 21:13:05.772129+00	cd294ccc-470c-405c-aad7-5fa58271a6ac	fd1c39dc-b8e3-4134-81ff-fe49a1a53595	LAS PIEDRAS
t	2025-03-17 21:13:05.778329+00	2025-03-17 21:13:05.778331+00	ac64da04-1610-4dea-aa4e-468aef8c2466	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	MASMA CHICCHE
t	2025-03-17 21:13:05.784178+00	2025-03-17 21:13:05.784181+00	227945b1-8559-4265-8518-a73fc18a6b07	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	HUAMALI
t	2025-03-17 21:13:05.789982+00	2025-03-17 21:13:05.789985+00	64b516b0-63f1-4e96-a530-fb112fa60740	454a9077-d285-43fb-8f73-9898bccb31bb	OBAS
t	2025-03-17 21:13:05.795821+00	2025-03-17 21:13:05.795823+00	70f47477-d724-4396-8740-c9ce01f4564f	cf4cb352-ae23-46de-9fc3-a94554ae89dd	CAYNA
t	2025-03-17 21:13:05.801089+00	2025-03-17 21:13:05.801093+00	0be29aca-85d6-4c10-8532-59900a091735	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	ACARI
t	2025-03-17 21:13:05.806749+00	2025-03-17 21:13:05.806752+00	432b9c40-292f-4884-951f-e20d81837495	34ab58b2-509d-451d-91db-da1dd6aa3a8e	VIZCATAN DEL ENE
t	2025-03-17 21:13:05.81203+00	2025-03-17 21:13:05.812032+00	66323797-d384-4ddf-b3c4-72e60ae7f2fd	ebe625dc-5bbd-47b5-bc9f-797ec65eedef	SAN MARTIN
t	2025-03-17 21:13:05.817909+00	2025-03-17 21:13:05.817913+00	5ad9836b-0dac-4b6a-9b6c-60fca71ccbe4	cf7fa8b0-e545-40b4-99eb-d431d72c6c8d	JAMALCA
t	2025-03-17 21:13:05.824706+00	2025-03-17 21:13:05.824709+00	6d2ff79f-7b48-4cd0-adff-c11c04b35931	0f00ebe8-c4f5-448e-a160-9c459750cf50	NUEVO PROGRESO
t	2025-03-17 21:13:05.831507+00	2025-03-17 21:13:05.831515+00	7dc324c1-3dcd-4b6f-97f3-90ce99fc16aa	084770c6-2080-4213-abe1-08c62f0eb28b	EL CARMEN DE LA FRONTERA
t	2025-03-17 21:13:05.837256+00	2025-03-17 21:13:05.83726+00	3aa89d50-7919-4d7b-afa9-356e642be835	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	PARCOY
t	2025-03-17 21:13:05.843236+00	2025-03-17 21:13:05.84324+00	88403fd8-f836-4ed9-8c69-f46e0140f0f3	2c09bf48-31df-47d1-bf45-11d7695ea002	SAN DAMIAN
t	2025-03-17 21:13:05.849451+00	2025-03-17 21:13:05.849453+00	f6b8de86-5423-4fc4-b1f2-0064eda93e4b	42a3655b-687b-424b-a374-b0ab58d4f011	NEPEÑA
t	2025-03-17 21:13:05.854986+00	2025-03-17 21:13:05.85499+00	7bcd88f3-a019-4e40-b051-cddb66aa7131	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	MANTA
t	2025-03-17 21:13:05.861676+00	2025-03-17 21:13:05.861679+00	6a4a2d3b-a4fb-4ec2-8922-26e1708e1c63	ea1da671-28f3-4192-ac87-6c6d5c9f5967	SALLIQUE
t	2025-03-17 21:13:05.867811+00	2025-03-17 21:13:05.867817+00	c99c5713-a919-4637-8afc-921e4fd20c0a	c66aef47-44ba-4f3a-bbf9-d3c3f463de54	MANUEL ANTONIO MESONES MURO
t	2025-03-17 21:13:05.874702+00	2025-03-17 21:13:05.874705+00	44dc21d3-8efe-448e-ba7f-f7334f9fa3bd	109a4db0-2e12-4674-ab1f-9417d1664661	CALLERIA
t	2025-03-17 21:13:05.882068+00	2025-03-17 21:13:05.882075+00	cdb005cc-5013-499d-a5ee-ad4a3f7c7298	dd0e7397-1a90-4e9b-b393-7faa473b1ad5	SANTIAGO DE LUCANAMARCA
t	2025-03-17 21:13:05.888669+00	2025-03-17 21:13:05.888674+00	b5a4f849-c49b-4c98-8167-129278f0fcaf	46a0b504-382b-4799-85d6-225617d83360	TACABAMBA
t	2025-03-17 21:13:05.895557+00	2025-03-17 21:13:05.89556+00	74b699cd-9085-4ba6-abfb-6b71e3dc1b8f	25fae8ef-3678-4898-9063-605c52bdc629	CULEBRAS
t	2025-03-17 21:13:05.904528+00	2025-03-17 21:13:05.904532+00	b085a08c-ffbc-4414-965b-012793a6645e	b42841e0-44d6-4122-9396-858f0fbf2b1d	HUACACHI
t	2025-03-17 21:13:05.911617+00	2025-03-17 21:13:05.911619+00	234a7ecd-06c8-41f1-8cd9-bdf28346af76	c35d368a-d376-4211-876e-9a3feb37e400	CAYNARACHI
t	2025-03-17 21:13:05.920402+00	2025-03-17 21:13:05.920407+00	a49d5321-ba19-4715-8cad-1c78ffd7096f	a8a4b3eb-833f-4269-98b8-d5e76c3fb74c	TABACONAS
t	2025-03-17 21:13:05.926823+00	2025-03-17 21:13:05.926825+00	dcac4286-8f94-47c6-a30b-669099571529	f1f444d7-6007-4f07-be39-a71d94b84ca7	LLALLI
t	2025-03-17 21:13:05.932143+00	2025-03-17 21:13:05.932144+00	d644fc80-2fcd-465c-8c57-11a6eeb788ad	cc0ea4e4-1184-4e35-8056-ce01bdb4f473	CUSCO
t	2025-03-17 21:13:05.937676+00	2025-03-17 21:13:05.937678+00	83f60704-8056-479f-bb35-ae90aae5c121	4d11370d-0157-4af4-b89d-731e4516658a	PACHIA
t	2025-03-17 21:13:05.943454+00	2025-03-17 21:13:05.943457+00	347e0862-da1d-4414-94cb-a37dc98a09bc	5f06e473-5acd-475a-b17f-aa63c7fa9783	FLORIDA
t	2025-03-17 21:13:05.950502+00	2025-03-17 21:13:05.950507+00	dff736ce-e1f6-46e1-a34a-911e25e61388	f6729187-58e1-4607-8b37-0b2db196f283	ARMA
t	2025-03-17 21:13:05.957434+00	2025-03-17 21:13:05.957437+00	cb00dad9-6648-4385-b1ff-317ddbcaa144	bbf8aad6-4dd0-482a-884b-0b42f2179319	PARDO MIGUEL
t	2025-03-17 21:13:05.963472+00	2025-03-17 21:13:05.96348+00	51545780-7cad-444f-bd82-98b5c1a897a8	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	NUEVO OCCORO
t	2025-03-17 21:13:05.969768+00	2025-03-17 21:13:05.969773+00	0412847d-2139-42a1-a2f2-4043ad2fe579	10923be8-8983-423b-9d2e-5cceef4d9ebd	QUINUA
t	2025-03-17 21:13:05.975924+00	2025-03-17 21:13:05.975927+00	5f9449e4-09f0-48a1-99b1-3530a868e2f6	10923be8-8983-423b-9d2e-5cceef4d9ebd	ACOS VINCHOS
t	2025-03-17 21:13:05.980817+00	2025-03-17 21:13:05.980821+00	8c7fc3d1-972b-4ede-b820-44ac52992787	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	TORAYA
t	2025-03-17 21:13:05.987956+00	2025-03-17 21:13:05.987961+00	300f997f-039a-4a02-8573-3ee598fe6734	4c515df3-386f-4376-a901-eb9876ac20da	RANRAHIRCA
t	2025-03-17 21:13:05.994659+00	2025-03-17 21:13:05.994663+00	c1bafd63-a7d2-4e5f-882c-4db7a7b7d13e	2c09bf48-31df-47d1-bf45-11d7695ea002	HUAROCHIRI
t	2025-03-17 21:13:06.001469+00	2025-03-17 21:13:06.001471+00	1b8ce5a4-85af-4795-a8b2-befb2d5c6d84	4f439eb6-7ff6-4f79-b681-05e3601f1b33	SAN PEDRO DE CORIS
t	2025-03-17 21:13:06.006717+00	2025-03-17 21:13:06.00672+00	be92c80a-f209-488c-a75e-60b97698952f	c86c46dc-e039-43dc-9913-86e623472583	CORCULLA
t	2025-03-17 21:13:06.012219+00	2025-03-17 21:13:06.012222+00	f93deefa-fea2-41b8-bc79-e57c799ed298	83a45ddf-481f-4760-86f7-5d5ba4423a89	LAS LOMAS
t	2025-03-17 21:13:06.01794+00	2025-03-17 21:13:06.017943+00	0932aa0e-6db0-4ac3-83d0-5c3cddd38e02	a3e76f78-476b-4191-8337-9b5b285b15de	JIRCAN
t	2025-03-17 21:13:06.023551+00	2025-03-17 21:13:06.023557+00	5e5d6be3-6002-4224-8127-2a9f34cdc7ca	d49d555e-7431-4c64-a327-7c0eef9a1dc8	GREGORIO PITA
t	2025-03-17 21:13:06.028933+00	2025-03-17 21:13:06.028936+00	27fca2a0-d03d-493d-9052-c95470a8c1dc	013c5ed1-ba41-4d8c-a7da-845849a7efb9	COCHABAMBA
t	2025-03-17 21:13:06.033839+00	2025-03-17 21:13:06.033842+00	bcc87318-abe8-4e95-af76-626a67cf8c8e	34ab58b2-509d-451d-91db-da1dd6aa3a8e	RIO NEGRO
t	2025-03-17 21:13:06.038939+00	2025-03-17 21:13:06.038941+00	42b61742-da04-49f0-9c23-0c2635ebca48	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	LINCHA
t	2025-03-17 21:13:06.044567+00	2025-03-17 21:13:06.044569+00	6fd2dfbb-7716-4799-aada-fbcb59820dd5	2c09bf48-31df-47d1-bf45-11d7695ea002	LAHUAYTAMBO
t	2025-03-17 21:13:06.049648+00	2025-03-17 21:13:06.049652+00	60295337-be16-4c71-8c09-9ad3a161c1c8	1a124fda-ccb8-45b3-b69b-e0453133d8d8	MARIANO DAMASO BERAUN
t	2025-03-17 21:13:06.054917+00	2025-03-17 21:13:06.054919+00	b106274a-fda5-4f6c-b4a7-5ac30fa9e20e	4f006a58-9e1b-4e72-85ce-4ae912b8cc5c	YUNGUYO
t	2025-03-17 21:13:06.060468+00	2025-03-17 21:13:06.060473+00	e6b9a8ec-a3c8-4f2c-81d7-b1f0f46c596a	792fb1cf-e799-4ec9-8dbf-339f60cf3179	PUERTO INCA
t	2025-03-17 21:13:06.065806+00	2025-03-17 21:13:06.065809+00	0146db72-8e4d-4b50-b046-c8da74bd43aa	46a0b504-382b-4799-85d6-225617d83360	PION
t	2025-03-17 21:13:06.07142+00	2025-03-17 21:13:06.071425+00	0d193287-5fcc-415c-bbc3-0dc285e6d031	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	HONGOS
t	2025-03-17 21:13:06.077495+00	2025-03-17 21:13:06.0775+00	912af225-4cdb-4d77-9103-cee9afaf9579	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	VIÑAC
t	2025-03-17 21:13:06.083092+00	2025-03-17 21:13:06.083095+00	83477e5a-8619-4d9e-9c05-25a58eaa7a18	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	PILCHACA
t	2025-03-17 21:13:06.089188+00	2025-03-17 21:13:06.089191+00	5ef9d996-0c24-4946-a6de-a947dbdb6885	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	CHALACO
t	2025-03-17 21:13:06.094923+00	2025-03-17 21:13:06.09493+00	068e3083-b113-44e8-9196-7f071574c1dc	50381126-eaca-4e9d-9688-2d0ed3c35612	PICSI
t	2025-03-17 21:13:06.101699+00	2025-03-17 21:13:06.101703+00	a10625c7-2f4a-4083-8ae8-c5f4dbb2bd77	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	JUSTO APU SAHUARAURA
t	2025-03-17 21:13:06.10815+00	2025-03-17 21:13:06.108156+00	3aadefd5-f0f6-4bf0-9ae7-a9a84666c52d	3c8af264-3631-4747-a2a2-7b153fa4b672	PACUCHA
t	2025-03-17 21:13:06.11399+00	2025-03-17 21:13:06.113994+00	9ad48b40-99de-4e18-8124-d5db4da7b273	013c5ed1-ba41-4d8c-a7da-845849a7efb9	PIRA
t	2025-03-17 21:13:06.119728+00	2025-03-17 21:13:06.119732+00	9e2fd667-a668-463d-b396-8f11d07c9b33	b5c477ac-5c22-4641-a743-47ccf2ee8c59	ATAQUERO
t	2025-03-17 21:13:06.125037+00	2025-03-17 21:13:06.125038+00	310e7366-e9c7-4ccb-9a7d-363c35b93c56	fae002ab-c99a-457d-8f6d-9e9964312caf	CHUCUITO
t	2025-03-17 21:13:06.131367+00	2025-03-17 21:13:06.13137+00	3c69a606-17eb-457c-a9ed-f6c811ecfad9	a0671457-1dd6-4137-b054-4f8a0d6515e5	BOLOGNESI
t	2025-03-17 21:13:06.137825+00	2025-03-17 21:13:06.137829+00	a8c76587-8c3b-4ea3-8763-5283a415070b	8bc9c85c-cc74-48be-979d-07938df4de67	SITAJARA
t	2025-03-17 21:13:06.144591+00	2025-03-17 21:13:06.144594+00	f64ebc99-8706-4b2d-bf11-6ac426ababa0	9d7bb05d-7107-41b7-8fc0-29d110e2992d	OCOBAMBA
t	2025-03-17 21:13:06.151929+00	2025-03-17 21:13:06.151932+00	c8db252e-336c-466a-85aa-07a18ae0a0bd	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	PUENTE PIEDRA
t	2025-03-17 21:13:06.159936+00	2025-03-17 21:13:06.159939+00	51fd39f0-b5e2-4ec9-9bf0-37838a785639	d49d555e-7431-4c64-a327-7c0eef9a1dc8	JOSE MANUEL QUIROZ
t	2025-03-17 21:13:06.166147+00	2025-03-17 21:13:06.16615+00	990a8922-369b-4b94-9418-2599f3e56fed	83a45ddf-481f-4760-86f7-5d5ba4423a89	CATACAOS
t	2025-03-17 21:13:06.172324+00	2025-03-17 21:13:06.172328+00	778def14-385f-44db-ba05-d76dbaea06d8	b6200a73-f2d4-4543-8e14-909a4f3e7f32	SAN MIGUEL DE CAURI
t	2025-03-17 21:13:06.179423+00	2025-03-17 21:13:06.179433+00	84764dc5-a17b-4f7d-9b01-7c4838c90c70	c44b2db0-1ce6-4816-b16c-975486d5db85	LACHAQUI
t	2025-03-17 21:13:06.185995+00	2025-03-17 21:13:06.185998+00	57d71ba1-a3ea-4db9-89f4-3d4817bbcbae	6a63b22a-2f1a-4c61-bf16-53cd00081db0	CUSCA
t	2025-03-17 21:13:06.194657+00	2025-03-17 21:13:06.194661+00	08ce38f3-f01e-447b-865c-415097c47212	994de1db-2a15-4db0-80a6-4efa76422c2c	HUALLANCA
t	2025-03-17 21:13:06.200274+00	2025-03-17 21:13:06.200276+00	972768d1-1a10-459d-833b-b2e22318d472	6eca8b97-dbde-4058-8fc8-4b86feb3307c	LIMBANI
t	2025-03-17 21:13:06.206615+00	2025-03-17 21:13:06.206617+00	52179a3f-3e0a-4c27-af0c-d3db8b88a700	1e747a8b-ad85-4e35-ad63-70fb3ad6da2d	FRIAS
t	2025-03-17 21:13:06.211455+00	2025-03-17 21:13:06.211458+00	64fbc1e7-6fd6-4dd1-9a9e-5836ce396175	6f01c2b3-c170-49f4-a21b-c1fae42b9815	QUICHES
t	2025-03-17 21:13:06.216993+00	2025-03-17 21:13:06.216998+00	449b7402-8555-49b2-a881-3a17847af671	e7d5b8b6-66d7-4611-ad0f-4ea3be3ebeec	YANAHUANCA
t	2025-03-17 21:13:06.222629+00	2025-03-17 21:13:06.222632+00	30bbf521-b726-4413-93cf-ebab974a8f1c	187d7e64-5269-4ebb-953a-949acc68acd7	PACHIZA
t	2025-03-17 21:13:06.227558+00	2025-03-17 21:13:06.227561+00	bc117e93-1867-4fdf-8a96-7c5203cc58bc	3141399d-6c64-4abc-9890-83e3edff88a1	GUADALUPITO
t	2025-03-17 21:13:06.232246+00	2025-03-17 21:13:06.232249+00	97f9501a-d508-422c-b9e5-335dc0cf7fa9	084770c6-2080-4213-abe1-08c62f0eb28b	SONDORILLO
t	2025-03-17 21:13:06.237521+00	2025-03-17 21:13:06.237524+00	a9c4d7c3-8869-41ee-811f-fda2ecee6cf3	d49d555e-7431-4c64-a327-7c0eef9a1dc8	CHANCAY
t	2025-03-17 21:13:06.24308+00	2025-03-17 21:13:06.243084+00	b8a12d23-4bc1-4886-bd67-ec6513e751d3	1bdc26fa-d3e6-4ac9-92f0-4270e897cee0	TORATA
t	2025-03-17 21:13:06.248936+00	2025-03-17 21:13:06.24894+00	55353930-3010-4a95-ab64-823477a3dc9d	846cebba-a2b2-4b4c-85bb-c79e1ae2600c	HUEPETUHE
t	2025-03-17 21:13:06.254885+00	2025-03-17 21:13:06.254888+00	7c443b52-7473-489e-961c-929fc87cf5f6	802f9e1a-4b36-4787-ae41-e5aaca68da54	AHUAC
t	2025-03-17 21:13:06.260805+00	2025-03-17 21:13:06.260808+00	df892738-0686-4671-b113-27611d8925da	6b370b4c-d286-40a1-8217-ee8f69ab0c0f	CHUMPI
t	2025-03-17 21:13:06.26734+00	2025-03-17 21:13:06.267345+00	4f7d6015-e258-4371-a906-684d47cab369	fd1c39dc-b8e3-4134-81ff-fe49a1a53595	LABERINTO
t	2025-03-17 21:13:06.273955+00	2025-03-17 21:13:06.273959+00	16dae500-d38d-4099-8a0d-6bedf474f16a	f6729187-58e1-4607-8b37-0b2db196f283	CAPILLAS
t	2025-03-17 21:13:06.280007+00	2025-03-17 21:13:06.280011+00	ecb66b4b-dd2b-43c5-afa0-9ddf6f57b6a4	e7d5b8b6-66d7-4611-ad0f-4ea3be3ebeec	SANTA ANA DE TUSI
t	2025-03-17 21:13:06.285861+00	2025-03-17 21:13:06.285863+00	c26aaf2f-6793-4a4c-86f1-f3c35c180c06	cbc121ea-f1b1-4a06-97cb-c010f63ee492	SANTA CRUZ DE CHUCA
t	2025-03-17 21:13:06.291213+00	2025-03-17 21:13:06.291216+00	1a05de42-bc1f-4aa3-9fd8-53cd736c579b	c5f4a998-3e9d-40be-a280-2d993d49b686	HUAROCONDO
t	2025-03-17 21:13:06.296018+00	2025-03-17 21:13:06.296021+00	fa7f31e7-2527-4735-85d4-f9a8fb31722f	87e9d712-7fef-4f4e-a7d1-111e719950ce	HUARO
t	2025-03-17 21:13:06.30216+00	2025-03-17 21:13:06.302163+00	3214fcb1-6a0e-40c6-802b-cb14ba1a7cf1	b42841e0-44d6-4122-9396-858f0fbf2b1d	HUARI
t	2025-03-17 21:13:06.307281+00	2025-03-17 21:13:06.307283+00	2b861323-2245-4f05-9057-d00a9210c9be	c1ae25de-54dd-4d24-90bd-2a41a350a944	MEJIA
t	2025-03-17 21:13:06.312345+00	2025-03-17 21:13:06.312348+00	5ff8c1a9-caa0-4bc3-aff9-646724344d81	2c09bf48-31df-47d1-bf45-11d7695ea002	SURCO
t	2025-03-17 21:13:06.317741+00	2025-03-17 21:13:06.317745+00	bfab2481-9cb4-481d-866d-518a9a0264c9	03fb2350-5ceb-4af7-9e21-98ba632a11c3	PILCUYO
t	2025-03-17 21:13:06.323369+00	2025-03-17 21:13:06.323372+00	0cf29406-25dd-4cba-ada9-4d16159b4fb0	e6121f54-624d-44b3-ba2e-d07a7cfe7226	SANTO DOMINGO DE CAPILLAS
t	2025-03-17 21:13:06.328608+00	2025-03-17 21:13:06.328613+00	7152702c-68e1-4ddb-9e2a-13da45ff9059	10923be8-8983-423b-9d2e-5cceef4d9ebd	TAMBILLO
t	2025-03-17 21:13:06.333873+00	2025-03-17 21:13:06.333876+00	4ca7d638-22e8-4197-bd3f-93a99ab90b22	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	PACA
t	2025-03-17 21:13:06.338699+00	2025-03-17 21:13:06.338702+00	1d88b1e5-e93d-40bd-8c41-74ed5f04262e	4b571beb-3d2d-4889-ad57-fd15c191be22	HUASO
t	2025-03-17 21:13:06.344573+00	2025-03-17 21:13:06.344576+00	017b796e-2373-4693-8028-49caba68b982	f6729187-58e1-4607-8b37-0b2db196f283	TICRAPO
t	2025-03-17 21:13:06.350701+00	2025-03-17 21:13:06.350704+00	58042f2c-678a-4089-be76-66f2b732ae90	83446550-f9ab-4a22-a1f0-308929aad66c	UCHUMARCA
t	2025-03-17 21:13:06.357137+00	2025-03-17 21:13:06.35714+00	49362431-de9d-451e-87a8-9e2c8e7b6bbe	4302c314-c6b8-4319-adfa-220b32d49c8d	JEBEROS
t	2025-03-17 21:13:06.363711+00	2025-03-17 21:13:06.363714+00	cf4292ec-a523-42a9-80f0-cc65d7d42af0	6198f919-cc14-48e2-bc8f-cd4799b8f49b	CAICAY
t	2025-03-17 21:13:06.369889+00	2025-03-17 21:13:06.369892+00	a5ada2b1-992b-408e-8772-663f16095379	c35d368a-d376-4211-876e-9a3feb37e400	CUÑUMBUQUI
t	2025-03-17 21:13:06.376325+00	2025-03-17 21:13:06.376328+00	39db3c4e-a9dd-4376-878a-c8b2dd513752	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	HUANUHUANU
t	2025-03-17 21:13:06.382611+00	2025-03-17 21:13:06.382614+00	81a50e3a-6c1a-46d3-915c-c02862c758fc	26dfbd86-1b08-4168-8d5b-0f468fe9bbc9	PASTAZA
t	2025-03-17 21:13:06.387931+00	2025-03-17 21:13:06.387934+00	842e6ea5-a6ad-4026-b6c4-2e937f9a33e2	b6ee8d13-7dc2-42e1-b9f8-4f689751a272	SAN RAMON
t	2025-03-17 21:13:06.39614+00	2025-03-17 21:13:06.396146+00	1d13f6d1-1d27-48ac-b57c-1dbbe029bf25	8bc9c85c-cc74-48be-979d-07938df4de67	TICACO
t	2025-03-17 21:13:06.404918+00	2025-03-17 21:13:06.404922+00	a1e4aea8-c509-45b8-a78d-f1f4b4b426f6	62bc063a-ebad-48e0-8d45-7ed5c604ed27	PAIJAN
t	2025-03-17 21:13:06.412215+00	2025-03-17 21:13:06.412219+00	8ceb4b57-1706-4a9b-a0a6-8b74f7ba43d5	fb3b3950-928c-4345-8bb6-8f89054c2e9b	BOLIVAR
t	2025-03-17 21:13:06.418537+00	2025-03-17 21:13:06.41854+00	b2a2de9a-85bc-4cb2-8ee8-765b27d02187	a0671457-1dd6-4137-b054-4f8a0d6515e5	CONCHUCOS
t	2025-03-17 21:13:06.424256+00	2025-03-17 21:13:06.424259+00	7e288562-10f4-4325-841a-fab80e4dfcc7	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	HUANTA
t	2025-03-17 21:13:06.431338+00	2025-03-17 21:13:06.431341+00	afeceff3-fbc0-4aa2-a45c-956cc1b4f066	c3464dda-3d6f-443f-a987-ad215194f703	LARI
t	2025-03-17 21:13:06.43779+00	2025-03-17 21:13:06.437792+00	34808aeb-c95e-406d-a017-0be0924a39cf	994de1db-2a15-4db0-80a6-4efa76422c2c	HUAYLLACAYAN
t	2025-03-17 21:13:06.443611+00	2025-03-17 21:13:06.443614+00	b1022331-a0c5-467d-82a6-d850a299fbd4	994de1db-2a15-4db0-80a6-4efa76422c2c	CHIQUIAN
t	2025-03-17 21:13:06.449932+00	2025-03-17 21:13:06.449935+00	a0b30448-f4fa-49be-92d7-06c05496fc2a	37fe07d1-74f8-4777-941d-ba51afc1c160	ZEPITA
t	2025-03-17 21:13:06.45656+00	2025-03-17 21:13:06.456563+00	f5e1baea-2895-4379-84c5-7fe6184c50e1	8eb85dc7-057c-4c9c-890b-3fc9f739fba7	CCAPI
t	2025-03-17 21:13:06.463725+00	2025-03-17 21:13:06.463728+00	c7d0875c-4c18-48d6-b495-2b7d4c0b595c	a154aa5a-7dee-47d6-8448-b6744a59812d	SANTA LEONOR
t	2025-03-17 21:13:06.470116+00	2025-03-17 21:13:06.47012+00	7b6d19b3-d98b-43bd-ac30-a7d63adcee6b	56ad5343-c9f9-4787-a151-0f3d01c21dbb	HUATA
t	2025-03-17 21:13:06.475272+00	2025-03-17 21:13:06.475277+00	d0121841-f37d-490c-808b-9558a8317aeb	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	PAICO
t	2025-03-17 21:13:06.480468+00	2025-03-17 21:13:06.480471+00	1ea5e933-2f6e-43f3-8f17-9414e627cd92	4302c314-c6b8-4319-adfa-220b32d49c8d	YURIMAGUAS
t	2025-03-17 21:13:06.484821+00	2025-03-17 21:13:06.484824+00	74d3b89a-ba50-4b12-888c-f97f2e380896	74b3890f-d58c-4d92-b653-e1ceec0d1b55	ICA
t	2025-03-17 21:13:06.489406+00	2025-03-17 21:13:06.489409+00	07929d8c-093c-452d-8951-eeccaac995d6	6e015257-6f7e-48cf-b9c0-a24502cdcc21	SAN AGUSTIN
t	2025-03-17 21:13:06.494576+00	2025-03-17 21:13:06.494579+00	61d0f85d-9077-40e6-81b6-e1b9b30bfd79	bbf8aad6-4dd0-482a-884b-0b42f2179319	AWAJUN
t	2025-03-17 21:13:06.499739+00	2025-03-17 21:13:06.499742+00	20d0c09d-a96b-4e6b-97f1-70fc406a3294	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	IGUAIN
t	2025-03-17 21:13:06.5056+00	2025-03-17 21:13:06.505602+00	48106eab-824d-4f3c-b6f8-f6cf6b4b0792	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	YAUCA
t	2025-03-17 21:13:06.510888+00	2025-03-17 21:13:06.510892+00	fa55a2da-c8bc-42b6-96f8-6f9ebe8057c8	cd1a779c-e303-4241-b40f-3a8bd328ae2a	COCABAMBA
t	2025-03-17 21:13:06.516977+00	2025-03-17 21:13:06.516982+00	ac41f304-4174-4aaa-9891-2c4ee1aa8ff1	1535087f-84f1-4173-955d-c6bc686c7306	ACCOMARCA
t	2025-03-17 21:13:06.524455+00	2025-03-17 21:13:06.524458+00	e760e2d2-ba88-4cbd-a199-e1eaa4e53b71	e479934c-2453-4ba8-a477-47d8f7b30704	QUILAHUANI
t	2025-03-17 21:13:06.530798+00	2025-03-17 21:13:06.530802+00	bc7f3e09-4286-4cdc-8863-aaf74e359d42	2c09bf48-31df-47d1-bf45-11d7695ea002	SAN BARTOLOME
t	2025-03-17 21:13:06.537749+00	2025-03-17 21:13:06.537752+00	b2ac8228-eb8e-488e-b51a-940dc5cf3131	03fb2350-5ceb-4af7-9e21-98ba632a11c3	ILAVE
t	2025-03-17 21:13:06.544626+00	2025-03-17 21:13:06.544632+00	bff3ed19-f203-46d1-acef-523d26901bcc	25fae8ef-3678-4898-9063-605c52bdc629	HUARMEY
t	2025-03-17 21:13:06.550328+00	2025-03-17 21:13:06.550332+00	0b2b3a53-5ec5-4f6a-8564-49a95cf563fb	aa997785-178f-4ee0-ae0b-199383726bc3	NAUTA
t	2025-03-17 21:13:06.555885+00	2025-03-17 21:13:06.555888+00	69cf4fdf-86a1-4dad-bb5a-3662dc5b1991	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	COMAS
t	2025-03-17 21:13:06.561042+00	2025-03-17 21:13:06.561045+00	69ead867-4def-4015-a467-d62c05b2a6ed	e5987227-df60-4b9e-a9c8-ef624979e917	CAYARA
t	2025-03-17 21:13:06.567454+00	2025-03-17 21:13:06.567458+00	fdc8cd37-270e-48e8-ae8b-5af055f18244	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	CHAMBARA
t	2025-03-17 21:13:06.574466+00	2025-03-17 21:13:06.574472+00	65a48c11-ac28-44fd-80d4-493724369e6e	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	HUANCASPATA
t	2025-03-17 21:13:06.580593+00	2025-03-17 21:13:06.580596+00	9e7e7e4d-9533-4615-9b8e-cbf9015f5656	6e015257-6f7e-48cf-b9c0-a24502cdcc21	PILCOMAYO
t	2025-03-17 21:13:06.587606+00	2025-03-17 21:13:06.58761+00	58017f7c-25eb-46a3-ad3e-af626ba15520	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	UCHURACCAY
t	2025-03-17 21:13:06.59446+00	2025-03-17 21:13:06.594466+00	e6b4636b-7ff4-4f75-a830-68cad3a8cd46	74b3890f-d58c-4d92-b653-e1ceec0d1b55	LA TINGUIÑA
t	2025-03-17 21:13:06.601618+00	2025-03-17 21:13:06.601622+00	d4a71833-4c79-464c-9e94-773adfd65243	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SANTA MARIA DE HUACHIPA
t	2025-03-17 21:13:06.607977+00	2025-03-17 21:13:06.607981+00	4cf7401b-170b-4aea-884a-8eeab23b8a33	c2c1f083-00f1-42dc-b34b-7c274675fe6f	CHICHAS
t	2025-03-17 21:13:06.614694+00	2025-03-17 21:13:06.614698+00	3982e352-6d55-4c09-af7a-3ec75a21c03f	2c09bf48-31df-47d1-bf45-11d7695ea002	RICARDO PALMA
t	2025-03-17 21:13:06.622373+00	2025-03-17 21:13:06.622379+00	ef2558b4-a2cc-44a0-bd89-17295f4c0903	50381126-eaca-4e9d-9688-2d0ed3c35612	PATAPO
t	2025-03-17 21:13:06.631933+00	2025-03-17 21:13:06.631938+00	8f446878-a82d-4c5f-a375-41459e0412c0	c66aef47-44ba-4f3a-bbf9-d3c3f463de54	INCAHUASI
t	2025-03-17 21:13:06.642346+00	2025-03-17 21:13:06.642349+00	b98f5aac-d4da-4502-b4cf-d9edf32a0726	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	CANCHAYLLO
t	2025-03-17 21:13:06.652461+00	2025-03-17 21:13:06.652463+00	f448c3f3-3d30-4c90-be58-9df323637de6	4bf4170f-e0ab-484c-8fbf-368ef843dc61	PALCAMAYO
t	2025-03-17 21:13:06.663098+00	2025-03-17 21:13:06.663102+00	fa55c4a5-e420-4fb4-a667-76340790f44f	5250e4c2-488d-4a7d-bdc9-d2633361c510	PEDRO VILCA APAZA
t	2025-03-17 21:13:06.672694+00	2025-03-17 21:13:06.672702+00	928bb998-587a-4df1-bedb-412c1284ecd8	fae002ab-c99a-457d-8f6d-9e9964312caf	CAPACHICA
t	2025-03-17 21:13:06.681616+00	2025-03-17 21:13:06.68162+00	5be3014b-47e2-47df-ad55-7ad720bfa0dd	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	MOLINOPAMPA
t	2025-03-17 21:13:06.690196+00	2025-03-17 21:13:06.690206+00	7ed56c5f-ef3f-468a-bc0e-27a4926df878	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	QUISHUAR
t	2025-03-17 21:13:06.698708+00	2025-03-17 21:13:06.698711+00	69eb210e-be8a-488e-af31-81864dc608a9	cd1a779c-e303-4241-b40f-3a8bd328ae2a	COLCAMAR
t	2025-03-17 21:13:06.710709+00	2025-03-17 21:13:06.710713+00	c53f9836-3612-4266-a430-e763e645e315	e5987227-df60-4b9e-a9c8-ef624979e917	HUAYA
t	2025-03-17 21:13:06.717695+00	2025-03-17 21:13:06.7177+00	36e1a1f3-429a-45d6-9b90-3c4340d3ffcb	a75e913b-1a31-4ba6-89c1-ef135099a204	TARAY
t	2025-03-17 21:13:06.723656+00	2025-03-17 21:13:06.723659+00	02a81e0b-d512-4b7b-a845-501b21b71bd0	6c20eceb-ede1-430a-b724-bfe76c2701ad	QUINUABAMBA
t	2025-03-17 21:13:06.730108+00	2025-03-17 21:13:06.730112+00	a8e6b1b7-a38a-4297-b156-ee0bdbd42867	cf4cb352-ae23-46de-9fc3-a94554ae89dd	TOMAY KICHWA
t	2025-03-17 21:13:06.736383+00	2025-03-17 21:13:06.736386+00	16f7b764-279b-4951-8906-27a06b8a6c62	0c319822-58c6-435a-ab75-c3c72db37ed8	CHAUPIMARCA
t	2025-03-17 21:13:06.742423+00	2025-03-17 21:13:06.74243+00	d78256aa-154c-4551-9edb-fe920d24cc33	029d4c57-b401-421f-beeb-7d0fef5c0dbb	LUCANAS
t	2025-03-17 21:13:06.748775+00	2025-03-17 21:13:06.748778+00	0a107e31-489f-455d-8bce-875f26534e87	6a63b22a-2f1a-4c61-bf16-53cd00081db0	CORONGO
t	2025-03-17 21:13:06.754898+00	2025-03-17 21:13:06.754902+00	ecfae640-590c-40dc-9310-178d763c778e	029d4c57-b401-421f-beeb-7d0fef5c0dbb	LLAUTA
t	2025-03-17 21:13:06.760362+00	2025-03-17 21:13:06.760366+00	7450f474-bf0e-40bd-a3d7-4fbd0f65e71a	fd1c39dc-b8e3-4134-81ff-fe49a1a53595	INAMBARI
t	2025-03-17 21:13:06.76552+00	2025-03-17 21:13:06.765523+00	f8236cc0-c18f-4d6b-92a0-47d8b73f80a4	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	VIRACO
t	2025-03-17 21:13:06.771652+00	2025-03-17 21:13:06.771656+00	b6817a7f-72f6-4f56-85d1-c9e18d39c319	3af19559-c0e0-469f-9660-92f10b46789e	OLLACHEA
t	2025-03-17 21:13:06.776993+00	2025-03-17 21:13:06.776996+00	f4db874c-3e5c-4c1f-b5d5-4df75a966bb5	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	CHOCOS
t	2025-03-17 21:13:06.782701+00	2025-03-17 21:13:06.782705+00	be6ba17f-55d6-4744-8f39-c8967049249c	e6121f54-624d-44b3-ba2e-d07a7cfe7226	HUAYACUNDO ARMA
t	2025-03-17 21:13:06.788341+00	2025-03-17 21:13:06.788346+00	2536ac1e-e043-42c6-a21a-e091b326d553	c5f4a998-3e9d-40be-a280-2d993d49b686	PUCYURA
t	2025-03-17 21:13:06.79437+00	2025-03-17 21:13:06.794373+00	63db2ddb-cec2-47d2-9547-31b047173eaa	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	HUAYO
t	2025-03-17 21:13:06.801333+00	2025-03-17 21:13:06.801337+00	1f286c23-b962-4104-b5f0-314fbfbed32b	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	MANZANARES
t	2025-03-17 21:13:06.80816+00	2025-03-17 21:13:06.808164+00	f10a538f-5173-4d79-aa57-eb698c5729e6	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	SAN CRISTOBAL DE RAJAN
t	2025-03-17 21:13:06.814968+00	2025-03-17 21:13:06.814972+00	10609b6c-e26e-4863-8062-b8f5ebca34eb	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	SURCUBAMBA
t	2025-03-17 21:13:06.822544+00	2025-03-17 21:13:06.822548+00	284a82bb-e6bb-4f71-9ab4-20330c89c3fb	b42841e0-44d6-4122-9396-858f0fbf2b1d	MASIN
t	2025-03-17 21:13:06.831561+00	2025-03-17 21:13:06.831565+00	9c6039fb-3cc4-450c-9282-60ae2133b668	b42841e0-44d6-4122-9396-858f0fbf2b1d	ANRA
t	2025-03-17 21:13:06.838385+00	2025-03-17 21:13:06.838388+00	5448e9ce-1967-402c-a9b9-9c9dd7fbd073	c2c1f083-00f1-42dc-b34b-7c274675fe6f	IRAY
t	2025-03-17 21:13:06.84468+00	2025-03-17 21:13:06.844683+00	fefada15-c48a-4a2e-bf5f-6ca0ccfc21de	b1166054-2099-441c-ba5d-e67d7e1d0645	RECUAY
t	2025-03-17 21:13:06.851996+00	2025-03-17 21:13:06.852002+00	ebff72db-a509-4060-8c34-e0d14820e426	10923be8-8983-423b-9d2e-5cceef4d9ebd	SANTIAGO DE PISCHA
t	2025-03-17 21:13:06.859347+00	2025-03-17 21:13:06.859351+00	9e4c3d25-28fb-4ee0-98ba-bc125452c6bb	4f006a58-9e1b-4e72-85ce-4ae912b8cc5c	COPANI
t	2025-03-17 21:13:06.865774+00	2025-03-17 21:13:06.865776+00	f488f213-1b4b-430e-9dbd-f224faedbd9d	9b57564f-d3d6-466b-8a32-2eb5fab33e6b	LLUSCO
t	2025-03-17 21:13:06.870791+00	2025-03-17 21:13:06.870793+00	056c9207-cb4c-41cd-afa5-028919c362db	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	COCHAS
t	2025-03-17 21:13:06.877059+00	2025-03-17 21:13:06.87707+00	25e753b0-9d04-41ae-b3a3-fd25825b9d07	915063a0-1172-48a3-8b31-33715e1f2e3c	SULLANA
t	2025-03-17 21:13:06.884819+00	2025-03-17 21:13:06.884823+00	dc59ea44-2317-42b8-bdab-d74ff7dc03be	1e747a8b-ad85-4e35-ad63-70fb3ad6da2d	JILILI
t	2025-03-17 21:13:06.890184+00	2025-03-17 21:13:06.890187+00	e6b3bd2f-9638-4528-aaca-2220c81b97ce	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	CAHUACHO
t	2025-03-17 21:13:06.896342+00	2025-03-17 21:13:06.896344+00	e9ff5e7f-7690-4800-b9a9-af256e733578	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	YACUS
t	2025-03-17 21:13:06.904461+00	2025-03-17 21:13:06.904466+00	028b542b-ecbe-4a01-9a5b-d4ed9c475368	193709f4-bd72-4989-8455-e92a7593cf92	TAMBOBAMBA
t	2025-03-17 21:13:06.911052+00	2025-03-17 21:13:06.911054+00	c144303c-9025-4f82-a0c3-d1433facee84	62bc063a-ebad-48e0-8d45-7ed5c604ed27	CASA GRANDE
t	2025-03-17 21:13:06.916753+00	2025-03-17 21:13:06.916756+00	e3b93005-de52-44f7-9427-7152c07d7fca	994de1db-2a15-4db0-80a6-4efa76422c2c	TICLLOS
t	2025-03-17 21:13:06.921538+00	2025-03-17 21:13:06.92154+00	1cb12621-0b71-43d1-a2f5-95f9c5537610	e09f0261-1ea3-4fd7-a601-d7077e27ff43	POZUZO
t	2025-03-17 21:13:06.926338+00	2025-03-17 21:13:06.92634+00	510651a3-ab3a-4a31-a896-0fd9e09eab98	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	HUANCARQUI
t	2025-03-17 21:13:06.931585+00	2025-03-17 21:13:06.931589+00	45d58768-02d5-4f21-a524-74c1434a3beb	50381126-eaca-4e9d-9688-2d0ed3c35612	REQUE
t	2025-03-17 21:13:06.936448+00	2025-03-17 21:13:06.936451+00	ecbc2240-93aa-42c6-a3d7-6bcf36d97ca6	23397af4-baff-4db8-b639-166478d622d1	CONTUMAZA
t	2025-03-17 21:13:06.942209+00	2025-03-17 21:13:06.942211+00	7a823da4-47ba-41cb-9c03-d6448e629d32	6b370b4c-d286-40a1-8217-ee8f69ab0c0f	CORACORA
t	2025-03-17 21:13:06.948317+00	2025-03-17 21:13:06.948328+00	1f12cec1-18d9-4ea0-974d-df025a41037c	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	LURICOCHA
t	2025-03-17 21:13:06.9558+00	2025-03-17 21:13:06.955803+00	41e18020-31cf-4f37-82e1-a903477c864e	e61f54ef-373f-46b9-b05e-bfe23561ec46	KUMPIRUSHIATO
t	2025-03-17 21:13:06.962551+00	2025-03-17 21:13:06.962555+00	b1e688eb-a2c2-43e0-8c60-aae216a7b5a0	35972dee-bd82-40d7-aad3-b6f032924ddd	SAN ANTONIO
t	2025-03-17 21:13:06.96881+00	2025-03-17 21:13:06.968813+00	aa2fab79-d4ae-4576-99bc-95241d6c91a1	aed4ea90-0fa5-4394-9819-85ab6fdc76a5	HUANCAPON
t	2025-03-17 21:13:06.974203+00	2025-03-17 21:13:06.974206+00	d1b05a4c-5e19-4c9c-ac73-e6d56f1b4ab6	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	ORONCCOY
t	2025-03-17 21:13:06.980087+00	2025-03-17 21:13:06.980091+00	9acc8211-9fc3-44ae-8a02-dbac800e0dc0	ae046f24-a6bc-4f31-a81c-2bca0c494b67	ALTO TAPICHE
t	2025-03-17 21:13:06.987198+00	2025-03-17 21:13:06.987207+00	b4419a6e-8aa4-491f-9680-b231fc4857ed	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	RIMAC
t	2025-03-17 21:13:06.993736+00	2025-03-17 21:13:06.993739+00	e269d0cd-2b5d-4ede-9ae8-8982a02045ec	a75e913b-1a31-4ba6-89c1-ef135099a204	CALCA
t	2025-03-17 21:13:06.998299+00	2025-03-17 21:13:06.998304+00	fe6391b9-8253-42a0-b469-3e7af0dd2858	b5c477ac-5c22-4641-a743-47ccf2ee8c59	ANTA
t	2025-03-17 21:13:07.003911+00	2025-03-17 21:13:07.003914+00	d251c701-cb83-43f4-80bc-b6770e9f0c94	efdcbed4-4e80-48e7-8992-8191ea2939b8	CHINCHO
t	2025-03-17 21:13:07.009383+00	2025-03-17 21:13:07.009386+00	9dce87e5-1e15-4eb9-945b-aabfc179b54c	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	MASMA
t	2025-03-17 21:13:07.014584+00	2025-03-17 21:13:07.014587+00	2feee3c7-ebd1-4c2e-a4ae-47bad2ac4c5b	013c5ed1-ba41-4d8c-a7da-845849a7efb9	HUANCHAY
t	2025-03-17 21:13:07.020314+00	2025-03-17 21:13:07.020318+00	16e4b897-abd8-4924-823c-cb276f235838	3141399d-6c64-4abc-9890-83e3edff88a1	CHAO
t	2025-03-17 21:13:07.026064+00	2025-03-17 21:13:07.026068+00	99e5daa7-0727-41e8-8993-ff2b840c7ba6	c1ae25de-54dd-4d24-90bd-2a41a350a944	MOLLENDO
t	2025-03-17 21:13:07.030632+00	2025-03-17 21:13:07.030635+00	b4e4ce2d-5922-4bd3-9a3b-780a41dbcbd0	957c7796-925d-4e7a-a997-1c18b7f41201	ALTO NANAY
t	2025-03-17 21:13:07.035802+00	2025-03-17 21:13:07.035804+00	b77cc183-1910-4f86-afd9-92bb44972a8d	57eae5d9-fae5-40b0-808f-4699285c2a8e	KUNTURKANKI
t	2025-03-17 21:13:07.040632+00	2025-03-17 21:13:07.040633+00	e5288be4-78d2-49d1-aa2c-314fbcc02c63	193709f4-bd72-4989-8455-e92a7593cf92	COTABAMBAS
t	2025-03-17 21:13:07.045852+00	2025-03-17 21:13:07.045855+00	c4a3084d-94d1-4b52-8cdd-e20ff566c00b	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	CACRA
t	2025-03-17 21:13:07.051583+00	2025-03-17 21:13:07.051585+00	4db2a975-082c-4476-8d4e-a8231f931690	bc89669e-ca8f-4a78-8a5a-f601b64fc944	CAUJUL
t	2025-03-17 21:13:07.05726+00	2025-03-17 21:13:07.057264+00	13b6da0f-1dd8-49ab-b658-35fa82206f0a	c3464dda-3d6f-443f-a987-ad215194f703	CAYLLOMA
t	2025-03-17 21:13:07.06282+00	2025-03-17 21:13:07.062824+00	4c66e67f-a235-41cc-89c1-1da9e9b16de9	c3464dda-3d6f-443f-a987-ad215194f703	SAN ANTONIO DE CHUCA
t	2025-03-17 21:13:07.068924+00	2025-03-17 21:13:07.068927+00	ae03aa46-a1cb-46ac-b66d-40bb12906c0b	0f00ebe8-c4f5-448e-a160-9c459750cf50	SHUNTE
t	2025-03-17 21:13:07.075093+00	2025-03-17 21:13:07.075096+00	9199602c-cb61-4dba-a9a2-b80ed48061aa	b1166054-2099-441c-ba5d-e67d7e1d0645	TAPACOCHA
t	2025-03-17 21:13:07.080856+00	2025-03-17 21:13:07.080858+00	108b0f5f-2edb-4caa-a3ba-2d4fb7a7b0e2	46a0b504-382b-4799-85d6-225617d83360	ANGUIA
t	2025-03-17 21:13:07.085588+00	2025-03-17 21:13:07.085591+00	7880f447-f586-4788-a1b8-aba18805459b	4bf4170f-e0ab-484c-8fbf-368ef843dc61	TARMA
t	2025-03-17 21:13:07.091221+00	2025-03-17 21:13:07.091224+00	7814f919-e4da-452e-b457-37c7b545e8bb	57eae5d9-fae5-40b0-808f-4699285c2a8e	LAYO
t	2025-03-17 21:13:07.096759+00	2025-03-17 21:13:07.096762+00	c11cfe97-3613-4b92-9dab-e828acbd35f7	23397af4-baff-4db8-b639-166478d622d1	CHILETE
t	2025-03-17 21:13:07.101956+00	2025-03-17 21:13:07.101959+00	ae8edb46-e707-4f59-ace0-0543a0020f1b	cd1a779c-e303-4241-b40f-3a8bd328ae2a	SAN CRISTOBAL
t	2025-03-17 21:13:07.106849+00	2025-03-17 21:13:07.106851+00	2942744c-3ca2-4f7b-9266-4faf8e0fb562	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	HEROINAS TOLEDO
t	2025-03-17 21:13:07.1118+00	2025-03-17 21:13:07.111803+00	015da883-7bf8-4ca9-a4b0-6a47ab9e0eb4	029d4c57-b401-421f-beeb-7d0fef5c0dbb	HUAC-HUAS
t	2025-03-17 21:13:07.11651+00	2025-03-17 21:13:07.116513+00	5adb50a4-05b2-42d1-bbfc-5e4871abbd2a	54874897-aa17-4f9d-aa01-926f71b3bfdc	LLOQUE
t	2025-03-17 21:13:07.121443+00	2025-03-17 21:13:07.121445+00	fa0d245e-db55-47f0-8fa0-6a194e93f05d	1a124fda-ccb8-45b3-b69b-e0453133d8d8	DANIEL ALOMIAS ROBLES
t	2025-03-17 21:13:07.126694+00	2025-03-17 21:13:07.126697+00	597f088c-ab05-4a5e-a604-23ec4f8e46e5	efdcbed4-4e80-48e7-8992-8191ea2939b8	SECCLLA
t	2025-03-17 21:13:07.131651+00	2025-03-17 21:13:07.131654+00	8eca26fa-3a6d-48b0-87c4-7e580aadb42c	63916004-9475-4b57-a40b-f707c2be8d2d	ALTO LARAN
t	2025-03-17 21:13:07.136814+00	2025-03-17 21:13:07.136816+00	306c0e06-a890-4126-8e73-8eceb8cfb36a	9d7bb05d-7107-41b7-8fc0-29d110e2992d	LOS CHANKAS
t	2025-03-17 21:13:07.14358+00	2025-03-17 21:13:07.143585+00	f09a9246-f895-4130-8676-fc1a89fdffa5	084770c6-2080-4213-abe1-08c62f0eb28b	SAN MIGUEL DE EL FAIQUE
t	2025-03-17 21:13:07.149415+00	2025-03-17 21:13:07.149417+00	99bfc500-48f7-40ac-8196-abd965214db0	aa61d159-135e-4d97-a318-d721d0ccd135	JUAN ESPINOZA MEDRANO
t	2025-03-17 21:13:07.154774+00	2025-03-17 21:13:07.154776+00	2dd7cdf2-a3d5-49c2-a293-d43a8800232f	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	JAUJA
t	2025-03-17 21:13:07.159236+00	2025-03-17 21:13:07.159239+00	7a415d1f-e899-4497-8726-ceade8fa0da9	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	CHUQUIBAMBA
t	2025-03-17 21:13:07.164169+00	2025-03-17 21:13:07.164172+00	747efc65-b618-426a-89b7-9b2d6eb608a0	1baa3fa5-23b2-4611-b753-c56dd60b5f0d	ILO
t	2025-03-17 21:13:07.169516+00	2025-03-17 21:13:07.169519+00	ca723c11-acce-4569-9406-96d15bf5b37b	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	CANAYRE
t	2025-03-17 21:13:07.174913+00	2025-03-17 21:13:07.174916+00	a21d4f45-150c-4ea8-bd0a-029133561462	c9678f77-84c7-4648-9a0c-4e6c0bba1844	PAMPAS DE HOSPITAL
t	2025-03-17 21:13:07.180741+00	2025-03-17 21:13:07.180743+00	4843c3b3-f6b4-4fb9-9d75-15d9209167bc	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	SOLOCO
t	2025-03-17 21:13:07.185853+00	2025-03-17 21:13:07.185856+00	a4dd9246-66c1-496b-8215-5c0df9ce0c0f	10923be8-8983-423b-9d2e-5cceef4d9ebd	AYACUCHO
t	2025-03-17 21:13:07.192116+00	2025-03-17 21:13:07.192119+00	2b1e48f8-9cf4-4e71-aecc-606b732753e2	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	MUQUI
t	2025-03-17 21:13:07.198239+00	2025-03-17 21:13:07.198248+00	c623a12a-35d4-4487-a708-c449bedcc99d	25d0ad5a-7f16-4975-bcd1-dc9b1d18f30a	SARTIMBAMBA
t	2025-03-17 21:13:07.204399+00	2025-03-17 21:13:07.204402+00	0e5926ce-ef4c-4b3e-a6f7-ab3e1fd69415	aa61d159-135e-4d97-a318-d721d0ccd135	ANTABAMBA
t	2025-03-17 21:13:07.210237+00	2025-03-17 21:13:07.210239+00	74dabbdd-f55e-41c4-9e79-5ecc1aab6e6e	1535087f-84f1-4173-955d-c6bc686c7306	VISCHONGO
t	2025-03-17 21:13:07.216681+00	2025-03-17 21:13:07.216686+00	ca7baea8-0349-456f-9ee4-d4490b3b158b	54874897-aa17-4f9d-aa01-926f71b3bfdc	OMATE
t	2025-03-17 21:13:07.222339+00	2025-03-17 21:13:07.222342+00	cbdb28d3-9ce6-4964-a35e-e87e9a48e639	50381126-eaca-4e9d-9688-2d0ed3c35612	LAGUNAS
t	2025-03-17 21:13:07.227888+00	2025-03-17 21:13:07.227891+00	bff3b117-86f0-4427-98cb-afa6d4aba2d6	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	HUANDO
t	2025-03-17 21:13:07.232855+00	2025-03-17 21:13:07.232857+00	6183cc5e-45a7-4140-b906-014f0a8e2cfa	e8f3629d-e44f-4811-a9cb-78896582c0f4	TUCUME
t	2025-03-17 21:13:07.237692+00	2025-03-17 21:13:07.237695+00	cf7f0dfa-581c-4e1d-924b-6228f21372f1	cd1a779c-e303-4241-b40f-3a8bd328ae2a	SANTA CATALINA
t	2025-03-17 21:13:07.242565+00	2025-03-17 21:13:07.242568+00	e46bb6e4-d3e2-40a0-ad95-dda492c1573a	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	YARABAMBA
t	2025-03-17 21:13:07.247432+00	2025-03-17 21:13:07.247435+00	406bd55e-53f8-43f0-9dd5-92423c6e6a6d	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	PUTINZA
t	2025-03-17 21:13:07.253009+00	2025-03-17 21:13:07.253014+00	91cf5bbb-9071-418c-bb1f-ec677e0baa8a	bc89669e-ca8f-4a78-8a5a-f601b64fc944	COCHAMARCA
t	2025-03-17 21:13:07.258718+00	2025-03-17 21:13:07.258721+00	5492833c-2a49-4670-b2b4-3f17568b5ea0	dd0e7397-1a90-4e9b-b393-7faa473b1ad5	CARAPO
t	2025-03-17 21:13:07.264362+00	2025-03-17 21:13:07.264364+00	2a1d622f-2728-486a-8d47-e41c6974920e	cc0ea4e4-1184-4e35-8056-ce01bdb4f473	CCORCA
t	2025-03-17 21:13:07.269426+00	2025-03-17 21:13:07.269429+00	f42dccab-5380-49f5-8cb7-b3808be9be01	029d4c57-b401-421f-beeb-7d0fef5c0dbb	SAN PEDRO DE PALCO
t	2025-03-17 21:13:07.275322+00	2025-03-17 21:13:07.275327+00	1f7b91f1-97ac-49c2-91cf-928bd82f7ce3	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	AZANGARO
t	2025-03-17 21:13:07.280384+00	2025-03-17 21:13:07.280387+00	48985020-3ce7-4428-8a67-90c31e693afe	c44b2db0-1ce6-4816-b16c-975486d5db85	HUAROS
t	2025-03-17 21:13:07.285506+00	2025-03-17 21:13:07.285508+00	9a6bc40c-8ac8-4d14-aa27-bdb1150fd0ac	f16f9945-52da-4a72-a49a-a94a3f113146	NAZCA
t	2025-03-17 21:13:07.290968+00	2025-03-17 21:13:07.290971+00	42d95499-d5d7-434c-86a2-0a55454b96d5	c5c7cd7a-16fd-4b52-bc0d-440a4b9ab23c	MATARA
t	2025-03-17 21:13:07.296469+00	2025-03-17 21:13:07.296473+00	c3d5ee4d-c62d-4d3c-901f-a1bacdd66f4f	3c46220d-fb67-4669-8288-27b7b8164e19	CHACAS
t	2025-03-17 21:13:07.301399+00	2025-03-17 21:13:07.301401+00	440f92cc-5410-4404-9bd8-e84455f44c66	cc0ea4e4-1184-4e35-8056-ce01bdb4f473	POROY
t	2025-03-17 21:13:07.305962+00	2025-03-17 21:13:07.305964+00	44ace983-ffae-4c4a-9fb8-e6b57e140aaf	a154aa5a-7dee-47d6-8448-b6744a59812d	SANTA MARIA
t	2025-03-17 21:13:07.311601+00	2025-03-17 21:13:07.311605+00	4b327e32-3fd1-4cd6-89c3-474398e8caed	da261af9-5596-4188-b73d-5c091ad57d8b	FIDEL OLIVAS ESCUDERO
t	2025-03-17 21:13:07.316566+00	2025-03-17 21:13:07.316569+00	05b6e9fe-3d5c-40ef-9552-44f579713b16	0c319822-58c6-435a-ab75-c3c72db37ed8	SIMON BOLIVAR
t	2025-03-17 21:13:07.321724+00	2025-03-17 21:13:07.321727+00	5088b0d6-cbc3-4f06-a777-e8a735c4a82f	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	CHILCAYOC
t	2025-03-17 21:13:07.326269+00	2025-03-17 21:13:07.326272+00	acd0ccf2-029c-441b-8397-43c2a6557775	c35d368a-d376-4211-876e-9a3feb37e400	LAMAS
t	2025-03-17 21:13:07.331378+00	2025-03-17 21:13:07.331381+00	e074f6d1-d29d-4595-bd72-77e6eccf1c84	a154aa5a-7dee-47d6-8448-b6744a59812d	AMBAR
t	2025-03-17 21:13:07.336591+00	2025-03-17 21:13:07.336593+00	a16d7df7-a97e-4612-a052-a297f9e95670	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	LA JOYA
t	2025-03-17 21:13:07.341359+00	2025-03-17 21:13:07.341361+00	ac9822f9-d975-4142-8204-8b610c9c39de	e479934c-2453-4ba8-a477-47d8f7b30704	CAMILACA
t	2025-03-17 21:13:07.346604+00	2025-03-17 21:13:07.346607+00	b6f5f0f7-97d0-48cc-9ac9-692a1e0d8da3	a75e913b-1a31-4ba6-89c1-ef135099a204	LAMAY
t	2025-03-17 21:13:07.351486+00	2025-03-17 21:13:07.351489+00	57fc8d7f-81f0-4ef1-a295-fd129cb27b99	cc76f1f4-59f8-477e-ab55-63ef31302138	MARISCAL BENAVIDES
t	2025-03-17 21:13:07.356441+00	2025-03-17 21:13:07.356444+00	438fcd96-4618-41b4-9d3a-84394c69824d	071e4b6b-e409-45e8-ab65-9ae4cc94f1b3	MOCHE
t	2025-03-17 21:13:07.361619+00	2025-03-17 21:13:07.361621+00	598ec9c9-b7f7-4867-b102-6820b92150ae	a4dc3a42-25f5-4178-a9e7-66ef66e42aeb	LA OROYA
t	2025-03-17 21:13:07.366838+00	2025-03-17 21:13:07.36684+00	31f6d760-2a01-4cc3-b46a-2ec2448793ea	c66aef47-44ba-4f3a-bbf9-d3c3f463de54	PITIPO
t	2025-03-17 21:13:07.371706+00	2025-03-17 21:13:07.371709+00	5162de8c-e1ca-4631-8f8a-6c44e08f2865	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	ANDAGUA
t	2025-03-17 21:13:07.376828+00	2025-03-17 21:13:07.376831+00	3ed39dff-ed48-450b-9797-9382fee5b78b	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	CIENEGUILLA
t	2025-03-17 21:13:07.381812+00	2025-03-17 21:13:07.381816+00	54d94442-7cd4-4e49-93e7-acc779307eee	fbc0bd2f-d800-4706-b300-4eca7a818b49	SAN VICENTE DE CAÑETE
t	2025-03-17 21:13:07.388395+00	2025-03-17 21:13:07.388399+00	d15ae8f3-9dcc-4cca-8cc8-226d065174a1	719ca1e2-85aa-4811-87f1-ee903712f816	CRISTO NOS VALGA
t	2025-03-17 21:13:07.394468+00	2025-03-17 21:13:07.394471+00	ab4b49e8-40be-45c5-85f3-a8b6ee398207	a0671457-1dd6-4137-b054-4f8a0d6515e5	PALLASCA
t	2025-03-17 21:13:07.40116+00	2025-03-17 21:13:07.401163+00	e644b620-e5f1-43ce-84a2-63431e3b2f9d	dce0a035-d91c-4f0a-a10f-aefa48915118	CHUSCHI
t	2025-03-17 21:13:07.408991+00	2025-03-17 21:13:07.408994+00	37a99dd5-e110-4a25-be71-e673a168d3d5	960e79f6-51c7-4335-b07a-7721b638f576	SAN PEDRO DE CACHORA
t	2025-03-17 21:13:07.41483+00	2025-03-17 21:13:07.414833+00	32d83fc3-7c06-4e65-b8d9-f9b498a9ac06	b5c477ac-5c22-4641-a743-47ccf2ee8c59	SHILLA
t	2025-03-17 21:13:07.420401+00	2025-03-17 21:13:07.420406+00	b0bb8a5f-50c0-49c3-9f32-50f93f9fa25a	745905a9-8826-4ae2-bbeb-334a668eebe1	PALLPATA
t	2025-03-17 21:13:07.425804+00	2025-03-17 21:13:07.425807+00	04c50a8b-9290-4472-b1f9-dea5c1dfd15a	3af19559-c0e0-469f-9660-92f10b46789e	CRUCERO
t	2025-03-17 21:13:07.431482+00	2025-03-17 21:13:07.431485+00	11af2d04-8964-40cc-ae1c-4c7bfa35a009	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	URPAY
t	2025-03-17 21:13:07.436654+00	2025-03-17 21:13:07.436657+00	04fa3340-ec4a-469f-86ee-e27cb6bd84d8	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	TOMAS
t	2025-03-17 21:13:07.442654+00	2025-03-17 21:13:07.442657+00	c66a70e7-932c-4510-906f-eca7aeca4446	23397af4-baff-4db8-b639-166478d622d1	GUZMANGO
t	2025-03-17 21:13:07.449193+00	2025-03-17 21:13:07.449196+00	29018483-6712-485c-a087-38e6c79c19a3	a6dc953c-4d00-40b8-b291-34929747c50c	HABANA
t	2025-03-17 21:13:07.455003+00	2025-03-17 21:13:07.455006+00	044150e4-ce62-41df-9793-d7a25dd6f02c	384003f9-fd40-42d7-bbcb-42d84f70c15d	BAMBAMARCA
t	2025-03-17 21:13:07.460954+00	2025-03-17 21:13:07.460957+00	f2c93caf-65c3-400c-923a-f60f150112d4	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	AYAUCA
t	2025-03-17 21:13:07.467119+00	2025-03-17 21:13:07.467123+00	c9e1c523-c3dd-4810-b805-4b98b8f3a9cf	071e4b6b-e409-45e8-ab65-9ae4cc94f1b3	FLORENCIA DE MORA
t	2025-03-17 21:13:07.472554+00	2025-03-17 21:13:07.472557+00	a70cdfb5-d236-4ac6-abec-d37a86d64673	37fe07d1-74f8-4777-941d-ba51afc1c160	JULI
t	2025-03-17 21:13:07.477891+00	2025-03-17 21:13:07.477894+00	d9b0e21f-900b-440e-b101-7bd733495f6e	0c319822-58c6-435a-ab75-c3c72db37ed8	SAN FRANCISCO DE ASIS DE YARUSYACAN
t	2025-03-17 21:13:07.483542+00	2025-03-17 21:13:07.483545+00	b8bd580e-9b3c-4a70-9b01-331b4b278f2d	62bc063a-ebad-48e0-8d45-7ed5c604ed27	MAGDALENA DE CAO
t	2025-03-17 21:13:07.488566+00	2025-03-17 21:13:07.48857+00	17eef1ef-2115-41d4-b746-b6c9b8fe2254	87e9d712-7fef-4f4e-a7d1-111e719950ce	ANDAHUAYLILLAS
t	2025-03-17 21:13:07.493211+00	2025-03-17 21:13:07.493214+00	ebd5acee-cf18-48a6-b3db-4a9d5ec9b49d	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	VITIS
t	2025-03-17 21:13:07.498281+00	2025-03-17 21:13:07.498285+00	1c380c70-278f-441b-ba78-51f7edf4e8fd	4f439eb6-7ff6-4f79-b681-05e3601f1b33	CHURCAMPA
t	2025-03-17 21:13:07.504238+00	2025-03-17 21:13:07.504247+00	e0c4632e-6c13-4cd0-8954-fe5c484a6ec8	c790e80f-15e1-4e44-b272-1ef57bb9c991	PARANDAY
t	2025-03-17 21:13:07.509993+00	2025-03-17 21:13:07.509996+00	83985cd8-2a87-4fc2-9a13-4ded89111f70	3af19559-c0e0-469f-9660-92f10b46789e	AJOYANI
t	2025-03-17 21:13:07.516103+00	2025-03-17 21:13:07.516106+00	f62f5962-475a-4517-915e-97a682bb209b	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	CHILCAYMARCA
t	2025-03-17 21:13:07.524054+00	2025-03-17 21:13:07.524064+00	7303e4cb-cbd6-4283-8296-0d00f22f3cd4	2c09bf48-31df-47d1-bf45-11d7695ea002	SAN PEDRO DE HUANCAYRE
t	2025-03-17 21:13:07.532934+00	2025-03-17 21:13:07.532937+00	df12b505-192e-4a9a-8d83-6d7ac4643b4c	745905a9-8826-4ae2-bbeb-334a668eebe1	ESPINAR
t	2025-03-17 21:13:07.539776+00	2025-03-17 21:13:07.53978+00	246b1186-0b90-492d-8390-24da94bfb361	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SANTIAGO DE SURCO
t	2025-03-17 21:13:07.547606+00	2025-03-17 21:13:07.547609+00	ca59acf0-603f-4dec-8868-a32c6fd235e3	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	CALLAYUC
t	2025-03-17 21:13:07.553909+00	2025-03-17 21:13:07.553912+00	4ac47dd9-61c0-41e2-b855-81439d81df5e	ebe625dc-5bbd-47b5-bc9f-797ec65eedef	AGUA BLANCA
t	2025-03-17 21:13:07.559591+00	2025-03-17 21:13:07.559594+00	d62b5d6d-bfee-4213-95a3-1222fa929699	d7ef5212-068e-4c9d-82ca-3a4aa4d5a2e5	LLIPATA
t	2025-03-17 21:13:07.565473+00	2025-03-17 21:13:07.565476+00	91b9fc93-9361-471c-b5b8-8f326c250075	8eb85dc7-057c-4c9c-890b-3fc9f739fba7	PACCARITAMBO
t	2025-03-17 21:13:07.5734+00	2025-03-17 21:13:07.573404+00	cd720dd8-9b47-490a-8af9-d4d1f0fabe3e	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	EL AGUSTINO
t	2025-03-17 21:13:07.580516+00	2025-03-17 21:13:07.580522+00	16ae99d1-5acd-47b3-bbf3-5245ca59ffae	4f439eb6-7ff6-4f79-b681-05e3601f1b33	PACHAMARCA
t	2025-03-17 21:13:07.58643+00	2025-03-17 21:13:07.586433+00	a6ad6e8e-a5be-4a98-b278-d0c507bd06ed	23397af4-baff-4db8-b639-166478d622d1	TANTARICA
t	2025-03-17 21:13:07.593583+00	2025-03-17 21:13:07.593589+00	e052263c-841b-4e2c-8c9c-ab9d47b1bbda	1e747a8b-ad85-4e35-ad63-70fb3ad6da2d	PACAIPAMPA
t	2025-03-17 21:13:07.601021+00	2025-03-17 21:13:07.601024+00	fe2257a1-eb87-4eda-bc66-604acfcffecc	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	NINABAMBA
t	2025-03-17 21:13:07.608799+00	2025-03-17 21:13:07.608804+00	1da449c8-fd8c-44a6-b617-4913dd3b598b	ea1da671-28f3-4192-ac87-6c6d5c9f5967	CHONTALI
t	2025-03-17 21:13:07.616958+00	2025-03-17 21:13:07.616964+00	765b7ce5-52db-4a51-a687-c54aa73639b2	fb3b3950-928c-4345-8bb6-8f89054c2e9b	SAN GREGORIO
t	2025-03-17 21:13:07.6239+00	2025-03-17 21:13:07.623903+00	0f633d13-8cef-419e-8b8e-cb38409bcee5	719ca1e2-85aa-4811-87f1-ee903712f816	RINCONADA LLICUAR
t	2025-03-17 21:13:07.630021+00	2025-03-17 21:13:07.630025+00	bee42c4a-62d6-4836-aa0c-3b6ab481017a	efdcbed4-4e80-48e7-8992-8191ea2939b8	CALLANMARCA
t	2025-03-17 21:13:07.63677+00	2025-03-17 21:13:07.636773+00	a2bdb750-173b-4522-9a83-9f978128517d	fbc0bd2f-d800-4706-b300-4eca7a818b49	COAYLLO
t	2025-03-17 21:13:07.645807+00	2025-03-17 21:13:07.645813+00	d121a720-fdbb-4d0c-84b9-817897aa2726	2c09bf48-31df-47d1-bf45-11d7695ea002	SANTA EULALIA
t	2025-03-17 21:13:07.652672+00	2025-03-17 21:13:07.652675+00	71fde87e-1278-48f2-b6c2-4294ac242826	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	CARABAYLLO
t	2025-03-17 21:13:07.65994+00	2025-03-17 21:13:07.659943+00	8138afa2-e779-4835-8773-10ef59cfd757	6e015257-6f7e-48cf-b9c0-a24502cdcc21	CARHUACALLANGA
t	2025-03-17 21:13:07.667004+00	2025-03-17 21:13:07.667011+00	c17a62c5-88a9-491c-8864-deab9c068acb	6a63b22a-2f1a-4c61-bf16-53cd00081db0	ACO
t	2025-03-17 21:13:07.67481+00	2025-03-17 21:13:07.674813+00	c1e587c4-db0f-445f-8209-41c19578f60f	c3464dda-3d6f-443f-a987-ad215194f703	HUANCA
t	2025-03-17 21:13:07.682117+00	2025-03-17 21:13:07.68212+00	4d2adcc0-d61c-4205-b85c-4419352c9f4b	4bf4170f-e0ab-484c-8fbf-368ef843dc61	HUASAHUASI
t	2025-03-17 21:13:07.690976+00	2025-03-17 21:13:07.69098+00	35857e5c-76e1-41a7-8986-4f8961cf8e1a	d49d555e-7431-4c64-a327-7c0eef9a1dc8	ICHOCAN
t	2025-03-17 21:13:07.699954+00	2025-03-17 21:13:07.699958+00	0b1eb40a-0d61-4d8f-b97e-79ea4237b67c	efdcbed4-4e80-48e7-8992-8191ea2939b8	CCOCHACCASA
t	2025-03-17 21:13:07.707769+00	2025-03-17 21:13:07.707773+00	29bad1a5-093e-485e-a6cc-2473c9ae24a9	a1f38acb-98af-4cf8-8788-1d479a1e26e3	ITE
t	2025-03-17 21:13:07.71639+00	2025-03-17 21:13:07.716396+00	88ad5008-84ae-45f3-a3b1-c6a821efd971	37fe07d1-74f8-4777-941d-ba51afc1c160	POMATA
t	2025-03-17 21:13:07.726323+00	2025-03-17 21:13:07.726328+00	f9f71082-b336-4bf8-9f1c-cfefe5f5da26	55340ef0-3d04-40ea-a070-cbb80d5755a5	COMBAPATA
t	2025-03-17 21:13:07.735191+00	2025-03-17 21:13:07.735195+00	92c24745-5904-4b32-a1b8-5a73d082bb79	2bc54a70-eee6-4d04-90b9-06503d3b6067	MUÑANI
t	2025-03-17 21:13:07.743113+00	2025-03-17 21:13:07.743117+00	fe9f308f-a400-4c52-8c0c-c17833e6a707	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SURQUILLO
t	2025-03-17 21:13:07.751313+00	2025-03-17 21:13:07.751319+00	d423f642-6af1-40f0-b961-742b8194579e	0c319822-58c6-435a-ab75-c3c72db37ed8	VICCO
t	2025-03-17 21:13:07.75937+00	2025-03-17 21:13:07.759377+00	0ac844ae-8a7c-44d0-985f-5846ee741929	e524e2e5-2c3d-4249-9d1d-7611d8538050	HUANCANO
t	2025-03-17 21:13:07.768611+00	2025-03-17 21:13:07.768618+00	a97dfbc0-3a4f-4542-831e-799099c7672d	c5c7cd7a-16fd-4b52-bc0d-440a4b9ab23c	CHETILLA
t	2025-03-17 21:13:07.776801+00	2025-03-17 21:13:07.776806+00	44a0477d-6314-4c54-ba64-337863deb18b	50381126-eaca-4e9d-9688-2d0ed3c35612	PUCALA
t	2025-03-17 21:13:07.783923+00	2025-03-17 21:13:07.783925+00	bdf21629-e026-4aed-8a39-f9fda129da3f	bbf8aad6-4dd0-482a-884b-0b42f2179319	RIOJA
t	2025-03-17 21:13:07.790377+00	2025-03-17 21:13:07.790386+00	5bd9f3cd-f6bd-42f3-9525-f223d9106937	b42841e0-44d6-4122-9396-858f0fbf2b1d	PAUCAS
t	2025-03-17 21:13:07.797319+00	2025-03-17 21:13:07.797322+00	170e0a4b-6847-43b7-b103-51fc2f866500	e7d5b8b6-66d7-4611-ad0f-4ea3be3ebeec	PAUCAR
t	2025-03-17 21:13:07.804217+00	2025-03-17 21:13:07.80422+00	392dad39-e69e-4416-ab36-278b1d1adc4f	4867fc63-7654-417d-8cb7-fd0de85acb77	HUIPOCA
t	2025-03-17 21:13:07.811968+00	2025-03-17 21:13:07.811974+00	c8fe855f-34e4-41fd-a181-9d6f5028d1c3	fbc0bd2f-d800-4706-b300-4eca7a818b49	ZUÑIGA
t	2025-03-17 21:13:07.819563+00	2025-03-17 21:13:07.819566+00	fe5a6f61-a463-49b9-82cd-c2d39aa54d5f	994de1db-2a15-4db0-80a6-4efa76422c2c	COLQUIOC
t	2025-03-17 21:13:07.826406+00	2025-03-17 21:13:07.82641+00	d4a8cf12-44bb-4c38-97a3-d6772e2b502f	6eca8b97-dbde-4058-8fc8-4b86feb3307c	QUIACA
t	2025-03-17 21:13:07.832691+00	2025-03-17 21:13:07.832694+00	ca1b28b6-2dbe-4484-96b3-52768dee1a37	1a124fda-ccb8-45b3-b69b-e0453133d8d8	SANTO DOMINGO DE ANDA
t	2025-03-17 21:13:07.840486+00	2025-03-17 21:13:07.84049+00	8cd7b8fa-e08b-47ba-98ff-c11652cd4571	f25dcc28-5abe-4b1a-bcfe-9de19ced6787	HUANCANE
t	2025-03-17 21:13:07.848773+00	2025-03-17 21:13:07.848776+00	d0e2ea2d-4405-48ee-abfc-cece7aa8393f	c86c46dc-e039-43dc-9913-86e623472583	MARCABAMBA
t	2025-03-17 21:13:07.855791+00	2025-03-17 21:13:07.855796+00	068637d7-3c01-4c84-8b5a-233ebf39737e	9d7bb05d-7107-41b7-8fc0-29d110e2992d	ANCO-HUALLO
t	2025-03-17 21:13:07.864019+00	2025-03-17 21:13:07.864024+00	0ac88e58-b4b0-497a-b244-76d6e2199375	e61f54ef-373f-46b9-b05e-bfe23561ec46	QUIMBIRI
t	2025-03-17 21:13:07.870964+00	2025-03-17 21:13:07.87097+00	ab9d01ef-2896-4b7a-965c-491df915b9d7	013c5ed1-ba41-4d8c-a7da-845849a7efb9	JANGAS
t	2025-03-17 21:13:07.877993+00	2025-03-17 21:13:07.877997+00	4a896fcb-301a-4db7-bfc1-55aaa60ebf34	454a9077-d285-43fb-8f73-9898bccb31bb	CHAVINILLO
t	2025-03-17 21:13:07.884689+00	2025-03-17 21:13:07.884692+00	dc88166b-3fca-4f02-b45f-5d9d633758cf	6c20eceb-ede1-430a-b724-bfe76c2701ad	PAROBAMBA
t	2025-03-17 21:13:07.891488+00	2025-03-17 21:13:07.891493+00	faf1e94c-9393-493d-bccd-fca7c19ee094	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	AYAVIRI
t	2025-03-17 21:13:07.902684+00	2025-03-17 21:13:07.902693+00	f63ae0ab-d027-44ec-921b-e69b31de6357	6e015257-6f7e-48cf-b9c0-a24502cdcc21	CHICCHE
t	2025-03-17 21:13:07.913274+00	2025-03-17 21:13:07.913277+00	99fad9f5-0c49-4eee-b2ba-61f39d6b3449	c5c7cd7a-16fd-4b52-bc0d-440a4b9ab23c	LLACANORA
t	2025-03-17 21:13:07.919616+00	2025-03-17 21:13:07.919619+00	529cfa2f-e39e-4dd1-a56a-8b97cee948d2	ae046f24-a6bc-4f31-a81c-2bca0c494b67	SAQUENA
t	2025-03-17 21:13:07.925347+00	2025-03-17 21:13:07.925349+00	8afc89c1-0b33-4651-9fe6-2e900a2f0ee7	5d4ee5b0-d0ff-4516-b31d-dfda81b61b02	CACHACHI
t	2025-03-17 21:13:07.931706+00	2025-03-17 21:13:07.93171+00	01a431c5-91ba-4599-9cac-0b28e02ad2a4	b1166054-2099-441c-ba5d-e67d7e1d0645	HUAYLLAPAMPA
t	2025-03-17 21:13:07.938404+00	2025-03-17 21:13:07.938407+00	d2f05ed5-4658-4369-8018-cba2bcc035e5	e25f8297-7651-4d13-b583-e83edec11bc7	SUCRE
t	2025-03-17 21:13:07.945094+00	2025-03-17 21:13:07.945097+00	815aec23-3e98-4451-8bc0-5419756999db	8f671c0f-3e82-43ae-ad5a-480f8bc815d4	COPALLIN
t	2025-03-17 21:13:07.954297+00	2025-03-17 21:13:07.954303+00	3ea9a362-167e-4109-b639-00db79bfb81b	54874897-aa17-4f9d-aa01-926f71b3bfdc	QUINISTAQUILLAS
t	2025-03-17 21:13:07.960604+00	2025-03-17 21:13:07.960608+00	ad83688d-9a57-457d-886f-1100c2c8ae0d	5f06e473-5acd-475a-b17f-aa63c7fa9783	CHURUJA
t	2025-03-17 21:13:07.968134+00	2025-03-17 21:13:07.96814+00	1073fb6a-c049-4932-aee5-c060d1e16d9b	74b3890f-d58c-4d92-b653-e1ceec0d1b55	SUBTANJALLA
t	2025-03-17 21:13:07.975646+00	2025-03-17 21:13:07.975652+00	eb93ff12-1c39-4ba2-97b0-1e366053a548	25d0ad5a-7f16-4975-bcd1-dc9b1d18f30a	MARCABAL
t	2025-03-17 21:13:07.984168+00	2025-03-17 21:13:07.984174+00	d889b8ef-42c5-4425-843e-d4b4d30d0a98	fdbbb089-cb94-4751-b70e-8bb8f82bdd28	JULIACA
t	2025-03-17 21:13:07.993777+00	2025-03-17 21:13:07.993782+00	0b5e1a43-c639-4354-869b-65c95684bfb5	e5987227-df60-4b9e-a9c8-ef624979e917	APONGO
t	2025-03-17 21:13:08.005663+00	2025-03-17 21:13:08.005669+00	8a53b905-f53c-45b4-a5be-1c87d6babad6	f25dcc28-5abe-4b1a-bcfe-9de19ced6787	HUATASANI
t	2025-03-17 21:13:08.015068+00	2025-03-17 21:13:08.015071+00	daec7126-983f-4aaf-8428-3992bf1e8df1	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	CONGAS
t	2025-03-17 21:13:08.021721+00	2025-03-17 21:13:08.021723+00	24b57e30-5997-47fd-95eb-c04777f4a360	49d2b1fe-f699-429b-b6d9-384cb23f8b04	VARGAS GUERRA
t	2025-03-17 21:13:08.026796+00	2025-03-17 21:13:08.026798+00	c7bec259-1f00-4e28-a398-159710003878	a4dc3a42-25f5-4178-a9e7-66ef66e42aeb	SANTA BARBARA DE CARHUACAYAN
t	2025-03-17 21:13:08.031903+00	2025-03-17 21:13:08.031905+00	b7a07d9a-485e-41d6-8e25-d85532c73013	cc0ea4e4-1184-4e35-8056-ce01bdb4f473	SANTIAGO
t	2025-03-17 21:13:08.036618+00	2025-03-17 21:13:08.03662+00	c7fb059c-b199-428b-aa7a-10df37474eef	4867fc63-7654-417d-8cb7-fd0de85acb77	NESHUYA
t	2025-03-17 21:13:08.041739+00	2025-03-17 21:13:08.041742+00	c043c99b-8d68-4b86-8873-430a944236c8	e5987227-df60-4b9e-a9c8-ef624979e917	HUANCAPI
t	2025-03-17 21:13:08.047129+00	2025-03-17 21:13:08.047133+00	3d3c546e-1004-43fa-9be3-a2dff3cc4d77	46a0b504-382b-4799-85d6-225617d83360	CONCHAN
t	2025-03-17 21:13:08.053143+00	2025-03-17 21:13:08.053145+00	b6a19bf0-cd2c-488d-9ddd-29519f182f93	3c8af264-3631-4747-a2a2-7b153fa4b672	PACOBAMBA
t	2025-03-17 21:13:08.058847+00	2025-03-17 21:13:08.058849+00	dd4a3e3f-9455-4d35-b9fd-64e6235ff8ea	c3464dda-3d6f-443f-a987-ad215194f703	MACA
t	2025-03-17 21:13:08.064522+00	2025-03-17 21:13:08.064526+00	4cb1c959-ca71-4aaa-a754-b2ef558c4360	35972dee-bd82-40d7-aad3-b6f032924ddd	CHUQUIBAMBILLA
t	2025-03-17 21:13:08.070608+00	2025-03-17 21:13:08.070609+00	82659071-9cf5-460e-9310-7926010a7464	e9ccabb0-d482-4488-845c-94f1fd0e96e6	LA PUNTA
t	2025-03-17 21:13:08.076532+00	2025-03-17 21:13:08.076535+00	9c5ba0d4-0b59-43a6-9a62-e8ad7fd1081a	46a0b504-382b-4799-85d6-225617d83360	TOCMOCHE
t	2025-03-17 21:13:08.083547+00	2025-03-17 21:13:08.083551+00	8fe29484-7a49-42c4-b83e-2990fc95e1d9	56ad5343-c9f9-4787-a151-0f3d01c21dbb	HUAYLAS
t	2025-03-17 21:13:08.089754+00	2025-03-17 21:13:08.089761+00	f307e47f-e8c4-4c77-ac01-a83983ee1c53	fbc0bd2f-d800-4706-b300-4eca7a818b49	ASIA
t	2025-03-17 21:13:08.096184+00	2025-03-17 21:13:08.096187+00	7abd8653-a41e-4912-9fad-12cf389ecdc2	74b3890f-d58c-4d92-b653-e1ceec0d1b55	YAUCA DEL ROSARIO
t	2025-03-17 21:13:08.104703+00	2025-03-17 21:13:08.10471+00	5e6ffb09-28a4-4ada-ac95-3ec9355e3ab9	4f006a58-9e1b-4e72-85ce-4ae912b8cc5c	UNICACHI
t	2025-03-17 21:13:08.112043+00	2025-03-17 21:13:08.112048+00	c2efd44b-e172-4645-88dc-86492a617111	960e79f6-51c7-4335-b07a-7721b638f576	CURAHUASI
t	2025-03-17 21:13:08.11888+00	2025-03-17 21:13:08.118885+00	5a5e2c74-5663-42e9-bff9-ff7e227de7b0	cd1a779c-e303-4241-b40f-3a8bd328ae2a	SAN JUAN DE LOPECANCHA
t	2025-03-17 21:13:08.125272+00	2025-03-17 21:13:08.125278+00	4ce0c113-8128-4f85-b2d8-033a151cbe11	8f671c0f-3e82-43ae-ad5a-480f8bc815d4	EL PARCO
t	2025-03-17 21:13:08.130891+00	2025-03-17 21:13:08.130894+00	bcb2c63a-be1c-4fcc-a6cd-2b084e29f185	3802be26-bb36-4da3-9d01-4b889d15548f	CABANILLA
t	2025-03-17 21:13:08.138124+00	2025-03-17 21:13:08.138127+00	38f04d30-ee79-44b8-be0b-a10e30e9543f	b5c477ac-5c22-4641-a743-47ccf2ee8c59	ACOPAMPA
t	2025-03-17 21:13:08.146168+00	2025-03-17 21:13:08.146175+00	16b9258f-6be4-4553-b755-b05331867767	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	SAN SALVADOR DE QUIJE
t	2025-03-17 21:13:08.15442+00	2025-03-17 21:13:08.154423+00	7422e7f0-1dae-41b1-af20-1a823c8eed06	c2c1f083-00f1-42dc-b34b-7c274675fe6f	CAYARANI
t	2025-03-17 21:13:08.162379+00	2025-03-17 21:13:08.162386+00	f3212984-f8a5-44cf-abf7-11a5596f0b89	c790e80f-15e1-4e44-b272-1ef57bb9c991	AGALLPAMPA
t	2025-03-17 21:13:08.170851+00	2025-03-17 21:13:08.170858+00	16e3cec1-4380-48a5-bf28-4cb6cd727ad0	fae002ab-c99a-457d-8f6d-9e9964312caf	ACORA
t	2025-03-17 21:13:08.178413+00	2025-03-17 21:13:08.178418+00	ea99793f-6626-407c-98d1-8d0578141c62	54874897-aa17-4f9d-aa01-926f71b3bfdc	UBINAS
t	2025-03-17 21:13:08.185608+00	2025-03-17 21:13:08.18561+00	3f2aa143-8435-4743-8328-768abe26dca0	745905a9-8826-4ae2-bbeb-334a668eebe1	ALTO PICHIGUA
t	2025-03-17 21:13:08.195141+00	2025-03-17 21:13:08.195145+00	47367783-cbf2-4176-9adc-5d45c2d3d5f2	6e015257-6f7e-48cf-b9c0-a24502cdcc21	HUALHUAS
t	2025-03-17 21:13:08.201634+00	2025-03-17 21:13:08.201638+00	232b84dc-cc3f-41fd-af72-a18145ed0a4c	029d4c57-b401-421f-beeb-7d0fef5c0dbb	LEONCIO PRADO
t	2025-03-17 21:13:08.209533+00	2025-03-17 21:13:08.209543+00	f3b431f2-1a5c-4f81-9ffe-29e84cb10a08	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	POCOHUANCA
t	2025-03-17 21:13:08.216212+00	2025-03-17 21:13:08.216215+00	9615dd31-18c9-4d48-994b-7f432ccfbd0b	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	CAJAMARQUILLA
t	2025-03-17 21:13:08.221579+00	2025-03-17 21:13:08.221582+00	e0b56a73-7aee-4b99-971f-a62ae65729df	5d4ee5b0-d0ff-4516-b31d-dfda81b61b02	CAJABAMBA
t	2025-03-17 21:13:08.229167+00	2025-03-17 21:13:08.229172+00	550d49cf-e101-4f92-8e64-6e653e3d1abe	a1f38acb-98af-4cf8-8788-1d479a1e26e3	LOCUMBA
t	2025-03-17 21:13:08.236085+00	2025-03-17 21:13:08.236092+00	ae09b2db-60ce-4d50-8edd-319f236c8387	c5f4a998-3e9d-40be-a280-2d993d49b686	ANCAHUASI
t	2025-03-17 21:13:08.24286+00	2025-03-17 21:13:08.242864+00	5cc34ecd-1842-434a-9a25-1a649c4af6f5	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	ANCHIHUAY
t	2025-03-17 21:13:08.248871+00	2025-03-17 21:13:08.248875+00	128b618c-3acd-4b70-9eb6-163a3672b497	3af19559-c0e0-469f-9660-92f10b46789e	ITUATA
t	2025-03-17 21:13:08.255522+00	2025-03-17 21:13:08.255527+00	85f23945-9d63-4f9f-90f6-f56e25d7a4b8	dd0e7397-1a90-4e9b-b393-7faa473b1ad5	SANCOS
t	2025-03-17 21:13:08.261891+00	2025-03-17 21:13:08.261895+00	4cae5bb7-41dc-49d9-b1e3-43f77733b705	956d4ecd-a18c-4758-bb6a-cb38c449e32c	HUARAL
t	2025-03-17 21:13:08.267079+00	2025-03-17 21:13:08.267084+00	f61daeac-bfb8-4217-b327-31567686c898	e9ccabb0-d482-4488-845c-94f1fd0e96e6	CALLAO
t	2025-03-17 21:13:08.273693+00	2025-03-17 21:13:08.273696+00	6f6c5651-baee-43a4-badf-71e3e81f2af1	e42231e6-aaee-4ff1-b63a-6fe0f1417241	LOBITOS
t	2025-03-17 21:13:08.279982+00	2025-03-17 21:13:08.279985+00	a9fce24c-ceb2-4339-a7b8-edffb6767c7b	fcd7819a-4504-4907-b6e9-87e79982326b	IÑAPARI
t	2025-03-17 21:13:08.286411+00	2025-03-17 21:13:08.286416+00	c9106742-0a7d-4a99-9a86-3a89a65b58f4	e524e2e5-2c3d-4249-9d1d-7611d8538050	HUMAY
t	2025-03-17 21:13:08.292636+00	2025-03-17 21:13:08.292639+00	ec142f1a-ef93-490e-abe5-f10ecdc1fd59	4bf4170f-e0ab-484c-8fbf-368ef843dc61	TAPO
t	2025-03-17 21:13:08.298661+00	2025-03-17 21:13:08.298664+00	0de1e673-ef62-4abb-a9d1-087128def766	c3464dda-3d6f-443f-a987-ad215194f703	YANQUE
t	2025-03-17 21:13:08.305034+00	2025-03-17 21:13:08.305037+00	c649d4f8-8e14-4265-85ad-e40f576db6b9	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	SAN ISIDRO DE MAINO
t	2025-03-17 21:13:08.311563+00	2025-03-17 21:13:08.311567+00	41c9bf7a-106d-40e3-a935-0e9536cf6a03	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	CATAHUASI
t	2025-03-17 21:13:08.319613+00	2025-03-17 21:13:08.319619+00	3128b9ac-45b7-4c63-8147-708c25bdfd22	0653b015-1f1e-4073-b4a6-eddacd4d0018	CHIPURANA
t	2025-03-17 21:13:08.327844+00	2025-03-17 21:13:08.327848+00	628ec960-4a96-488f-a610-c1498004ee49	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	TAURIPAMPA
t	2025-03-17 21:13:08.33629+00	2025-03-17 21:13:08.336296+00	02526ec9-1105-47dc-9613-6bd1159f719d	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	CUENCA
t	2025-03-17 21:13:08.343275+00	2025-03-17 21:13:08.34333+00	13f1f769-6005-438d-b2d6-cc2b02a05379	071e4b6b-e409-45e8-ab65-9ae4cc94f1b3	TRUJILLO
t	2025-03-17 21:13:08.351622+00	2025-03-17 21:13:08.351626+00	c06a1bcd-fea8-4c06-bc3f-8d4336e220cc	013c5ed1-ba41-4d8c-a7da-845849a7efb9	INDEPENDENCIA
t	2025-03-17 21:13:08.360482+00	2025-03-17 21:13:08.360488+00	66718d37-abc3-4d71-86a1-8fba8d072f9e	013c5ed1-ba41-4d8c-a7da-845849a7efb9	HUARAZ
t	2025-03-17 21:13:08.367983+00	2025-03-17 21:13:08.367988+00	488ef0f7-349a-4916-b363-573b6321bfe0	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	CHALA
t	2025-03-17 21:13:08.373631+00	2025-03-17 21:13:08.373634+00	002fa377-1db6-4f0a-9119-15feab4c136d	3c8af264-3631-4747-a2a2-7b153fa4b672	SAN ANTONIO DE CACHI
t	2025-03-17 21:13:08.378734+00	2025-03-17 21:13:08.378736+00	96a8fa72-1c49-448f-babb-4cf8fcd76622	56ad5343-c9f9-4787-a151-0f3d01c21dbb	CARAZ
t	2025-03-17 21:13:08.383357+00	2025-03-17 21:13:08.38336+00	a60d6a0f-1cea-401d-bfb4-47ca7803cd29	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	SANTA ROSA DE OCOPA
t	2025-03-17 21:13:08.388559+00	2025-03-17 21:13:08.388561+00	91ca5731-fa04-4e38-b5e8-739673006b75	957c7796-925d-4e7a-a997-1c18b7f41201	FERNANDO LORES
t	2025-03-17 21:13:08.394785+00	2025-03-17 21:13:08.394789+00	72ddbb26-eb25-46f0-965f-751170400f91	e6121f54-624d-44b3-ba2e-d07a7cfe7226	OCOYO
t	2025-03-17 21:13:08.401357+00	2025-03-17 21:13:08.40136+00	9bd47426-c90e-416b-b1c9-480e1855d50a	5b08eab1-14c5-448c-8832-40f39e2a1840	MOSOC LLACTA
t	2025-03-17 21:13:08.407951+00	2025-03-17 21:13:08.407954+00	54f8cd92-494b-4c83-b542-575e1544a187	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	TIPAN
t	2025-03-17 21:13:08.414681+00	2025-03-17 21:13:08.414687+00	3005b1ab-5342-439b-9fa0-c194aacef5e0	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	CHETO
t	2025-03-17 21:13:08.421637+00	2025-03-17 21:13:08.421643+00	f9361ef1-dfda-4c41-bdfa-a12c8169722a	ab26eff7-de79-4815-9cd6-d53359f9d7f1	CANOAS DE PUNTA SAL
t	2025-03-17 21:13:08.426293+00	2025-03-17 21:13:08.426294+00	18beeed9-c92f-4728-ba0f-3db9d9c48b18	50381126-eaca-4e9d-9688-2d0ed3c35612	CHONGOYAPE
t	2025-03-17 21:13:08.433717+00	2025-03-17 21:13:08.433724+00	28744489-5f21-41c0-bfcc-1092ae1eab83	54874897-aa17-4f9d-aa01-926f71b3bfdc	MATALAQUE
t	2025-03-17 21:13:08.441644+00	2025-03-17 21:13:08.44165+00	0f215b8d-726f-4d1c-918e-563f2f20d8e0	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	SACHACA
t	2025-03-17 21:13:08.447724+00	2025-03-17 21:13:08.447727+00	722f0e63-5243-42a1-b509-dcfbcd9832d4	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	MITO
t	2025-03-17 21:13:08.455081+00	2025-03-17 21:13:08.455088+00	67712d17-0a3c-4309-9255-6cc655be86df	e8f3629d-e44f-4811-a9cb-78896582c0f4	PACORA
t	2025-03-17 21:13:08.462379+00	2025-03-17 21:13:08.462386+00	6d04caac-a5c5-47af-ba17-ea6cdf32ec1a	1bdc26fa-d3e6-4ac9-92f0-4270e897cee0	CUCHUMBAYA
t	2025-03-17 21:13:08.471206+00	2025-03-17 21:13:08.47121+00	c57fe68d-89cf-467a-851c-c81eee50e8c1	5b797ca5-ff5a-496b-bfce-d18fb4e97a04	TAHUANIA
t	2025-03-17 21:13:08.480202+00	2025-03-17 21:13:08.480209+00	08195755-7dc1-480e-b253-380ae4f29700	f25dcc28-5abe-4b1a-bcfe-9de19ced6787	VILQUE CHICO
t	2025-03-17 21:13:08.489864+00	2025-03-17 21:13:08.489869+00	ea6eb2d2-219c-43a9-82c1-739d281145c0	3c8af264-3631-4747-a2a2-7b153fa4b672	CHIARA
t	2025-03-17 21:13:08.501068+00	2025-03-17 21:13:08.501074+00	f3fce463-fa07-4eb6-92a8-52ca099efeb4	efdcbed4-4e80-48e7-8992-8191ea2939b8	SANTO TOMAS DE PATA
t	2025-03-17 21:13:08.509338+00	2025-03-17 21:13:08.509341+00	2916c116-3eb7-4dc6-8dbe-2d493adb2d6d	109a4db0-2e12-4674-ab1f-9417d1664661	MANANTAY
t	2025-03-17 21:13:08.514507+00	2025-03-17 21:13:08.51451+00	94363c43-3604-4cdf-8aff-a4f92d9bcc3b	454a9077-d285-43fb-8f73-9898bccb31bb	CAHUAC
t	2025-03-17 21:13:08.520596+00	2025-03-17 21:13:08.520601+00	201b44f8-4649-47f2-96c7-8acb57294c99	745905a9-8826-4ae2-bbeb-334a668eebe1	SUYCKUTAMBO
t	2025-03-17 21:13:08.530157+00	2025-03-17 21:13:08.530163+00	6e16f3f3-9722-4824-9cc7-5d887a6797c1	6e015257-6f7e-48cf-b9c0-a24502cdcc21	SAN JERONIMO DE TUNAN
t	2025-03-17 21:13:08.539205+00	2025-03-17 21:13:08.539211+00	c0a5b5bc-604a-4782-a866-f9a1264b716f	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	UTICYACU
t	2025-03-17 21:13:08.547216+00	2025-03-17 21:13:08.547222+00	1138121d-7615-44f7-8938-7c7246dccbb6	c2c1f083-00f1-42dc-b34b-7c274675fe6f	SALAMANCA
t	2025-03-17 21:13:08.556103+00	2025-03-17 21:13:08.556106+00	f27e1fc6-2084-4781-a920-16be6821c3ab	b6ee8d13-7dc2-42e1-b9f8-4f689751a272	VITOC
t	2025-03-17 21:13:08.565224+00	2025-03-17 21:13:08.565227+00	32ab56cc-e565-40ef-bdba-c9d7e1bf19b5	e6121f54-624d-44b3-ba2e-d07a7cfe7226	QUITO-ARMA
t	2025-03-17 21:13:08.572514+00	2025-03-17 21:13:08.57252+00	be3d200f-3398-4a89-8015-c4ee57ee092e	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	MUQUIYAUYO
t	2025-03-17 21:13:08.581311+00	2025-03-17 21:13:08.581315+00	4a297a84-377c-469f-9261-2398396a27f4	cbc121ea-f1b1-4a06-97cb-c010f63ee492	ANGASMARCA
t	2025-03-17 21:13:08.589261+00	2025-03-17 21:13:08.589269+00	e46b3da2-28a2-4fa2-8e4d-2cd07db2c40b	fae002ab-c99a-457d-8f6d-9e9964312caf	COATA
t	2025-03-17 21:13:08.599163+00	2025-03-17 21:13:08.599167+00	aa7ea3be-1208-4d08-9f10-a7e5003e3f07	55340ef0-3d04-40ea-a070-cbb80d5755a5	MARANGANI
t	2025-03-17 21:13:08.60534+00	2025-03-17 21:13:08.605342+00	193eb3e8-52ba-497e-9d26-f900d9c8bd54	a0671457-1dd6-4137-b054-4f8a0d6515e5	TAUCA
t	2025-03-17 21:13:08.609485+00	2025-03-17 21:13:08.609487+00	9fbb0f58-0982-475c-a9b9-69407006731d	a8a4b3eb-833f-4269-98b8-d5e76c3fb74c	NAMBALLE
t	2025-03-17 21:13:08.61427+00	2025-03-17 21:13:08.614274+00	51e55882-1eb5-4bb8-96bb-fd2f70f42d5b	5b08eab1-14c5-448c-8832-40f39e2a1840	SANGARARA
t	2025-03-17 21:13:08.619175+00	2025-03-17 21:13:08.619178+00	f85f6696-0318-4846-a7f9-5c2b8bec0cb0	645a24ad-797e-4a8f-8376-d9b0a7afe5b2	ZARUMILLA
t	2025-03-17 21:13:08.623773+00	2025-03-17 21:13:08.623775+00	50d7fe36-8619-4494-a8ef-248a82c57cd4	25d0ad5a-7f16-4975-bcd1-dc9b1d18f30a	CURGOS
t	2025-03-17 21:13:08.630056+00	2025-03-17 21:13:08.630062+00	f14a0c1f-127f-4eb4-9791-77288643a644	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	SAN JOAQUIN
t	2025-03-17 21:13:08.636112+00	2025-03-17 21:13:08.636117+00	48ee1cb5-8f1e-4735-a5f7-53bcdde3e526	b8e4d98a-e502-47a8-af92-8fdab0b88e60	CHINGAS
t	2025-03-17 21:13:08.641423+00	2025-03-17 21:13:08.641429+00	db121381-34a6-4996-b342-1fa5779f928d	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	SIVIA
t	2025-03-17 21:13:08.647086+00	2025-03-17 21:13:08.647091+00	5493fdb7-dada-4f57-9f9a-91f666bf7627	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	CARHUAPAMPA
t	2025-03-17 21:13:08.652764+00	2025-03-17 21:13:08.652771+00	ef5929ad-e773-4744-900b-cbd57e3d12fa	e6121f54-624d-44b3-ba2e-d07a7cfe7226	CORDOVA
t	2025-03-17 21:13:08.661309+00	2025-03-17 21:13:08.661313+00	7246b9cd-2d68-4753-9a89-58a620f49b0f	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	MARGOS
t	2025-03-17 21:13:08.668389+00	2025-03-17 21:13:08.668393+00	04595ecd-f1c0-4f4c-9da3-91117e135890	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	VITOR
t	2025-03-17 21:13:08.674647+00	2025-03-17 21:13:08.674651+00	769d0f1d-fbff-446d-8e96-53d37a9c2c8a	fb3b3950-928c-4345-8bb6-8f89054c2e9b	CALQUIS
t	2025-03-17 21:13:08.679759+00	2025-03-17 21:13:08.679764+00	5078ecdd-54c5-4aa3-ac86-c0044f305379	87e9d712-7fef-4f4e-a7d1-111e719950ce	URCOS
t	2025-03-17 21:13:08.685312+00	2025-03-17 21:13:08.685315+00	f9c6c6b3-2fc4-4bf4-9749-4f1872007c65	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	MAGDALENA
t	2025-03-17 21:13:08.692707+00	2025-03-17 21:13:08.69271+00	3bcccc15-080a-478d-b4de-0f92ebb9b1fe	e09f0261-1ea3-4fd7-a601-d7077e27ff43	PUERTO BERMUDEZ
t	2025-03-17 21:13:08.698455+00	2025-03-17 21:13:08.698458+00	682a8fdf-ad0e-45d0-84a3-26caf8532d05	b1166054-2099-441c-ba5d-e67d7e1d0645	COTAPARACO
t	2025-03-17 21:13:08.703687+00	2025-03-17 21:13:08.70369+00	57bb12d1-bafe-47a4-9201-6f9c7e743cbc	c2c1f083-00f1-42dc-b34b-7c274675fe6f	YANAQUIHUA
t	2025-03-17 21:13:08.709199+00	2025-03-17 21:13:08.709205+00	978ddd48-483a-4b90-bebe-e9971f0f4ced	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	BUENOS AIRES
t	2025-03-17 21:13:08.714911+00	2025-03-17 21:13:08.714914+00	7f4ef565-4142-40d1-98d3-18eff2f413c1	a3e76f78-476b-4191-8337-9b5b285b15de	TANTAMAYO
t	2025-03-17 21:13:08.720325+00	2025-03-17 21:13:08.720328+00	55a6b347-e290-4456-9e8b-0c3aceb9d95d	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	CARAYBAMBA
t	2025-03-17 21:13:08.725848+00	2025-03-17 21:13:08.725851+00	b7fa8832-32f2-4257-a63b-b2f57ba6c293	e479934c-2453-4ba8-a477-47d8f7b30704	HUANUARA
t	2025-03-17 21:13:08.731541+00	2025-03-17 21:13:08.731544+00	71a0d416-3ddf-4185-835d-16905580b718	2c09bf48-31df-47d1-bf45-11d7695ea002	CARAMPOMA
t	2025-03-17 21:13:08.736326+00	2025-03-17 21:13:08.736329+00	bd2d4b0b-9495-44ee-95eb-107dc0f67ab7	f16f9945-52da-4a72-a49a-a94a3f113146	MARCONA
t	2025-03-17 21:13:08.741477+00	2025-03-17 21:13:08.74148+00	a1388c91-e9cc-4be1-a475-14ba1ff8889d	fd1c39dc-b8e3-4134-81ff-fe49a1a53595	TAMBOPATA
t	2025-03-17 21:13:08.746264+00	2025-03-17 21:13:08.746265+00	b39635f4-853a-4f1a-8c80-5430792d6b96	cd1a779c-e303-4241-b40f-3a8bd328ae2a	LUYA VIEJO
t	2025-03-17 21:13:08.75122+00	2025-03-17 21:13:08.751222+00	7a98e3cc-efd1-4a13-800c-3e99af9a3592	12f1d3ac-6d49-46b4-8553-07f33b5be588	TUMBADEN
t	2025-03-17 21:13:08.75703+00	2025-03-17 21:13:08.757035+00	27be31f6-bada-406b-a46e-1856dc980879	071e4b6b-e409-45e8-ab65-9ae4cc94f1b3	LAREDO
t	2025-03-17 21:13:08.763319+00	2025-03-17 21:13:08.763323+00	58661f98-6e1b-4337-aec9-0e9c8613b0a1	fb3b3950-928c-4345-8bb6-8f89054c2e9b	TONGOD
t	2025-03-17 21:13:08.769307+00	2025-03-17 21:13:08.769312+00	fbfb8732-3045-410d-a5e4-9ec8c180041f	ea1da671-28f3-4192-ac87-6c6d5c9f5967	LAS PIRIAS
t	2025-03-17 21:13:08.774963+00	2025-03-17 21:13:08.774966+00	e051f03d-ad4b-4fec-80d1-6ec3447a121f	54874897-aa17-4f9d-aa01-926f71b3bfdc	PUQUINA
t	2025-03-17 21:13:08.781271+00	2025-03-17 21:13:08.781275+00	f78b58a7-5874-483a-b5c8-fe4d412df5e8	1bdc26fa-d3e6-4ac9-92f0-4270e897cee0	CARUMAS
t	2025-03-17 21:13:08.787364+00	2025-03-17 21:13:08.787369+00	378bdd1c-0bd4-41f5-9dd5-8a69570e1727	b763ddbd-4a9c-4883-bf39-ccabfca1f3b7	MARAS
t	2025-03-17 21:13:08.793021+00	2025-03-17 21:13:08.793024+00	1f430fb8-03c7-475e-bfa7-86cd8a3b7ad9	3af19559-c0e0-469f-9660-92f10b46789e	COASA
t	2025-03-17 21:13:08.798417+00	2025-03-17 21:13:08.79842+00	a527f469-5d2b-4e9f-9e3f-f5648dd34996	cf7fa8b0-e545-40b4-99eb-d431d72c6c8d	BAGUA GRANDE
t	2025-03-17 21:13:08.80599+00	2025-03-17 21:13:08.805993+00	11be4f06-aab2-42db-bbb9-81794aab65b1	74b3890f-d58c-4d92-b653-e1ceec0d1b55	TATE
t	2025-03-17 21:13:08.811912+00	2025-03-17 21:13:08.811915+00	07e36070-f000-4892-85fb-78c3b873dd99	b763ddbd-4a9c-4883-bf39-ccabfca1f3b7	OLLANTAYTAMBO
t	2025-03-17 21:13:08.8176+00	2025-03-17 21:13:08.817603+00	1e547eb4-30aa-4695-a37d-f4bcfd213608	98e65496-68d3-4d43-bddc-22c7631c5b27	LA HUACA
t	2025-03-17 21:13:08.8233+00	2025-03-17 21:13:08.823303+00	0f63f588-b0db-4945-9160-8ed72f06a41d	8ae34c95-7c05-4880-915b-49c44ac13bd1	SAN JOSE
t	2025-03-17 21:13:08.828637+00	2025-03-17 21:13:08.828643+00	a4dc798a-b65e-45c6-a1ae-30df4f7e1d72	03fb2350-5ceb-4af7-9e21-98ba632a11c3	CONDURIRI
t	2025-03-17 21:13:08.836055+00	2025-03-17 21:13:08.836059+00	4f20db9a-003e-49ba-ac33-2b06b376a729	e25f8297-7651-4d13-b583-e83edec11bc7	JOSE GALVEZ
t	2025-03-17 21:13:08.842204+00	2025-03-17 21:13:08.842208+00	f07cbb85-e9a7-4607-9005-8e2a9a0296b9	2c09bf48-31df-47d1-bf45-11d7695ea002	SANTO DOMINGO DE LOS OLLEROS
t	2025-03-17 21:13:08.84785+00	2025-03-17 21:13:08.847853+00	15cba3a5-4526-47f3-a6c5-68bdbda12c9e	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	UÑON
t	2025-03-17 21:13:08.853072+00	2025-03-17 21:13:08.853075+00	7c1ac90a-f573-4404-9ea5-0635154f7c34	a6dc953c-4d00-40b8-b291-34929747c50c	JEPELACIO
t	2025-03-17 21:13:08.858888+00	2025-03-17 21:13:08.858891+00	e08a67cb-778a-4e52-987a-06e417d5ee9f	b1206fd6-020d-42a0-a864-feb8643f0013	TINGO DE PONASA
t	2025-03-17 21:13:08.865767+00	2025-03-17 21:13:08.865771+00	21c3e6d7-7e21-4ef5-a868-23270c98591b	cf4cb352-ae23-46de-9fc3-a94554ae89dd	CONCHAMARCA
t	2025-03-17 21:13:08.871609+00	2025-03-17 21:13:08.871612+00	f1171a2c-46bc-4ece-b8e0-d62cb5ff8c26	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	ASUNCION
t	2025-03-17 21:13:08.877703+00	2025-03-17 21:13:08.877707+00	a7af064f-e464-435b-aaa8-f55b3656b6d7	f25dcc28-5abe-4b1a-bcfe-9de19ced6787	TARACO
t	2025-03-17 21:13:08.883772+00	2025-03-17 21:13:08.883773+00	e5d0656c-12e0-4a19-af64-8288d13f1881	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	SAN JUAN DE BIGOTE
t	2025-03-17 21:13:08.890937+00	2025-03-17 21:13:08.89094+00	53bd39ce-0c76-43f8-a1b1-220a977bf473	0653b015-1f1e-4073-b4a6-eddacd4d0018	LA BANDA DE SHILCAYO
t	2025-03-17 21:13:08.899124+00	2025-03-17 21:13:08.89913+00	a12fed08-5427-4dbb-9d73-c1380385b4a1	109a4db0-2e12-4674-ab1f-9417d1664661	MASISEA
t	2025-03-17 21:13:08.908112+00	2025-03-17 21:13:08.908116+00	00d34f53-016a-4109-b818-b75b1ab29655	0653b015-1f1e-4073-b4a6-eddacd4d0018	PAPAPLAYA
t	2025-03-17 21:13:08.914214+00	2025-03-17 21:13:08.914217+00	8735eb0d-7d34-4282-873d-1759065042ad	e61f54ef-373f-46b9-b05e-bfe23561ec46	HUAYOPATA
t	2025-03-17 21:13:08.920281+00	2025-03-17 21:13:08.920284+00	43fe2666-d119-414d-b063-74850406c12d	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	AREQUIPA
t	2025-03-17 21:13:08.925518+00	2025-03-17 21:13:08.92552+00	9a4f5a0b-3c82-49bb-bd8a-f0f90ce8e590	c745de6d-713a-4613-951f-05d16e86739b	NICOLAS DE PIEROLA
t	2025-03-17 21:13:08.930426+00	2025-03-17 21:13:08.930428+00	6215baa6-ce85-4832-9432-1da93f000cbe	bbf8aad6-4dd0-482a-884b-0b42f2179319	ELIAS SOPLIN VARGAS
t	2025-03-17 21:13:08.935309+00	2025-03-17 21:13:08.935311+00	9b70b778-1cb6-43b3-8998-22c60bf92f2c	e7d5b8b6-66d7-4611-ad0f-4ea3be3ebeec	TAPUC
t	2025-03-17 21:13:08.94065+00	2025-03-17 21:13:08.940653+00	14f351c2-9960-476e-992a-66e803ac73bd	f1f444d7-6007-4f07-be39-a71d94b84ca7	CUPI
t	2025-03-17 21:13:08.945973+00	2025-03-17 21:13:08.945976+00	66920445-5627-4589-985e-c4705aea2598	c35d368a-d376-4211-876e-9a3feb37e400	BARRANQUITA
t	2025-03-17 21:13:08.952252+00	2025-03-17 21:13:08.952256+00	45614cea-efbb-4c2d-9170-fac2c4d6eb59	0653b015-1f1e-4073-b4a6-eddacd4d0018	ALBERTO LEVEAU
t	2025-03-17 21:13:08.958012+00	2025-03-17 21:13:08.958014+00	86c5c1e8-98dd-4de5-88ee-302f59151085	fbc0bd2f-d800-4706-b300-4eca7a818b49	CALANGO
t	2025-03-17 21:13:08.963061+00	2025-03-17 21:13:08.963065+00	7d6a3b62-634e-4e26-8042-47c00980aa26	1e747a8b-ad85-4e35-ad63-70fb3ad6da2d	PAIMAS
t	2025-03-17 21:13:08.968533+00	2025-03-17 21:13:08.968534+00	fcfcd16c-a5ee-414f-98b2-d69a6d1003da	cd1a779c-e303-4241-b40f-3a8bd328ae2a	TRITA
t	2025-03-17 21:13:08.973812+00	2025-03-17 21:13:08.973816+00	706fd738-5d09-40d1-b499-b2657a54cd5b	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	CHACA
t	2025-03-17 21:13:08.978784+00	2025-03-17 21:13:08.978787+00	80f4926d-64fd-4bcc-91c0-4f788b0db81f	da261af9-5596-4188-b73d-5c091ad57d8b	LLUMPA
t	2025-03-17 21:13:08.982854+00	2025-03-17 21:13:08.982857+00	4935c5d3-1fb8-46da-a490-9f9345789278	e25f8297-7651-4d13-b583-e83edec11bc7	SOROCHUCO
t	2025-03-17 21:13:08.990206+00	2025-03-17 21:13:08.990209+00	3b75c817-ff83-4fcf-9b5e-acbb517d07da	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	SAN MIGUEL
t	2025-03-17 21:13:08.995402+00	2025-03-17 21:13:08.995407+00	60c41b50-52cb-40bf-b3ff-d253aec58e6b	83a45ddf-481f-4760-86f7-5d5ba4423a89	EL TALLAN
t	2025-03-17 21:13:09.000686+00	2025-03-17 21:13:09.000688+00	463a794d-303d-4c79-9f99-432816beb5fc	87e9d712-7fef-4f4e-a7d1-111e719950ce	CCATCA
t	2025-03-17 21:13:09.006012+00	2025-03-17 21:13:09.006014+00	b1bedd9c-1ecc-4ef5-86e6-0e22d119ff7a	efdcbed4-4e80-48e7-8992-8191ea2939b8	HUANCA-HUANCA
t	2025-03-17 21:13:09.010778+00	2025-03-17 21:13:09.010781+00	e9e7a2e2-be9b-4239-881a-d0005e14b2e4	157ac8ce-05cf-4107-81ff-6c697fac45fd	ALTO BIAVO
t	2025-03-17 21:13:09.015857+00	2025-03-17 21:13:09.01586+00	b416b897-34e0-44bd-b8a1-47b244c72a79	071e4b6b-e409-45e8-ab65-9ae4cc94f1b3	SIMBAL
t	2025-03-17 21:13:09.022771+00	2025-03-17 21:13:09.022774+00	777ac78c-d68d-40b2-91b3-7fd2a88b14b7	e42231e6-aaee-4ff1-b63a-6fe0f1417241	EL ALTO
t	2025-03-17 21:13:09.028996+00	2025-03-17 21:13:09.028999+00	120d534d-6574-46e5-913a-330085da6e0a	2c09bf48-31df-47d1-bf45-11d7695ea002	LARAOS
t	2025-03-17 21:13:09.034882+00	2025-03-17 21:13:09.034885+00	7c62b369-9d82-4bfa-be29-b43716b612c2	6f01c2b3-c170-49f4-a21b-c1fae42b9815	CHINGALPO
t	2025-03-17 21:13:09.041429+00	2025-03-17 21:13:09.041431+00	39876a5c-1bc4-4fb6-beef-879175cf8f69	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	PICHOS
t	2025-03-17 21:13:09.047093+00	2025-03-17 21:13:09.047095+00	fae9ae62-b559-4ec2-8b71-699af5463491	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	PUCACOLPA
t	2025-03-17 21:13:09.053178+00	2025-03-17 21:13:09.053181+00	f1d0108e-00f3-4aed-bf38-10d08b1b47e4	ea1da671-28f3-4192-ac87-6c6d5c9f5967	SAN FELIPE
t	2025-03-17 21:13:09.059924+00	2025-03-17 21:13:09.059929+00	1e9e353c-bbcd-49c2-a5af-456984813ada	f25dcc28-5abe-4b1a-bcfe-9de19ced6787	ROSASPATA
t	2025-03-17 21:13:09.066489+00	2025-03-17 21:13:09.066495+00	805c7d35-91da-4611-96bc-5d282e5249be	fbc0bd2f-d800-4706-b300-4eca7a818b49	MALA
t	2025-03-17 21:13:09.074831+00	2025-03-17 21:13:09.074837+00	37b75fb0-e36b-4c43-b89c-3813d49ae8f7	50381126-eaca-4e9d-9688-2d0ed3c35612	CAYALTI
t	2025-03-17 21:13:09.082787+00	2025-03-17 21:13:09.082791+00	033183dc-4715-4f84-bfd3-8f6e565b7383	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	PANCAN
t	2025-03-17 21:13:09.090183+00	2025-03-17 21:13:09.090186+00	c0ffe17e-c92d-4787-b934-56800b4b9980	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	QUINJALCA
t	2025-03-17 21:13:09.098904+00	2025-03-17 21:13:09.098909+00	e247330f-2abb-4e46-929d-f87ec3fe7a38	c9678f77-84c7-4648-9a0c-4e6c0bba1844	LA CRUZ
t	2025-03-17 21:13:09.107474+00	2025-03-17 21:13:09.107479+00	05f49482-6602-411e-acd4-f063bcf4dd5e	39b5f4f6-da10-4e59-90a1-ca1e4c8877dc	PAUCARA
t	2025-03-17 21:13:09.115774+00	2025-03-17 21:13:09.115776+00	fa849e84-5a56-49be-833d-4a690e347a43	c9678f77-84c7-4648-9a0c-4e6c0bba1844	SAN JUAN DE LA VIRGEN
t	2025-03-17 21:13:09.124671+00	2025-03-17 21:13:09.124675+00	02660aed-486b-4df3-89c5-a75a522cef04	8f671c0f-3e82-43ae-ad5a-480f8bc815d4	ARAMANGO
t	2025-03-17 21:13:09.133949+00	2025-03-17 21:13:09.133953+00	338ccaa7-d564-4782-b4a3-67f2bde3b9e6	ebe625dc-5bbd-47b5-bc9f-797ec65eedef	SHATOJA
t	2025-03-17 21:13:09.142292+00	2025-03-17 21:13:09.142296+00	8a036b31-dcca-484f-bf4e-01a2861d7798	aa8c638e-2ea0-4a72-9668-8057261bbfee	RIPAN
t	2025-03-17 21:13:09.15208+00	2025-03-17 21:13:09.15209+00	2dd22d3e-56bb-410c-8a06-c020b38ad5a0	b1166054-2099-441c-ba5d-e67d7e1d0645	MARCA
t	2025-03-17 21:13:09.161751+00	2025-03-17 21:13:09.161754+00	8e3ac84a-2eee-43e9-98be-b99a86218d76	cc0ea4e4-1184-4e35-8056-ce01bdb4f473	SAYLLA
t	2025-03-17 21:13:09.170021+00	2025-03-17 21:13:09.170024+00	61bce59c-ec06-481b-be47-83a09af01c4c	c3464dda-3d6f-443f-a987-ad215194f703	COPORAQUE
t	2025-03-17 21:13:09.178218+00	2025-03-17 21:13:09.178224+00	a20322a5-0f47-4be7-a456-8fc85dc1c831	9d7bb05d-7107-41b7-8fc0-29d110e2992d	ONGOY
t	2025-03-17 21:13:09.184913+00	2025-03-17 21:13:09.184917+00	076d50bb-3f48-4099-9108-465df5fad565	8bc9c85c-cc74-48be-979d-07938df4de67	ESTIQUE-PAMPA
t	2025-03-17 21:13:09.194929+00	2025-03-17 21:13:09.194933+00	17f27088-21ba-4231-a627-03999b755fb7	4c515df3-386f-4376-a901-eb9876ac20da	MATACOTO
t	2025-03-17 21:13:09.203407+00	2025-03-17 21:13:09.203414+00	589998a8-1697-4363-bf8b-517e93ac0d26	0c319822-58c6-435a-ab75-c3c72db37ed8	HUACHON
t	2025-03-17 21:13:09.212572+00	2025-03-17 21:13:09.212576+00	4d832fb8-627a-42ad-9d66-c6be55785331	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	ONGON
t	2025-03-17 21:13:09.221061+00	2025-03-17 21:13:09.221065+00	17097378-c5cb-413f-8dbe-25b1032ddf2b	957c7796-925d-4e7a-a997-1c18b7f41201	PUNCHANA
t	2025-03-17 21:13:09.229511+00	2025-03-17 21:13:09.229519+00	8a13d296-4875-4681-89c5-a00120f2c8b2	f6729187-58e1-4607-8b37-0b2db196f283	HUACHOS
t	2025-03-17 21:13:09.240888+00	2025-03-17 21:13:09.240892+00	7bf5870a-2bc3-403e-9572-4be50b4cd7b7	6eca8b97-dbde-4058-8fc8-4b86feb3307c	SAN PEDRO DE PUTINA PUNCO
t	2025-03-17 21:13:09.248085+00	2025-03-17 21:13:09.248091+00	ed286cd1-1c36-45f5-ba24-e8bb2222ea98	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	YURA
t	2025-03-17 21:13:09.257566+00	2025-03-17 21:13:09.25757+00	1e406a2a-d19a-4c15-9c49-44ef34c4685e	6a0799ec-1dab-4d4c-9e30-0a4123d28996	SUPE PUERTO
t	2025-03-17 21:13:09.26656+00	2025-03-17 21:13:09.266565+00	7d085cc0-23bf-4419-9675-77fc1fc902d8	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	MARISCAL CASTILLA
t	2025-03-17 21:13:09.27547+00	2025-03-17 21:13:09.275474+00	87454cd7-87ff-498b-93a5-0ae1e2d96d0b	c3464dda-3d6f-443f-a987-ad215194f703	CHIVAY
t	2025-03-17 21:13:09.282919+00	2025-03-17 21:13:09.282923+00	10fb6a76-6e10-4757-b4ec-708a9693830e	b1166054-2099-441c-ba5d-e67d7e1d0645	PARARIN
t	2025-03-17 21:13:09.289709+00	2025-03-17 21:13:09.289713+00	981d4a1c-16ca-4b7a-81f3-570b37b2e404	56ad5343-c9f9-4787-a151-0f3d01c21dbb	SANTO TORIBIO
t	2025-03-17 21:13:09.29679+00	2025-03-17 21:13:09.296794+00	f06cb5e8-5142-4878-845f-9848df49ef7a	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	MARCO
t	2025-03-17 21:13:09.303227+00	2025-03-17 21:13:09.30323+00	fc20498d-d0a1-4c03-9344-5f362d42bdea	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	ATE
t	2025-03-17 21:13:09.309443+00	2025-03-17 21:13:09.309447+00	9ae6c51b-e3ef-4b29-9f2e-3804ec6dd796	ae046f24-a6bc-4f31-a81c-2bca0c494b67	JENARO HERRERA
t	2025-03-17 21:13:09.316903+00	2025-03-17 21:13:09.31691+00	3acb3f80-9996-4fbe-b127-909bc0feaf02	193709f4-bd72-4989-8455-e92a7593cf92	HAQUIRA
t	2025-03-17 21:13:09.324292+00	2025-03-17 21:13:09.324296+00	88176b49-0089-46a9-80d2-a191e78d3092	2c09bf48-31df-47d1-bf45-11d7695ea002	MATUCANA
t	2025-03-17 21:13:09.333088+00	2025-03-17 21:13:09.333096+00	f44dc6cd-15c4-4300-9284-1c249e11d366	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	HUAYLLAHUARA
t	2025-03-17 21:13:09.341717+00	2025-03-17 21:13:09.341722+00	14612ec1-1640-46b3-8beb-07ecbc24fe07	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	CHILIQUIN
t	2025-03-17 21:13:09.348129+00	2025-03-17 21:13:09.348133+00	e20636f3-ca16-4a11-a7ab-40661c64b664	e524e2e5-2c3d-4249-9d1d-7611d8538050	SAN CLEMENTE
t	2025-03-17 21:13:09.354823+00	2025-03-17 21:13:09.354827+00	b1286cfd-8b03-4ae6-8369-6b8d4e4ce48f	846cebba-a2b2-4b4c-85bb-c79e1ae2600c	MANU
t	2025-03-17 21:13:09.362237+00	2025-03-17 21:13:09.36224+00	cfcfc5b8-ebee-4ac6-a666-9551de5dc52b	c35d368a-d376-4211-876e-9a3feb37e400	RUMISAPA
t	2025-03-17 21:13:09.368922+00	2025-03-17 21:13:09.368925+00	af8d5ec5-b1b4-483a-a44f-821d7cbbc81a	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	TAURIJA
t	2025-03-17 21:13:09.375206+00	2025-03-17 21:13:09.375208+00	51ef93ce-aa2f-4800-8d5d-54ccf24f50d4	6b370b4c-d286-40a1-8217-ee8f69ab0c0f	PUYUSCA
t	2025-03-17 21:13:09.382078+00	2025-03-17 21:13:09.382081+00	a093a6d2-d275-4816-bb4e-383a895b2a3c	8eb85dc7-057c-4c9c-890b-3fc9f739fba7	HUANOQUITE
t	2025-03-17 21:13:09.387738+00	2025-03-17 21:13:09.387741+00	d14169cf-a3ca-476a-8152-acf572503468	5f06e473-5acd-475a-b17f-aa63c7fa9783	RECTA
t	2025-03-17 21:13:09.393936+00	2025-03-17 21:13:09.393939+00	5bd3b0d1-7de2-46f4-a8ff-37f97aff7b66	d49d555e-7431-4c64-a327-7c0eef9a1dc8	EDUARDO VILLANUEVA
t	2025-03-17 21:13:09.400218+00	2025-03-17 21:13:09.400222+00	bd0bffdb-ca56-4507-aa76-a367ab83382c	34ab58b2-509d-451d-91db-da1dd6aa3a8e	PANGOA
t	2025-03-17 21:13:09.407098+00	2025-03-17 21:13:09.407101+00	8863a503-29d3-46b9-ba52-9e4f665708fb	6e015257-6f7e-48cf-b9c0-a24502cdcc21	SANTO DOMINGO DE ACOBAMBA
t	2025-03-17 21:13:09.413369+00	2025-03-17 21:13:09.413372+00	3e96b7d8-9c0b-4404-9163-32154abe8216	b6200a73-f2d4-4543-8e14-909a4f3e7f32	QUEROPALCA
t	2025-03-17 21:13:09.419083+00	2025-03-17 21:13:09.419086+00	26abe3dd-27f1-41d6-bb71-14638740ded0	3c46220d-fb67-4669-8288-27b7b8164e19	ACOCHACA
t	2025-03-17 21:13:09.424987+00	2025-03-17 21:13:09.42499+00	f07bb78f-440f-4e35-a970-47a058a39037	1a124fda-ccb8-45b3-b69b-e0453133d8d8	HERMILIO VALDIZAN
t	2025-03-17 21:13:09.43116+00	2025-03-17 21:13:09.431163+00	8867479a-db95-4e8c-97cb-6ee66d91779c	cd1a779c-e303-4241-b40f-3a8bd328ae2a	MARIA
t	2025-03-17 21:13:09.437049+00	2025-03-17 21:13:09.437054+00	afb488e1-e561-4ab5-b755-d96622cf0848	c790e80f-15e1-4e44-b272-1ef57bb9c991	SINSICAP
t	2025-03-17 21:13:09.444237+00	2025-03-17 21:13:09.444241+00	a972d42e-6a7b-474f-9494-48cba1918e86	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	LURIN
t	2025-03-17 21:13:09.451162+00	2025-03-17 21:13:09.451165+00	ffe45492-d92f-4b4a-9b4e-226a74152582	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	ANDAMARCA
t	2025-03-17 21:13:09.457705+00	2025-03-17 21:13:09.457708+00	21113730-30c5-416b-9117-929985409222	14ecad5d-903d-42ac-b037-7f9cdcec77b2	HUACLLAN
t	2025-03-17 21:13:09.465463+00	2025-03-17 21:13:09.465466+00	497e3c10-da51-448c-b1d1-ddf746d3d9c3	37fe07d1-74f8-4777-941d-ba51afc1c160	HUACULLANI
t	2025-03-17 21:13:09.473094+00	2025-03-17 21:13:09.473098+00	e32f8494-699c-49b5-b4f7-eb2e40043b80	915063a0-1172-48a3-8b31-33715e1f2e3c	MIGUEL CHECA
t	2025-03-17 21:13:09.480422+00	2025-03-17 21:13:09.480433+00	82c2dcaa-5ad3-47f6-b4a0-d28052bbfb27	013c5ed1-ba41-4d8c-a7da-845849a7efb9	LA LIBERTAD
t	2025-03-17 21:13:09.487519+00	2025-03-17 21:13:09.487522+00	a70a54b5-e724-4e7b-81fc-ba5e030fe67d	802f9e1a-4b36-4787-ae41-e5aaca68da54	TRES DE DICIEMBRE
t	2025-03-17 21:13:09.493456+00	2025-03-17 21:13:09.49346+00	4df3ddad-512d-4bee-a6f8-f593c06acf62	42a3655b-687b-424b-a374-b0ab58d4f011	SANTA
t	2025-03-17 21:13:09.499147+00	2025-03-17 21:13:09.499151+00	af16937e-fa2d-4a64-9b4a-883035248c5c	c44b2db0-1ce6-4816-b16c-975486d5db85	SANTA ROSA DE QUIVES
t	2025-03-17 21:13:09.504805+00	2025-03-17 21:13:09.504808+00	ef2ae72f-12ff-4ba2-85c5-a7ab73aef180	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	PALCA
t	2025-03-17 21:13:09.510571+00	2025-03-17 21:13:09.510574+00	298a72f2-fc82-4543-a018-e8567c564c9b	b42841e0-44d6-4122-9396-858f0fbf2b1d	HUACHIS
t	2025-03-17 21:13:09.516963+00	2025-03-17 21:13:09.516966+00	9ca9cf77-98a3-4930-aeb7-9b1fc7a9991a	39b5f4f6-da10-4e59-90a1-ca1e4c8877dc	MARCAS
t	2025-03-17 21:13:09.522293+00	2025-03-17 21:13:09.522296+00	83ab4753-a568-4efd-87f8-dfa335613fff	e25f8297-7651-4d13-b583-e83edec11bc7	CELENDIN
t	2025-03-17 21:13:09.526499+00	2025-03-17 21:13:09.5265+00	f4fc9903-86aa-4970-ac20-d2017151bdc3	a3e76f78-476b-4191-8337-9b5b285b15de	MONZON
t	2025-03-17 21:13:09.531506+00	2025-03-17 21:13:09.531508+00	59a775d0-4378-4c49-9421-c79302325c55	e09f0261-1ea3-4fd7-a601-d7077e27ff43	CHONTABAMBA
t	2025-03-17 21:13:09.535839+00	2025-03-17 21:13:09.535841+00	d0a1f1a8-6f3b-4be8-9096-bcccf29fb960	83446550-f9ab-4a22-a1f0-308929aad66c	LONGOTEA
t	2025-03-17 21:13:09.54066+00	2025-03-17 21:13:09.540662+00	1800ba0b-a422-4ba9-aedd-9f84f6bff7e6	2bc54a70-eee6-4d04-90b9-06503d3b6067	TIRAPATA
t	2025-03-17 21:13:09.545884+00	2025-03-17 21:13:09.545887+00	d91f55a3-aef9-4685-9773-2fcecb8d3b95	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	ANDAYMARCA
t	2025-03-17 21:13:09.551986+00	2025-03-17 21:13:09.551989+00	ddbb406b-7079-44fa-bbb2-dde6bff8c4af	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	LA JALCA
t	2025-03-17 21:13:09.557167+00	2025-03-17 21:13:09.557169+00	424aa053-8cb9-404b-b4b7-14019986fa5c	b1166054-2099-441c-ba5d-e67d7e1d0645	LLACLLIN
t	2025-03-17 21:13:09.563993+00	2025-03-17 21:13:09.563997+00	29fd39bc-9221-435c-8d96-a3bf39d1217f	aed4ea90-0fa5-4394-9819-85ab6fdc76a5	MANAS
t	2025-03-17 21:13:09.569494+00	2025-03-17 21:13:09.569497+00	658c10d6-9aeb-4d56-8b6b-546f105c6be8	e61f54ef-373f-46b9-b05e-bfe23561ec46	SANTA TERESA
t	2025-03-17 21:13:09.574845+00	2025-03-17 21:13:09.574848+00	baa883e3-5d8e-4a66-8a38-eb100d3c55fe	043c2412-4dba-427d-800e-a374fffd45f7	EL CENEPA
t	2025-03-17 21:13:09.579506+00	2025-03-17 21:13:09.579508+00	5e60ce38-e94a-43da-8e00-ef2c082b2aed	ccad1c7a-1947-451e-8728-01cf9e71c3f0	HUACAYBAMBA
t	2025-03-17 21:13:09.585299+00	2025-03-17 21:13:09.585302+00	2f0abf99-05d2-46d1-828e-bb3c13c5d87e	bbf8aad6-4dd0-482a-884b-0b42f2179319	YURACYACU
t	2025-03-17 21:13:09.590739+00	2025-03-17 21:13:09.590743+00	89f925fe-3a53-4836-bf95-5bfcc5b8c64f	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	HUANUCO
t	2025-03-17 21:13:09.596006+00	2025-03-17 21:13:09.596009+00	e76d3af6-c919-4e5e-a196-ec89489c81f4	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	CHALCOS
t	2025-03-17 21:13:09.601188+00	2025-03-17 21:13:09.601192+00	585f05ef-6277-4cd3-a07b-8ddae6d61b82	d2871400-5eea-44cf-a5fa-e9ef6242f327	PURUS
t	2025-03-17 21:13:09.606584+00	2025-03-17 21:13:09.606588+00	7c02c0aa-860e-4f0c-9182-4a852821b8fd	14ecad5d-903d-42ac-b037-7f9cdcec77b2	CORIS
t	2025-03-17 21:13:09.611616+00	2025-03-17 21:13:09.611619+00	76e68788-d89f-4d82-9ed7-da790052d1c0	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	VILCA
t	2025-03-17 21:13:09.617221+00	2025-03-17 21:13:09.617224+00	88ee5ecf-e111-401d-8d6e-8e99b2095f87	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	NUEVE DE JULIO
t	2025-03-17 21:13:09.622623+00	2025-03-17 21:13:09.622626+00	ac7b78ae-c81b-4d4c-82cf-272d905f9262	ae046f24-a6bc-4f31-a81c-2bca0c494b67	MAQUIA
t	2025-03-17 21:13:09.628055+00	2025-03-17 21:13:09.628058+00	9a2e1104-6539-4bc9-b388-733963a67f71	3c8af264-3631-4747-a2a2-7b153fa4b672	ANDARAPA
t	2025-03-17 21:13:09.632941+00	2025-03-17 21:13:09.632945+00	0a2865a6-b097-4a26-9588-cef4eec543ef	193709f4-bd72-4989-8455-e92a7593cf92	MARA
t	2025-03-17 21:13:09.638072+00	2025-03-17 21:13:09.638075+00	b255fc07-a9af-43b1-a893-24deade132ab	54874897-aa17-4f9d-aa01-926f71b3bfdc	COALAQUE
t	2025-03-17 21:13:09.644078+00	2025-03-17 21:13:09.644082+00	ee628d63-007a-41d9-8875-627245fae52f	aa997785-178f-4ee0-ae0b-199383726bc3	TIGRE
t	2025-03-17 21:13:09.649424+00	2025-03-17 21:13:09.649427+00	f0dcbc83-d1b0-4ed0-992d-8646065f22dd	e8f3629d-e44f-4811-a9cb-78896582c0f4	CHOCHOPE
t	2025-03-17 21:13:09.65416+00	2025-03-17 21:13:09.654163+00	ad9d2291-d2c5-4235-91f3-20d5fedc00ad	6b370b4c-d286-40a1-8217-ee8f69ab0c0f	CORONEL CASTAÑEDA
t	2025-03-17 21:13:09.659955+00	2025-03-17 21:13:09.659958+00	9077e28a-e871-4e0e-9285-7cf00a3e5017	dce0a035-d91c-4f0a-a10f-aefa48915118	MARIA PARADO DE BELLIDO
t	2025-03-17 21:13:09.666197+00	2025-03-17 21:13:09.6662+00	37d1b9b7-b384-4ae0-96fc-15cf5de64ab2	a154aa5a-7dee-47d6-8448-b6744a59812d	PACCHO
t	2025-03-17 21:13:09.672151+00	2025-03-17 21:13:09.672154+00	715644f9-5d14-44e6-8ccf-6f0e77b20a09	4867fc63-7654-417d-8cb7-fd0de85acb77	IRAZOLA
t	2025-03-17 21:13:09.677645+00	2025-03-17 21:13:09.677648+00	673a38d1-c236-4844-833e-c2f14a9984bc	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	LEONOR ORDOÑEZ
t	2025-03-17 21:13:09.682876+00	2025-03-17 21:13:09.682879+00	5bc46ac6-385f-4fd8-8318-af1f9dad999b	4c515df3-386f-4376-a901-eb9876ac20da	MANCOS
t	2025-03-17 21:13:09.687767+00	2025-03-17 21:13:09.68777+00	9520440f-563a-41c9-baec-2341a487442b	2bc54a70-eee6-4d04-90b9-06503d3b6067	POTONI
t	2025-03-17 21:13:09.694237+00	2025-03-17 21:13:09.69424+00	9172e0be-075f-4d68-906f-4ed9ea0b3b56	2c09bf48-31df-47d1-bf45-11d7695ea002	SAN MATEO
t	2025-03-17 21:13:09.699738+00	2025-03-17 21:13:09.699741+00	86d83cb9-fcdf-44cf-85e9-8ee4e3d0d1fb	c5f4a998-3e9d-40be-a280-2d993d49b686	LIMATAMBO
t	2025-03-17 21:13:09.705436+00	2025-03-17 21:13:09.705439+00	c8cfa294-5597-4245-a046-f3f138de9daa	960e79f6-51c7-4335-b07a-7721b638f576	CHACOCHE
t	2025-03-17 21:13:09.711379+00	2025-03-17 21:13:09.711384+00	727d5362-5f29-4c75-9305-e46dc163e649	e6121f54-624d-44b3-ba2e-d07a7cfe7226	QUERCO
t	2025-03-17 21:13:09.716763+00	2025-03-17 21:13:09.716766+00	86cb77fa-c049-4a15-975d-825c2b59c3d3	6198f919-cc14-48e2-bc8f-cd4799b8f49b	PAUCARTAMBO
t	2025-03-17 21:13:09.722198+00	2025-03-17 21:13:09.722201+00	a159b587-06fe-4f22-b9fe-56bdead65a69	46a0b504-382b-4799-85d6-225617d83360	PACCHA
t	2025-03-17 21:13:09.727561+00	2025-03-17 21:13:09.727564+00	7619deb3-4b05-4d28-a144-30d71ba911d8	1a124fda-ccb8-45b3-b69b-e0453133d8d8	RUPA-RUPA
t	2025-03-17 21:13:09.733173+00	2025-03-17 21:13:09.733176+00	b994766e-d9f9-4299-abb1-94873f3c3070	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	SAN FRANCISCO DE CAYRAN
t	2025-03-17 21:13:09.739583+00	2025-03-17 21:13:09.739586+00	de19dc0b-0393-441d-bb4d-a4dc501c5c81	e7815c4d-9487-4bbf-aa91-b30ca9896721	COTAHUASI
t	2025-03-17 21:13:09.745389+00	2025-03-17 21:13:09.745392+00	b8bb97f0-e35e-401d-b362-9f2c99d15ed2	50381126-eaca-4e9d-9688-2d0ed3c35612	MONSEFU
t	2025-03-17 21:13:09.750779+00	2025-03-17 21:13:09.750781+00	32345dcc-48a7-4690-8b53-009ed7743aac	54874897-aa17-4f9d-aa01-926f71b3bfdc	ICHUÑA
t	2025-03-17 21:13:09.756005+00	2025-03-17 21:13:09.756007+00	5b481315-6693-4ec3-8fd0-850032891c5d	9b57564f-d3d6-466b-8a32-2eb5fab33e6b	LIVITACA
t	2025-03-17 21:13:09.761067+00	2025-03-17 21:13:09.76107+00	99b9726d-bac1-4bdb-803f-6c9d35ff5964	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	AYO
t	2025-03-17 21:13:09.767042+00	2025-03-17 21:13:09.767045+00	8c7ec800-9917-44e3-a8a5-9da06ac3357d	5f06e473-5acd-475a-b17f-aa63c7fa9783	CUISPES
t	2025-03-17 21:13:09.772982+00	2025-03-17 21:13:09.772985+00	14e68def-50dd-458d-acf5-c4afc67a362a	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	HUAYLLO
t	2025-03-17 21:13:09.777919+00	2025-03-17 21:13:09.777926+00	cec4fc25-3aef-420e-aa12-bb9d975d157a	a3e76f78-476b-4191-8337-9b5b285b15de	SINGA
t	2025-03-17 21:13:09.783754+00	2025-03-17 21:13:09.783757+00	80c4d874-8a53-4d0d-a1f1-13c0acb3e931	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	SANTILLANA
t	2025-03-17 21:13:09.789258+00	2025-03-17 21:13:09.789261+00	0a1815fe-72dc-4025-8ae8-59fadadb1c13	c5c7cd7a-16fd-4b52-bc0d-440a4b9ab23c	JESUS
t	2025-03-17 21:13:09.794554+00	2025-03-17 21:13:09.794557+00	326e373a-645a-43f8-a2d4-00cf5b217588	029d4c57-b401-421f-beeb-7d0fef5c0dbb	CHAVIÑA
t	2025-03-17 21:13:09.800951+00	2025-03-17 21:13:09.800954+00	74d8bd8f-44fd-4859-b8db-a4106b11e4eb	1535087f-84f1-4173-955d-c6bc686c7306	CONCEPCION
t	2025-03-17 21:13:09.807133+00	2025-03-17 21:13:09.807136+00	f3eaa665-650f-48fb-8e2c-81413a193e7b	d7ef5212-068e-4c9d-82ca-3a4aa4d5a2e5	PALPA
t	2025-03-17 21:13:09.813489+00	2025-03-17 21:13:09.813492+00	1ff8ee88-cf5e-4162-91f0-3d2268042572	56ad5343-c9f9-4787-a151-0f3d01c21dbb	MATO
t	2025-03-17 21:13:09.819018+00	2025-03-17 21:13:09.819021+00	1e273fb9-6fb1-43e9-8023-84d6690c0ee3	c3464dda-3d6f-443f-a987-ad215194f703	SIBAYO
t	2025-03-17 21:13:09.824025+00	2025-03-17 21:13:09.824028+00	4dd0daae-c366-4424-82d6-3fa0ec43d47d	e5987227-df60-4b9e-a9c8-ef624979e917	CANARIA
t	2025-03-17 21:13:09.830149+00	2025-03-17 21:13:09.830151+00	70cf6580-0719-466b-a9b7-0a7bba8b933b	c86c46dc-e039-43dc-9913-86e623472583	PARARCA
t	2025-03-17 21:13:09.836727+00	2025-03-17 21:13:09.83673+00	fc2cbe5a-2319-461f-b4be-deef5326a19f	cf7fa8b0-e545-40b4-99eb-d431d72c6c8d	CAJARURO
t	2025-03-17 21:13:09.842298+00	2025-03-17 21:13:09.842302+00	0681c4a4-a030-4b6a-98c0-61c483985a7e	915063a0-1172-48a3-8b31-33715e1f2e3c	IGNACIO ESCUDERO
t	2025-03-17 21:13:09.848109+00	2025-03-17 21:13:09.848112+00	7ebab1e4-3038-4f9e-b376-6cb6df454829	4f439eb6-7ff6-4f79-b681-05e3601f1b33	EL CARMEN
t	2025-03-17 21:13:09.853221+00	2025-03-17 21:13:09.853224+00	1a235c8e-b532-402b-baaf-1e5da4edc140	745905a9-8826-4ae2-bbeb-334a668eebe1	PICHIGUA
t	2025-03-17 21:13:09.858827+00	2025-03-17 21:13:09.85883+00	3ef958e3-1b52-478c-8922-6c2401c87fc5	adc985f9-78c3-4def-a9a0-4138987c6537	YAGUAS
t	2025-03-17 21:13:09.866038+00	2025-03-17 21:13:09.866041+00	240adc11-f81b-43a6-b9bd-369203da1178	792fb1cf-e799-4ec9-8dbf-339f60cf3179	TOURNAVISTA
t	2025-03-17 21:13:09.87268+00	2025-03-17 21:13:09.872685+00	7011044d-c899-494d-93c5-d0458e393dfc	e42231e6-aaee-4ff1-b63a-6fe0f1417241	MANCORA
t	2025-03-17 21:13:09.878385+00	2025-03-17 21:13:09.878388+00	7f15003c-7838-46a9-9ca8-561f48f9a243	3c8af264-3631-4747-a2a2-7b153fa4b672	POMACOCHA
t	2025-03-17 21:13:09.884274+00	2025-03-17 21:13:09.884277+00	9ee40a49-9878-4a4f-ba8a-e72dde0dbf81	34ab58b2-509d-451d-91db-da1dd6aa3a8e	PAMPA HERMOSA
t	2025-03-17 21:13:09.88994+00	2025-03-17 21:13:09.889943+00	cc23217a-1056-49f1-bd1d-005433c2fcc8	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	CUTERVO
t	2025-03-17 21:13:09.896252+00	2025-03-17 21:13:09.896257+00	eaf0aef5-7b90-4e50-802f-c5b05f7e452b	cc76f1f4-59f8-477e-ab55-63ef31302138	VISTA ALEGRE
t	2025-03-17 21:13:09.904612+00	2025-03-17 21:13:09.904615+00	1f873f19-b57c-4cf1-9430-be6d0c7bd86b	fcd7819a-4504-4907-b6e9-87e79982326b	IBERIA
t	2025-03-17 21:13:09.911477+00	2025-03-17 21:13:09.91148+00	dadfc4ab-76d4-4f65-9102-90cc97585dae	fbc0bd2f-d800-4706-b300-4eca7a818b49	NUEVO IMPERIAL
t	2025-03-17 21:13:09.917219+00	2025-03-17 21:13:09.917222+00	dc869b34-c685-4de6-91de-ff4b6fcbc622	5f06e473-5acd-475a-b17f-aa63c7fa9783	JUMBILLA
t	2025-03-17 21:13:09.922967+00	2025-03-17 21:13:09.922969+00	90f63ac2-c5c7-4ec2-ac9a-8ce8fc9fa3e3	c745de6d-713a-4613-951f-05d16e86739b	SAMUEL PASTOR
t	2025-03-17 21:13:09.929185+00	2025-03-17 21:13:09.929188+00	0539a6df-49f7-4a1c-b66f-3de2ae9ee654	c86c46dc-e039-43dc-9913-86e623472583	SAN JOSE DE USHUA
t	2025-03-17 21:13:09.935325+00	2025-03-17 21:13:09.93533+00	04cdc551-240b-4bed-a4e5-6350a253be8c	2bc54a70-eee6-4d04-90b9-06503d3b6067	SAN ANTON
t	2025-03-17 21:13:14.936711+00	2025-03-17 21:13:14.936713+00	6d4245d5-9314-4291-97aa-1abbb6bd2d47	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SANTA ROSA
t	2025-03-17 21:13:09.941525+00	2025-03-17 21:13:09.941531+00	50cbabea-0092-4dcc-92b2-df12d8af4b65	2c09bf48-31df-47d1-bf45-11d7695ea002	SANTIAGO DE ANCHUCAYA
t	2025-03-17 21:13:09.948778+00	2025-03-17 21:13:09.948783+00	2f7c6cde-c613-4d8c-a1f7-f51b0e65bce1	3af19559-c0e0-469f-9660-92f10b46789e	SAN GABAN
t	2025-03-17 21:13:09.956919+00	2025-03-17 21:13:09.956923+00	0138d4b7-aa77-4d80-ad66-7150a7fe0601	a154aa5a-7dee-47d6-8448-b6744a59812d	VEGUETA
t	2025-03-17 21:13:09.963311+00	2025-03-17 21:13:09.963314+00	513cc65e-46cd-4554-94eb-1ee6929ee325	e25f8297-7651-4d13-b583-e83edec11bc7	JORGE CHAVEZ
t	2025-03-17 21:13:09.970045+00	2025-03-17 21:13:09.970048+00	a37916ab-0bbc-441e-bc20-008a8e557773	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	CHAPARRA
t	2025-03-17 21:13:09.976928+00	2025-03-17 21:13:09.976932+00	0f35e02d-a232-4ab5-8cb3-84f4f1743692	63916004-9475-4b57-a40b-f707c2be8d2d	SUNAMPE
t	2025-03-17 21:13:09.984993+00	2025-03-17 21:13:09.984998+00	3177ca35-c520-408b-80e0-db4550b6bfe8	0c319822-58c6-435a-ab75-c3c72db37ed8	TINYAHUARCO
t	2025-03-17 21:13:09.993647+00	2025-03-17 21:13:09.993653+00	cb8c4a12-cddd-4d43-b094-77aef904f3c8	e8f3629d-e44f-4811-a9cb-78896582c0f4	MORROPE
t	2025-03-17 21:13:10.002281+00	2025-03-17 21:13:10.002285+00	f99f8d5c-77aa-4366-b962-0bc6fed5b236	193709f4-bd72-4989-8455-e92a7593cf92	CHALLHUAHUACHO
t	2025-03-17 21:13:10.008813+00	2025-03-17 21:13:10.008816+00	ddb3970d-f531-49c8-88ee-5da3cd710740	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	SANTO DOMINGO DE LA CAPILLA
t	2025-03-17 21:13:10.016189+00	2025-03-17 21:13:10.016193+00	0bd63d35-0cea-4e5b-aa41-fd5ef4c03daa	e6121f54-624d-44b3-ba2e-d07a7cfe7226	HUAYTARA
t	2025-03-17 21:13:10.023164+00	2025-03-17 21:13:10.023168+00	2e04e1c0-3be2-47d0-b377-4a5f7245d5d0	49d2b1fe-f699-429b-b6d9-384cb23f8b04	PADRE MARQUEZ
t	2025-03-17 21:13:10.030554+00	2025-03-17 21:13:10.03056+00	6eebcc74-e4bd-45f6-a928-66bf1bc8650f	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	SAN PABLO DE PILLAO
t	2025-03-17 21:13:10.037716+00	2025-03-17 21:13:10.037719+00	15798562-e80e-4a90-8323-5850f1edc8ba	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	CHACHAPOYAS
t	2025-03-17 21:13:10.044154+00	2025-03-17 21:13:10.044158+00	bbecc745-5d8e-47b5-aa72-8be532433d65	157ac8ce-05cf-4107-81ff-6c697fac45fd	BAJO BIAVO
t	2025-03-17 21:13:10.051638+00	2025-03-17 21:13:10.051645+00	ef71d09a-bae7-4ecc-966b-fe27e09e603d	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	SALCABAMBA
t	2025-03-17 21:13:10.059043+00	2025-03-17 21:13:10.059046+00	475270b8-1f64-45e4-af65-51a2086c00a9	a75e913b-1a31-4ba6-89c1-ef135099a204	SAN SALVADOR
t	2025-03-17 21:13:10.066903+00	2025-03-17 21:13:10.066908+00	ee871617-993a-4524-a129-fd05a36a67c7	bbf8aad6-4dd0-482a-884b-0b42f2179319	YORONGOS
t	2025-03-17 21:13:10.076356+00	2025-03-17 21:13:10.076359+00	5c565a99-0183-4004-99be-3f244f31e2ae	e7815c4d-9487-4bbf-aa91-b30ca9896721	TAURIA
t	2025-03-17 21:13:10.083211+00	2025-03-17 21:13:10.083215+00	0479f529-d965-49bf-8bf4-e7907252226e	6c20eceb-ede1-430a-b724-bfe76c2701ad	POMABAMBA
t	2025-03-17 21:13:10.091578+00	2025-03-17 21:13:10.091583+00	f3f5c9ef-290e-4827-a47e-b2b50602e1a0	f1f444d7-6007-4f07-be39-a71d94b84ca7	UMACHIRI
t	2025-03-17 21:13:10.099765+00	2025-03-17 21:13:10.099768+00	cc145616-e216-468b-8f2f-630fb0e1f4aa	2bc54a70-eee6-4d04-90b9-06503d3b6067	SAN JUAN DE SALINAS
t	2025-03-17 21:13:10.107823+00	2025-03-17 21:13:10.107828+00	e557695e-f660-433f-b948-629067fab737	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	TAMBO
t	2025-03-17 21:13:10.115189+00	2025-03-17 21:13:10.115192+00	9242ab77-1e20-4396-b2d9-6fb4483ed3aa	cc76f1f4-59f8-477e-ab55-63ef31302138	SANTA ROSA
t	2025-03-17 21:13:10.123905+00	2025-03-17 21:13:10.123911+00	d4d0caaf-5a0c-4961-9d8d-e30d5355cd49	9d7bb05d-7107-41b7-8fc0-29d110e2992d	HUACCANA
t	2025-03-17 21:13:10.131151+00	2025-03-17 21:13:10.131155+00	c2a293a4-5439-495f-a76a-dceffeb5d7a2	4867fc63-7654-417d-8cb7-fd0de85acb77	CURIMANA
t	2025-03-17 21:13:10.136189+00	2025-03-17 21:13:10.136191+00	b9447e80-9cad-4f55-9a75-33406d06eae7	aa8c638e-2ea0-4a72-9668-8057261bbfee	QUIVILLA
t	2025-03-17 21:13:10.142491+00	2025-03-17 21:13:10.142495+00	edf7d424-595c-42df-a9ee-bee505b5a2e3	e8f3629d-e44f-4811-a9cb-78896582c0f4	LAMBAYEQUE
t	2025-03-17 21:13:10.149074+00	2025-03-17 21:13:10.149077+00	01584d63-80e0-4bee-ac56-c2b58951ea28	e25f8297-7651-4d13-b583-e83edec11bc7	CORTEGANA
t	2025-03-17 21:13:10.154553+00	2025-03-17 21:13:10.154555+00	67d20e76-f9fe-4d71-b4d4-bd8eb6400b22	3c65165b-fec3-4cac-a995-07815d72b599	PACANGA
t	2025-03-17 21:13:10.162129+00	2025-03-17 21:13:10.162132+00	29640e6c-de5e-40e9-b382-48072f6dcc8d	fae002ab-c99a-457d-8f6d-9e9964312caf	PICHACANI
t	2025-03-17 21:13:10.169486+00	2025-03-17 21:13:10.16949+00	046aee48-ccff-4cda-88a0-8239ad954d01	bc89669e-ca8f-4a78-8a5a-f601b64fc944	PACHANGARA
t	2025-03-17 21:13:10.177434+00	2025-03-17 21:13:10.177437+00	ccad847b-684d-440c-9c53-a8c019260acb	2bc54a70-eee6-4d04-90b9-06503d3b6067	ARAPA
t	2025-03-17 21:13:10.184156+00	2025-03-17 21:13:10.18416+00	ef846ff2-db68-473f-882d-b39cc80be89a	802f9e1a-4b36-4787-ae41-e5aaca68da54	HUACHAC
t	2025-03-17 21:13:10.192389+00	2025-03-17 21:13:10.192397+00	f1fbdcba-6fa1-480c-8eb9-19c944fc34b9	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	ACORIA
t	2025-03-17 21:13:10.199139+00	2025-03-17 21:13:10.199142+00	a9449729-f0c7-4ba1-bc4d-e0b6313b52fc	afde374b-f6de-4e26-9694-e2e7378ee275	SAN LUIS
t	2025-03-17 21:13:10.205505+00	2025-03-17 21:13:10.205511+00	021866ce-dafe-4229-9634-1cddc2b449ec	f1f444d7-6007-4f07-be39-a71d94b84ca7	ANTAUTA
t	2025-03-17 21:13:10.211809+00	2025-03-17 21:13:10.211811+00	ab3b7bd6-27a0-48d9-b086-c9335353123f	802f9e1a-4b36-4787-ae41-e5aaca68da54	SAN JUAN DE YSCOS
t	2025-03-17 21:13:10.218084+00	2025-03-17 21:13:10.218089+00	27a8fb64-bf69-4267-a400-832e6370830d	0f00ebe8-c4f5-448e-a160-9c459750cf50	UCHIZA
t	2025-03-17 21:13:10.225298+00	2025-03-17 21:13:10.225305+00	2592c816-52c6-439b-a30d-2df192a5aa7a	957c7796-925d-4e7a-a997-1c18b7f41201	INDIANA
t	2025-03-17 21:13:10.231745+00	2025-03-17 21:13:10.231748+00	f1a45d66-9b5b-4a91-ab22-d18e967aeee3	e61f54ef-373f-46b9-b05e-bfe23561ec46	MARANURA
t	2025-03-17 21:13:10.23866+00	2025-03-17 21:13:10.238664+00	2e2065b7-5434-41db-97c8-23208178e98b	cc76f1f4-59f8-477e-ab55-63ef31302138	HUAMBO
t	2025-03-17 21:13:10.246934+00	2025-03-17 21:13:10.246938+00	afefc412-cc86-4a51-a158-1f46af620878	0653b015-1f1e-4073-b4a6-eddacd4d0018	CHAZUTA
t	2025-03-17 21:13:10.255502+00	2025-03-17 21:13:10.255505+00	70e95d4a-baaa-460f-910b-a52101df8911	cbc121ea-f1b1-4a06-97cb-c010f63ee492	QUIRUVILCA
t	2025-03-17 21:13:10.260971+00	2025-03-17 21:13:10.260974+00	010c28ed-5180-4f80-970d-5a7cefd5fd3c	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	ATAURA
t	2025-03-17 21:13:10.266125+00	2025-03-17 21:13:10.266127+00	efa3c27a-5bf0-4d8b-88ba-d250844c51ea	6198f919-cc14-48e2-bc8f-cd4799b8f49b	HUANCARANI
t	2025-03-17 21:13:10.270983+00	2025-03-17 21:13:10.270986+00	e526bc17-1378-4100-8918-053ed51db1ea	ea1da671-28f3-4192-ac87-6c6d5c9f5967	PUCARA
t	2025-03-17 21:13:10.277315+00	2025-03-17 21:13:10.277317+00	10c290da-f4a8-4944-9a84-5f2d22eb300e	2c09bf48-31df-47d1-bf45-11d7695ea002	SAN ANDRES DE TUPICOCHA
t	2025-03-17 21:13:10.282943+00	2025-03-17 21:13:10.282946+00	6742f45f-cead-447d-8915-1f0879f71929	83a45ddf-481f-4760-86f7-5d5ba4423a89	CURA MORI
t	2025-03-17 21:13:10.288506+00	2025-03-17 21:13:10.288509+00	4de9fb3e-106a-4da1-a3af-6cae6d27f0d4	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	ACAS
t	2025-03-17 21:13:10.293902+00	2025-03-17 21:13:10.293906+00	9d204d3d-04df-49e1-9b06-580aad5668b3	4302c314-c6b8-4319-adfa-220b32d49c8d	TENIENTE CESAR LOPEZ ROJAS
t	2025-03-17 21:13:10.29975+00	2025-03-17 21:13:10.299752+00	1d341f45-8a01-4e3a-9624-8ae7e5d547d0	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SAN MARTIN DE PORRES
t	2025-03-17 21:13:10.304972+00	2025-03-17 21:13:10.304975+00	2a491821-0a0c-45a4-8c7e-83c8cabb9e29	35972dee-bd82-40d7-aad3-b6f032924ddd	CURASCO
t	2025-03-17 21:13:10.31068+00	2025-03-17 21:13:10.310684+00	03f2ca6c-8c90-4b14-be69-6c2849812a00	3c8af264-3631-4747-a2a2-7b153fa4b672	PAMPACHIRI
t	2025-03-17 21:13:10.316528+00	2025-03-17 21:13:10.316531+00	5072813d-0028-4dc8-84c3-16c03ca745fe	013c5ed1-ba41-4d8c-a7da-845849a7efb9	TARICA
t	2025-03-17 21:13:10.322375+00	2025-03-17 21:13:10.322378+00	cd1fce5d-8720-4a3c-8067-ecd2427ec4cf	ccad1c7a-1947-451e-8728-01cf9e71c3f0	CANCHABAMBA
t	2025-03-17 21:13:10.329581+00	2025-03-17 21:13:10.329585+00	6f9c6c00-a06f-4538-a89d-3c3b192579c7	49d2b1fe-f699-429b-b6d9-384cb23f8b04	SARAYACU
t	2025-03-17 21:13:10.338469+00	2025-03-17 21:13:10.338474+00	90dd83a4-1b79-4749-b15f-8fb373896438	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	QUEROCOTILLO
t	2025-03-17 21:13:10.347693+00	2025-03-17 21:13:10.347698+00	964d97e2-cfc0-4883-bd93-6c6db352806c	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	SAUCEPAMPA
t	2025-03-17 21:13:10.356389+00	2025-03-17 21:13:10.356392+00	0b86ad09-51ce-4e61-85d0-3cc45397cd42	9d7bb05d-7107-41b7-8fc0-29d110e2992d	EL PORVENIR
t	2025-03-17 21:13:10.364149+00	2025-03-17 21:13:10.364154+00	f7834240-e269-4690-af79-e0f6c6c5d110	34ab58b2-509d-451d-91db-da1dd6aa3a8e	SATIPO
t	2025-03-17 21:13:10.371479+00	2025-03-17 21:13:10.371483+00	940d3d84-cbeb-4f50-a3d5-2a0ffc7922ff	0c319822-58c6-435a-ab75-c3c72db37ed8	NINACACA
t	2025-03-17 21:13:10.379585+00	2025-03-17 21:13:10.37959+00	2b25a6f6-91ed-4f47-9c5e-74dc6295c691	645a24ad-797e-4a8f-8376-d9b0a7afe5b2	AGUAS VERDES
t	2025-03-17 21:13:10.38762+00	2025-03-17 21:13:10.387625+00	fc8e301b-d79e-487f-9316-88366f324dcf	1535087f-84f1-4173-955d-c6bc686c7306	CARHUANCA
t	2025-03-17 21:13:10.396779+00	2025-03-17 21:13:10.396786+00	6b9c1d3c-8a4a-4fa4-972e-aa71f9573e00	cd1a779c-e303-4241-b40f-3a8bd328ae2a	SAN FRANCISCO DEL YESO
t	2025-03-17 21:13:10.407603+00	2025-03-17 21:13:10.407611+00	87d20e96-9b16-4e5f-8b76-4e1b578e7b92	50381126-eaca-4e9d-9688-2d0ed3c35612	OYOTUN
t	2025-03-17 21:13:10.416551+00	2025-03-17 21:13:10.416555+00	009a9113-432b-4d32-8241-31c69757486d	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	COLONIA
t	2025-03-17 21:13:10.425006+00	2025-03-17 21:13:10.425013+00	63a8259c-baf1-49a4-aa32-d577863f1308	74b3890f-d58c-4d92-b653-e1ceec0d1b55	PACHACUTEC
t	2025-03-17 21:13:10.433417+00	2025-03-17 21:13:10.433421+00	d79eb1de-6769-4004-ace8-04e367fe7dbf	10923be8-8983-423b-9d2e-5cceef4d9ebd	CARMEN ALTO
t	2025-03-17 21:13:10.440233+00	2025-03-17 21:13:10.440237+00	17a97c87-072a-418f-9f81-f1a21a5f4b82	ae046f24-a6bc-4f31-a81c-2bca0c494b67	YAQUERANA
t	2025-03-17 21:13:10.448232+00	2025-03-17 21:13:10.448237+00	891b94f9-2a7a-48ae-81d1-e730f2670444	5f06e473-5acd-475a-b17f-aa63c7fa9783	COROSHA
t	2025-03-17 21:13:10.456358+00	2025-03-17 21:13:10.456367+00	2119515b-9979-47e7-af30-7f5aae5baada	aa997785-178f-4ee0-ae0b-199383726bc3	PARINARI
t	2025-03-17 21:13:10.463996+00	2025-03-17 21:13:10.463999+00	5ac8304c-24e8-469d-9080-9aa4b4656151	b4abe853-410a-439c-a371-7c33a96d2566	NO APLICA
t	2025-03-17 21:13:14.871854+00	2025-03-17 21:13:14.871857+00	115e2a1b-7727-44d0-80aa-9e781813df73	e9ccabb0-d482-4488-845c-94f1fd0e96e6	BELLAVISTA
t	2025-03-17 21:13:14.87919+00	2025-03-17 21:13:14.879194+00	cc95a3fa-deb5-44de-a225-f857dbdf99a0	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	COMAS
t	2025-03-17 21:13:14.885878+00	2025-03-17 21:13:14.885882+00	2954eb14-176e-4481-899f-573f1c064d6f	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	INDEPENDENCIA
t	2025-03-17 21:13:14.891817+00	2025-03-17 21:13:14.891821+00	9086eee1-291e-4618-98e5-253670831af0	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	LA VICTORIA
t	2025-03-17 21:13:14.901536+00	2025-03-17 21:13:14.901539+00	2af5905a-eef4-4e9f-8e3d-0e60892cab52	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	MIRAFLORES
t	2025-03-17 21:13:14.911719+00	2025-03-17 21:13:14.911723+00	615ffbf3-9495-463b-ab93-7417e918f5d1	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	PUEBLO LIBRE
t	2025-03-17 21:13:14.918645+00	2025-03-17 21:13:14.918649+00	434f7b19-9311-4374-95c5-7e24adbed64d	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SAN ISIDRO
t	2025-03-17 21:13:14.925539+00	2025-03-17 21:13:14.925544+00	7c49a4a3-73ed-47fb-b1d1-ba4902ed2659	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SAN LUIS
t	2025-03-17 21:13:14.931043+00	2025-03-17 21:13:14.931046+00	94e6c425-aee1-4d7f-8705-8a76f99f0298	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SAN MIGUEL
t	2025-03-17 21:13:14.954578+00	2025-03-17 21:13:14.954582+00	51a55ef7-7191-4871-b887-43e7753cc33e	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	SALAMANCA
\.


--
-- Data for Name: entry_channel; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.entry_channel (status, registration_date, update_date, entry_channel_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.07164+00	\N	a5689997-3bae-4d88-b582-0762526e5f3e	2f363ce3-e629-42d7-8bb2-7892307e0275	TIKTOK
t	2025-03-17 21:13:14.071265+00	\N	d51c5328-fa5b-4035-a9dd-be9bddc6a8cc	2f363ce3-e629-42d7-8bb2-7892307e0275	WHATSAPP
t	2025-03-17 21:13:14.07169+00	\N	406b0be9-366b-4e77-a447-ea57973a8f7a	2f363ce3-e629-42d7-8bb2-7892307e0275	TWITTER
t	2025-03-17 21:13:14.073645+00	\N	2a2f2557-ccf3-408e-9a6a-5c530dc77c3d	2f363ce3-e629-42d7-8bb2-7892307e0275	INSTAGRAM
t	2025-03-17 21:13:14.074193+00	\N	67f7159a-7c09-4bb3-b08b-af24bc0d6c65	2f363ce3-e629-42d7-8bb2-7892307e0275	FACEBOOK
t	2025-03-17 21:13:14.075924+00	\N	be0db500-b7d2-40ad-913a-9212097e0354	2f363ce3-e629-42d7-8bb2-7892307e0275	WEB
t	2025-03-17 21:13:14.075934+00	\N	5138f4e8-1da7-4515-a74b-5708fe19775f	2f363ce3-e629-42d7-8bb2-7892307e0275	OTRO
\.


--
-- Data for Name: management_type; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.management_type (status, registration_date, update_date, management_type_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.643073+00	2025-03-17 21:13:14.643074+00	42b85b0b-2e53-457c-bf7c-deddcb162040	2f363ce3-e629-42d7-8bb2-7892307e0275	RECUPERO
t	2025-03-17 21:13:14.643009+00	2025-03-17 21:13:14.643012+00	d8caf74d-9c8d-4798-9f69-532e4afea62a	2f363ce3-e629-42d7-8bb2-7892307e0275	VENTA
t	2025-03-17 21:13:14.643009+00	2025-03-17 21:13:14.643012+00	9fc40fec-796a-41ab-a7f8-604bd86efb28	2f363ce3-e629-42d7-8bb2-7892307e0275	RESERVA
t	2025-03-17 21:13:14.643009+00	2025-03-17 21:13:14.643012+00	c314eb7d-9642-42fc-973e-867f695c40cf	2f363ce3-e629-42d7-8bb2-7892307e0275	CANJE
t	2025-03-17 21:13:14.643091+00	2025-03-17 21:13:14.643094+00	ec5fd3bc-0b9d-4509-8da3-c67529d4c284	2f363ce3-e629-42d7-8bb2-7892307e0275	CAMBIO
t	2025-03-17 21:13:14.643992+00	2025-03-17 21:13:14.643996+00	2c491a08-28d4-4f8b-bd22-edffeda5c7f8	2f363ce3-e629-42d7-8bb2-7892307e0275	PREVENTA
\.


--
-- Data for Name: membership_state; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.membership_state (status, registration_date, update_date, membership_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.692309+00	2025-03-17 21:13:14.692312+00	0235e557-92f8-40b1-9f19-2b760c6c6e79	2f363ce3-e629-42d7-8bb2-7892307e0275	PAGADA
t	2025-03-17 21:13:14.692307+00	2025-03-17 21:13:14.69231+00	bb59e4d0-3595-4b11-8f6b-b415afbd606f	2f363ce3-e629-42d7-8bb2-7892307e0275	EXPIRADA
t	2025-03-17 21:13:14.692307+00	2025-03-17 21:13:14.69231+00	4f1dd1f2-029d-471e-8988-42614b8f9716	2f363ce3-e629-42d7-8bb2-7892307e0275	ACTIVA
\.


--
-- Data for Name: module; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.module (monthly_price, status, registration_date, update_date, module_id, user_id, name) FROM stdin;
3	t	2025-03-17 21:13:13.946023+00	2025-03-17 21:13:13.946025+00	88b39995-4f3a-4ca9-af85-6b3f529997af	2f363ce3-e629-42d7-8bb2-7892307e0275	MÓDULO DE VENTAS
5	t	2025-03-17 21:13:13.952109+00	2025-03-17 21:13:13.952113+00	dcb30fb5-295b-4870-909c-ecc8ec023506	2f363ce3-e629-42d7-8bb2-7892307e0275	MÓDULO DE GESTIÓN
3	t	2025-03-17 21:13:13.957595+00	2025-03-17 21:13:13.957598+00	0806c596-06d0-4d92-b3d7-112e0c1c059a	2f363ce3-e629-42d7-8bb2-7892307e0275	ANALÍTICA DE VENTAS
5	t	2025-03-17 21:13:13.961991+00	2025-03-17 21:13:13.961994+00	60c85a9f-c15b-4c9e-b310-d54eaadf5f6f	2f363ce3-e629-42d7-8bb2-7892307e0275	INTEGRACION CON SHOPIFY
5	t	2025-03-17 21:13:13.965948+00	2025-03-17 21:13:13.965952+00	8e9b429a-5587-4b65-8667-35e76d18bd0f	2f363ce3-e629-42d7-8bb2-7892307e0275	MÓDULO DE ALMACÉN
15	t	2025-03-17 21:13:13.97006+00	2025-03-17 21:13:13.970062+00	b3655f7b-1d74-4b49-a0cd-18efbb79afd9	2f363ce3-e629-42d7-8bb2-7892307e0275	FACTURACIÓN ELECTRONICA
8	t	2025-03-17 21:13:13.974227+00	2025-03-17 21:13:13.974229+00	98c17d43-4232-4fbb-85fb-8d815c773465	2f363ce3-e629-42d7-8bb2-7892307e0275	MÓDULO DE REMARKETING
10	t	2025-03-17 21:13:13.978761+00	2025-03-17 21:13:13.978763+00	0ef17031-7a7e-4d23-b3ce-e2b8834a3c93	2f363ce3-e629-42d7-8bb2-7892307e0275	INTEGRACION CON MARKETPLACE
10	t	2025-03-17 21:13:13.982656+00	2025-03-17 21:13:13.982658+00	a6c224f3-7090-4b10-941b-1d46356e19e4	2f363ce3-e629-42d7-8bb2-7892307e0275	INTEGRACION TIENDA VIRTUAL
5	t	2025-03-17 21:13:13.98688+00	2025-03-17 21:13:13.986882+00	6c1a9c32-5898-45dd-b005-c8429f917be1	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO DE COURIER
5	t	2025-03-17 21:13:13.991341+00	2025-03-17 21:13:13.991344+00	27386840-4e27-4ff3-9511-57aa7c301ea3	2f363ce3-e629-42d7-8bb2-7892307e0275	MODULO DE FINANZAS
\.


--
-- Data for Name: order_state; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.order_state (status, registration_date, update_date, order_state_id, user_id, hex_color, name) FROM stdin;
t	2025-03-17 21:13:14.571992+00	2025-03-17 21:13:14.571995+00	505fa8c5-1c9a-4a77-b105-573b71d8b15c	2f363ce3-e629-42d7-8bb2-7892307e0275	#f5222d	FALLIDO
t	2025-03-17 21:13:14.572047+00	2025-03-17 21:13:14.57205+00	9e918c17-17cc-482e-82c6-d459882b90d8	2f363ce3-e629-42d7-8bb2-7892307e0275	#1890ff	POR RECOGER
t	2025-03-17 21:13:14.57206+00	2025-03-17 21:13:14.572062+00	22bc1499-dab5-497f-b75f-81bc4757bb42	2f363ce3-e629-42d7-8bb2-7892307e0275	#52c41a	ENTREGADO
t	2025-03-17 21:13:14.572047+00	2025-03-17 21:13:14.57205+00	c8bca9d3-c26b-48ce-8333-1631f073fd46	2f363ce3-e629-42d7-8bb2-7892307e0275	#00FF00	PREPARADO
t	2025-03-17 21:13:14.57245+00	2025-03-17 21:13:14.572452+00	cf860156-7168-4ada-bd07-ed44f57df3d6	2f363ce3-e629-42d7-8bb2-7892307e0275	#722ed1	LLAMAR
t	2025-03-17 21:13:14.572444+00	2025-03-17 21:13:14.572448+00	1dc23d55-d76f-4939-b984-001e875a7ca2	2f363ce3-e629-42d7-8bb2-7892307e0275	#2f54eb	RESERVADO
t	2025-03-17 21:13:14.572008+00	2025-03-17 21:13:14.572013+00	a895c275-9abb-4b5b-a8b5-96fd451b205a	2f363ce3-e629-42d7-8bb2-7892307e0275	#faad14	PENDIENTE DE STOCK
t	2025-03-17 21:13:14.572495+00	2025-03-17 21:13:14.572496+00	b5c0ee6c-00be-4c4b-b012-8bcd30ffd94a	2f363ce3-e629-42d7-8bb2-7892307e0275	#FFA500	PAGADO
t	2025-03-17 21:13:14.575433+00	2025-03-17 21:13:14.575438+00	981c887e-a944-4e8e-8710-f8862284e3bf	2f363ce3-e629-42d7-8bb2-7892307e0275	#d9d9d9	NO HAY STOCK
t	2025-03-17 21:13:14.576284+00	2025-03-17 21:13:14.576287+00	0f252436-c499-4fa3-8656-b426b0b375d7	2f363ce3-e629-42d7-8bb2-7892307e0275	#f2433d	PENDIENTE
t	2025-03-17 21:13:14.58192+00	2025-03-17 21:13:14.581923+00	d2a9d0ae-c571-4da7-906a-43176bed1cf1	2f363ce3-e629-42d7-8bb2-7892307e0275	#ad8b00	DEVOLUCION
t	2025-03-17 21:13:14.585689+00	2025-03-17 21:13:14.585691+00	96b76860-995e-4643-8ed2-337b722f3008	2f363ce3-e629-42d7-8bb2-7892307e0275	#13c2c2	AGENDADO
t	2025-03-17 21:13:14.586977+00	2025-03-17 21:13:14.586981+00	7287451e-1787-4abe-9bcc-7ff4b83247ce	2f363ce3-e629-42d7-8bb2-7892307e0275	#f5222d	CANCELADO
t	2025-03-17 21:13:14.587488+00	2025-03-17 21:13:14.587491+00	ff310975-e4dc-4271-89ca-020647442606	2f363ce3-e629-42d7-8bb2-7892307e0275	#008080	LLAMADO
t	2025-03-17 21:13:14.58744+00	2025-03-17 21:13:14.587443+00	e81bcd61-4c64-4eb0-a9ee-b6b6b9da46c8	2f363ce3-e629-42d7-8bb2-7892307e0275	#004d80	EN RUTA
\.


--
-- Data for Name: payment_method; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.payment_method (status, registration_date, update_date, payment_method_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.643719+00	2025-03-17 21:13:14.643722+00	71f7ed5d-4ba9-4f23-9a0f-c451f671b7ad	2f363ce3-e629-42d7-8bb2-7892307e0275	POS
t	2025-03-17 21:13:14.643727+00	2025-03-17 21:13:14.64373+00	9ef32682-3d6b-4ce0-8414-f068be4d457f	2f363ce3-e629-42d7-8bb2-7892307e0275	LINK
t	2025-03-17 21:13:14.643875+00	2025-03-17 21:13:14.643878+00	0a9db7f8-e15d-41a2-a350-b4da372eb617	2f363ce3-e629-42d7-8bb2-7892307e0275	EFECTIVO
t	2025-03-17 21:13:14.646571+00	2025-03-17 21:13:14.646576+00	be1ec0a0-91af-4ed0-a07a-47cf294dfb2c	2f363ce3-e629-42d7-8bb2-7892307e0275	YAPE
t	2025-03-17 21:13:14.652554+00	2025-03-17 21:13:14.652557+00	21ac737b-3e34-4713-9960-1c0966ccbe51	2f363ce3-e629-42d7-8bb2-7892307e0275	CAMBIO
t	2025-03-17 21:13:14.657092+00	2025-03-17 21:13:14.657096+00	a62e10cf-708e-4c78-8b19-c9cded0e4975	2f363ce3-e629-42d7-8bb2-7892307e0275	PLIN
t	2025-03-17 21:13:14.657182+00	2025-03-17 21:13:14.657184+00	f84cf0ea-7cd2-48fb-89c9-64ac3b214e8a	2f363ce3-e629-42d7-8bb2-7892307e0275	CONTRAENTREGA
t	2025-03-17 21:13:14.657185+00	2025-03-17 21:13:14.657189+00	bce09747-2136-4c50-9d40-c19d93ee797b	2f363ce3-e629-42d7-8bb2-7892307e0275	PLATAFORMA MP/WEB
t	2025-03-17 21:13:14.657204+00	2025-03-17 21:13:14.657207+00	215bda0f-e8e2-456e-85f6-f72bcd85bcad	2f363ce3-e629-42d7-8bb2-7892307e0275	CANJE
t	2025-03-17 21:13:14.658045+00	2025-03-17 21:13:14.658049+00	5159e2b4-4aeb-4304-967d-85e2d9b00dc7	2f363ce3-e629-42d7-8bb2-7892307e0275	BCP
t	2025-03-17 21:13:14.660451+00	2025-03-17 21:13:14.660454+00	6b627968-4bda-47d3-815b-9dce2350a9c9	2f363ce3-e629-42d7-8bb2-7892307e0275	INTERBANK
t	2025-03-17 21:13:14.661329+00	2025-03-17 21:13:14.661334+00	99ca632a-f4e3-49ce-82de-05e135c8490e	2f363ce3-e629-42d7-8bb2-7892307e0275	BANCO DE LA NACION
\.


--
-- Data for Name: payment_state; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.payment_state (status, registration_date, update_date, payment_state_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.589503+00	2025-03-17 21:13:14.589508+00	d328ebcc-0edd-4360-8bf6-aaba3fcc65a1	2f363ce3-e629-42d7-8bb2-7892307e0275	PERDIDA
t	2025-03-17 21:13:14.589503+00	2025-03-17 21:13:14.589508+00	14a925ca-0f2e-4e56-be74-d3943c9c1041	2f363ce3-e629-42d7-8bb2-7892307e0275	RECAUDADO
t	2025-03-17 21:13:14.589625+00	2025-03-17 21:13:14.589627+00	476bf84e-7392-474c-8131-0fbb61071409	2f363ce3-e629-42d7-8bb2-7892307e0275	POR RECAUDAR
\.


--
-- Data for Name: province; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.province (status, registration_date, update_date, department_id, province_id, name) FROM stdin;
t	2025-03-17 21:12:56.826294+00	2025-03-17 21:12:56.826318+00	e54cbf4b-fb48-4748-94b9-59c0213fa6cb	98d0224f-7b80-4fce-be5b-fa8afb3d5d61	SISTEMA
t	2025-03-17 21:12:58.735465+00	2025-03-17 21:12:58.735468+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	454a9077-d285-43fb-8f73-9898bccb31bb	YAROWILCA
t	2025-03-17 21:12:58.741516+00	2025-03-17 21:12:58.741519+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	186355ca-8fe2-4aa6-8445-132b479de1b5	MARAÑON
t	2025-03-17 21:12:58.74757+00	2025-03-17 21:12:58.747573+00	c2cec227-4f27-48ba-ae84-97baf7053980	ea1da671-28f3-4192-ac87-6c6d5c9f5967	JAEN
t	2025-03-17 21:12:58.754987+00	2025-03-17 21:12:58.754992+00	008109f1-ef93-443c-8615-36d6154f4363	87327c56-b236-4368-b80b-34d9952243ac	HUALLAGA
t	2025-03-17 21:12:58.761538+00	2025-03-17 21:12:58.761545+00	6e05b190-f77c-4493-8b73-8d7b145f775e	fcd7819a-4504-4907-b6e9-87e79982326b	TAHUAMANU
t	2025-03-17 21:12:58.768433+00	2025-03-17 21:12:58.768437+00	cc1ebf53-c458-4848-ae03-00f173fd7d91	26dfbd86-1b08-4168-8d5b-0f468fe9bbc9	DATEM DEL MARAÑON
t	2025-03-17 21:12:58.774734+00	2025-03-17 21:12:58.774743+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	87e9d712-7fef-4f4e-a7d1-111e719950ce	QUISPICANCHI
t	2025-03-17 21:12:58.782656+00	2025-03-17 21:12:58.782661+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	2dc69e0d-998b-495d-87a4-64f98a9260cd	MOHO
t	2025-03-17 21:12:58.789777+00	2025-03-17 21:12:58.789781+00	c2cec227-4f27-48ba-ae84-97baf7053980	fb3b3950-928c-4345-8bb6-8f89054c2e9b	SAN MIGUEL
t	2025-03-17 21:12:58.796078+00	2025-03-17 21:12:58.796085+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	3af19559-c0e0-469f-9660-92f10b46789e	CARABAYA
t	2025-03-17 21:12:58.804215+00	2025-03-17 21:12:58.804222+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	a0671457-1dd6-4137-b054-4f8a0d6515e5	PALLASCA
t	2025-03-17 21:12:58.81176+00	2025-03-17 21:12:58.811764+00	eac57f95-0120-4f3a-8a43-52547da7141e	3c65165b-fec3-4cac-a995-07815d72b599	CHEPEN
t	2025-03-17 21:12:58.818965+00	2025-03-17 21:12:58.818968+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	b42841e0-44d6-4122-9396-858f0fbf2b1d	HUARI
t	2025-03-17 21:12:58.826637+00	2025-03-17 21:12:58.826643+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	b763ddbd-4a9c-4883-bf39-ccabfca1f3b7	URUBAMBA
t	2025-03-17 21:12:58.834828+00	2025-03-17 21:12:58.834832+00	eac57f95-0120-4f3a-8a43-52547da7141e	3141399d-6c64-4abc-9890-83e3edff88a1	VIRU
t	2025-03-17 21:12:58.842413+00	2025-03-17 21:12:58.842417+00	9b18a617-06d6-47ef-a808-086d455baad5	f8df6cf4-6d33-4b55-a6ee-2fd3b1ad9b7c	TAYACAJA
t	2025-03-17 21:12:58.849216+00	2025-03-17 21:12:58.849221+00	1a5d0888-418f-4901-8ce3-58b7a0082455	960e79f6-51c7-4335-b07a-7721b638f576	ABANCAY
t	2025-03-17 21:12:58.856646+00	2025-03-17 21:12:58.856649+00	01bd3b5d-a13b-455e-a68d-fcda3e51b67f	83a45ddf-481f-4760-86f7-5d5ba4423a89	PIURA
t	2025-03-17 21:12:58.863367+00	2025-03-17 21:12:58.86337+00	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	fbc0bd2f-d800-4706-b300-4eca7a818b49	CAÑETE
t	2025-03-17 21:12:58.868691+00	2025-03-17 21:12:58.868695+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	57eae5d9-fae5-40b0-808f-4699285c2a8e	CANAS
t	2025-03-17 21:12:58.875879+00	2025-03-17 21:12:58.875887+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	b6200a73-f2d4-4543-8e14-909a4f3e7f32	LAURICOCHA
t	2025-03-17 21:12:58.884403+00	2025-03-17 21:12:58.884409+00	4b5c4963-89d4-4d53-bf18-6d9326b1b107	c1ae25de-54dd-4d24-90bd-2a41a350a944	ISLAY
t	2025-03-17 21:12:58.891321+00	2025-03-17 21:12:58.891325+00	9b18a617-06d6-47ef-a808-086d455baad5	4f439eb6-7ff6-4f79-b681-05e3601f1b33	CHURCAMPA
t	2025-03-17 21:12:58.899189+00	2025-03-17 21:12:58.899192+00	1a5d0888-418f-4901-8ce3-58b7a0082455	9d7bb05d-7107-41b7-8fc0-29d110e2992d	CHINCHEROS
t	2025-03-17 21:12:58.907175+00	2025-03-17 21:12:58.907179+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	745905a9-8826-4ae2-bbeb-334a668eebe1	ESPINAR
t	2025-03-17 21:12:58.913877+00	2025-03-17 21:12:58.913881+00	eac57f95-0120-4f3a-8a43-52547da7141e	83446550-f9ab-4a22-a1f0-308929aad66c	BOLIVAR
t	2025-03-17 21:12:58.920911+00	2025-03-17 21:12:58.920916+00	01bd3b5d-a13b-455e-a68d-fcda3e51b67f	084770c6-2080-4213-abe1-08c62f0eb28b	HUANCABAMBA
t	2025-03-17 21:12:58.926521+00	2025-03-17 21:12:58.926529+00	4b5c4963-89d4-4d53-bf18-6d9326b1b107	c2c1f083-00f1-42dc-b34b-7c274675fe6f	CONDESUYOS
t	2025-03-17 21:12:58.931666+00	2025-03-17 21:12:58.93167+00	585eedab-682a-4f38-abf5-2f1a20048d81	10923be8-8983-423b-9d2e-5cceef4d9ebd	HUAMANGA
t	2025-03-17 21:12:58.936857+00	2025-03-17 21:12:58.936861+00	585eedab-682a-4f38-abf5-2f1a20048d81	4eb7a0fa-c0f2-4be9-8067-69a1bddb105f	HUANTA
t	2025-03-17 21:12:58.941785+00	2025-03-17 21:12:58.941787+00	9fed89ae-eb4d-4bac-8f4c-b59cd4712cfa	54874897-aa17-4f9d-aa01-926f71b3bfdc	GENERAL SANCHEZ CERRO
t	2025-03-17 21:12:58.948678+00	2025-03-17 21:12:58.948683+00	9b18a617-06d6-47ef-a808-086d455baad5	efdcbed4-4e80-48e7-8992-8191ea2939b8	ANGARAES
t	2025-03-17 21:12:58.954529+00	2025-03-17 21:12:58.954532+00	5714c637-0118-434a-adb7-845e053679de	cf7fa8b0-e545-40b4-99eb-d431d72c6c8d	UTCUBAMBA
t	2025-03-17 21:12:58.959696+00	2025-03-17 21:12:58.9597+00	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	a154aa5a-7dee-47d6-8448-b6744a59812d	HUAURA
t	2025-03-17 21:12:58.965566+00	2025-03-17 21:12:58.965568+00	c2cec227-4f27-48ba-ae84-97baf7053980	a8a4b3eb-833f-4269-98b8-d5e76c3fb74c	SAN IGNACIO
t	2025-03-17 21:12:58.972582+00	2025-03-17 21:12:58.972588+00	01bd3b5d-a13b-455e-a68d-fcda3e51b67f	98e65496-68d3-4d43-bddc-22c7631c5b27	PAITA
t	2025-03-17 21:12:58.977878+00	2025-03-17 21:12:58.977881+00	71dda8ea-3972-4c5b-867b-d5d905ce7f7c	74b3890f-d58c-4d92-b653-e1ceec0d1b55	ICA
t	2025-03-17 21:12:58.983182+00	2025-03-17 21:12:58.983187+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	55340ef0-3d04-40ea-a070-cbb80d5755a5	CANCHIS
t	2025-03-17 21:12:58.992353+00	2025-03-17 21:12:58.992357+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	b5c477ac-5c22-4641-a743-47ccf2ee8c59	CARHUAZ
t	2025-03-17 21:12:58.998401+00	2025-03-17 21:12:58.998406+00	008109f1-ef93-443c-8615-36d6154f4363	187d7e64-5269-4ebb-953a-949acc68acd7	MARISCAL CACERES
t	2025-03-17 21:12:59.004653+00	2025-03-17 21:12:59.004658+00	eac57f95-0120-4f3a-8a43-52547da7141e	48baea8d-1683-43d2-80ed-35ccb06c4f37	GRAN CHIMU
t	2025-03-17 21:12:59.010509+00	2025-03-17 21:12:59.010512+00	5714c637-0118-434a-adb7-845e053679de	cd1a779c-e303-4241-b40f-3a8bd328ae2a	LUYA
t	2025-03-17 21:12:59.015653+00	2025-03-17 21:12:59.015656+00	671ad43a-a97f-4b3e-b88e-31d57bb9da7d	c66aef47-44ba-4f3a-bbf9-d3c3f463de54	FERREÑAFE
t	2025-03-17 21:12:59.021205+00	2025-03-17 21:12:59.021209+00	6e05b190-f77c-4493-8b73-8d7b145f775e	846cebba-a2b2-4b4c-85bb-c79e1ae2600c	MANU
t	2025-03-17 21:12:59.027029+00	2025-03-17 21:12:59.027033+00	c2cec227-4f27-48ba-ae84-97baf7053980	d49d555e-7431-4c64-a327-7c0eef9a1dc8	SAN MARCOS
t	2025-03-17 21:12:59.032422+00	2025-03-17 21:12:59.032425+00	05c5be37-e302-4ec4-9d60-71e3baf7afcc	4867fc63-7654-417d-8cb7-fd0de85acb77	PADRE ABAD
t	2025-03-17 21:12:59.038324+00	2025-03-17 21:12:59.038326+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	4c515df3-386f-4376-a901-eb9876ac20da	YUNGAY
t	2025-03-17 21:12:59.044582+00	2025-03-17 21:12:59.044587+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	aa8c638e-2ea0-4a72-9668-8057261bbfee	DOS DE MAYO
t	2025-03-17 21:12:59.050419+00	2025-03-17 21:12:59.050423+00	1a5d0888-418f-4901-8ce3-58b7a0082455	35972dee-bd82-40d7-aad3-b6f032924ddd	GRAU
t	2025-03-17 21:12:59.056217+00	2025-03-17 21:12:59.056224+00	eac57f95-0120-4f3a-8a43-52547da7141e	25d0ad5a-7f16-4975-bcd1-dc9b1d18f30a	SANCHEZ CARRION
t	2025-03-17 21:12:59.061677+00	2025-03-17 21:12:59.06168+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	25fae8ef-3678-4898-9063-605c52bdc629	HUARMEY
t	2025-03-17 21:12:59.0682+00	2025-03-17 21:12:59.068206+00	008109f1-ef93-443c-8615-36d6154f4363	bbf8aad6-4dd0-482a-884b-0b42f2179319	RIOJA
t	2025-03-17 21:12:59.075479+00	2025-03-17 21:12:59.075486+00	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	aed4ea90-0fa5-4394-9819-85ab6fdc76a5	CAJATAMBO
t	2025-03-17 21:12:59.082531+00	2025-03-17 21:12:59.082534+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	f25dcc28-5abe-4b1a-bcfe-9de19ced6787	HUANCANE
t	2025-03-17 21:12:59.088898+00	2025-03-17 21:12:59.088901+00	9b18a617-06d6-47ef-a808-086d455baad5	39b5f4f6-da10-4e59-90a1-ca1e4c8877dc	ACOBAMBA
t	2025-03-17 21:12:59.094428+00	2025-03-17 21:12:59.094431+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	6f01c2b3-c170-49f4-a21b-c1fae42b9815	SIHUAS
t	2025-03-17 21:12:59.099359+00	2025-03-17 21:12:59.099362+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	42a3655b-687b-424b-a374-b0ab58d4f011	SANTA
t	2025-03-17 21:12:59.104879+00	2025-03-17 21:12:59.104882+00	a6dcff66-1d61-4879-8b19-7e8dbc15cb8d	e7d5b8b6-66d7-4611-ad0f-4ea3be3ebeec	DANIEL ALCIDES CARRION
t	2025-03-17 21:12:59.109382+00	2025-03-17 21:12:59.109385+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	afde374b-f6de-4e26-9694-e2e7378ee275	CARLOS FERMIN FITZCARRALD
t	2025-03-17 21:12:59.113972+00	2025-03-17 21:12:59.113974+00	eac57f95-0120-4f3a-8a43-52547da7141e	c790e80f-15e1-4e44-b272-1ef57bb9c991	OTUZCO
t	2025-03-17 21:12:59.120973+00	2025-03-17 21:12:59.120975+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	fae002ab-c99a-457d-8f6d-9e9964312caf	PUNO
t	2025-03-17 21:12:59.127524+00	2025-03-17 21:12:59.127528+00	b6f7696e-ecf0-489f-bcd0-2ef7762fd854	ab26eff7-de79-4815-9cd6-d53359f9d7f1	CONTRALMIRANTE VILLAR
t	2025-03-17 21:12:59.134013+00	2025-03-17 21:12:59.134017+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	e61f54ef-373f-46b9-b05e-bfe23561ec46	LA CONVENCION
t	2025-03-17 21:12:59.141394+00	2025-03-17 21:12:59.141398+00	c2cec227-4f27-48ba-ae84-97baf7053980	e25f8297-7651-4d13-b583-e83edec11bc7	CELENDIN
t	2025-03-17 21:12:59.150743+00	2025-03-17 21:12:59.150749+00	585eedab-682a-4f38-abf5-2f1a20048d81	0bb9dd4c-635e-4e95-944e-56e03f7a87ef	SUCRE
t	2025-03-17 21:12:59.157411+00	2025-03-17 21:12:59.157414+00	71dda8ea-3972-4c5b-867b-d5d905ce7f7c	63916004-9475-4b57-a40b-f707c2be8d2d	CHINCHA
t	2025-03-17 21:12:59.164217+00	2025-03-17 21:12:59.164222+00	eac57f95-0120-4f3a-8a43-52547da7141e	4b571beb-3d2d-4889-ad57-fd15c191be22	JULCAN
t	2025-03-17 21:12:59.17057+00	2025-03-17 21:12:59.170575+00	cc1ebf53-c458-4848-ae03-00f173fd7d91	957c7796-925d-4e7a-a997-1c18b7f41201	MAYNAS
t	2025-03-17 21:12:59.17714+00	2025-03-17 21:12:59.177143+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	fdbbb089-cb94-4751-b70e-8bb8f82bdd28	SAN ROMAN
t	2025-03-17 21:12:59.183232+00	2025-03-17 21:12:59.183236+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	ccad1c7a-1947-451e-8728-01cf9e71c3f0	HUACAYBAMBA
t	2025-03-17 21:12:59.189498+00	2025-03-17 21:12:59.1895+00	eac57f95-0120-4f3a-8a43-52547da7141e	8ae34c95-7c05-4880-915b-49c44ac13bd1	PACASMAYO
t	2025-03-17 21:12:59.194984+00	2025-03-17 21:12:59.194988+00	5714c637-0118-434a-adb7-845e053679de	cc76f1f4-59f8-477e-ab55-63ef31302138	RODRIGUEZ DE MENDOZA
t	2025-03-17 21:12:59.200097+00	2025-03-17 21:12:59.200099+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	d2e34ee4-e38b-4602-8fb6-b2f7a29d135c	HUANUCO
t	2025-03-17 21:12:59.205162+00	2025-03-17 21:12:59.205166+00	05c5be37-e302-4ec4-9d60-71e3baf7afcc	d2871400-5eea-44cf-a5fa-e9ef6242f327	PURUS
t	2025-03-17 21:12:59.210216+00	2025-03-17 21:12:59.210218+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	a3e76f78-476b-4191-8337-9b5b285b15de	HUAMALIES
t	2025-03-17 21:12:59.215539+00	2025-03-17 21:12:59.215542+00	585eedab-682a-4f38-abf5-2f1a20048d81	029d4c57-b401-421f-beeb-7d0fef5c0dbb	LUCANAS
t	2025-03-17 21:12:59.220895+00	2025-03-17 21:12:59.220897+00	c2cec227-4f27-48ba-ae84-97baf7053980	c5c7cd7a-16fd-4b52-bc0d-440a4b9ab23c	CAJAMARCA
t	2025-03-17 21:12:59.22726+00	2025-03-17 21:12:59.227264+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	5b08eab1-14c5-448c-8832-40f39e2a1840	ACOMAYO
t	2025-03-17 21:12:59.232845+00	2025-03-17 21:12:59.232847+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	56ad5343-c9f9-4787-a151-0f3d01c21dbb	HUAYLAS
t	2025-03-17 21:12:59.237966+00	2025-03-17 21:12:59.237968+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	5250e4c2-488d-4a7d-bdc9-d2633361c510	SAN ANTONIO DE PUTINA
t	2025-03-17 21:12:59.242883+00	2025-03-17 21:12:59.242887+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	6a63b22a-2f1a-4c61-bf16-53cd00081db0	CORONGO
t	2025-03-17 21:12:59.248769+00	2025-03-17 21:12:59.248773+00	008109f1-ef93-443c-8615-36d6154f4363	a6dc953c-4d00-40b8-b291-34929747c50c	MOYOBAMBA
t	2025-03-17 21:12:59.254664+00	2025-03-17 21:12:59.25467+00	a6dcff66-1d61-4879-8b19-7e8dbc15cb8d	0c319822-58c6-435a-ab75-c3c72db37ed8	PASCO
t	2025-03-17 21:12:59.262027+00	2025-03-17 21:12:59.26203+00	f529af54-448a-4109-a46d-104ff28f07c0	6a5cf9a4-6f24-4a7e-b672-4b80cc5aecf7	JUNIN
t	2025-03-17 21:12:59.268269+00	2025-03-17 21:12:59.268275+00	c2cec227-4f27-48ba-ae84-97baf7053980	384003f9-fd40-42d7-bbcb-42d84f70c15d	HUALGAYOC
t	2025-03-17 21:12:59.273369+00	2025-03-17 21:12:59.273371+00	4b5c4963-89d4-4d53-bf18-6d9326b1b107	dc4070d6-a719-4c5c-8c7d-8e2c705f7eef	CARAVELI
t	2025-03-17 21:12:59.27922+00	2025-03-17 21:12:59.279224+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	1a124fda-ccb8-45b3-b69b-e0453133d8d8	LEONCIO PRADO
t	2025-03-17 21:12:59.285752+00	2025-03-17 21:12:59.285756+00	c2cec227-4f27-48ba-ae84-97baf7053980	5d4ee5b0-d0ff-4516-b31d-dfda81b61b02	CAJABAMBA
t	2025-03-17 21:12:59.29181+00	2025-03-17 21:12:59.291814+00	c2cec227-4f27-48ba-ae84-97baf7053980	12f1d3ac-6d49-46b4-8553-07f33b5be588	SAN PABLO
t	2025-03-17 21:12:59.298516+00	2025-03-17 21:12:59.298519+00	1a5d0888-418f-4901-8ce3-58b7a0082455	3c8af264-3631-4747-a2a2-7b153fa4b672	ANDAHUAYLAS
t	2025-03-17 21:12:59.304169+00	2025-03-17 21:12:59.304173+00	cc1ebf53-c458-4848-ae03-00f173fd7d91	49d2b1fe-f699-429b-b6d9-384cb23f8b04	UCAYALI
t	2025-03-17 21:12:59.311774+00	2025-03-17 21:12:59.311776+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	6198f919-cc14-48e2-bc8f-cd4799b8f49b	PAUCARTAMBO
t	2025-03-17 21:12:59.317265+00	2025-03-17 21:12:59.317268+00	4b5c4963-89d4-4d53-bf18-6d9326b1b107	e7815c4d-9487-4bbf-aa91-b30ca9896721	LA UNION
t	2025-03-17 21:12:59.322912+00	2025-03-17 21:12:59.322914+00	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	956d4ecd-a18c-4758-bb6a-cb38c449e32c	HUARAL
t	2025-03-17 21:12:59.330006+00	2025-03-17 21:12:59.33001+00	8466176d-7fec-439d-a138-60eb019be911	e9ccabb0-d482-4488-845c-94f1fd0e96e6	CALLAO
t	2025-03-17 21:12:59.335976+00	2025-03-17 21:12:59.33598+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	da261af9-5596-4188-b73d-5c091ad57d8b	MARISCAL LUZURIAGA
t	2025-03-17 21:12:59.341475+00	2025-03-17 21:12:59.341479+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	b1166054-2099-441c-ba5d-e67d7e1d0645	RECUAY
t	2025-03-17 21:12:59.348683+00	2025-03-17 21:12:59.34869+00	008109f1-ef93-443c-8615-36d6154f4363	ebe625dc-5bbd-47b5-bc9f-797ec65eedef	EL DORADO
t	2025-03-17 21:12:59.355057+00	2025-03-17 21:12:59.355061+00	cc1ebf53-c458-4848-ae03-00f173fd7d91	adc985f9-78c3-4def-a9a0-4138987c6537	PUTUMAYO
t	2025-03-17 21:12:59.359598+00	2025-03-17 21:12:59.3596+00	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	5f8bbb5f-2b74-46e5-a9b4-db9e64194ea2	YAUYOS
t	2025-03-17 21:12:59.364766+00	2025-03-17 21:12:59.36477+00	eac57f95-0120-4f3a-8a43-52547da7141e	62bc063a-ebad-48e0-8d45-7ed5c604ed27	ASCOPE
t	2025-03-17 21:12:59.370157+00	2025-03-17 21:12:59.370161+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	8eb85dc7-057c-4c9c-890b-3fc9f739fba7	PARURO
t	2025-03-17 21:12:59.374437+00	2025-03-17 21:12:59.374439+00	01bd3b5d-a13b-455e-a68d-fcda3e51b67f	915063a0-1172-48a3-8b31-33715e1f2e3c	SULLANA
t	2025-03-17 21:12:59.379984+00	2025-03-17 21:12:59.379987+00	4d831775-ae37-4dd6-bf75-1238d20e75c0	4d11370d-0157-4af4-b89d-731e4516658a	TACNA
t	2025-03-17 21:12:59.385362+00	2025-03-17 21:12:59.385364+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	87de50fb-aaa2-4cf0-ab34-cd5ef888b5f5	OCROS
t	2025-03-17 21:12:59.390797+00	2025-03-17 21:12:59.390801+00	eac57f95-0120-4f3a-8a43-52547da7141e	071e4b6b-e409-45e8-ab65-9ae4cc94f1b3	TRUJILLO
t	2025-03-17 21:12:59.396389+00	2025-03-17 21:12:59.396394+00	671ad43a-a97f-4b3e-b88e-31d57bb9da7d	50381126-eaca-4e9d-9688-2d0ed3c35612	CHICLAYO
t	2025-03-17 21:12:59.403186+00	2025-03-17 21:12:59.40319+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	013c5ed1-ba41-4d8c-a7da-845849a7efb9	HUARAZ
t	2025-03-17 21:12:59.410026+00	2025-03-17 21:12:59.410029+00	585eedab-682a-4f38-abf5-2f1a20048d81	e5987227-df60-4b9e-a9c8-ef624979e917	VICTOR FAJARDO
t	2025-03-17 21:12:59.414701+00	2025-03-17 21:12:59.414703+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	3802be26-bb36-4da3-9d01-4b889d15548f	LAMPA
t	2025-03-17 21:12:59.4197+00	2025-03-17 21:12:59.419703+00	05c5be37-e302-4ec4-9d60-71e3baf7afcc	5b797ca5-ff5a-496b-bfce-d18fb4e97a04	ATALAYA
t	2025-03-17 21:12:59.42486+00	2025-03-17 21:12:59.424864+00	f529af54-448a-4109-a46d-104ff28f07c0	c2fb14bb-3ef0-4dc9-b886-e92d2e60d2bd	CONCEPCION
t	2025-03-17 21:12:59.430313+00	2025-03-17 21:12:59.430315+00	71dda8ea-3972-4c5b-867b-d5d905ce7f7c	d7ef5212-068e-4c9d-82ca-3a4aa4d5a2e5	PALPA
t	2025-03-17 21:12:59.434607+00	2025-03-17 21:12:59.43461+00	c2cec227-4f27-48ba-ae84-97baf7053980	23397af4-baff-4db8-b639-166478d622d1	CONTUMAZA
t	2025-03-17 21:12:59.440146+00	2025-03-17 21:12:59.440149+00	b6f7696e-ecf0-489f-bcd0-2ef7762fd854	c9678f77-84c7-4648-9a0c-4e6c0bba1844	TUMBES
t	2025-03-17 21:12:59.445225+00	2025-03-17 21:12:59.445229+00	4d831775-ae37-4dd6-bf75-1238d20e75c0	e479934c-2453-4ba8-a477-47d8f7b30704	CANDARAVE
t	2025-03-17 21:12:59.450999+00	2025-03-17 21:12:59.451003+00	5714c637-0118-434a-adb7-845e053679de	5f06e473-5acd-475a-b17f-aa63c7fa9783	BONGARA
t	2025-03-17 21:12:59.456021+00	2025-03-17 21:12:59.456024+00	585eedab-682a-4f38-abf5-2f1a20048d81	1eea72bc-f5c7-4c7e-8c54-19e1c6c9e918	LA MAR
t	2025-03-17 21:12:59.460794+00	2025-03-17 21:12:59.460796+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	14ecad5d-903d-42ac-b037-7f9cdcec77b2	AIJA
t	2025-03-17 21:12:59.464928+00	2025-03-17 21:12:59.464931+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	a75e913b-1a31-4ba6-89c1-ef135099a204	CALCA
t	2025-03-17 21:12:59.469479+00	2025-03-17 21:12:59.469482+00	c2cec227-4f27-48ba-ae84-97baf7053980	c3d03295-6b8c-4abe-a0c5-e3461db3c1d3	SANTA CRUZ
t	2025-03-17 21:12:59.475969+00	2025-03-17 21:12:59.475976+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	c5f4a998-3e9d-40be-a280-2d993d49b686	ANTA
t	2025-03-17 21:12:59.482404+00	2025-03-17 21:12:59.482407+00	c2cec227-4f27-48ba-ae84-97baf7053980	2fe9c726-f99e-4236-9971-d40dcc8f8a4a	CUTERVO
t	2025-03-17 21:12:59.487996+00	2025-03-17 21:12:59.487998+00	5714c637-0118-434a-adb7-845e053679de	043c2412-4dba-427d-800e-a374fffd45f7	CONDORCANQUI
t	2025-03-17 21:12:59.493728+00	2025-03-17 21:12:59.493732+00	9fed89ae-eb4d-4bac-8f4c-b59cd4712cfa	1bdc26fa-d3e6-4ac9-92f0-4270e897cee0	MARISCAL NIETO
t	2025-03-17 21:12:59.500082+00	2025-03-17 21:12:59.500085+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	03fb2350-5ceb-4af7-9e21-98ba632a11c3	EL COLLAO
t	2025-03-17 21:12:59.504533+00	2025-03-17 21:12:59.504537+00	1a5d0888-418f-4901-8ce3-58b7a0082455	193709f4-bd72-4989-8455-e92a7593cf92	COTABAMBAS
t	2025-03-17 21:12:59.509928+00	2025-03-17 21:12:59.509932+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	e02ca1a8-e500-491d-9a6d-69149df77156	PACHITEA
t	2025-03-17 21:12:59.5152+00	2025-03-17 21:12:59.515203+00	4b5c4963-89d4-4d53-bf18-6d9326b1b107	c3464dda-3d6f-443f-a987-ad215194f703	CAYLLOMA
t	2025-03-17 21:12:59.52036+00	2025-03-17 21:12:59.520365+00	b6f7696e-ecf0-489f-bcd0-2ef7762fd854	645a24ad-797e-4a8f-8376-d9b0a7afe5b2	ZARUMILLA
t	2025-03-17 21:12:59.52545+00	2025-03-17 21:12:59.525453+00	01bd3b5d-a13b-455e-a68d-fcda3e51b67f	e42231e6-aaee-4ff1-b63a-6fe0f1417241	TALARA
t	2025-03-17 21:12:59.530879+00	2025-03-17 21:12:59.530882+00	9b18a617-06d6-47ef-a808-086d455baad5	e6121f54-624d-44b3-ba2e-d07a7cfe7226	HUAYTARA
t	2025-03-17 21:12:59.536736+00	2025-03-17 21:12:59.536741+00	4b5c4963-89d4-4d53-bf18-6d9326b1b107	3f11c7b6-6cf8-40ad-bc5f-113a18ae96bf	CASTILLA
t	2025-03-17 21:12:59.541964+00	2025-03-17 21:12:59.541969+00	01bd3b5d-a13b-455e-a68d-fcda3e51b67f	1e747a8b-ad85-4e35-ad63-70fb3ad6da2d	AYABACA
t	2025-03-17 21:12:59.547357+00	2025-03-17 21:12:59.54736+00	585eedab-682a-4f38-abf5-2f1a20048d81	6b370b4c-d286-40a1-8217-ee8f69ab0c0f	PARINACOCHAS
t	2025-03-17 21:12:59.552362+00	2025-03-17 21:12:59.552366+00	5714c637-0118-434a-adb7-845e053679de	0695b6c6-6e42-456e-b2c7-1ddadf9370f7	CHACHAPOYAS
t	2025-03-17 21:12:59.55745+00	2025-03-17 21:12:59.557453+00	f529af54-448a-4109-a46d-104ff28f07c0	4bf4170f-e0ab-484c-8fbf-368ef843dc61	TARMA
t	2025-03-17 21:12:59.562741+00	2025-03-17 21:12:59.562745+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	cf4cb352-ae23-46de-9fc3-a94554ae89dd	AMBO
t	2025-03-17 21:12:59.56869+00	2025-03-17 21:12:59.568694+00	008109f1-ef93-443c-8615-36d6154f4363	0653b015-1f1e-4073-b4a6-eddacd4d0018	SAN MARTIN
t	2025-03-17 21:12:59.573729+00	2025-03-17 21:12:59.573734+00	4d831775-ae37-4dd6-bf75-1238d20e75c0	a1f38acb-98af-4cf8-8788-1d479a1e26e3	JORGE BASADRE
t	2025-03-17 21:12:59.579208+00	2025-03-17 21:12:59.579212+00	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	bc89669e-ca8f-4a78-8a5a-f601b64fc944	OYON
t	2025-03-17 21:12:59.584938+00	2025-03-17 21:12:59.584942+00	f529af54-448a-4109-a46d-104ff28f07c0	802f9e1a-4b36-4787-ae41-e5aaca68da54	CHUPACA
t	2025-03-17 21:12:59.596218+00	2025-03-17 21:12:59.596222+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	6c20eceb-ede1-430a-b724-bfe76c2701ad	POMABAMBA
t	2025-03-17 21:12:59.601965+00	2025-03-17 21:12:59.601971+00	eac57f95-0120-4f3a-8a43-52547da7141e	cc9a3bf5-80b3-467a-8aed-d1b05d8ea04b	PATAZ
t	2025-03-17 21:12:59.606836+00	2025-03-17 21:12:59.606838+00	585eedab-682a-4f38-abf5-2f1a20048d81	dce0a035-d91c-4f0a-a10f-aefa48915118	CANGALLO
t	2025-03-17 21:12:59.611642+00	2025-03-17 21:12:59.611645+00	cc1ebf53-c458-4848-ae03-00f173fd7d91	4302c314-c6b8-4319-adfa-220b32d49c8d	ALTO AMAZONAS
t	2025-03-17 21:12:59.616659+00	2025-03-17 21:12:59.616662+00	f529af54-448a-4109-a46d-104ff28f07c0	36f58ca7-5727-4024-865f-eb4f4ecbe4a0	JAUJA
t	2025-03-17 21:12:59.621424+00	2025-03-17 21:12:59.621426+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	9b57564f-d3d6-466b-8a32-2eb5fab33e6b	CHUMBIVILCAS
t	2025-03-17 21:12:59.626511+00	2025-03-17 21:12:59.626517+00	671ad43a-a97f-4b3e-b88e-31d57bb9da7d	e8f3629d-e44f-4811-a9cb-78896582c0f4	LAMBAYEQUE
t	2025-03-17 21:12:59.632727+00	2025-03-17 21:12:59.63273+00	eac57f95-0120-4f3a-8a43-52547da7141e	cbc121ea-f1b1-4a06-97cb-c010f63ee492	SANTIAGO DE CHUCO
t	2025-03-17 21:12:59.638585+00	2025-03-17 21:12:59.638588+00	9fed89ae-eb4d-4bac-8f4c-b59cd4712cfa	1baa3fa5-23b2-4611-b753-c56dd60b5f0d	ILO
t	2025-03-17 21:12:59.6443+00	2025-03-17 21:12:59.644304+00	f529af54-448a-4109-a46d-104ff28f07c0	a4dc3a42-25f5-4178-a9e7-66ef66e42aeb	YAULI
t	2025-03-17 21:12:59.650035+00	2025-03-17 21:12:59.650039+00	585eedab-682a-4f38-abf5-2f1a20048d81	dd0e7397-1a90-4e9b-b393-7faa473b1ad5	HUANCA SANCOS
t	2025-03-17 21:12:59.657433+00	2025-03-17 21:12:59.657437+00	6e05b190-f77c-4493-8b73-8d7b145f775e	fd1c39dc-b8e3-4134-81ff-fe49a1a53595	TAMBOPATA
t	2025-03-17 21:12:59.663924+00	2025-03-17 21:12:59.663927+00	9d0864a4-e335-49e2-849d-34c3ffcf431d	cc0ea4e4-1184-4e35-8056-ce01bdb4f473	CUSCO
t	2025-03-17 21:12:59.669124+00	2025-03-17 21:12:59.669126+00	01bd3b5d-a13b-455e-a68d-fcda3e51b67f	719ca1e2-85aa-4811-87f1-ee903712f816	SECHURA
t	2025-03-17 21:12:59.674664+00	2025-03-17 21:12:59.674666+00	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	6a0799ec-1dab-4d4c-9e30-0a4123d28996	BARRANCA
t	2025-03-17 21:12:59.680472+00	2025-03-17 21:12:59.680475+00	1a5d0888-418f-4901-8ce3-58b7a0082455	aa61d159-135e-4d97-a318-d721d0ccd135	ANTABAMBA
t	2025-03-17 21:12:59.687841+00	2025-03-17 21:12:59.687846+00	9b18a617-06d6-47ef-a808-086d455baad5	f6729187-58e1-4607-8b37-0b2db196f283	CASTROVIRREYNA
t	2025-03-17 21:12:59.69461+00	2025-03-17 21:12:59.694613+00	585eedab-682a-4f38-abf5-2f1a20048d81	c86c46dc-e039-43dc-9913-86e623472583	PAUCAR DEL SARA SARA
t	2025-03-17 21:12:59.699422+00	2025-03-17 21:12:59.699425+00	c2cec227-4f27-48ba-ae84-97baf7053980	46a0b504-382b-4799-85d6-225617d83360	CHOTA
t	2025-03-17 21:12:59.704124+00	2025-03-17 21:12:59.704129+00	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	2c09bf48-31df-47d1-bf45-11d7695ea002	HUAROCHIRI
t	2025-03-17 21:12:59.708919+00	2025-03-17 21:12:59.708922+00	4b5c4963-89d4-4d53-bf18-6d9326b1b107	c745de6d-713a-4613-951f-05d16e86739b	CAMANA
t	2025-03-17 21:12:59.712951+00	2025-03-17 21:12:59.712953+00	5714c637-0118-434a-adb7-845e053679de	8f671c0f-3e82-43ae-ad5a-480f8bc815d4	BAGUA
t	2025-03-17 21:12:59.716826+00	2025-03-17 21:12:59.716829+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	4f006a58-9e1b-4e72-85ce-4ae912b8cc5c	YUNGUYO
t	2025-03-17 21:12:59.72134+00	2025-03-17 21:12:59.721343+00	bd9d3a3c-d6f7-4d46-86a7-b6e43fa883a1	792fb1cf-e799-4ec9-8dbf-339f60cf3179	PUERTO INCA
t	2025-03-17 21:12:59.725342+00	2025-03-17 21:12:59.725344+00	01bd3b5d-a13b-455e-a68d-fcda3e51b67f	1f3a84c8-f9f5-4e20-8c05-aaed1a1b58be	MORROPON
t	2025-03-17 21:12:59.72974+00	2025-03-17 21:12:59.729743+00	1a5d0888-418f-4901-8ce3-58b7a0082455	fd14cd00-aec4-4ce6-b4db-cda6b31196c5	AYMARAES
t	2025-03-17 21:12:59.735376+00	2025-03-17 21:12:59.735379+00	cc1ebf53-c458-4848-ae03-00f173fd7d91	40cd7264-e177-460b-81e7-fd1c04a3d1dd	MARISCAL RAMON CASTILLA
t	2025-03-17 21:12:59.741289+00	2025-03-17 21:12:59.741292+00	f529af54-448a-4109-a46d-104ff28f07c0	b6ee8d13-7dc2-42e1-b9f8-4f689751a272	CHANCHAMAYO
t	2025-03-17 21:12:59.748182+00	2025-03-17 21:12:59.748186+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	b8e4d98a-e502-47a8-af92-8fdab0b88e60	ANTONIO RAYMONDI
t	2025-03-17 21:12:59.754487+00	2025-03-17 21:12:59.754492+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	6eca8b97-dbde-4058-8fc8-4b86feb3307c	SANDIA
t	2025-03-17 21:12:59.762199+00	2025-03-17 21:12:59.762203+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	74f3454f-27d1-4e37-aac7-283f27a56308	CASMA
t	2025-03-17 21:12:59.76792+00	2025-03-17 21:12:59.767923+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	2bc54a70-eee6-4d04-90b9-06503d3b6067	AZANGARO
t	2025-03-17 21:12:59.774014+00	2025-03-17 21:12:59.774017+00	05c5be37-e302-4ec4-9d60-71e3baf7afcc	109a4db0-2e12-4674-ab1f-9417d1664661	CORONEL PORTILLO
t	2025-03-17 21:12:59.780006+00	2025-03-17 21:12:59.78001+00	71dda8ea-3972-4c5b-867b-d5d905ce7f7c	f16f9945-52da-4a72-a49a-a94a3f113146	NAZCA
t	2025-03-17 21:12:59.785856+00	2025-03-17 21:12:59.785859+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	f1f444d7-6007-4f07-be39-a71d94b84ca7	MELGAR
t	2025-03-17 21:12:59.792582+00	2025-03-17 21:12:59.792588+00	a0251865-288a-4fc7-b9fd-f9650fae1df6	37fe07d1-74f8-4777-941d-ba51afc1c160	CHUCUITO
t	2025-03-17 21:12:59.799148+00	2025-03-17 21:12:59.799152+00	008109f1-ef93-443c-8615-36d6154f4363	157ac8ce-05cf-4107-81ff-6c697fac45fd	BELLAVISTA
t	2025-03-17 21:12:59.805937+00	2025-03-17 21:12:59.805939+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	994de1db-2a15-4db0-80a6-4efa76422c2c	BOLOGNESI
t	2025-03-17 21:12:59.811485+00	2025-03-17 21:12:59.811491+00	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	c44b2db0-1ce6-4816-b16c-975486d5db85	CANTA
t	2025-03-17 21:12:59.8175+00	2025-03-17 21:12:59.817503+00	4d831775-ae37-4dd6-bf75-1238d20e75c0	8bc9c85c-cc74-48be-979d-07938df4de67	TARATA
t	2025-03-17 21:12:59.82361+00	2025-03-17 21:12:59.823612+00	64f0fa6a-e0c3-4299-bd7c-f9e9f305fcdc	3c46220d-fb67-4669-8288-27b7b8164e19	ASUNCION
t	2025-03-17 21:12:59.83011+00	2025-03-17 21:12:59.830114+00	cc1ebf53-c458-4848-ae03-00f173fd7d91	ae046f24-a6bc-4f31-a81c-2bca0c494b67	REQUENA
t	2025-03-17 21:12:59.836227+00	2025-03-17 21:12:59.836229+00	9b18a617-06d6-47ef-a808-086d455baad5	d21e1ac4-03c6-4a09-bbc8-9b18b7ad4264	HUANCAVELICA
t	2025-03-17 21:12:59.841592+00	2025-03-17 21:12:59.841595+00	cc1ebf53-c458-4848-ae03-00f173fd7d91	aa997785-178f-4ee0-ae0b-199383726bc3	LORETO
t	2025-03-17 21:12:59.849415+00	2025-03-17 21:12:59.849422+00	f529af54-448a-4109-a46d-104ff28f07c0	34ab58b2-509d-451d-91db-da1dd6aa3a8e	SATIPO
t	2025-03-17 21:12:59.855534+00	2025-03-17 21:12:59.855537+00	4b5c4963-89d4-4d53-bf18-6d9326b1b107	b18551de-2e75-4ca4-9a0f-31c1f6b2bee7	AREQUIPA
t	2025-03-17 21:12:59.860926+00	2025-03-17 21:12:59.860928+00	008109f1-ef93-443c-8615-36d6154f4363	c35d368a-d376-4211-876e-9a3feb37e400	LAMAS
t	2025-03-17 21:12:59.86667+00	2025-03-17 21:12:59.866674+00	a6dcff66-1d61-4879-8b19-7e8dbc15cb8d	e09f0261-1ea3-4fd7-a601-d7077e27ff43	OXAPAMPA
t	2025-03-17 21:12:59.87263+00	2025-03-17 21:12:59.872633+00	008109f1-ef93-443c-8615-36d6154f4363	0f00ebe8-c4f5-448e-a160-9c459750cf50	TOCACHE
t	2025-03-17 21:12:59.878809+00	2025-03-17 21:12:59.878816+00	71dda8ea-3972-4c5b-867b-d5d905ce7f7c	e524e2e5-2c3d-4249-9d1d-7611d8538050	PISCO
t	2025-03-17 21:12:59.884832+00	2025-03-17 21:12:59.884835+00	d15ee908-ffa3-4cbe-b43d-67cb978c97e4	ddf12423-e0c9-4e76-94cb-d68eaf6f2719	LIMA
t	2025-03-17 21:12:59.890287+00	2025-03-17 21:12:59.890291+00	f529af54-448a-4109-a46d-104ff28f07c0	6e015257-6f7e-48cf-b9c0-a24502cdcc21	HUANCAYO
t	2025-03-17 21:12:59.898019+00	2025-03-17 21:12:59.898025+00	585eedab-682a-4f38-abf5-2f1a20048d81	1535087f-84f1-4173-955d-c6bc686c7306	VILCAS HUAMAN
t	2025-03-17 21:12:59.906306+00	2025-03-17 21:12:59.90631+00	008109f1-ef93-443c-8615-36d6154f4363	b1206fd6-020d-42a0-a864-feb8643f0013	PICOTA
t	2025-03-17 21:12:59.913405+00	2025-03-17 21:12:59.91341+00	43ddd4e7-033f-483d-9bad-bc4e2db954a1	b4abe853-410a-439c-a371-7c33a96d2566	NO APLICA
\.


--
-- Data for Name: sale_channel; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.sale_channel (status, registration_date, update_date, sale_channel_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.571992+00	2025-03-17 21:13:14.571995+00	e728a998-9804-4870-80a2-f7d356f7d9a7	2f363ce3-e629-42d7-8bb2-7892307e0275	MP FALLABELA
t	2025-03-17 21:13:14.581811+00	2025-03-17 21:13:14.581815+00	12f1a258-d69f-4e06-8e53-63371d7a4370	2f363ce3-e629-42d7-8bb2-7892307e0275	IG ARANNI
t	2025-03-17 21:13:14.58876+00	2025-03-17 21:13:14.588764+00	e39b5801-ec96-4de3-856f-e0c1df32596e	2f363ce3-e629-42d7-8bb2-7892307e0275	IG KUNCA
t	2025-03-17 21:13:14.595428+00	2025-03-17 21:13:14.59543+00	521cfd90-8ee6-43f0-bc60-3962c4d08362	2f363ce3-e629-42d7-8bb2-7892307e0275	TIENDA OP
t	2025-03-17 21:13:14.600279+00	2025-03-17 21:13:14.60028+00	08858de9-6e03-42dc-9a51-0ed91e746acd	2f363ce3-e629-42d7-8bb2-7892307e0275	VENTA B2B
t	2025-03-17 21:13:14.60419+00	2025-03-17 21:13:14.604193+00	dc89a803-0cfe-45f6-b139-0f57546f3610	2f363ce3-e629-42d7-8bb2-7892307e0275	WEB KUNCA.PE
t	2025-03-17 21:13:14.609126+00	2025-03-17 21:13:14.609128+00	e8fa8d3b-0511-4939-9301-7bca3f9a92f5	2f363ce3-e629-42d7-8bb2-7892307e0275	MP RIPLEY
t	2025-03-17 21:13:14.612969+00	2025-03-17 21:13:14.61297+00	cb087b0e-2d10-44eb-95d5-69a5ff8ea24d	2f363ce3-e629-42d7-8bb2-7892307e0275	WEB KUNCA.SHOP
t	2025-03-17 21:13:14.616329+00	2025-03-17 21:13:14.616332+00	5f24b891-c5e3-4302-b640-faed591b9579	2f363ce3-e629-42d7-8bb2-7892307e0275	MERCADO LIBRE
t	2025-03-17 21:13:14.620679+00	2025-03-17 21:13:14.620682+00	3f314efb-7428-49ed-86ac-54f473c4a1c0	2f363ce3-e629-42d7-8bb2-7892307e0275	MP YAPE
t	2025-03-17 21:13:14.625428+00	2025-03-17 21:13:14.625429+00	5de278cf-da2b-4eb5-a96b-3d73452ef63c	2f363ce3-e629-42d7-8bb2-7892307e0275	MP PLATANITOS
t	2025-03-17 21:13:14.629225+00	2025-03-17 21:13:14.629228+00	c810e868-7cd8-47b1-bec1-16d456bcf513	2f363ce3-e629-42d7-8bb2-7892307e0275	WEB ARANNI.PE
t	2025-03-17 21:13:14.632993+00	2025-03-17 21:13:14.632995+00	854a839e-8ecb-4ac0-b4f6-5e9aa30a1eec	2f363ce3-e629-42d7-8bb2-7892307e0275	LIVE SHOPPING ARANNI
t	2025-03-17 21:13:14.636587+00	2025-03-17 21:13:14.63659+00	547a6ff6-ebea-4cf4-8cb3-ac7b7f48214d	2f363ce3-e629-42d7-8bb2-7892307e0275	LIVE SHOPPING KUNCA
t	2025-03-17 21:13:14.866021+00	2025-03-17 21:13:14.866023+00	7b4ac45b-f7f7-4165-9273-d6297bf888d1	2f363ce3-e629-42d7-8bb2-7892307e0275	WHATSAPP
\.


--
-- Data for Name: size; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.size (status, registration_date, update_date, client_id, size_id, size_type_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.491108+00	2025-03-17 21:13:14.491112+00	84a40517-458c-4933-97e7-e399d71b50e8	2f0080ac-6228-4edb-867a-ee6ebface8c9	0f97d517-4d28-4158-a1f7-8f6a899e505e	2f363ce3-e629-42d7-8bb2-7892307e0275	XS
t	2025-03-17 21:13:14.496605+00	2025-03-17 21:13:14.496608+00	84a40517-458c-4933-97e7-e399d71b50e8	9f779896-d6c3-44fa-b144-1cf50633a5bb	0f97d517-4d28-4158-a1f7-8f6a899e505e	2f363ce3-e629-42d7-8bb2-7892307e0275	S
t	2025-03-17 21:13:14.502462+00	2025-03-17 21:13:14.502467+00	84a40517-458c-4933-97e7-e399d71b50e8	512ced82-36cc-43e4-bd1c-63d4b1cabb39	0f97d517-4d28-4158-a1f7-8f6a899e505e	2f363ce3-e629-42d7-8bb2-7892307e0275	L
t	2025-03-17 21:13:14.508902+00	2025-03-17 21:13:14.508904+00	84a40517-458c-4933-97e7-e399d71b50e8	26c4d554-f2d2-4e1e-81ed-75dcbf1921da	0f97d517-4d28-4158-a1f7-8f6a899e505e	2f363ce3-e629-42d7-8bb2-7892307e0275	M
t	2025-03-17 21:13:14.514916+00	2025-03-17 21:13:14.514918+00	84a40517-458c-4933-97e7-e399d71b50e8	5cc8340d-8a85-4a56-8c6c-7ea04a6d630e	0f97d517-4d28-4158-a1f7-8f6a899e505e	2f363ce3-e629-42d7-8bb2-7892307e0275	XL
t	2025-03-17 21:13:14.520318+00	2025-03-17 21:13:14.520321+00	84a40517-458c-4933-97e7-e399d71b50e8	58a9bf05-90a4-4fc3-8c7d-ffe63efde690	0f97d517-4d28-4158-a1f7-8f6a899e505e	2f363ce3-e629-42d7-8bb2-7892307e0275	XXL
t	2025-03-17 21:13:14.525684+00	2025-03-17 21:13:14.525686+00	84a40517-458c-4933-97e7-e399d71b50e8	fd1f1051-0da9-465b-8727-a7f19d018db7	07c42c20-5cbd-415d-a50f-887645aa8512	2f363ce3-e629-42d7-8bb2-7892307e0275	35
t	2025-03-17 21:13:14.53183+00	2025-03-17 21:13:14.531835+00	84a40517-458c-4933-97e7-e399d71b50e8	d9d8c922-14aa-4554-ab6a-a0c7252b45e0	07c42c20-5cbd-415d-a50f-887645aa8512	2f363ce3-e629-42d7-8bb2-7892307e0275	36
t	2025-03-17 21:13:14.538333+00	2025-03-17 21:13:14.538337+00	84a40517-458c-4933-97e7-e399d71b50e8	5e05f206-96d0-40d7-a04d-d42d097d425f	07c42c20-5cbd-415d-a50f-887645aa8512	2f363ce3-e629-42d7-8bb2-7892307e0275	37
t	2025-03-17 21:13:14.544492+00	2025-03-17 21:13:14.544496+00	84a40517-458c-4933-97e7-e399d71b50e8	85b68194-6710-40db-971e-12cb3055e7e0	07c42c20-5cbd-415d-a50f-887645aa8512	2f363ce3-e629-42d7-8bb2-7892307e0275	38
t	2025-03-17 21:13:14.549969+00	2025-03-17 21:13:14.549973+00	84a40517-458c-4933-97e7-e399d71b50e8	e5c8c503-7932-4eb7-843d-4ea77a153b8a	07c42c20-5cbd-415d-a50f-887645aa8512	2f363ce3-e629-42d7-8bb2-7892307e0275	39
t	2025-03-17 21:13:14.555743+00	2025-03-17 21:13:14.555747+00	84a40517-458c-4933-97e7-e399d71b50e8	74102262-b214-4d60-a01c-b8f9376e1b91	07c42c20-5cbd-415d-a50f-887645aa8512	2f363ce3-e629-42d7-8bb2-7892307e0275	40
t	2025-03-17 21:13:14.561268+00	2025-03-17 21:13:14.561272+00	84a40517-458c-4933-97e7-e399d71b50e8	b3ffbcea-5cdb-4143-9311-9054c59369a0	752edb70-fac6-4444-982b-eb4fa42d36db	2f363ce3-e629-42d7-8bb2-7892307e0275	A
t	2025-03-17 21:13:14.566239+00	2025-03-17 21:13:14.56625+00	84a40517-458c-4933-97e7-e399d71b50e8	d2acbedd-bedd-436f-96d4-4eedafd6fada	5169fa70-f07c-4b1e-b7a8-f70ac4b7a6e0	2f363ce3-e629-42d7-8bb2-7892307e0275	C
t	2025-03-17 21:13:14.84187+00	2025-03-17 21:13:14.841872+00	84a40517-458c-4933-97e7-e399d71b50e8	d23c29a1-b4a6-4b1b-9d02-7bde97c64ca5	0f97d517-4d28-4158-a1f7-8f6a899e505e	2f363ce3-e629-42d7-8bb2-7892307e0275	STD
t	2025-03-17 21:13:14.850145+00	2025-03-17 21:13:14.850148+00	84a40517-458c-4933-97e7-e399d71b50e8	2bc167b8-bdc6-43c7-8975-cb399e7ccf32	0f97d517-4d28-4158-a1f7-8f6a899e505e	2f363ce3-e629-42d7-8bb2-7892307e0275	PSZ
\.


--
-- Data for Name: size_type; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.size_type (status, registration_date, update_date, client_id, size_type_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.102043+00	2025-03-17 21:13:14.102045+00	84a40517-458c-4933-97e7-e399d71b50e8	0f97d517-4d28-4158-a1f7-8f6a899e505e	2f363ce3-e629-42d7-8bb2-7892307e0275	ROPA
t	2025-03-17 21:13:14.109454+00	2025-03-17 21:13:14.109457+00	84a40517-458c-4933-97e7-e399d71b50e8	07c42c20-5cbd-415d-a50f-887645aa8512	2f363ce3-e629-42d7-8bb2-7892307e0275	CALZADO
t	2025-03-17 21:13:14.116134+00	2025-03-17 21:13:14.116139+00	84a40517-458c-4933-97e7-e399d71b50e8	5169fa70-f07c-4b1e-b7a8-f70ac4b7a6e0	2f363ce3-e629-42d7-8bb2-7892307e0275	COMPLEMENTOS
t	2025-03-17 21:13:14.122864+00	2025-03-17 21:13:14.122866+00	84a40517-458c-4933-97e7-e399d71b50e8	752edb70-fac6-4444-982b-eb4fa42d36db	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESORIOS
\.


--
-- Data for Name: store_type; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.store_type (status, registration_date, update_date, store_type_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.071253+00	2025-03-17 21:13:14.070879+00	04ff89ed-8934-49fc-901c-5f9e1a78fc29	2f363ce3-e629-42d7-8bb2-7892307e0275	SHOPIFY
t	2025-03-17 21:13:14.077703+00	2025-03-17 21:13:14.077552+00	5bc9aca1-0aad-4c1b-b1fc-6d81788f0bcf	2f363ce3-e629-42d7-8bb2-7892307e0275	WOOCOMMERCE
t	2025-03-17 21:13:14.081719+00	2025-03-17 21:13:14.081631+00	21aeaedd-e217-464b-861e-3e5216e722c9	2f363ce3-e629-42d7-8bb2-7892307e0275	TIENDADA
t	2025-03-17 21:13:14.086397+00	2025-03-17 21:13:14.086269+00	4728dd20-9e29-48ea-a943-5df747c2c9d8	2f363ce3-e629-42d7-8bb2-7892307e0275	NINGUNA
t	2025-03-17 21:13:14.089607+00	2025-03-17 21:13:14.089507+00	a11e60d4-0e69-44e3-9b0b-bda5122ba53e	2f363ce3-e629-42d7-8bb2-7892307e0275	OTRO
t	2025-03-17 21:13:14.09273+00	2025-03-17 21:13:14.092651+00	8515dc4c-07c0-4da0-b815-61dcd12b124a	2f363ce3-e629-42d7-8bb2-7892307e0275	WIX
t	2025-03-17 21:13:14.096353+00	2025-03-17 21:13:14.096253+00	28f7434c-6eaf-4db9-b216-ae18153dda9f	2f363ce3-e629-42d7-8bb2-7892307e0275	PRESTASHOP
\.


--
-- Data for Name: sub_category_product; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.sub_category_product (status, registration_date, update_date, category_product_id, client_id, sub_category_product_id, user_id, name, sku) FROM stdin;
t	2025-03-17 21:13:14.213024+00	2025-03-17 21:13:14.213026+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	34448a70-2a30-48f7-8521-3bd19a11f5f8	2f363ce3-e629-42d7-8bb2-7892307e0275	BLUSA	BLS
t	2025-03-17 21:13:14.222519+00	2025-03-17 21:13:14.222523+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	cbdc8a7f-7702-49ae-96ba-e2faa4373779	2f363ce3-e629-42d7-8bb2-7892307e0275	CAMISA	CS
t	2025-03-17 21:13:14.232229+00	2025-03-17 21:13:14.232233+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	17c33d7b-5309-479e-9b1f-8758a898eda9	2f363ce3-e629-42d7-8bb2-7892307e0275	VESTIDO	VT
t	2025-03-17 21:13:14.242052+00	2025-03-17 21:13:14.242055+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	fcdbdf69-ddf4-4ff4-940f-bd37871a69d7	2f363ce3-e629-42d7-8bb2-7892307e0275	SACO	SC
t	2025-03-17 21:13:14.252156+00	2025-03-17 21:13:14.252161+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	15bce80f-38ed-46ba-bc07-56af39e78e37	2f363ce3-e629-42d7-8bb2-7892307e0275	SHORT	SH
t	2025-03-17 21:13:14.262554+00	2025-03-17 21:13:14.262557+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	db9e5c7b-10e5-4a92-9bcd-954788b8310f	2f363ce3-e629-42d7-8bb2-7892307e0275	PANTALON_SASTRE	PST
t	2025-03-17 21:13:14.272277+00	2025-03-17 21:13:14.272281+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	f478d9e9-94ef-4f84-b50f-98cbb10dcb2c	2f363ce3-e629-42d7-8bb2-7892307e0275	BLAZER	BLZ
t	2025-03-17 21:13:14.280478+00	2025-03-17 21:13:14.280481+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	27102be9-9f0d-4d10-a921-3370cfb21cfc	2f363ce3-e629-42d7-8bb2-7892307e0275	CHALECO	CHA
t	2025-03-17 21:13:14.290101+00	2025-03-17 21:13:14.290104+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	697bf577-84c1-4069-b6bb-158592e9dbe6	2f363ce3-e629-42d7-8bb2-7892307e0275	POLO	POL
t	2025-03-17 21:13:14.298311+00	2025-03-17 21:13:14.298314+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	d46ba595-ad9f-414f-93a4-fa5cac57ecf8	2f363ce3-e629-42d7-8bb2-7892307e0275	VESTIDO_SHORT	VTS
t	2025-03-17 21:13:14.304449+00	2025-03-17 21:13:14.304452+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	09cc61b0-436c-4586-b140-1f75e8c80828	2f363ce3-e629-42d7-8bb2-7892307e0275	FALDA	FAL
t	2025-03-17 21:13:14.309623+00	2025-03-17 21:13:14.309625+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	2460cb32-78be-4bfb-9581-51a2a1770c6e	2f363ce3-e629-42d7-8bb2-7892307e0275	HOODIES	HOO
t	2025-03-17 21:13:14.315012+00	2025-03-17 21:13:14.315015+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	81d2f6af-9bf8-4d15-992d-594f20e871e2	2f363ce3-e629-42d7-8bb2-7892307e0275	CHOMPAS	CHO
t	2025-03-17 21:13:14.320583+00	2025-03-17 21:13:14.320585+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	aa7ccdb5-fd4e-4f31-8b99-267f57bdf17f	2f363ce3-e629-42d7-8bb2-7892307e0275	PANTALON_DENIM	PTD
t	2025-03-17 21:13:14.325712+00	2025-03-17 21:13:14.325714+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	d1d483ac-cf55-4e45-9434-8244fdf0145b	2f363ce3-e629-42d7-8bb2-7892307e0275	PANTALONES	PA
t	2025-03-17 21:13:14.330528+00	2025-03-17 21:13:14.33053+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	edb7d7a0-2bb9-4cb0-842d-ac011a1ded8d	2f363ce3-e629-42d7-8bb2-7892307e0275	TOPS	TO
t	2025-03-17 21:13:14.335348+00	2025-03-17 21:13:14.335351+00	8d560d48-e12a-4b7f-ba7a-c51bc8903b31	84a40517-458c-4933-97e7-e399d71b50e8	11405d18-bcf0-4f86-9834-3b0cd001e069	2f363ce3-e629-42d7-8bb2-7892307e0275	ENTERIZOS	EN
t	2025-03-17 21:13:14.340576+00	2025-03-17 21:13:14.340578+00	4f326f81-ead8-4330-b8de-0efa16882018	84a40517-458c-4933-97e7-e399d71b50e8	a4d50eb4-3d03-48c3-a459-9c7199689771	2f363ce3-e629-42d7-8bb2-7892307e0275	BOLSOS	BOL
t	2025-03-17 21:13:14.34669+00	2025-03-17 21:13:14.346696+00	4f326f81-ead8-4330-b8de-0efa16882018	84a40517-458c-4933-97e7-e399d71b50e8	63dc8cb4-3d7a-4783-8495-846a3a011d94	2f363ce3-e629-42d7-8bb2-7892307e0275	CARTERAS	CAR
t	2025-03-17 21:13:14.352378+00	2025-03-17 21:13:14.35238+00	4f326f81-ead8-4330-b8de-0efa16882018	84a40517-458c-4933-97e7-e399d71b50e8	46910eb7-6e6e-47e2-987d-61f149394e6d	2f363ce3-e629-42d7-8bb2-7892307e0275	GORRAS	GOR
t	2025-03-17 21:13:14.35843+00	2025-03-17 21:13:14.358436+00	4f326f81-ead8-4330-b8de-0efa16882018	84a40517-458c-4933-97e7-e399d71b50e8	84b98757-4ff7-4594-aec6-f038e9fe18f8	2f363ce3-e629-42d7-8bb2-7892307e0275	MOCHILAS	MOCH
t	2025-03-17 21:13:14.364438+00	2025-03-17 21:13:14.36444+00	4f326f81-ead8-4330-b8de-0efa16882018	84a40517-458c-4933-97e7-e399d71b50e8	7fe7faf2-05cc-484b-935c-57d8f40a2235	2f363ce3-e629-42d7-8bb2-7892307e0275	BILLETERAS	BIL
t	2025-03-17 21:13:14.370071+00	2025-03-17 21:13:14.370073+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	b3a22457-6ae3-4615-9ea1-e7b6c8913480	2f363ce3-e629-42d7-8bb2-7892307e0275	BOTIN_ALTO	BOA
t	2025-03-17 21:13:14.375043+00	2025-03-17 21:13:14.375047+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	2aa644d3-e774-4559-af0c-18ebc38c40b4	2f363ce3-e629-42d7-8bb2-7892307e0275	BOTIN_BAJO	BOB
t	2025-03-17 21:13:14.380023+00	2025-03-17 21:13:14.380025+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	94b30829-ca97-4124-9c9a-cd0a6e61f65f	2f363ce3-e629-42d7-8bb2-7892307e0275	ZAPATILLAS	ZA
t	2025-03-17 21:13:14.386618+00	2025-03-17 21:13:14.386624+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	a9651e98-a0d0-4be0-a120-76e53a645bf4	2f363ce3-e629-42d7-8bb2-7892307e0275	OXFORD	OXF
t	2025-03-17 21:13:14.396402+00	2025-03-17 21:13:14.396406+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	2131fe3a-aa75-495d-b82d-d0ce71b04bdf	2f363ce3-e629-42d7-8bb2-7892307e0275	BALERINAS	BAL
t	2025-03-17 21:13:14.407767+00	2025-03-17 21:13:14.407773+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	a81f9c66-5fba-4fcd-ae4c-f6d471fd0a49	2f363ce3-e629-42d7-8bb2-7892307e0275	SANDALIAS_PLANAS	SAP
t	2025-03-17 21:13:14.416143+00	2025-03-17 21:13:14.416146+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	e847096f-42a7-43b2-8e6f-51ff889035cc	2f363ce3-e629-42d7-8bb2-7892307e0275	PLATAFORMAS	PLA
t	2025-03-17 21:13:14.424305+00	2025-03-17 21:13:14.424308+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	3bdbcbcc-2ce8-481f-a604-56ba003d2e81	2f363ce3-e629-42d7-8bb2-7892307e0275	SANDALIAS	SA
t	2025-03-17 21:13:14.42979+00	2025-03-17 21:13:14.429793+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	3de87d5f-38a1-4b7c-b7bb-b31de1737182	2f363ce3-e629-42d7-8bb2-7892307e0275	SANDALIAS_CON_TACO	SAT
t	2025-03-17 21:13:14.435454+00	2025-03-17 21:13:14.435458+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	254923e0-71d1-43ee-a324-05bca3de3812	2f363ce3-e629-42d7-8bb2-7892307e0275	CHUNKIS	CHU
t	2025-03-17 21:13:14.441467+00	2025-03-17 21:13:14.44147+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	58e628ca-1a2d-4b2b-bcf7-66bfc18d6299	2f363ce3-e629-42d7-8bb2-7892307e0275	ALPAGARTAS	ALP
t	2025-03-17 21:13:14.447486+00	2025-03-17 21:13:14.447488+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	eed94728-1ff4-4326-b1f5-20b64ab1c5a2	2f363ce3-e629-42d7-8bb2-7892307e0275	MULES	MUL
t	2025-03-17 21:13:14.453199+00	2025-03-17 21:13:14.453201+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	70a666f9-879d-4621-b25e-aa9f4b653cfd	2f363ce3-e629-42d7-8bb2-7892307e0275	BABUCHA	BAB
t	2025-03-17 21:13:14.458805+00	2025-03-17 21:13:14.458807+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	88d0a3c0-4a8e-4f0d-b3ca-2c533709e8ac	2f363ce3-e629-42d7-8bb2-7892307e0275	BOTAS	BOT
t	2025-03-17 21:13:14.464613+00	2025-03-17 21:13:14.464614+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	5c65c491-f345-455c-aea4-68c34b98021e	2f363ce3-e629-42d7-8bb2-7892307e0275	STILETTO	STI
t	2025-03-17 21:13:14.469403+00	2025-03-17 21:13:14.469404+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	401845c4-c424-4ea7-a32c-69276adf7594	2f363ce3-e629-42d7-8bb2-7892307e0275	SUECOS	SUE
t	2025-03-17 21:13:14.474119+00	2025-03-17 21:13:14.474122+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	22d07aed-e1f3-4b38-b136-18aa4626c8d1	2f363ce3-e629-42d7-8bb2-7892307e0275	MOCASIN	MOC
t	2025-03-17 21:13:14.479756+00	2025-03-17 21:13:14.47976+00	41aee1f3-954d-49e1-b49b-bfa7c8bf66ca	84a40517-458c-4933-97e7-e399d71b50e8	c3802051-ed05-4502-a2fb-7307de0ab5f5	2f363ce3-e629-42d7-8bb2-7892307e0275	ZAPATILLAS_URBANAS	ZAU
t	2025-03-17 21:13:14.485382+00	2025-03-17 21:13:14.485385+00	fd2350dc-1fad-43c7-8689-c200e54866b5	84a40517-458c-4933-97e7-e399d71b50e8	53e24a49-4240-4e3e-96c6-ce20039f55b5	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESORIOS	ACC
\.


--
-- Data for Name: unit; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.unit (status, registration_date, update_date, client_id, unit_id, unit_type_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.148956+00	2025-03-17 21:13:14.148961+00	84a40517-458c-4933-97e7-e399d71b50e8	f0a929e8-ef05-4f10-9600-b0974ca45ba4	b19b3026-3e26-4c28-ad8a-3e6d32e25834	2f363ce3-e629-42d7-8bb2-7892307e0275	UND
t	2025-03-17 21:13:14.15594+00	2025-03-17 21:13:14.155942+00	84a40517-458c-4933-97e7-e399d71b50e8	b19d5c7b-4fd1-4cb5-8653-fffba2461534	c3a898b6-176d-4b65-8dde-e39bb1941b0d	2f363ce3-e629-42d7-8bb2-7892307e0275	PAR
t	2025-03-17 21:13:14.164098+00	2025-03-17 21:13:14.1641+00	84a40517-458c-4933-97e7-e399d71b50e8	3defdbe2-d57e-48d9-98b8-d6d5d9877840	2b6f39bf-8c22-4291-b40a-b08d7ecc8943	2f363ce3-e629-42d7-8bb2-7892307e0275	UND
t	2025-03-17 21:13:14.168122+00	2025-03-17 21:13:14.168124+00	84a40517-458c-4933-97e7-e399d71b50e8	6eac514a-7bc9-4515-8131-bd06bfc1afbf	c95f25ff-5c4f-4464-93a6-531cebcfeb10	2f363ce3-e629-42d7-8bb2-7892307e0275	UND
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.unit_type (status, registration_date, update_date, client_id, unit_type_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.128009+00	2025-03-17 21:13:14.128013+00	84a40517-458c-4933-97e7-e399d71b50e8	b19b3026-3e26-4c28-ad8a-3e6d32e25834	2f363ce3-e629-42d7-8bb2-7892307e0275	ROPA
t	2025-03-17 21:13:14.1327+00	2025-03-17 21:13:14.132703+00	84a40517-458c-4933-97e7-e399d71b50e8	c3a898b6-176d-4b65-8dde-e39bb1941b0d	2f363ce3-e629-42d7-8bb2-7892307e0275	CALZADO
t	2025-03-17 21:13:14.136507+00	2025-03-17 21:13:14.136509+00	84a40517-458c-4933-97e7-e399d71b50e8	2b6f39bf-8c22-4291-b40a-b08d7ecc8943	2f363ce3-e629-42d7-8bb2-7892307e0275	ACCESORIOS
t	2025-03-17 21:13:14.140923+00	2025-03-17 21:13:14.140925+00	84a40517-458c-4933-97e7-e399d71b50e8	c95f25ff-5c4f-4464-93a6-531cebcfeb10	2f363ce3-e629-42d7-8bb2-7892307e0275	COMPLEMENTOS
\.


--
-- Data for Name: cancelled_order; Type: TABLE DATA; Schema: ordering; Owner: postgres
--

COPY ordering.cancelled_order (registration_date, update_date, cancellation_reason_id, cancelled_order_id, client_id, order_id, user_id) FROM stdin;
\.


--
-- Data for Name: courier_picture; Type: TABLE DATA; Schema: ordering; Owner: postgres
--

COPY ordering.courier_picture (registration_date, client_id, courier_picture_id, order_id, user_id, picture_url) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: ordering; Owner: postgres
--

COPY ordering.customer (status, registration_date, update_date, client_id, customer_id, customer_type_id, district_id, user_id, address, dni, instagram, name, phone, reference) FROM stdin;
t	2025-03-17 21:52:59.410775+00	2025-03-17 21:52:59.410778+00	84a40517-458c-4933-97e7-e399d71b50e8	f42f8e45-f948-4d2b-a7f6-013b2a005900	aaabf4a2-97fe-447f-bcfa-e837d2a9bbd8	4cae5bb7-41dc-49d9-b1e3-43f77733b705	2f363ce3-e629-42d7-8bb2-7892307e0275	quepepampa	74439864	igorrc	igor	929417416	colegio
\.


--
-- Data for Name: customer_type; Type: TABLE DATA; Schema: ordering; Owner: postgres
--

COPY ordering.customer_type (status, registration_date, update_date, customer_type_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.692307+00	2025-03-17 21:13:14.69231+00	aaabf4a2-97fe-447f-bcfa-e837d2a9bbd8	\N	TRADICIONAL
t	2025-03-17 21:13:14.693089+00	2025-03-17 21:13:14.693092+00	2627f81f-c98f-4893-bcef-5ae279180e11	\N	MAYORISTA
\.


--
-- Data for Name: delivery_point; Type: TABLE DATA; Schema: ordering; Owner: postgres
--

COPY ordering.delivery_point (status, registration_date, update_date, delivery_point_id, user_id, address, name) FROM stdin;
t	2025-03-17 21:13:14.707559+00	2025-03-17 21:13:14.707561+00	95bb2ad4-91fc-4344-8957-976e105bf067	2f363ce3-e629-42d7-8bb2-7892307e0275	limna	LIMA
t	2025-03-17 21:13:14.712801+00	2025-03-17 21:13:14.712804+00	9cfac25d-8b76-4c9b-a9ca-717d70d914ad	2f363ce3-e629-42d7-8bb2-7892307e0275	punto scharft	PUNTO SCHARF
t	2025-03-17 21:13:14.716669+00	2025-03-17 21:13:14.716672+00	503e7e95-bcde-4f00-bd5e-ee096ce54d6e	2f363ce3-e629-42d7-8bb2-7892307e0275	provincia	PROVINCIA
t	2025-03-17 21:13:14.720567+00	2025-03-17 21:13:14.720569+00	381cd59f-88c3-4e6f-976e-2ba7c460f1e1	2f363ce3-e629-42d7-8bb2-7892307e0275	recojo en tienda	RECOJO EN TIENDA
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: ordering; Owner: postgres
--

COPY ordering."order" (advanced_payment, cancellation, delivery_amount, delivery_flag, discount_amount, receipt_flag, order_number, registration_date, update_date, client_id, closing_channel_id, courier_id, customer_id, delivery_point_id, discount_id, management_type_id, order_id, order_state_id, payment_method_id, payment_state_id, sale_channel_id, store_id, user_id, delivery_address, observations, seller) FROM stdin;
0.01	f	1	f	1	t	1	2025-03-17 22:51:52.764275+00	2025-03-17 22:51:52.764279+00	84a40517-458c-4933-97e7-e399d71b50e8	797a6c81-11ed-4e00-8e53-12ac0ae2d421	afbd0e30-6ef8-4389-9f0d-3cc4214cdc38	f42f8e45-f948-4d2b-a7f6-013b2a005900	95bb2ad4-91fc-4344-8957-976e105bf067	65fcb0dd-c1d1-454b-a424-026405d35946	d8caf74d-9c8d-4798-9f69-532e4afea62a	2cefd59c-8b42-4eb2-b2c2-6f6cd7251d8d	0f252436-c499-4fa3-8656-b426b0b375d7	bce09747-2136-4c50-9d40-c19d93ee797b	476bf84e-7392-474c-8131-0fbb61071409	12f1a258-d69f-4e06-8e53-63371d7a4370	5bdcf459-185e-44b4-acc4-45783fd3b7fb	2f363ce3-e629-42d7-8bb2-7892307e0275	LIMA	SSS	JUAN ROMERO
\.


--
-- Data for Name: order_contacted; Type: TABLE DATA; Schema: ordering; Owner: postgres
--

COPY ordering.order_contacted (contacted, registration_date, update_date, agent_id, client_id, order_contacted_id, order_id, user_id, observations) FROM stdin;
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: ordering; Owner: postgres
--

COPY ordering.order_item (discount_amount, quantity, select_order_status, status, registration_date, update_date, client_id, discount_id, order_id, order_item_id, product_id, user_id, observations) FROM stdin;
50	2	f	t	2025-03-17 22:51:52.83857+00	2025-03-17 22:51:52.838133+00	84a40517-458c-4933-97e7-e399d71b50e8	948b95c1-3168-49e9-a26b-20fbfa277a23	2cefd59c-8b42-4eb2-b2c2-6f6cd7251d8d	c5661ddd-bced-4dfc-b43b-9f46ed0328cc	931fc955-4613-404a-af2d-4459241d8f8d	2f363ce3-e629-42d7-8bb2-7892307e0275	ZZZZZZ
0	2	f	t	2025-03-17 23:42:59.623424+00	2025-03-17 23:42:59.609747+00	84a40517-458c-4933-97e7-e399d71b50e8	99e795f4-bfbb-4d0d-8fe0-56485cccc486	2cefd59c-8b42-4eb2-b2c2-6f6cd7251d8d	d273cefb-e011-49db-85ea-acf5fb51e723	b1b9c41f-2c2b-47c3-bf86-6ce127e85d49	2f363ce3-e629-42d7-8bb2-7892307e0275	ZZZ
0	2	f	t	2025-03-17 23:44:02.507717+00	2025-03-17 23:44:02.507264+00	84a40517-458c-4933-97e7-e399d71b50e8	99e795f4-bfbb-4d0d-8fe0-56485cccc486	2cefd59c-8b42-4eb2-b2c2-6f6cd7251d8d	27f6226c-72fa-429d-8fd3-fba794e3f230	b1b9c41f-2c2b-47c3-bf86-6ce127e85d49	2f363ce3-e629-42d7-8bb2-7892307e0275	ZZZ
0	2	f	t	2025-03-17 23:44:04.18805+00	2025-03-17 23:44:04.187409+00	84a40517-458c-4933-97e7-e399d71b50e8	99e795f4-bfbb-4d0d-8fe0-56485cccc486	2cefd59c-8b42-4eb2-b2c2-6f6cd7251d8d	68cfe8e6-f625-4e37-b42f-ba94445998c5	b1b9c41f-2c2b-47c3-bf86-6ce127e85d49	2f363ce3-e629-42d7-8bb2-7892307e0275	ZZZ
\.


--
-- Data for Name: order_log; Type: TABLE DATA; Schema: ordering; Owner: postgres
--

COPY ordering.order_log (registration_date, client_id, order_id, order_log_id, order_state_id, user_id, detail) FROM stdin;
2025-03-17 22:51:56.009162+00	84a40517-458c-4933-97e7-e399d71b50e8	2cefd59c-8b42-4eb2-b2c2-6f6cd7251d8d	2b75e31f-7aaf-4118-bd05-93c1a731bc11	0f252436-c499-4fa3-8656-b426b0b375d7	2f363ce3-e629-42d7-8bb2-7892307e0275	2025-03-17T17:51:56.008533303-05:00 - JROMERO PENDIENTE
\.


--
-- Data for Name: order_payment_receipt; Type: TABLE DATA; Schema: ordering; Owner: postgres
--

COPY ordering.order_payment_receipt (registration_date, client_id, order_id, order_payment_receipt, user_id, payment_receipt_url) FROM stdin;
2025-03-17 22:51:55.69896+00	84a40517-458c-4933-97e7-e399d71b50e8	2cefd59c-8b42-4eb2-b2c2-6f6cd7251d8d	bb07d34d-d491-445d-ad83-88092a481753	2f363ce3-e629-42d7-8bb2-7892307e0275	http://res.cloudinary.com/dqzvbdf9r/image/upload/v1742251914/SISTEMA_PEDIDOS/PEDIDO_2cefd59c-8b42-4eb2-b2c2-6f6cd7251d8d_JROMERO_2025-03-17_17-51-52_COMPROBANTE_1.png
\.


--
-- Data for Name: membership; Type: TABLE DATA; Schema: payment; Owner: postgres
--

COPY payment.membership (demo, expiration_date, registration_date, update_date, client_id, membership_id, membership_payment_id, membership_state_id, subscription_id, user_id) FROM stdin;
\.


--
-- Data for Name: membership_payment; Type: TABLE DATA; Schema: payment; Owner: postgres
--

COPY payment.membership_payment (gross_amount, net_amount, payment_gateway_fee, tax_amount, registration_date, update_date, client_id, membership_payment_id, payment_gateway_id, user_id) FROM stdin;
\.


--
-- Data for Name: membership_payment_state; Type: TABLE DATA; Schema: payment; Owner: postgres
--

COPY payment.membership_payment_state (status, registration_date, update_date, membership_payment_state_id, user_id, name) FROM stdin;
\.


--
-- Data for Name: payment_gateway; Type: TABLE DATA; Schema: payment; Owner: postgres
--

COPY payment.payment_gateway (status, registration_date, update_date, payment_gateway_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.692307+00	2025-03-17 21:13:14.69231+00	b0fb5fef-5433-4498-88ae-a75e935b3dc7	2f363ce3-e629-42d7-8bb2-7892307e0275	DEMO
t	2025-03-17 21:13:14.692307+00	2025-03-17 21:13:14.69231+00	7341876b-2713-4691-96d5-94c31b0aef94	2f363ce3-e629-42d7-8bb2-7892307e0275	MERCADO PAGO
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: payment; Owner: postgres
--

COPY payment.subscription (discount_percent, months, status, registration_date, update_date, subscription_id, user_id, name) FROM stdin;
0	1	t	2025-03-17 21:13:13.996493+00	2025-03-17 21:13:13.996497+00	04eb6701-9a42-4f4e-aa88-1bb6ccc78a3d	2f363ce3-e629-42d7-8bb2-7892307e0275	MENSUAL
10	6	t	2025-03-17 21:13:14.001815+00	2025-03-17 21:13:14.001818+00	e0d8605a-9282-4e84-9041-a44c28f732dd	2f363ce3-e629-42d7-8bb2-7892307e0275	SEMESTRAL
20	12	t	2025-03-17 21:13:14.005802+00	2025-03-17 21:13:14.005805+00	cd08265b-7814-478a-bc32-73b6a8898628	2f363ce3-e629-42d7-8bb2-7892307e0275	ANUAL
\.


--
-- Data for Name: general_stock; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.general_stock (quantity, registration_date, update_date, client_id, general_stock_id, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: stock_transaction; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.stock_transaction (registration_date, client_id, stock_transaction_id, stock_transaction_type_id, user_id, warehouse_id, serial) FROM stdin;
\.


--
-- Data for Name: stock_transaction_item; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.stock_transaction_item (quantity, registration_date, client_id, product_id, stock_transaction_id, stock_transaction_item_id, user_id) FROM stdin;
\.


--
-- Data for Name: stock_transaction_type; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.stock_transaction_type (status, registration_date, update_date, stock_transaction_type_id, user_id, name) FROM stdin;
t	2025-03-17 21:13:14.725878+00	2025-03-17 21:13:14.725881+00	5aed1519-4bdc-44e7-b4cb-2d8dad8a3ed8	2f363ce3-e629-42d7-8bb2-7892307e0275	INGRESO
t	2025-03-17 21:13:14.731642+00	2025-03-17 21:13:14.731645+00	4bab2362-2fb9-4848-a0aa-54ea38b0aa79	2f363ce3-e629-42d7-8bb2-7892307e0275	SALIDA
t	2025-03-17 21:13:14.735799+00	2025-03-17 21:13:14.735801+00	85d0e6fa-0573-480d-b1fc-d54ceb41ea14	2f363ce3-e629-42d7-8bb2-7892307e0275	GUIA-COURIER
t	2025-03-17 21:13:14.740068+00	2025-03-17 21:13:14.74007+00	9dfd8ca4-2fea-4a68-9636-4ece94d79cda	2f363ce3-e629-42d7-8bb2-7892307e0275	GUIA-COURIER-DEVOLUCION
\.


--
-- Data for Name: supply_order; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.supply_order (status, delivery_date, order_number, registration_date, update_date, client_id, supply_order_id, user_id, warehouse_id, ref) FROM stdin;
\.


--
-- Data for Name: supply_order_item; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.supply_order_item (quantity, status, registration_date, update_date, client_id, product_id, purchase_id, purchase_item_id, user_id, observations) FROM stdin;
\.


--
-- Data for Name: warehouse_output; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.warehouse_output (status, order_number, registration_date, update_date, client_id, user_id, warehouse_id, warehouse_output_id, ref) FROM stdin;
\.


--
-- Data for Name: warehouse_output_item; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.warehouse_output_item (quantity, status, registration_date, update_date, client_id, product_id, user_id, warehouse_output_id, warehouse_output_item_id) FROM stdin;
\.


--
-- Data for Name: warehouse_stock; Type: TABLE DATA; Schema: stock; Owner: postgres
--

COPY stock.warehouse_stock (quantity, registration_date, update_date, client_id, product_id, user_id, warehouse_id, warehouse_stock_id) FROM stdin;
\.


--
-- Name: courier courier_pkey; Type: CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.courier
    ADD CONSTRAINT courier_pkey PRIMARY KEY (courier_id);


--
-- Name: delivery_company delivery_company_pkey; Type: CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_company
    ADD CONSTRAINT delivery_company_pkey PRIMARY KEY (delivery_company_id);


--
-- Name: delivery_manifest_items delivery_manifest_items_pkey; Type: CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_manifest_items
    ADD CONSTRAINT delivery_manifest_items_pkey PRIMARY KEY (delivery_manifest_item_id);


--
-- Name: delivery_manifest delivery_manifest_pkey; Type: CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_manifest
    ADD CONSTRAINT delivery_manifest_pkey PRIMARY KEY (delivery_manifest_id);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);


--
-- Name: supplier_type supplier_type_pkey; Type: CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.supplier_type
    ADD CONSTRAINT supplier_type_pkey PRIMARY KEY (supplier_type_id);


--
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (warehouse_id);


--
-- Name: access access_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.access
    ADD CONSTRAINT access_pkey PRIMARY KEY (access_id);


--
-- Name: audit_event audit_event_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.audit_event
    ADD CONSTRAINT audit_event_pkey PRIMARY KEY (audit_event_id);


--
-- Name: audit audit_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.audit
    ADD CONSTRAINT audit_pkey PRIMARY KEY (audit_id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);


--
-- Name: membership_module membership_module_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.membership_module
    ADD CONSTRAINT membership_module_pkey PRIMARY KEY (membership_module_id);


--
-- Name: membership_module_role membership_module_role_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.membership_module_role
    ADD CONSTRAINT membership_module_role_pkey PRIMARY KEY (membership_module_role_id);


--
-- Name: onboarding_channel onboarding_channel_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding_channel
    ADD CONSTRAINT onboarding_channel_pkey PRIMARY KEY (onboard_channel_id);


--
-- Name: onboarding_module onboarding_module_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding_module
    ADD CONSTRAINT onboarding_module_pkey PRIMARY KEY (onboard_module_id);


--
-- Name: onboarding onboarding_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding
    ADD CONSTRAINT onboarding_pkey PRIMARY KEY (onboard_id);


--
-- Name: onboarding_store onboarding_store_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding_store
    ADD CONSTRAINT onboarding_store_pkey PRIMARY KEY (onboard_store_id);


--
-- Name: role_access role_access_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.role_access
    ADD CONSTRAINT role_access_pkey PRIMARY KEY (role_access_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- Name: store store_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);


--
-- Name: user_data user_data_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.user_data
    ADD CONSTRAINT user_data_pkey PRIMARY KEY (user_id);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_role_id);


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brand_id);


--
-- Name: model model_pkey; Type: CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (model_id);


--
-- Name: product_picture product_picture_pkey; Type: CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product_picture
    ADD CONSTRAINT product_picture_pkey PRIMARY KEY (product_picture_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: product_price product_price_pkey; Type: CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product_price
    ADD CONSTRAINT product_price_pkey PRIMARY KEY (product_price_id);


--
-- Name: cancellation_reason cancellation_reason_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.cancellation_reason
    ADD CONSTRAINT cancellation_reason_pkey PRIMARY KEY (cancellation_reason_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: category_product category_product_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.category_product
    ADD CONSTRAINT category_product_pkey PRIMARY KEY (category_product_id);


--
-- Name: closing_channel closing_channel_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.closing_channel
    ADD CONSTRAINT closing_channel_pkey PRIMARY KEY (closing_channel_id);


--
-- Name: color color_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (color_id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- Name: discount discount_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.discount
    ADD CONSTRAINT discount_pkey PRIMARY KEY (discount_id);


--
-- Name: district district_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (district_id);


--
-- Name: entry_channel entry_channel_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.entry_channel
    ADD CONSTRAINT entry_channel_pkey PRIMARY KEY (entry_channel_id);


--
-- Name: management_type management_type_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.management_type
    ADD CONSTRAINT management_type_pkey PRIMARY KEY (management_type_id);


--
-- Name: membership_state membership_state_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.membership_state
    ADD CONSTRAINT membership_state_pkey PRIMARY KEY (membership_id);


--
-- Name: module module_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.module
    ADD CONSTRAINT module_pkey PRIMARY KEY (module_id);


--
-- Name: order_state order_state_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.order_state
    ADD CONSTRAINT order_state_pkey PRIMARY KEY (order_state_id);


--
-- Name: payment_method payment_method_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.payment_method
    ADD CONSTRAINT payment_method_pkey PRIMARY KEY (payment_method_id);


--
-- Name: payment_state payment_state_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.payment_state
    ADD CONSTRAINT payment_state_pkey PRIMARY KEY (payment_state_id);


--
-- Name: province province_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (province_id);


--
-- Name: sale_channel sale_channel_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.sale_channel
    ADD CONSTRAINT sale_channel_pkey PRIMARY KEY (sale_channel_id);


--
-- Name: size size_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.size
    ADD CONSTRAINT size_pkey PRIMARY KEY (size_id);


--
-- Name: size_type size_type_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.size_type
    ADD CONSTRAINT size_type_pkey PRIMARY KEY (size_type_id);


--
-- Name: store_type store_type_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.store_type
    ADD CONSTRAINT store_type_pkey PRIMARY KEY (store_type_id);


--
-- Name: sub_category_product sub_category_product_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.sub_category_product
    ADD CONSTRAINT sub_category_product_pkey PRIMARY KEY (sub_category_product_id);


--
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (unit_id);


--
-- Name: unit_type unit_type_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.unit_type
    ADD CONSTRAINT unit_type_pkey PRIMARY KEY (unit_type_id);


--
-- Name: cancelled_order cancelled_order_pkey; Type: CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.cancelled_order
    ADD CONSTRAINT cancelled_order_pkey PRIMARY KEY (cancelled_order_id);


--
-- Name: courier_picture courier_picture_pkey; Type: CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.courier_picture
    ADD CONSTRAINT courier_picture_pkey PRIMARY KEY (courier_picture_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: customer_type customer_type_pkey; Type: CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.customer_type
    ADD CONSTRAINT customer_type_pkey PRIMARY KEY (customer_type_id);


--
-- Name: delivery_point delivery_point_pkey; Type: CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.delivery_point
    ADD CONSTRAINT delivery_point_pkey PRIMARY KEY (delivery_point_id);


--
-- Name: order_contacted order_contacted_pkey; Type: CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_contacted
    ADD CONSTRAINT order_contacted_pkey PRIMARY KEY (order_contacted_id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (order_item_id);


--
-- Name: order_log order_log_pkey; Type: CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_log
    ADD CONSTRAINT order_log_pkey PRIMARY KEY (order_log_id);


--
-- Name: order_payment_receipt order_payment_receipt_pkey; Type: CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_payment_receipt
    ADD CONSTRAINT order_payment_receipt_pkey PRIMARY KEY (order_payment_receipt);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- Name: membership_payment membership_payment_pkey; Type: CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership_payment
    ADD CONSTRAINT membership_payment_pkey PRIMARY KEY (membership_payment_id);


--
-- Name: membership_payment_state membership_payment_state_pkey; Type: CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership_payment_state
    ADD CONSTRAINT membership_payment_state_pkey PRIMARY KEY (membership_payment_state_id);


--
-- Name: membership membership_pkey; Type: CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership
    ADD CONSTRAINT membership_pkey PRIMARY KEY (membership_id);


--
-- Name: payment_gateway payment_gateway_pkey; Type: CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.payment_gateway
    ADD CONSTRAINT payment_gateway_pkey PRIMARY KEY (payment_gateway_id);


--
-- Name: subscription subscription_pkey; Type: CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.subscription
    ADD CONSTRAINT subscription_pkey PRIMARY KEY (subscription_id);


--
-- Name: general_stock general_stock_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.general_stock
    ADD CONSTRAINT general_stock_pkey PRIMARY KEY (general_stock_id);


--
-- Name: stock_transaction_item stock_transaction_item_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction_item
    ADD CONSTRAINT stock_transaction_item_pkey PRIMARY KEY (stock_transaction_item_id);


--
-- Name: stock_transaction stock_transaction_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction
    ADD CONSTRAINT stock_transaction_pkey PRIMARY KEY (stock_transaction_id);


--
-- Name: stock_transaction_type stock_transaction_type_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction_type
    ADD CONSTRAINT stock_transaction_type_pkey PRIMARY KEY (stock_transaction_type_id);


--
-- Name: supply_order_item supply_order_item_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.supply_order_item
    ADD CONSTRAINT supply_order_item_pkey PRIMARY KEY (purchase_item_id);


--
-- Name: supply_order supply_order_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.supply_order
    ADD CONSTRAINT supply_order_pkey PRIMARY KEY (supply_order_id);


--
-- Name: warehouse_output_item warehouse_output_item_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_output_item
    ADD CONSTRAINT warehouse_output_item_pkey PRIMARY KEY (warehouse_output_item_id);


--
-- Name: warehouse_output warehouse_output_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_output
    ADD CONSTRAINT warehouse_output_pkey PRIMARY KEY (warehouse_output_id);


--
-- Name: warehouse_stock warehouse_stock_pkey; Type: CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_stock
    ADD CONSTRAINT warehouse_stock_pkey PRIMARY KEY (warehouse_stock_id);


--
-- Name: delivery_manifest fk29ruliv7rr2os19dqsn6vr2sw; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_manifest
    ADD CONSTRAINT fk29ruliv7rr2os19dqsn6vr2sw FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: delivery_manifest fk3awpv1q892etd9umyfhh42y4q; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_manifest
    ADD CONSTRAINT fk3awpv1q892etd9umyfhh42y4q FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: supplier fk5xjviyvdlcy21vsavhjmwd0vs; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.supplier
    ADD CONSTRAINT fk5xjviyvdlcy21vsavhjmwd0vs FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: delivery_company fk8j8na4qj95pxsi7tc4rlald3o; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_company
    ADD CONSTRAINT fk8j8na4qj95pxsi7tc4rlald3o FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: warehouse fkabqoh8i8gpa8wdaek9bcbuwvn; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.warehouse
    ADD CONSTRAINT fkabqoh8i8gpa8wdaek9bcbuwvn FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: supplier fkae15uaqxio5el4c6qt5e1nqyw; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.supplier
    ADD CONSTRAINT fkae15uaqxio5el4c6qt5e1nqyw FOREIGN KEY (district_id) REFERENCES master.district(district_id);


--
-- Name: delivery_manifest_items fkb36rtileludvce6ly2c7n41de; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_manifest_items
    ADD CONSTRAINT fkb36rtileludvce6ly2c7n41de FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: delivery_manifest fkc5y386832rvl77kj6sryrhtg; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_manifest
    ADD CONSTRAINT fkc5y386832rvl77kj6sryrhtg FOREIGN KEY (courier_id) REFERENCES logistics.courier(courier_id);


--
-- Name: supplier fkdp2i9p8sxew7tj0dksty5dw4t; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.supplier
    ADD CONSTRAINT fkdp2i9p8sxew7tj0dksty5dw4t FOREIGN KEY (country_id) REFERENCES master.country(country_id);


--
-- Name: delivery_manifest fkhq8gfurdlbmflfit0snjdqgl3; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_manifest
    ADD CONSTRAINT fkhq8gfurdlbmflfit0snjdqgl3 FOREIGN KEY (warehouse_id) REFERENCES logistics.warehouse(warehouse_id);


--
-- Name: supplier fki8frtsnt5d9v8bljvk9ce7e49; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.supplier
    ADD CONSTRAINT fki8frtsnt5d9v8bljvk9ce7e49 FOREIGN KEY (supplier_type_id) REFERENCES logistics.supplier_type(supplier_type_id);


--
-- Name: warehouse fkkx7wfjvxkenrgy32wqk8k1c3v; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.warehouse
    ADD CONSTRAINT fkkx7wfjvxkenrgy32wqk8k1c3v FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: courier fkm0oofu9oipeylng2uye1ke47b; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.courier
    ADD CONSTRAINT fkm0oofu9oipeylng2uye1ke47b FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: delivery_manifest_items fkm7n39736wdjdh33m3xb2ja3tm; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_manifest_items
    ADD CONSTRAINT fkm7n39736wdjdh33m3xb2ja3tm FOREIGN KEY (order_item_id) REFERENCES ordering.order_item(order_item_id);


--
-- Name: courier fkn0tq8pwc8w0sry4fp7ujgv9h4; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.courier
    ADD CONSTRAINT fkn0tq8pwc8w0sry4fp7ujgv9h4 FOREIGN KEY (delivery_company_id) REFERENCES logistics.delivery_company(delivery_company_id);


--
-- Name: delivery_company fkoe7jt31cwomlcq8bwuc6p0arp; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_company
    ADD CONSTRAINT fkoe7jt31cwomlcq8bwuc6p0arp FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: courier fkserm8rjv4qhyjk5vv9dhdp2g2; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.courier
    ADD CONSTRAINT fkserm8rjv4qhyjk5vv9dhdp2g2 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: delivery_manifest_items fksjtswvxjxiau6vtmvm8jeqvek; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_manifest_items
    ADD CONSTRAINT fksjtswvxjxiau6vtmvm8jeqvek FOREIGN KEY (product_id) REFERENCES marketing.product(product_id);


--
-- Name: delivery_manifest_items fkwp523muqw2deyfbg79ek30jx; Type: FK CONSTRAINT; Schema: logistics; Owner: postgres
--

ALTER TABLE ONLY logistics.delivery_manifest_items
    ADD CONSTRAINT fkwp523muqw2deyfbg79ek30jx FOREIGN KEY (delivery_manifest_id) REFERENCES logistics.delivery_manifest(delivery_manifest_id);


--
-- Name: audit fk2x63qme5bammbohu3d70jbuqc; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.audit
    ADD CONSTRAINT fk2x63qme5bammbohu3d70jbuqc FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: audit fk5d2hapfhlqfqq52r9m4tu9eu5; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.audit
    ADD CONSTRAINT fk5d2hapfhlqfqq52r9m4tu9eu5 FOREIGN KEY (audit_event_id) REFERENCES management.audit_event(audit_event_id);


--
-- Name: onboarding_module fk5pk989b0ai7c7f1u42xbsera0; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding_module
    ADD CONSTRAINT fk5pk989b0ai7c7f1u42xbsera0 FOREIGN KEY (module_id) REFERENCES master.module(module_id);


--
-- Name: onboarding_store fk6ttjika07jqrclmkws2svibdd; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding_store
    ADD CONSTRAINT fk6ttjika07jqrclmkws2svibdd FOREIGN KEY (store_id) REFERENCES management.store(store_id);


--
-- Name: user_data fk76l563xm2ieqmn3kqvltwnsqj; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.user_data
    ADD CONSTRAINT fk76l563xm2ieqmn3kqvltwnsqj FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: audit_event fk7ual7uq79f4shv4or5pu8888p; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.audit_event
    ADD CONSTRAINT fk7ual7uq79f4shv4or5pu8888p FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: onboarding_store fk88p8qh0yfwy5fh2o7sl6f1kns; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding_store
    ADD CONSTRAINT fk88p8qh0yfwy5fh2o7sl6f1kns FOREIGN KEY (onboard_id) REFERENCES management.onboarding(onboard_id);


--
-- Name: membership_module_role fk94cikhgslbrire1yei68y6j8l; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.membership_module_role
    ADD CONSTRAINT fk94cikhgslbrire1yei68y6j8l FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: onboarding fk954rer9ytoohsemavpkj5nhlo; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding
    ADD CONSTRAINT fk954rer9ytoohsemavpkj5nhlo FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: user_role fka68196081fvovjhkek5m97n3y; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.user_role
    ADD CONSTRAINT fka68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES management.role(role_id);


--
-- Name: membership_module fkau4op6k116f09k0k7ok0y4maw; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.membership_module
    ADD CONSTRAINT fkau4op6k116f09k0k7ok0y4maw FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: onboarding_channel fkcqxs20yc9g4sujuqv9f0jr5dx; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding_channel
    ADD CONSTRAINT fkcqxs20yc9g4sujuqv9f0jr5dx FOREIGN KEY (onboard_id) REFERENCES management.onboarding(onboard_id);


--
-- Name: onboarding_channel fkd7mn6dr75hotga6jigbbeojy6; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding_channel
    ADD CONSTRAINT fkd7mn6dr75hotga6jigbbeojy6 FOREIGN KEY (closing_channel_id) REFERENCES master.closing_channel(closing_channel_id);


--
-- Name: onboarding_module fkd8l92oaal33r1w8mlfhu1fy2j; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding_module
    ADD CONSTRAINT fkd8l92oaal33r1w8mlfhu1fy2j FOREIGN KEY (onboard_id) REFERENCES management.onboarding(onboard_id);


--
-- Name: onboarding fkdgt3v7w63cldyb28fv4xp8q4g; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding
    ADD CONSTRAINT fkdgt3v7w63cldyb28fv4xp8q4g FOREIGN KEY (category_id) REFERENCES master.category(category_id);


--
-- Name: membership_module fkeso1m4upk8912gae2mm1somce; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.membership_module
    ADD CONSTRAINT fkeso1m4upk8912gae2mm1somce FOREIGN KEY (membership_id) REFERENCES payment.membership(membership_id);


--
-- Name: role_access fkfp0fuaew5ad4lrhoi8enrnc4r; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.role_access
    ADD CONSTRAINT fkfp0fuaew5ad4lrhoi8enrnc4r FOREIGN KEY (access_id) REFERENCES management.access(access_id);


--
-- Name: store fkg7wk2yfmvuvjs1hxsfr1ipjeg; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.store
    ADD CONSTRAINT fkg7wk2yfmvuvjs1hxsfr1ipjeg FOREIGN KEY (store_type_id) REFERENCES master.store_type(store_type_id);


--
-- Name: role_access fkgivcvjgfyx5n6dobicwh0iyk5; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.role_access
    ADD CONSTRAINT fkgivcvjgfyx5n6dobicwh0iyk5 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: store fkhrfdoorjpsp5d9o1132mh3vgu; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.store
    ADD CONSTRAINT fkhrfdoorjpsp5d9o1132mh3vgu FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: client fkj3xji43pext7xehl7gjd1pjfq; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.client
    ADD CONSTRAINT fkj3xji43pext7xehl7gjd1pjfq FOREIGN KEY (district_id) REFERENCES master.district(district_id);


--
-- Name: access fkkoncnwtbklf6xf2xtt1ouphij; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.access
    ADD CONSTRAINT fkkoncnwtbklf6xf2xtt1ouphij FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: membership_module fkksh5dx7c8vnht7j7ibaql1afd; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.membership_module
    ADD CONSTRAINT fkksh5dx7c8vnht7j7ibaql1afd FOREIGN KEY (module_id) REFERENCES master.module(module_id);


--
-- Name: audit fklsy9jqp7v9oxlpsgpmej9b58n; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.audit
    ADD CONSTRAINT fklsy9jqp7v9oxlpsgpmej9b58n FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: membership_module_role fkoslxugmimxgynpf6igoyu8edy; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.membership_module_role
    ADD CONSTRAINT fkoslxugmimxgynpf6igoyu8edy FOREIGN KEY (membership_module_id) REFERENCES management.membership_module(membership_module_id);


--
-- Name: user_role fkp22died80dx5melwhyfwxbkcn; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.user_role
    ADD CONSTRAINT fkp22died80dx5melwhyfwxbkcn FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: membership_module_role fkp680rnk1kj3ec8qjtpxcj00m6; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.membership_module_role
    ADD CONSTRAINT fkp680rnk1kj3ec8qjtpxcj00m6 FOREIGN KEY (role_id) REFERENCES management.role(role_id);


--
-- Name: user_data fksndl135r7mmv4nh0nbrqi214m; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.user_data
    ADD CONSTRAINT fksndl135r7mmv4nh0nbrqi214m FOREIGN KEY (district_id) REFERENCES master.district(district_id);


--
-- Name: onboarding fkt5ucthv7t8uvxc2sntomsgjbb; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.onboarding
    ADD CONSTRAINT fkt5ucthv7t8uvxc2sntomsgjbb FOREIGN KEY (entry_channel_id) REFERENCES master.entry_channel(entry_channel_id);


--
-- Name: role fktaemp3hhlx1adgfx3fmdsyssg; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.role
    ADD CONSTRAINT fktaemp3hhlx1adgfx3fmdsyssg FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: role_access fktieafqolqa48hq93xuaj7wp7q; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.role_access
    ADD CONSTRAINT fktieafqolqa48hq93xuaj7wp7q FOREIGN KEY (role_id) REFERENCES management.role(role_id);


--
-- Name: store fktnhu5doy5h7pdjhhym9s7yn5p; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.store
    ADD CONSTRAINT fktnhu5doy5h7pdjhhym9s7yn5p FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: product fk3g8nmhhbt7mwbf9r0g5qon8m0; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product
    ADD CONSTRAINT fk3g8nmhhbt7mwbf9r0g5qon8m0 FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: product_picture fk3jj3txq09gmroutux3lwdljmk; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product_picture
    ADD CONSTRAINT fk3jj3txq09gmroutux3lwdljmk FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: product fk40jy1qphfyw9fo5ncfyl9g3cd; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product
    ADD CONSTRAINT fk40jy1qphfyw9fo5ncfyl9g3cd FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: product fk7j8aci4xn0sahyhxk0fvqql6e; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product
    ADD CONSTRAINT fk7j8aci4xn0sahyhxk0fvqql6e FOREIGN KEY (color_id) REFERENCES master.color(color_id);


--
-- Name: product_price fkeupemu63ifqfc4txkskyy1hyi; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product_price
    ADD CONSTRAINT fkeupemu63ifqfc4txkskyy1hyi FOREIGN KEY (product_id) REFERENCES marketing.product(product_id);


--
-- Name: product_picture fkfq6p1rh9ifxuxtj9aenls45hd; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product_picture
    ADD CONSTRAINT fkfq6p1rh9ifxuxtj9aenls45hd FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: model fkhbgv4j3vpt308sepyq9q79mhu; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.model
    ADD CONSTRAINT fkhbgv4j3vpt308sepyq9q79mhu FOREIGN KEY (brand_id) REFERENCES marketing.brand(brand_id);


--
-- Name: model fkhdp8u9d2je1h05b264b419qpg; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.model
    ADD CONSTRAINT fkhdp8u9d2je1h05b264b419qpg FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: product_picture fkhna689todg1mb769hwfgcmsos; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product_picture
    ADD CONSTRAINT fkhna689todg1mb769hwfgcmsos FOREIGN KEY (product_id) REFERENCES marketing.product(product_id);


--
-- Name: product fkkj4rugu6x9sb4chv5msepdwmn; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product
    ADD CONSTRAINT fkkj4rugu6x9sb4chv5msepdwmn FOREIGN KEY (model_id) REFERENCES marketing.model(model_id);


--
-- Name: product_price fkl5rpk81cd2gc3qrfaa1fc8ahw; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product_price
    ADD CONSTRAINT fkl5rpk81cd2gc3qrfaa1fc8ahw FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: product fkndrubbm6whifirg6o2bpdcf6b; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product
    ADD CONSTRAINT fkndrubbm6whifirg6o2bpdcf6b FOREIGN KEY (unit_id) REFERENCES master.unit(unit_id);


--
-- Name: model fko9grvi0a8yfutapgwas02bcwp; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.model
    ADD CONSTRAINT fko9grvi0a8yfutapgwas02bcwp FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: brand fkpikfc78gwwwj3ilp4x83lcrwc; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.brand
    ADD CONSTRAINT fkpikfc78gwwwj3ilp4x83lcrwc FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: product fksccbu8jiglqc6t5tjsp04amv7; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product
    ADD CONSTRAINT fksccbu8jiglqc6t5tjsp04amv7 FOREIGN KEY (size_id) REFERENCES master.size(size_id);


--
-- Name: brand fkt1f1ckkash2rdlfggk3j77qjr; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.brand
    ADD CONSTRAINT fkt1f1ckkash2rdlfggk3j77qjr FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: product fktowai82hp2vxynan8w5sgl7ta; Type: FK CONSTRAINT; Schema: marketing; Owner: postgres
--

ALTER TABLE ONLY marketing.product
    ADD CONSTRAINT fktowai82hp2vxynan8w5sgl7ta FOREIGN KEY (sub_category_product_id) REFERENCES master.sub_category_product(sub_category_product_id);


--
-- Name: district fk276utu38g5lgqeth6pwfm3rw2; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.district
    ADD CONSTRAINT fk276utu38g5lgqeth6pwfm3rw2 FOREIGN KEY (province_id) REFERENCES master.province(province_id);


--
-- Name: sub_category_product fk35v7657ryssc8i8frpp5pw4r7; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.sub_category_product
    ADD CONSTRAINT fk35v7657ryssc8i8frpp5pw4r7 FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: payment_state fk3q56uynxiwuomcoitkm2gs0ln; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.payment_state
    ADD CONSTRAINT fk3q56uynxiwuomcoitkm2gs0ln FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: category_product fk6ftavmw5jtlo7sfquswc9uprb; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.category_product
    ADD CONSTRAINT fk6ftavmw5jtlo7sfquswc9uprb FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: sub_category_product fk6gbbp92ru5joa3mpr9mo4jndq; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.sub_category_product
    ADD CONSTRAINT fk6gbbp92ru5joa3mpr9mo4jndq FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: category_product fk81khi8m9gvb7no7hoh069bylb; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.category_product
    ADD CONSTRAINT fk81khi8m9gvb7no7hoh069bylb FOREIGN KEY (unit_type_id) REFERENCES master.unit_type(unit_type_id);


--
-- Name: category fk8dcna8xqno63aurm540vc0uer; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.category
    ADD CONSTRAINT fk8dcna8xqno63aurm540vc0uer FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: management_type fk8jv600tkoiau9mpknjmoemar8; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.management_type
    ADD CONSTRAINT fk8jv600tkoiau9mpknjmoemar8 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: color fk95lw28xa0lb89b8y7y7b1j4o9; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.color
    ADD CONSTRAINT fk95lw28xa0lb89b8y7y7b1j4o9 FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: membership_state fkae2l1ce8ji8gg34mmb3tl6qim; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.membership_state
    ADD CONSTRAINT fkae2l1ce8ji8gg34mmb3tl6qim FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: unit fkatalq4eest82ckgmmqdg8j855; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.unit
    ADD CONSTRAINT fkatalq4eest82ckgmmqdg8j855 FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: size fkavuufxlxbo7rubv5a45ckiqcx; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.size
    ADD CONSTRAINT fkavuufxlxbo7rubv5a45ckiqcx FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: closing_channel fkaxjn01knpllxufr8jcmn89koc; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.closing_channel
    ADD CONSTRAINT fkaxjn01knpllxufr8jcmn89koc FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: unit fkc8lbarh59q5w07t54u910b3gy; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.unit
    ADD CONSTRAINT fkc8lbarh59q5w07t54u910b3gy FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: cancellation_reason fkcfa13f13q2x4qvcre7xcchal5; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.cancellation_reason
    ADD CONSTRAINT fkcfa13f13q2x4qvcre7xcchal5 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: category_product fkcj4obb2sbj7us2pgr3ldnju2j; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.category_product
    ADD CONSTRAINT fkcj4obb2sbj7us2pgr3ldnju2j FOREIGN KEY (size_type_id) REFERENCES master.size_type(size_type_id);


--
-- Name: entry_channel fkclfvupu8mv1kelh2h0jibp7tj; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.entry_channel
    ADD CONSTRAINT fkclfvupu8mv1kelh2h0jibp7tj FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: size fke01lrnb33f1xvefpqub4d2ko3; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.size
    ADD CONSTRAINT fke01lrnb33f1xvefpqub4d2ko3 FOREIGN KEY (size_type_id) REFERENCES master.size_type(size_type_id);


--
-- Name: discount fke3rhwtrgalc91tafndbex16yq; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.discount
    ADD CONSTRAINT fke3rhwtrgalc91tafndbex16yq FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: size fke6fgptvo61lal0gim5j1q6axn; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.size
    ADD CONSTRAINT fke6fgptvo61lal0gim5j1q6axn FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: order_state fkey5q5cjvreubf0j0c9fjh79en; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.order_state
    ADD CONSTRAINT fkey5q5cjvreubf0j0c9fjh79en FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: size_type fkfclkuhyai4t5mic5aswrja7e5; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.size_type
    ADD CONSTRAINT fkfclkuhyai4t5mic5aswrja7e5 FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: unit fkfpa61gje7ge4eb06ovx81hbo4; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.unit
    ADD CONSTRAINT fkfpa61gje7ge4eb06ovx81hbo4 FOREIGN KEY (unit_type_id) REFERENCES master.unit_type(unit_type_id);


--
-- Name: category_product fkfv1g19hhbn7c4ekdm8li5nq1a; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.category_product
    ADD CONSTRAINT fkfv1g19hhbn7c4ekdm8li5nq1a FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: color fkguer3h3gtno6sx1vp6m93ct57; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.color
    ADD CONSTRAINT fkguer3h3gtno6sx1vp6m93ct57 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: sale_channel fkjxidoha5xi9bhfjgelv0i3g3p; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.sale_channel
    ADD CONSTRAINT fkjxidoha5xi9bhfjgelv0i3g3p FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: department fkk0qqx5jjcwjwd8wut9t7rl23; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.department
    ADD CONSTRAINT fkk0qqx5jjcwjwd8wut9t7rl23 FOREIGN KEY (country_id) REFERENCES master.country(country_id);


--
-- Name: store_type fklde6jnumm1nxr7spp6nf26dwm; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.store_type
    ADD CONSTRAINT fklde6jnumm1nxr7spp6nf26dwm FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: province fklqwtri7foyv73f09apfupey7v; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.province
    ADD CONSTRAINT fklqwtri7foyv73f09apfupey7v FOREIGN KEY (department_id) REFERENCES master.department(department_id);


--
-- Name: payment_method fknkh3s9gpeomh982ndh54gvh9o; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.payment_method
    ADD CONSTRAINT fknkh3s9gpeomh982ndh54gvh9o FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: unit_type fknlwlp7la20s9x08k5rjg9v32v; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.unit_type
    ADD CONSTRAINT fknlwlp7la20s9x08k5rjg9v32v FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: sub_category_product fko1opvo2q8183698hmtdwtaldk; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.sub_category_product
    ADD CONSTRAINT fko1opvo2q8183698hmtdwtaldk FOREIGN KEY (category_product_id) REFERENCES master.category_product(category_product_id);


--
-- Name: module fkofpfptg64d5jf9ucuhadthvuu; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.module
    ADD CONSTRAINT fkofpfptg64d5jf9ucuhadthvuu FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: size_type fkqh00mga1gmvtoh0ig03tuwj27; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.size_type
    ADD CONSTRAINT fkqh00mga1gmvtoh0ig03tuwj27 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: unit_type fkrx8legohruwocqpgnsdwyc0oj; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.unit_type
    ADD CONSTRAINT fkrx8legohruwocqpgnsdwyc0oj FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: cancelled_order fk11iprhqm5gpxh1m6m5ibmsgkd; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.cancelled_order
    ADD CONSTRAINT fk11iprhqm5gpxh1m6m5ibmsgkd FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: order_payment_receipt fk29n62sjg9ocju93kojay9mx2u; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_payment_receipt
    ADD CONSTRAINT fk29n62sjg9ocju93kojay9mx2u FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: order_payment_receipt fk441a373d9ty022lg4daiujgj5; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_payment_receipt
    ADD CONSTRAINT fk441a373d9ty022lg4daiujgj5 FOREIGN KEY (order_id) REFERENCES ordering."order"(order_id);


--
-- Name: courier_picture fk4amn57bktyoee11skv9r1oruu; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.courier_picture
    ADD CONSTRAINT fk4amn57bktyoee11skv9r1oruu FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: order_item fk551losx9j75ss5d6bfsqvijna; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_item
    ADD CONSTRAINT fk551losx9j75ss5d6bfsqvijna FOREIGN KEY (product_id) REFERENCES marketing.product(product_id);


--
-- Name: order fk574xprqox7sx5lngwyo00v4y8; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fk574xprqox7sx5lngwyo00v4y8 FOREIGN KEY (closing_channel_id) REFERENCES master.closing_channel(closing_channel_id);


--
-- Name: order fk61d7rjlx8qtdk4j1yofuoksxk; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fk61d7rjlx8qtdk4j1yofuoksxk FOREIGN KEY (delivery_point_id) REFERENCES ordering.delivery_point(delivery_point_id);


--
-- Name: cancelled_order fk62f40547v6d74ykjgges7l78h; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.cancelled_order
    ADD CONSTRAINT fk62f40547v6d74ykjgges7l78h FOREIGN KEY (cancellation_reason_id) REFERENCES master.cancellation_reason(cancellation_reason_id);


--
-- Name: order fk6y32m1o494o2mupkyu7l3n3ac; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fk6y32m1o494o2mupkyu7l3n3ac FOREIGN KEY (payment_state_id) REFERENCES master.payment_state(payment_state_id);


--
-- Name: customer fk7kussxniw0okvwfo22snxc221; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.customer
    ADD CONSTRAINT fk7kussxniw0okvwfo22snxc221 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: customer fk7ye9voadhgeaojq3l7hfodjja; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.customer
    ADD CONSTRAINT fk7ye9voadhgeaojq3l7hfodjja FOREIGN KEY (district_id) REFERENCES master.district(district_id);


--
-- Name: order_log fk81eqk7adux2j3a2v9vcg18txj; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_log
    ADD CONSTRAINT fk81eqk7adux2j3a2v9vcg18txj FOREIGN KEY (order_id) REFERENCES ordering."order"(order_id);


--
-- Name: customer fk8axppsuewb9gg1dhc4cj07qjf; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.customer
    ADD CONSTRAINT fk8axppsuewb9gg1dhc4cj07qjf FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: delivery_point fk92uo6510evx3wgb23dxlpe0wf; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.delivery_point
    ADD CONSTRAINT fk92uo6510evx3wgb23dxlpe0wf FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: order fk9aic5c086nl3jsslo9vcjjyou; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fk9aic5c086nl3jsslo9vcjjyou FOREIGN KEY (order_state_id) REFERENCES master.order_state(order_state_id);


--
-- Name: order fk9i6o01mis3khi5axe1grih90j; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fk9i6o01mis3khi5axe1grih90j FOREIGN KEY (discount_id) REFERENCES master.discount(discount_id);


--
-- Name: order fk9wmy20fey9gaykblfh3fqsjo0; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fk9wmy20fey9gaykblfh3fqsjo0 FOREIGN KEY (store_id) REFERENCES management.store(store_id);


--
-- Name: order_contacted fkard9a9d0xheu5np7l8d4dfk6p; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_contacted
    ADD CONSTRAINT fkard9a9d0xheu5np7l8d4dfk6p FOREIGN KEY (order_id) REFERENCES ordering."order"(order_id);


--
-- Name: order fkb8tboo4d95mh8gavvovwbb7vg; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fkb8tboo4d95mh8gavvovwbb7vg FOREIGN KEY (customer_id) REFERENCES ordering.customer(customer_id);


--
-- Name: order fkbb5wakyppwqmfuhp53p3jvs5u; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fkbb5wakyppwqmfuhp53p3jvs5u FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: cancelled_order fkbs6jfa6mh5o4x1uunawi2xr7y; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.cancelled_order
    ADD CONSTRAINT fkbs6jfa6mh5o4x1uunawi2xr7y FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: courier_picture fkbxtersejhrurrdact45dbsuo2; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.courier_picture
    ADD CONSTRAINT fkbxtersejhrurrdact45dbsuo2 FOREIGN KEY (order_id) REFERENCES ordering."order"(order_id);


--
-- Name: order_payment_receipt fkf9ipj5r356m1584h4jvv901bd; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_payment_receipt
    ADD CONSTRAINT fkf9ipj5r356m1584h4jvv901bd FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: order fkg3hid83met6yximafjdf8fdrk; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fkg3hid83met6yximafjdf8fdrk FOREIGN KEY (management_type_id) REFERENCES master.management_type(management_type_id);


--
-- Name: cancelled_order fkgu9wc0sfq7sn7ojwqy0wqgpf9; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.cancelled_order
    ADD CONSTRAINT fkgu9wc0sfq7sn7ojwqy0wqgpf9 FOREIGN KEY (order_id) REFERENCES ordering."order"(order_id);


--
-- Name: order_contacted fkhwfv8eb50y3wub2ktd2eaymi2; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_contacted
    ADD CONSTRAINT fkhwfv8eb50y3wub2ktd2eaymi2 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: order_log fkj9ow0bq5qv7vjxfwmj8qt5i3w; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_log
    ADD CONSTRAINT fkj9ow0bq5qv7vjxfwmj8qt5i3w FOREIGN KEY (order_state_id) REFERENCES master.order_state(order_state_id);


--
-- Name: order_item fkjdgdduaa9j2jwe95rullqn8yy; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_item
    ADD CONSTRAINT fkjdgdduaa9j2jwe95rullqn8yy FOREIGN KEY (discount_id) REFERENCES master.discount(discount_id);


--
-- Name: order fklaf31ka37nhamsdy9gvct70q0; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fklaf31ka37nhamsdy9gvct70q0 FOREIGN KEY (payment_method_id) REFERENCES master.payment_method(payment_method_id);


--
-- Name: customer_type fklfe06did624h1lxffp5fq9hg4; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.customer_type
    ADD CONSTRAINT fklfe06did624h1lxffp5fq9hg4 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: courier_picture fklujjdr3cy8msgedon0uv15syq; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.courier_picture
    ADD CONSTRAINT fklujjdr3cy8msgedon0uv15syq FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: order_item fkn3hl0vogrk2wsqtme5wo88ixq; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_item
    ADD CONSTRAINT fkn3hl0vogrk2wsqtme5wo88ixq FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: customer fkn8vf9jf3m29plqn6rx45p2pl7; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.customer
    ADD CONSTRAINT fkn8vf9jf3m29plqn6rx45p2pl7 FOREIGN KEY (customer_type_id) REFERENCES ordering.customer_type(customer_type_id);


--
-- Name: order_item fkp4mgraul09m4m7upv54v08fjy; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_item
    ADD CONSTRAINT fkp4mgraul09m4m7upv54v08fjy FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: order_contacted fkp9uig1kujfhwxr5gv2g9ejvoc; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_contacted
    ADD CONSTRAINT fkp9uig1kujfhwxr5gv2g9ejvoc FOREIGN KEY (agent_id) REFERENCES management.user_data(user_id);


--
-- Name: order fkpvay0ycleiixer0mbdv1ulg2a; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fkpvay0ycleiixer0mbdv1ulg2a FOREIGN KEY (courier_id) REFERENCES logistics.courier(courier_id);


--
-- Name: order_log fkq6b6dsff8vqf3ljh56so0b8qw; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_log
    ADD CONSTRAINT fkq6b6dsff8vqf3ljh56so0b8qw FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: order_log fkr1mywd23nh96l9t5ewft1vqu0; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_log
    ADD CONSTRAINT fkr1mywd23nh96l9t5ewft1vqu0 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: order fkrq3vvehgxgpomlr1gxwps69ci; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fkrq3vvehgxgpomlr1gxwps69ci FOREIGN KEY (sale_channel_id) REFERENCES master.sale_channel(sale_channel_id);


--
-- Name: order_contacted fkrtyaw40pks4suoa7sjc04gpvn; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_contacted
    ADD CONSTRAINT fkrtyaw40pks4suoa7sjc04gpvn FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: order fksunlg4strlu6w0662xu56ph2l; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering."order"
    ADD CONSTRAINT fksunlg4strlu6w0662xu56ph2l FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: order_item fkt6wv8m7eshksp5kp8w4b2d1dm; Type: FK CONSTRAINT; Schema: ordering; Owner: postgres
--

ALTER TABLE ONLY ordering.order_item
    ADD CONSTRAINT fkt6wv8m7eshksp5kp8w4b2d1dm FOREIGN KEY (order_id) REFERENCES ordering."order"(order_id);


--
-- Name: membership fk8s473tlgsyhg6srkmhkfok9xg; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership
    ADD CONSTRAINT fk8s473tlgsyhg6srkmhkfok9xg FOREIGN KEY (membership_payment_id) REFERENCES payment.membership_payment(membership_payment_id);


--
-- Name: membership_payment fkc87dv60idpvl4g2muae6gi7e7; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership_payment
    ADD CONSTRAINT fkc87dv60idpvl4g2muae6gi7e7 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: membership_payment fkdwphwqttk1dg2t3hdya0b3i72; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership_payment
    ADD CONSTRAINT fkdwphwqttk1dg2t3hdya0b3i72 FOREIGN KEY (payment_gateway_id) REFERENCES payment.payment_gateway(payment_gateway_id);


--
-- Name: membership_payment_state fkec8dnky25355salol6p7igt3c; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership_payment_state
    ADD CONSTRAINT fkec8dnky25355salol6p7igt3c FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: membership fkhkammhkjmd5xsixh1d3kt2l40; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership
    ADD CONSTRAINT fkhkammhkjmd5xsixh1d3kt2l40 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: subscription fkj4bgh2qakis425oa7c532rqbl; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.subscription
    ADD CONSTRAINT fkj4bgh2qakis425oa7c532rqbl FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: membership_payment fkl31b7028byd444xhp13xc7wa7; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership_payment
    ADD CONSTRAINT fkl31b7028byd444xhp13xc7wa7 FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: membership fknqxm1bnta4g710n2y6itoo835; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership
    ADD CONSTRAINT fknqxm1bnta4g710n2y6itoo835 FOREIGN KEY (membership_state_id) REFERENCES master.membership_state(membership_id);


--
-- Name: payment_gateway fkrb8qg0w0gicpamaa5c7vy1vja; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.payment_gateway
    ADD CONSTRAINT fkrb8qg0w0gicpamaa5c7vy1vja FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: membership fkrpym0hqeki9mqxftuk7b2nqcu; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership
    ADD CONSTRAINT fkrpym0hqeki9mqxftuk7b2nqcu FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: membership fkswq68v4p3g70l37rxklt5ujwb; Type: FK CONSTRAINT; Schema: payment; Owner: postgres
--

ALTER TABLE ONLY payment.membership
    ADD CONSTRAINT fkswq68v4p3g70l37rxklt5ujwb FOREIGN KEY (subscription_id) REFERENCES payment.subscription(subscription_id);


--
-- Name: stock_transaction fk14hxmfhfwgm4xje28ghnp4sjg; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction
    ADD CONSTRAINT fk14hxmfhfwgm4xje28ghnp4sjg FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: stock_transaction fk1xcexr06o4klgk5b5pvn3wcx4; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction
    ADD CONSTRAINT fk1xcexr06o4klgk5b5pvn3wcx4 FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: stock_transaction fk222g22ud54l25tovcfrqegso0; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction
    ADD CONSTRAINT fk222g22ud54l25tovcfrqegso0 FOREIGN KEY (warehouse_id) REFERENCES logistics.warehouse(warehouse_id);


--
-- Name: supply_order fk2qa8hb0f9fnty6oxjrh87s0ok; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.supply_order
    ADD CONSTRAINT fk2qa8hb0f9fnty6oxjrh87s0ok FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: warehouse_stock fk5jkp80xgfoadbgenbir8cl6ro; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_stock
    ADD CONSTRAINT fk5jkp80xgfoadbgenbir8cl6ro FOREIGN KEY (product_id) REFERENCES marketing.product(product_id);


--
-- Name: warehouse_output fk6gws4xl0a48dlos07ucqbsin8; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_output
    ADD CONSTRAINT fk6gws4xl0a48dlos07ucqbsin8 FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: supply_order fk80cqfw47g0w88x2vaim43ymqs; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.supply_order
    ADD CONSTRAINT fk80cqfw47g0w88x2vaim43ymqs FOREIGN KEY (warehouse_id) REFERENCES logistics.warehouse(warehouse_id);


--
-- Name: stock_transaction_item fk8dh1a92nygc0ktcyiytpbu097; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction_item
    ADD CONSTRAINT fk8dh1a92nygc0ktcyiytpbu097 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: supply_order_item fk8eq1yt8m6o76ar969gswpn9ek; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.supply_order_item
    ADD CONSTRAINT fk8eq1yt8m6o76ar969gswpn9ek FOREIGN KEY (product_id) REFERENCES marketing.product(product_id);


--
-- Name: stock_transaction_item fk8u1vln0k90i3rwq5wbr2rgfyl; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction_item
    ADD CONSTRAINT fk8u1vln0k90i3rwq5wbr2rgfyl FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: stock_transaction_type fk91jvn1jkevvhlhld0j5vl8a9j; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction_type
    ADD CONSTRAINT fk91jvn1jkevvhlhld0j5vl8a9j FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: stock_transaction_item fk9eh12ai37eqn9lre8n7gcldyh; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction_item
    ADD CONSTRAINT fk9eh12ai37eqn9lre8n7gcldyh FOREIGN KEY (stock_transaction_id) REFERENCES stock.stock_transaction(stock_transaction_id);


--
-- Name: warehouse_output_item fkayir16byjy29sg6sp4mq4o6xo; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_output_item
    ADD CONSTRAINT fkayir16byjy29sg6sp4mq4o6xo FOREIGN KEY (product_id) REFERENCES marketing.product(product_id);


--
-- Name: general_stock fkb6yac3xj4g7ctx4esjn9yfjj0; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.general_stock
    ADD CONSTRAINT fkb6yac3xj4g7ctx4esjn9yfjj0 FOREIGN KEY (product_id) REFERENCES marketing.product(product_id);


--
-- Name: supply_order_item fkbwhadvdilfoinwl6qqexxcywb; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.supply_order_item
    ADD CONSTRAINT fkbwhadvdilfoinwl6qqexxcywb FOREIGN KEY (purchase_id) REFERENCES stock.supply_order(supply_order_id);


--
-- Name: warehouse_output_item fkcf5qk1qs1lr025v34xl4ongbx; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_output_item
    ADD CONSTRAINT fkcf5qk1qs1lr025v34xl4ongbx FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: warehouse_stock fkdwmhgyv7ktixi0uaa5158b2un; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_stock
    ADD CONSTRAINT fkdwmhgyv7ktixi0uaa5158b2un FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: stock_transaction_item fkedayga2ssc1ey9uu5069521e2; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction_item
    ADD CONSTRAINT fkedayga2ssc1ey9uu5069521e2 FOREIGN KEY (product_id) REFERENCES marketing.product(product_id);


--
-- Name: warehouse_stock fkfalk2cwo00uo7jjda00lu8wsv; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_stock
    ADD CONSTRAINT fkfalk2cwo00uo7jjda00lu8wsv FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: supply_order_item fkgbv6vmn5b6l91homvbk4xu4p8; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.supply_order_item
    ADD CONSTRAINT fkgbv6vmn5b6l91homvbk4xu4p8 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: warehouse_output fkgcv4w3jkr8y0atf7ndybpw0tf; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_output
    ADD CONSTRAINT fkgcv4w3jkr8y0atf7ndybpw0tf FOREIGN KEY (warehouse_id) REFERENCES logistics.warehouse(warehouse_id);


--
-- Name: warehouse_stock fkgm7yx9o82faihg0nq9xs1wde9; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_stock
    ADD CONSTRAINT fkgm7yx9o82faihg0nq9xs1wde9 FOREIGN KEY (warehouse_id) REFERENCES logistics.warehouse(warehouse_id);


--
-- Name: stock_transaction fkhl1qcc6g3fuxvlc5t3t683gcp; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.stock_transaction
    ADD CONSTRAINT fkhl1qcc6g3fuxvlc5t3t683gcp FOREIGN KEY (stock_transaction_type_id) REFERENCES stock.stock_transaction_type(stock_transaction_type_id);


--
-- Name: warehouse_output_item fkiwvi0bx8tq1fqk7ujl1yjf47a; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_output_item
    ADD CONSTRAINT fkiwvi0bx8tq1fqk7ujl1yjf47a FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: warehouse_output_item fkm7xmhytit0rltde33de4c3obp; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_output_item
    ADD CONSTRAINT fkm7xmhytit0rltde33de4c3obp FOREIGN KEY (warehouse_output_id) REFERENCES stock.warehouse_output(warehouse_output_id);


--
-- Name: general_stock fkmkkuk51o6sdxe16ytgy26e2sr; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.general_stock
    ADD CONSTRAINT fkmkkuk51o6sdxe16ytgy26e2sr FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: general_stock fkpr43mmo2qi74t91k5xxq71afl; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.general_stock
    ADD CONSTRAINT fkpr43mmo2qi74t91k5xxq71afl FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- Name: supply_order fkt9c68w259ki5q62b6eb1p8fv6; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.supply_order
    ADD CONSTRAINT fkt9c68w259ki5q62b6eb1p8fv6 FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: warehouse_output fkth7yt411duce6c4w5ck1yicsr; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.warehouse_output
    ADD CONSTRAINT fkth7yt411duce6c4w5ck1yicsr FOREIGN KEY (user_id) REFERENCES management.user_data(user_id);


--
-- Name: supply_order_item fktjk62p138tm2rs6q63s72qv2w; Type: FK CONSTRAINT; Schema: stock; Owner: postgres
--

ALTER TABLE ONLY stock.supply_order_item
    ADD CONSTRAINT fktjk62p138tm2rs6q63s72qv2w FOREIGN KEY (client_id) REFERENCES management.client(client_id);


--
-- PostgreSQL database dump complete
--

