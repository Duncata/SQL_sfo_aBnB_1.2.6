--1. What's the most expensive listing? What else can you tell me about the listing?

--There are multiple columns and rows in each table which describe about 
--the 3 tables. The 3 tables can be joined also cause there are 
--value in each pair matches, returning rows with the data from both tables.

WITH sfo_ids as(
SELECT
	sfo_reviews.id,
	sfo_reviews.listing_id,
	sfo_listings.price
	
FROM sfo_reviews

JOIN sfo_listings
ON sfo_reviews.id=sfo_listings.id
GROUP BY 1,2,3) 

SELECT
sfo_ids.id,
sfo_ids.listing_id,
MAX(sfo_ids.price) as max_listing_price,
MAX(sfo_calendar.price) as max_cal_price,
COUNT(*)


FROM sfo_ids

JOIN sfo_calendar
ON sfo_ids.listing_id=sfo_calendar.listing_id
GROUP BY 1,2
ORDER BY max_listing_price desc
LIMIT 10;
