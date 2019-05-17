--2. What neighborhoods seem to be the most popular?
SELECT
	neighbourhood_group,
	neighbourhood,
	review_date,
	MAX(sfo_listings.number_of_reviews) as max_num_review,
	MAX(sfo_listings.reviews_per_month) as max_review_mnth,
	MAX(sfo_listings.calculated_host_listings_count) as max_listings_count
FROM sfo_listings

JOIN sfo_reviews
ON sfo_listings.id = sfo_reviews.id

GROUP BY 1,2,3
ORDER BY max_listings_count DESC
LIMIT 10;

