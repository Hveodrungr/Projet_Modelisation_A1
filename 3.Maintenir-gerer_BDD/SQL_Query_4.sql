SELECT vente.ID_Province, COUNT(vente.ID_Vente) as `Vente total`, Moyenne.`Moyenne vente`, (COUNT(vente.ID_Vente) / Moyenne.`Moyenne vente`) as `Vente Total/Moyenne des ventes `

FROM vente,
(SELECT (COUNT(venteProvince.ID_Vente) / count(DISTINCT(venteProvince.ID_Province))) as `Moyenne vente`
FROM vente as venteProvince) as Moyenne
GROUP BY vente.ID_Province;