Create view ItemFarmSummary as
Select locations.Name as 'Location', enemies.name as "Enemy", BaseHp as 'Health', BaseSouls as 'Souls', items.Name ,quantity as "Quantity", dropRate as 'Drop rate'
from 
locations join spawns on locations.LocationId = spawns.LocationId join enemies on spawns.EnemyId = enemies.EnemyId join drops on enemies.EnemyId = drops.EnemyId 
join items on drops.itemId = items.itemId;