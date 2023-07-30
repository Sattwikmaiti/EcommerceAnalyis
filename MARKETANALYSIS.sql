-- SELECT COUNT(*) FROM mytable ;  2823 rows

#Table Details

#select * from mytable;



# Groupby DEALSIZe

-- select  DEALSIZE ,count(DEALSIZE)
-- FROM mytable
-- group by DEALSIZE
-- order by count(DEALSIZE) asc;


# Groupby ProductLine

-- select  PRODUCTLINE ,count(PRODUCTLINE)
-- FROM mytable
-- group by PRODUCTLINE
-- order by count(PRODUCTLINE) asc;


# Groupby YEAR

-- select  YEAR_ID,count(YEAR_ID)
-- FROM mytable
-- group by YEAR_ID
-- order by count(YEAR_ID) asc;



# Groupby Month

-- select  MONTH_ID,count(MONTH_ID),sum(PRICEEACH) as 'REVENUE'
-- FROM mytable
-- group by MONTH_ID
-- order by sum(PRICEEACH) desc;

#Sales from a particular customer

-- SELECT CUSTOMERNAME,ORDERNUMBER,SALES
-- from mytable
-- where CUSTOMERNAME ="Atelier graphique";


-- #Best Customers to target using RFM (Recency ,Frequency and Monetary )

-- with rfm as 
-- (
-- SELECT CUSTOMERNAME,
-- sum(SALES) as 'Purchased',
-- avg(SALES) as 'Avg Sales',
-- count(ORDERNUMBER) as "Order Number",
-- max(ORDERDATE) as "Last Order Date ",
--     
-- DATEDIFF(DATE_FORMAT(STR_TO_DATE('5/31/2005 0:00', '%m/%d/%Y'), '%Y/%m/%d'),DATE_FORMAT(STR_TO_DATE(max(ORDERDATE), '%m/%d/%Y'), '%Y/%m/%d'))as 'Recency'
-- from mytable
-- group by CUSTOMERNAME
-- order by count(ORDERNUMBER) asc

-- ),
-- rfm_score as (	
-- Select r.*,
--    ntile(4) over (order by 'Recency' desc ) as rfm_recency,
-- 	ntile(4) over (order by "Order Number") as rfm_frequency,
-- 	ntile(4) over (order by 'Purchased') as rfm_monetary
-- from rfm r
-- )
-- , RFM_Final
-- AS
-- (
-- SELECT *,
--   CONCAT(rfm_recency, rfm_frequency, rfm_monetary) as RFM_Overall
-- FROM rfm_score
-- )

-- SELECT f.* ,cs.Segment
--    
-- FROM RFM_Final f
-- INNER JOIN csreview as cs on f.RFM_Overall= cs.Scores
--      


-- ;

#grouping of orders
-- select count(ORDERNUMBER) ,ORDERNUMBER

-- from mytable

-- group by ORDERNUMBER ;




-- SELECT A.ORDERNUMBER,A.PRODUCTCODE,B.PRODUCTCODE
-- FROM mytable as A
-- LEFT JOIN mytable as B on A.ORDERNUMBER=B.ORDERNUMBER;

-- SELECT count(PRODUCTCODE) ,PRODUCTCODE
-- from mytable
-- group by PRODUCTCODE
--  ;


-- select ORDERNUMBER,PRODUCTCODE from mytable 
-- where ORDERNUMBER =10107;


-- select  A.ORDERNUMBER,A.PRODUCTCODE,B.PRODUCTCODE from mytable A join mytable B
-- on A.ORDERNUMBER=B.ORDERNUMBER
-- and A.PRODUCTCODE <> B.PRODUCTCODE

-- WHERE A.ORDERNUMBER =10107
-- ;

#MArket Basket ANalysis for 4 products at a together 
-- SELECT
--     s.OrderNumber,
--     SUBSTRING_INDEX(GROUP_CONCAT(p.PRODUCTCODE SEPARATOR ','), ',', 4) AS ProductCodes
-- FROM mytable s
-- JOIN mytable p ON s.ORDERNUMBER = p.ORDERNUMBER
-- WHERE s.STATUS = 'Shipped'
-- GROUP BY s.OrderNumber
-- ORDER BY ORDERNUMBER asc;





