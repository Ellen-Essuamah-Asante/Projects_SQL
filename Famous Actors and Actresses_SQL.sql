CREATE TABLE celebs (id INTEGER PRIMARY KEY, f_name TEXT, l_name TEXT, age INTEGER, occupation TEXT, hobby TEXT);
#inserting values
INSERT INTO celebs VALUES (1, "Jocelyn", "Dumas", 44, "Actress", "Cooking");
INSERT INTO celebs VALUES (2, "Yvonne", "Nelson", 38, "Actress", "Fishing");
INSERT INTO celebs VALUES (3, "John", "Dumelo", 40, "Actor", "Politics");
INSERT INTO celebs VALUES (4, "Majid", "Michelle", 42, "Actor", "Baking");
INSERT INTO celebs VALUES (5, "Selena", "Gomez", 29, "Artist", "Golf");
INSERT INTO celebs VALUES (6, "David", "Okoro", 31, "Host", "swimming");
INSERT INTO celebs VALUES (7, "Osas", "Igodaro", 36, "Actress", "cooking");
INSERT INTO celebs VALUES (8, "Napoleon", "Ogwuchu", 19, "Artist", "swimming");
INSERT INTO celebs VALUES (9, "Davido", "Adekele", 32, "Artist", "Dancing");
INSERT INTO celebs VALUES (10, "Kiekie", "Ogwu", 25, "Host", "cooking");

#Querying the Data
SELECT * FROM celebs;
SELECT occupation, SUM(age) AS "Total_age" FROM celebs GROUP BY occupation;

#creating more tables
CREATE TABLE Personality (id INTEGER PRIMARY KEY, Gender TEXT, Nationality TEXT, Status TEXT, Residence TEXT);

INSERT INTO Personality VALUES (1,"Female", "Ghanaian", "Single", "Accra");
INSERT INTO Personality VALUES (2,"Female", "Ghanaian", "Single", "Accra");
INSERT INTO Personality VALUES (3,"Male", "Ghanaian", "Married", "Accra");
INSERT INTO Personality VALUES (4,"Male", "Ghanaian", "Married", "Kumasi");
INSERT INTO Personality VALUES (5,"Female", "American", "Single", "Texas");
INSERT INTO Personality VALUES (6,"Male", "Ghanaian", "Married", "Nigeria");
INSERT INTO Personality VALUES (7,"Female", "Nigerian", "Single", "Nigeria");
INSERT INTO Personality VALUES (8,"Male", "Nigerian", "Single", "Nigeria");
INSERT INTO Personality VALUES (9,"Male", "Nigerian", "Single", "Nigeria");
INSERT INTO Personality VALUES (10,"Female", "Nigerian", "Single", "Nigeria");

#creating an occupations table
CREATE TABLE occupation (id INTEGER PRIMARY KEY, personality_id INTEGER, Occupation TEXT, Major_project TEXT);

INSERT INTO occupation VALUES (1, 2, "Actress", "why marry");
INSERT INTO occupation VALUES (2, 5, "Artist", "calm down");
INSERT INTO occupation VALUES (3, 10, "Host", "The housemaids");
INSERT INTO occupation VALUES (4, 7, "Actress", "King of Boys");
INSERT INTO occupation VALUES (5, 9, "Artist", "Unavailable");
INSERT INTO occupation VALUES (6, 8, "Artist", "No level");
INSERT INTO occupation VALUES (7, 6, "Host", "I want to be a Billionaire");
INSERT INTO occupation VALUES (8, 4, "Actor", "Passion");
INSERT INTO occupation VALUES (9, 3, "Actor", "Independence");
INSERT INTO occupation VALUES (10, 1, "Actress", "The dance");

SELECT * FROM celebs;
SELECT * FROM personality;
SELECT * FROM occupation;

#Querying the data
#question: counting the number of celebs who are actresses or Actors
SELECT COUNT(id), occupation FROM celebs WHERE occupation = "Actress" GROUP BY occupation;

SELECT COUNT(id) AS Celeb_count, occupation FROM celebs WHERE occupation = "Actress" OR occupation = "Actor" GROUP BY occupation;

#joining tables
#question: identifying celebs who are single and ghanaians

SELECT 
    celebs.f_name, personality.Status, personality.Nationality
FROM
    celebs
        JOIN
    personality ON celebs.id = personality.id
WHERE
    personality.Status = 'Single'
        AND personality.Nationality = 'Ghanaian';

#multiple join
#question: finding names of celebs,gender and major project

 SELECT celebs.f_name, celebs.l_name, personality.gender, occupation.major_project FROM celebs 
 JOIN personality ON celebs.id = personality.id 
 JOIN occupation ON personality.id = occupation.personality_id 
 ORDER BY f_name;
 