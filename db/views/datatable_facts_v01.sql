select facts.id as id, facts.date, facts.description, m.amount as total, partners.name as partner from facts
inner join (select fact_id, sum(amount) as amount from moves where type = 'Credit' group by fact_id) m on facts.id = m.fact_id
left outer join partners on facts.partner_id = partners.id
