
create database adyner;


CREATE EXTERNAL TABLE adyner.sales (
     product_name varchar(1024)
    ,price DECIMAL(18, 2)
    ,sale_tm timestamp
    ,product_category varchar(1024)
    ,ip_address varchar(1024) COMMENT 'IP Address of the User'
)
COMMENT 'All sales from tetraoxygen web site'
PARTITIONED BY (event_dt string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/adyner/events/'
TBLPROPERTIES(
    'skip.header.line.count' = '0'
);

ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-01') LOCATION '/user/adyner/events/2019/09/01';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-02') LOCATION '/user/adyner/events/2019/09/02';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-03') LOCATION '/user/adyner/events/2019/09/03';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-04') LOCATION '/user/adyner/events/2019/09/04';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-05') LOCATION '/user/adyner/events/2019/09/05';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-06') LOCATION '/user/adyner/events/2019/09/06';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-07') LOCATION '/user/adyner/events/2019/09/07';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-08') LOCATION '/user/adyner/events/2019/09/08';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-09') LOCATION '/user/adyner/events/2019/09/09';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-10') LOCATION '/user/adyner/events/2019/09/10';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-11') LOCATION '/user/adyner/events/2019/09/11';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-12') LOCATION '/user/adyner/events/2019/09/12';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-13') LOCATION '/user/adyner/events/2019/09/13';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-14') LOCATION '/user/adyner/events/2019/09/14';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-15') LOCATION '/user/adyner/events/2019/09/15';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-16') LOCATION '/user/adyner/events/2019/09/16';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-17') LOCATION '/user/adyner/events/2019/09/17';
ALTER TABLE adyner.sales ADD PARTITION (event_dt ='2019-09-18') LOCATION '/user/adyner/events/2019/09/18';


CREATE EXTERNAL TABLE adyner.ip_address_info (
     network varchar(255)
    ,geoname_id bigint
    ,registered_country_geoname_id bigint
    ,represented_country_geoname_id varchar(1024)
    ,is_anonymous_proxy TINYINT
    ,is_satellite_provider TINYINT
)
COMMENT 'ip address info from https://dev.maxmind.com/geoip/geoip2/geolite2/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/adyner/ip_address_info/blocks/'
TBLPROPERTIES(
    'skip.header.line.count' = '1'
)
;

CREATE EXTERNAL TABLE adyner.location_info (
     geoname_id bigint
    ,locale_code varchar(1024)
    ,continent_code varchar(1024)
    ,continent_name varchar(1024)
    ,country_iso_code varchar(1024)
    ,country_name varchar(1024)
    ,is_in_european_union TINYINT
)
COMMENT 'Country and Locations en info from https://dev.maxmind.com/geoip/geoip2/geolite2/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/adyner/ip_address_info/country/'
TBLPROPERTIES(
    'skip.header.line.count' = '1'
)
;
