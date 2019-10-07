

/*Hive*/

ADD JAR hdfs:///user/adyner/hive_udf_lib/JGeoIPChecker-1.0-SNAPSHOT-jar-with-dependencies.jar;


DROP FUNCTION IF EXISTS adyner.getCountryNameByLookupFile
;

CREATE FUNCTION adyner.getCountryNameByLookupFile AS 'com.tetraoxygen.datalake.IPCountryResolver'
USING JAR 'hdfs:///user/adyner/hive_udf_lib/JGeoIPChecker-1.0-SNAPSHOT-jar-with-dependencies.jar'
;

CREATE temporary MACRO getCountyNameByIP(ip string)
adyner.getCountryNameByLookupFile(ip, '/user/adyner/ip_address_info/ip_geo_info/000000_0')
;


INSERT INTO adyner.sales_top10_countries
SELECT
     country_name
    ,sum(price) as total_amount
FROM (
    SELECT
         getCountyNameByIP(ip_address) as country_name
        ,price
    FROM adyner.sales 
) s  
GROUP BY country_name
ORDER BY total_amount DESC
LIMIT 10
;
