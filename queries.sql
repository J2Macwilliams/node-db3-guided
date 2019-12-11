-- example of how to join
select (e.firstName || ' ' || e.lastName) as SoldBy
    ,o.id 
    ,o.CustomerId as Customer
    ,o.ShipCountry as ShippedTo
    , c.CompanyName as OrderedBy
from [order] as o
join employee as e 
    on o.EmployeeId = e.id
join customer as c 
    on o.CustomerId = c.id;

-- for a join with creating a total
    select o.id as OrderNumber
    , p.ProductName
    , od.Quantity
    , p.UnitPrice as Price
    , (od.Quantity * p.UnitPrice) as LineTotal
from [Order] as o
join orderdetail as od
    on o.id = od.OrderId
join Product as p
    on od.productId = p.id;

    -- for a join with 3 different tables
    select o.id as OrderNumber
    , p.ProductName
    , od.Quantity
    , p.UnitPrice as Price
    , (od.Quantity * p.UnitPrice) as LineTotal  
    ,  s.CompanyName as SoldBy  
from [Order] as o
join OrderDetail as od
    on o.id = od.OrderId
join Product as p
    on od.productId = p.id
join Supplier as s
    on s.id = p.SupplierId;


    -- a join is the same as an "inner join"

select distinct c.companyName as Customer
from customer as c
join [order] as o 
on c.id = o.customerid;--16789
order by c.companyName;

select * from customer;

select * from [order]
--delete from [order]
where customerId = 'ALFKI';

-- ----------------------
-- a join is the same as an "inner join"
select distinct c.id, c.CompanyName
from customer as c 
join [order] as o on c.id = o.customerId
order by c.id; -- 16589 (90 unique customers)
-- all the customer, even if they have no orders
select c.id, c.companyName as Customer, o.Id 
from customer as c
left join [order] as o on c.id = o.customerId
order by c.id;
select * from [order]
-- delete from [order]
where customerId = 'ALFKI';