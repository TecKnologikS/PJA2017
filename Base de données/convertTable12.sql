// A PARTIR DE LA TABLE 12, on créer les articles

INSERT INTO `article`(`ref`, `name`, `smallDesc`, `about`, `image`, `categorie`, `tags`, `prix`)
SELECT t.`REFERENCE`, t.`LIBELLE court`, t.`LIBELLE long`, '', '', c.id , '', t.`PV UNITAIRE (HT)` FROM `TABLE 12` t INNER JOIN categorie c ON c.name = t.`Code Fam`  WHERE 1


// CREER ENSUITE LES DETAILS D ARTICLES
INSERT INTO `article_details`(`ID_Article`, `W`, `K`, `Lm`, `LmW`, `F`, `V`, `IRC`, `H`, `Longueur`, `Largeur`, `Profondeur`, `Poids`, `Min`, `Max`, `DEEE`)
SELECT a.id, t.`PUISSANCE (W)`, t.`TEMPERATURE (K)`, t.`LUMINOSITE (Lm)`, t.`RATIO (Lm/W)`, t.`FAISCEAU (-°)`, t.`TENSION (V)`, t.`IRC`, t.`DUREE DE VIE (H)`, t.`Longueur`, t.`Largeur`, t.`Profondeur`, t.`Poids (g)`, t.`Minimum`, t.`Maximum`, t.`DEEE (HT) INCLUSE` FROM `TABLE 12` t INNER JOIN article a ON a.ref = t.`REFERENCE`
