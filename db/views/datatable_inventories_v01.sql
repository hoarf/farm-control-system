select inventories.id as id, inventories.item, inventories.unit as unit, coalesce(ci.total - co.total, 0) as total from inventories
left outer join (select inventory_id, sum(amount) as total from entries where type = 'Checkin' group by inventory_id) ci on ci.inventory_id = id
left outer join (select inventory_id, sum(amount) as total from entries where type = 'Checkout' group by inventory_id) co on co.inventory_id = id
