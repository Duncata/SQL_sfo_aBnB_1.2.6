--3. What time of year is the cheapest time to go to San Francisco? 
SELECT
	sfo_calendar.calender_date,
	MIN(sfo_calendar.price) as min_calendar_price,
	MIN(sfo_listings.price) as min_listings_price

FROM sfo_calendar

JOIN sfo_reviews
ON sfo_calendar.listing_id=sfo_reviews.listing_id

JOIN sfo_listings
ON sfo_listings.id=sfo_reviews.id

GROUP BY 1
ORDER BY min_calendar_price
LIMIT 10;



