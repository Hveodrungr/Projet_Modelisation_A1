SELECT vente.ID_Province, lieu.P_enGuerre,

-- Vente total de la province 
COUNT(vente.ID_Vente) as `Vente total`,

-- Vente d'une province en temps de guerre
COUNT(CASE WHEN LOCATE(vente.V_Annee, lieu.P_enGuerre) != 0 THEN 1 ELSE NULL END) as `Vente en guerre`,

-- Vente d'une province en temps de paix
COUNT(CASE WHEN LOCATE(vente.V_Annee, lieu.P_enGuerre) = 0 or ISNULL(lieu.P_enGuerre) = 1 THEN 1 ELSE NULL END) as `Vente hors guerre`,

-- ELSE -1 au denominateur permet d'éviter la division 0/0
-- Vente d'une province en temps de guerre en fonction du nombre d'années en guerre
( COUNT(CASE WHEN LOCATE(vente.V_Annee, lieu.P_enGuerre) != 0 THEN 1 ELSE NULL END) / ( CASE WHEN  ISNULL(lieu.P_enGuerre) = 0 THEN ROUND( ( LENGTH(lieu.P_enGuerre) - LENGTH( REPLACE ( lieu.P_enGuerre, ";", "") ) ) / LENGTH(";") ) ELSE -1 END) ) AS `Ratio Vente en guerre-Années en guerre`,

-- ELSE -1 au denominateur permet d'éviter la division 0/0
-- Vente d'une province en temps de paix en fonction du nombre d'années en paix
( COUNT(CASE WHEN LOCATE(vente.V_Annee, lieu.P_enGuerre) = 0 or ISNULL(lieu.P_enGuerre) = 1 THEN 1 ELSE NULL END) / ( COUNT(DISTINCT(vente.V_Annee)) - ( CASE WHEN  ISNULL(lieu.P_enGuerre) = 0 THEN ROUND( ( LENGTH(lieu.P_enGuerre) - LENGTH( REPLACE ( lieu.P_enGuerre, ";", "") ) ) / LENGTH(";") ) ELSE -1 END) ) )  as `Ratio Vente hors guerre-Années en paix`

FROM vente
INNER JOIN lieu ON lieu.ID_Province = vente.ID_Province
GROUP BY vente.ID_Province;