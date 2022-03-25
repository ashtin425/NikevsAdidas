-- Looking at table
select *
from worksheet

-- Looking at the average sale price, rating, and number of reviews with all Adidas products
-- The initial price is in Indian Rupee currency so the exchange rate as of 3/23/2022 is 0.0132
select Round((AVG([ Sale Price ] * 0.0132)), 2) as AVGPrice, round((AVG(Rating)), 2) as AVGRating,
round((AVG(Reviews)), 2) as AVGReviews
from worksheet
where Brand like '%Adidas%'

-- Looking at the average price, rating, and number of reviews with all Nike products
-- The initial price is in Indian Rupee currency so the exchange rate as of 3/23/2022 is 0.0132
select round((AVG([ Sale Price ] * 0.0132)), 2) as AVGPrice, round((AVG(Rating)), 2) as AVGRating,
round((AVG(Reviews)), 2) as AVGReviews
from worksheet
where Brand like '%Nike%'

-- Looking at the top 10 most expensive Adidas products
select distinct top (10) [Product Name (Corrected)] as ProductName, round(([ Listing Price ] * 0.0132), 2) as ListingPrice, 
round(([ Sale Price ] * 0.0132), 2) as SalePrice 
from worksheet
where Brand like '%Adidas%'
order by 3 desc


-- Looking at the top 10 most expensive Nike products
select distinct top (10) [Product Name (Corrected)] as ProductName, round(([ Listing Price ] * 0.0132), 2) as ListingPrice, 
round(([ Sale Price ] * 0.0132), 2) as SalePrice
from worksheet
where Brand like '%Nike%' and [ Listing Price ] is not null
order by 3 desc

-- Looking at the 10 cheapest adidas products
select top (10) [Product Name (Corrected)] as ProductName, round(([ Listing Price ] * 0.0132), 2) as ListingPrice,
round(([ Sale Price ] * 0.0132), 2) as SalePrice, Brand, Description, Rating, Reviews
from worksheet
where Brand like '%Adidas%'
order by [ Sale Price ] asc

-- Looking at the 10 cheapest Nike products
select top (10) [Product Name (Corrected)] as ProductName, round(([ Sale Price ] * 0.0132), 2) as SalePrice, Brand,
Description, Rating, Reviews
from worksheet
where Brand like '%Nike%'
order by [ Sale Price ] asc

-- Looking at top rated Nike products with at least 10 reviews
select top (10) [Product Name (Corrected)] as ProductName, round(([ Sale Price ] * 0.0132), 2) as SalePrice, Brand,
Description, Rating, Reviews
from worksheet
where Brand like '%Nike%' and Reviews > 10
order by rating desc

-- Looking at top rated Adidas products with at least 10 reviews
select top (10) [Product Name (Corrected)]as ProductName, round(([ Sale Price ] * 0.0132), 2) as SalePrice, Brand,
Description, Rating, Reviews
from worksheet
where Brand like '%Adidas%' and Reviews > 10
order by rating desc

-- Looking at lowest rated Adidas products with at least 10 reviews
select top (10) [Product Name (Corrected)] as ProductName, round(([ Sale Price ] * 0.0132), 2) as SalePrice, Brand,
Description, Rating, Reviews
from worksheet
where Brand like '%Adidas%' and Reviews > 10
order by rating asc

-- Looking at lowest rated Nike products with at least 10 reviews
select top (10) [Product Name (Corrected)] as ProductName, round(([ Sale Price ] * 0.0132), 2) as SalePrice, Brand,
Description, Rating, Reviews
from worksheet
where Brand like '%Nike%' and Reviews > 10
order by rating asc

-- Getting the count of total Adidas products under $150 US dollars. (11445 Indian Rupees is approx $150 US dollars)
select count(*) as AdidasProdUnder150
from worksheet
where Brand like '%Adidas%' and [ Listing Price ]< 11445

-- Getting the count of total Nike products under $150 US dollars. (11445 Indian Rupees is approx $150 US dollars)
select count(*) as NikeProdUnder150
from worksheet
where Brand like '%Nike%' and [ Listing Price ]< 11445


