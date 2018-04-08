SELECT vente.ID_Vente,
CONCAT (V_Jour, ' ',V_mois, ' de l\'an ', V_Annee) AS Date, 
objet.O_Objet AS Objet, 
pouvoir.ID_Pouvoir AS Pouvoir,
CONCAT(MIN(detenir.ID_decoration), (CASE WHEN MAX(detenir.ID_decoration) = MIN(detenir.ID_decoration) THEN " " ELSE CONCAT( " & ", MAX(detenir.ID_decoration)) END)) as `Décoration(s)`,
vente.V_Oo AS `Oberon d'or`, 
vente.V_Oa AS `Oberon d'argent`, 
vente.V_Of AS `Oberon de fer`,
(vente.V_Oo * Oo.M_Value + Vente.V_Oa * Oa.M_Value + Vente.V_Of * Of.M_Value ) as `Oberon de cuivre`,
CONCAT(MIN(creer.ID_Artisan), (CASE WHEN MAX(creer.ID_Artisan) = MIN(creer.ID_Artisan) THEN " " ELSE CONCAT( " & ", MAX(creer.ID_Artisan)) END)) as `Artisan(s)`,
lieu.ID_Province AS `Dans la province de`,
ville.ID_Cite AS `Pour la ville de`,
vente.V_Quantite AS Quantité
FROM vente

LEFT JOIN objet ON vente.ID_Objet = objet.ID_Objet
LEFT JOIN pouvoir ON vente.ID_Pouvoir = pouvoir.ID_Pouvoir
LEFT JOIN detenir ON vente.ID_Vente = detenir.ID_Vente
LEFT JOIN creer ON vente.ID_Vente = creer.ID_Vente
LEFT JOIN lieu ON vente.ID_Province = lieu.ID_Province
LEFT JOIN ville ON vente.ID_Cite = ville.ID_Cite
LEFT JOIN monnaie Oo ON Oo.M_ID = "Oo"
LEFT JOIN monnaie Oa ON Oa.M_ID = "Oa"
LEFT JOIN monnaie Of ON Of.M_ID = "Of"

-- WHERE vente.ID_Vente < chooseValue 
-- WHERE lieu.ID_Province = 'chooseText'
-- WHERE vente.V_Quantite = chooseValue
-- WHERE objet.O_Objet = 'chooseText'
-- WHERE (vente.V_Oo * Oo.M_Value + Vente.V_Oa * Oa.M_Value + Vente.V_Of * Of.M_Value ) < chooseValue

GROUP BY vente.ID_Vente

-- ORDER BY vente.V_Annee
-- ORDER BY vente.ID_Province
-- ORDER BY vente.V_Quantite
-- ORDER BY `Oberon de cuivre`