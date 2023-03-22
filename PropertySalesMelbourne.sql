select * from [dbo].[PropertySalesMelbourne]

-- Change date format
select Date, CONVERT(date, Date)
from [dbo].[PropertySalesMelbourne]

alter table [dbo].[PropertySalesMelbourne]
add DateModify date;

update [dbo].[PropertySalesMelbourne]
set DateModify = CONVERT(date, Date)

-- Change Method Value
select
	(case
		when [Method] = 'SP'
		then 'property sold prior'
		when [Method] = 'S'
		then 'property sold'
		when [Method] = 'PI'
		then 'property passed in'
		when [Method] = 'PN'
		then 'sold prior not disclosed'
		when [Method] = 'SN'
		then 'sold not disclosed'
		when [Method] = 'VB'
		then 'vendor bid'
		when [Method] = 'W'
		then 'withdrawn prior to auction'
		when [Method] = 'SA'
		then 'sold after auction'
	end)
from [dbo].[PropertySalesMelbourne]

update [dbo].[PropertySalesMelbourne]
set [Method] = (case
		when [Method] = 'SP'
		then 'property sold prior'
		when [Method] = 'S'
		then 'property sold'
		when [Method] = 'PI'
		then 'property passed in'
		when [Method] = 'PN'
		then 'sold prior not disclosed'
		when [Method] = 'SN'
		then 'sold not disclosed'
		when [Method] = 'VB'
		then 'vendor bid'
		when [Method] = 'W'
		then 'withdrawn prior to auction'
		when [Method] = 'SA'
		then 'sold after auction'
	end)

-- Change Type Value
select
	(case
		when [Type] = 'h'
		then 'house'
		when [Type] = 't'
		then 'townhouse'
		when [Type] = 'u'
		then 'unit/apartment'
	end)
from [dbo].[PropertySalesMelbourne]

update [dbo].[PropertySalesMelbourne]
set [Type] = (case
		when [Type] = 'h'
		then 'house'
		when [Type] = 't'
		then 'townhouse'
		when [Type] = 'u'
		then 'unit/apartment'
	end)

-- Check Price by Suburb
select Suburb, min(price) as min_price, cast(AVG(price) as int) as average_price, max(price) as max_price
from [dbo].[PropertySalesMelbourne]
group by Suburb
order by 2 desc


-- Fill Blank Regionname 
select *
from [dbo].[PropertySalesMelbourne]
where Address like '%Stafford%'

update [dbo].[PropertySalesMelbourne]
set Regionname = 'Northern Metropolitan'
where Regionname = ' '

-- Check Price by RegionName
select Regionname, min(price) as min_price, cast(AVG(price) as int) as average_price, max(price) as max_price
from [dbo].[PropertySalesMelbourne]
group by Regionname
order by 1 asc

-- Check Average Price by Type
select Type, cast(AVG(price) as int) as average_price
from [dbo].[PropertySalesMelbourne]
group by Type
order by 2 desc

-- the number of properties held by the agent
select SellerG, count(Address) as number_of_property
from [dbo].[PropertySalesMelbourne]
group by SellerG
order by 2 desc

-- Top Revenue Agent by Property Sold
select SellerG, sum(Price) as Revenue_S
from [dbo].[PropertySalesMelbourne]
where Method = 'S'
group by SellerG
order by 2 desc

-- Top Revenue Agent by Property Sold After Auction
select SellerG, sum(Price) as Revenue_SA
from [dbo].[PropertySalesMelbourne]
where Method = 'SA'
group by SellerG
order by 2 desc

-- Top Sold Price by agent
select SellerG, MAX(Price) as Top_Sold
from [dbo].[PropertySalesMelbourne]
group by SellerG
order by 2 desc

-- Fill Null value in CouncilArea
select 
(case
	when [CouncilArea] = ' '
	then null
	else [CouncilArea]
end)
from [dbo].[PropertySalesMelbourne] 

select *
from [dbo].[PropertySalesMelbourne]
where [CouncilArea] is null

select a.Postcode,a.[CouncilArea], b.Postcode,b.[CouncilArea], ISNULL(a.[CouncilArea], b.[CouncilArea])
from [dbo].[PropertySalesMelbourne] a
join [dbo].[PropertySalesMelbourne] b
on a.Postcode = b.Postcode

update a
set a.[CouncilArea] = ISNULL(a.[CouncilArea], b.[CouncilArea])
from [dbo].[PropertySalesMelbourne] a
join [dbo].[PropertySalesMelbourne] b
on a.Postcode = b.Postcode
AND a.Method <> b.Method

-- For Null Council Area
select
	(case
		when [CouncilArea] is null
		then 'Unknown'
		else [CouncilArea]
	end)
from [dbo].[PropertySalesMelbourne]
order by 1

update [dbo].[PropertySalesMelbourne]
set [CouncilArea] = (case
		when [CouncilArea] is null or [CouncilArea] = 'Unavailable'
		then 'Unknown'
		else [CouncilArea]
	end)

select [CouncilArea], count([CouncilArea]) Total
from [dbo].[PropertySalesMelbourne]
group by [CouncilArea]
order by 2 desc

-- Most Method used for sell
select Method, count(Method) as Total
from [dbo].[PropertySalesMelbourne]
group by Method
order by 2 desc

-- Top Seller Method 
select [SellerG], [Method], sum([Price]) as Total
from [dbo].[PropertySalesMelbourne]
group by [SellerG], [Method]
order by 3 desc

-- Drop Date column
alter table [dbo].[PropertySalesMelbourne]
drop column [Date]
