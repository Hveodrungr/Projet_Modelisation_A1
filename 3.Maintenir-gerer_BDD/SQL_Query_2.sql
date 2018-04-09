SELECT objet.O_Objet AS "Objet" , (avg(Vente.V_Oo) * Oo.M_Value + avg(Vente.V_Oa) * Oa.M_Value + avg(Vente.V_Of) * Of.M_Value ) AS `Oberon de cuivre`
FROM Vente
LEFT JOIN objet ON Vente.ID_Objet = objet.ID_objet
LEFT JOIN monnaie Oo ON Oo.M_ID = "Oo" 
LEFT JOIN monnaie Oa ON Oa.M_ID = "Oa" 
LEFT JOIN monnaie Of ON Of.M_ID = "Of"
GROUP BY objet.O_Objet;