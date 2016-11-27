select facts.id, facts.date, accounts.name as account, accounts.id as account_id, moves.amount, moves.type from moves
inner join accounts on accounts.id = moves.account_id
inner join facts on facts.id = moves.fact_id
