-- Daniel Marabito
select title as "Album", artist as "Musical Genious", unit_price as "Price" -- selecting the columns and assigning them aliases. For example title gets the alias "album"
from items -- indicating what table to select from.
where unit_price > 15 and unit_price < 18 -- setting the range of prices to 15-18 not including end points. >= and <= would be substituted if I wanted to include end points.
order by unit_price, artist asc; -- sorting it by unit price and then artist in ascending order. asc means ascending.
