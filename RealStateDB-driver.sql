-- Ticket Breakdown
/*
Ticket 1: Setup the Real Estate Database
Tasks:
Set up the database using the provided SQL script.
Download realestate_database.sql
Ensure that all tables are created, and data is inserted correctly.
*/

USE realestatedb;

/*
Ticket 2: INNER JOIN
Tasks:
List all properties along with the agent's first name, last name, city, and state.
Use an INNER JOIN between the Properties and Agents tables.
Retrieve the transaction ID and the associated property address, city, and state.
Use an INNER JOIN between the Transactions and Properties tables.
Find all properties listed by a specific agent (e.g., AgentID = 3) along with the property address, city, state, and listing price.
Use an INNER JOIN between the Properties and Agents tables.
List all clients along with their first name, last name, email, and the properties they have purchased (address, city, state).
Use an INNER JOIN between the Transactions,Properties and Clients tables.
*/

-- Task 1: 
SELECT * FROM agents;
SELECT * FROM properties; 

-- agentID is the relationship column.

SELECT properties.propertyID, properties.city, properties.state, agents.firstName, agents.LastName FROM properties
INNER JOIN agents ON properties.PropertyID = agents.AgentID; 

-- Task 2: Retrieve the transaction ID and the associated property address, city, and state.

SELECT transactions.TransactionID, properties.Address, properties.City, properties.State FROM transactions
INNER JOIN properties on transactions.PropertyID = properties.PropertyID;

-- Task 3: 
SELECT properties.AgentID, properties.Address, properties.City, properties.State, properties.ListingDate
FROM properties 
INNER JOIN agents on properties.AgentID = agents.AgentID where properties.AgentID = 3;

-- TASK 4:

select transactions.TransactionID, transactions.PropertyID, clients.Email, clients.LastName,
properties.Address, properties.City, properties.State FROM transactions
inner join clients on transactions.ClientID = clients.ClientID
inner join properties on transactions.PropertyID = properties.PropertyID;

-- TICEK 3
-- tast 1:
select agents.FirstName, agents.LastName, properties.City from agents
left join properties on properties.AgentID = agents.AgentID;

-- tast 2:
select properties.PropertyID, properties.City, transactions.PropertyID, transactions.SalePrice
from properties
left join transactions on properties.PropertyID = transactions.PropertyID;

-- task 3:
select clients.ClientID, clients.FirstName, properties.PropertyID, properties.City, transactions.PropertyID, transactions.ClientID, transactions.SalePrice
from clients
left join transactions on transactions.ClientID = clients.ClientID
left join properties on transactions.PropertyID = properties.PropertyID;

-- task 4:
select propertytypes.TypeID, propertytypes.TypeName, properties.PropertyID, properties.City
from propertytypes
left join properties on propertytypes.TypeID = properties.TypeID;

-- ticket 4
-- taskt 1
select properties.PropertyID, properties.City, properties.ListingPrice, agents.AgentID, agents.FirstName
from properties
right join agents on properties.AgentID = agents.AgentID;

-- task 2:
select transactions.TransactionID, transactions.SaleDate, transactions.SalePrice, transactions.ClientID, clients.ClientID, clients.FirstName
from transactions
right join clients on transactions.ClientID = clients.ClientID;

-- task 3:
select propertytypes.TypeID, propertytypes.TypeName, properties.PropertyID, properties.City
from propertytypes
right join properties on propertytypes.TypeID = properties.TypeID;

-- tastk 4:
select clients.ClientID, clients.FirstName, transactions.TransactionID, transactions.ClientID, transactions.SaleDate
from clients
right join transactions on  transactions.ClientID =  clients.ClientID;

-- ticket 5
-- task 1:
select agents.FirstName, agents.LastName, properties.Address, properties.City
from agents
cross join properties
order by agents.FirstName;

-- task 2:
select clients.FirstName, clients.LastName, properties.Address, properties.City, properties.ListingDate
from clients
cross join properties order by clients.LastName;

-- tastk 3:
select propertytypes.TypeName, properties.City, properties.State, properties.ListingPrice
from propertytypes
cross join properties order by propertytypes.TypeID;

-- task 4:

select  agents.AgentID, agents.LastName, clients.ClientID, clients.LastName
from agents
cross join clients order by agents.AgentID;