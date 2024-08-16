use realestatedb;

-- TICKET 1: 
select avg(listingprice) from properties;

-- TICKET 2: 
-- TASK 1:

select address, listingprice  from properties where listingprice = (select min(listingprice) from properties);

-- TICKET 3: 

select address, listingprice  from properties 
where listingprice > (select avg(listingprice) from properties);

select avg(listingprice) from properties;

-- TICKET 4:

-- agents and properties :- agentid is the relationship

select a.firstname, a.lastname from agents a
inner join properties p on p.agentid = a.agentid where p.listingprice > 500000;

-- TICKET 5:
-- properties and propertydetails:- propertyid is the r/ship

/* select p.address, pd.bedrooms from properties p 
inner join propertydetails pd on p.propertyid = pd.propertyid
order by pd.bedrooms desc; */

select p.address, pd.bedrooms from properties p 
inner join propertydetails pd on p.propertyid = pd.propertyid
where bedrooms >= (select max(pd.bedrooms)  from propertydetails pd);

-- TICKET 6:

select avg(pd.bedrooms) from propertydetails pd 
left join properties p on p.propertyid = pd.propertyid
group by  (select avg(bedrooms) from propertydetails );

select sum(bedrooms)/count(propertyid) from propertydetails;

-- TICKET 7:
-- tables to use : properties and propertydetails. propertyid is the r/ship
select * from properties p 
inner join  propertydetails pd on p.propertyid =  pd.propertyid
where pd.yearbuilt = (select min(pd.yearbuilt) from propertydetails pd);

select yearbuilt from propertydetails order by yearbuilt asc;

-- TICKET 8:
-- tables: properties and propertydetails. propertyid is th r/ship

select * from properties p
inner join propertydetails pd on p.propertyid = pd.propertyid
where bathrooms > (select avg(bathrooms) from propertydetails);

select round(avg(bathrooms), 3) from propertydetails;

-- TICKET 9:
-- tables: properties and propertyamenities propertyamenityassignments. propertyid and propertyamenitiesis are th r/ship

select count(p.propertyid) from properties p
inner join propertyamenityassignments paa on p.propertyid = paa.propertyid
inner join propertyamenities pa on paa.amenityid = pa.amenityid
where amenityname = 'pool';

-- TICKET 10:
select amenityname from propertyamenities 
where (select count(amenityname)  from properties
  group by amenityname having count(amenityname) > 3);

select pa.amenityname, count(propertyid) from propertyamenities pa
inner join propertyamenityassignments paa
on pa.amenityid = paa.amenityid
group by pa.amenityname
having (select count(propertyid) from propertyamenityassignments  ) > 3 ;
-- (select count(propertyid) from propertyamenityassignments having count(propertyid) > 3 );




