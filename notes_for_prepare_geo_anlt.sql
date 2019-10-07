
CREATE EXTERNAL TABLE adyner.ip_geo_info (
     network VARCHAR(1024)
    ,country_name VARCHAR(1024)
)
COMMENT 'Special projection for sale geo analysis'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/adyner/ip_address_info/ip_geo_info/'
;


INSERT INTO adyner.ip_geo_info (network, country_name)
SELECT     
     a.network
    ,l.country_name
FROM 
    adyner.ip_address_info a
    INNER JOIN adyner.location_info l
    ON 1 = 1 
        AND a.registered_country_geoname_id = l.geoname_id
;
