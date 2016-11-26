SELECT parents.id as id, parents.name AS name, parents.description, parents.type, COALESCE(debits.valor,0) - COALESCE(credits.valor,0) AS valor FROM accounts parents
LEFT OUTER JOIN accounts childrens ON childrens.parent_id = parents.id
LEFT OUTER JOIN (SELECT account_id, COALESCE(sum(amount), 0) AS valor FROM moves WHERE type = 'Credit' GROUP BY account_id) credits ON credits.account_id = parents.id
LEFT OUTER JOIN (SELECT account_id, COALESCE(sum(amount), 0) AS valor FROM moves WHERE type = 'Debit' GROUP BY account_id) debits ON debits.account_id = parents.id
WHERE parents.type = 'Debtor' AND childrens.parent_id IS NULL

UNION

SELECT parents.id as id, parents.name AS name, parents.description, parents.type, COALESCE(credits.valor,0) - COALESCE(debits.valor,0) AS valor FROM accounts parents
LEFT OUTER JOIN accounts childrens ON childrens.parent_id = parents.id
LEFT OUTER JOIN (SELECT account_id, COALESCE(sum(amount), 0) AS valor FROM moves WHERE type = 'Credit' GROUP BY account_id) credits ON credits.account_id = parents.id
LEFT OUTER JOIN (SELECT account_id, COALESCE(sum(amount), 0) AS valor FROM moves WHERE type = 'Debit' GROUP BY account_id) debits ON debits.account_id = parents.id
WHERE parents.type = 'Creditor' AND childrens.parent_id IS NULL
