SELECT MAX(vente.V_Oo * Oo.M_Value + Vente.V_Oa * Oa.M_Value + Vente.V_Of * Of.M_Value ) as `Oberon de cuivre`, TeamArtisan.`Artisan(s)`, mois.ID_Divinite
FROM vente
LEFT JOIN creer ON vente.ID_Vente = creer.ID_Vente
LEFT JOIN monnaie Oo ON Oo.M_ID = "Oo"
LEFT JOIN monnaie Oa ON Oa.M_ID = "Oa"
LEFT JOIN monnaie Of ON Of.M_ID = "Of"
INNER JOIN mois ON vente.V_Mois = mois.V_Mois
INNER JOIN (    SELECT pointVente.ID_Vente as IDvente, CONCAT(MIN(creator.ID_Artisan), (CASE WHEN MAX(creator.ID_Artisan) = MIN(creator.ID_Artisan) THEN " " ELSE CONCAT( " & ", MAX(creator.ID_Artisan)) END)) as `Artisan(s)`
    FROM vente pointVente
    INNER JOIN creer creator ON creator.ID_Vente = pointVente.ID_Vente
    GROUP BY pointVente.ID_Vente) TeamArtisan ON TeamArtisan.IDvente = vente.ID_Vente
GROUP BY TeamArtisan.`Artisan(s)