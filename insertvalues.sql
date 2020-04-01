INSERT INTO TVShow VALUES ('The Bachelor', 1, 98), ('The Bachelor', 2, 86), ('The Bachelorette', 1, 99), 
							('The Bachelorette', 2, 98), ('Bachelor in Paradise', 1, 80), 
							('The Bachelorette', 10, 90), ('The Bachelorette', 11, 92), ('The Bachelor', 20, 70);
                            
INSERT INTO Company VALUES (1, 'ABC'), (2, 'CBS'), (3, 'NBC'), (4, 'YTV'), (5, 'FOX');

INSERT INTO CompanyProducesShow VALUES (1, 'The Bachelor', 1), (1, 'The Bachelor', 2), (1, 'The Bachelorette', 1), (2, 'The Bachelorette', 2), (1, 'Bachelor in Paradise', 1);

INSERT INTO EpisodeAired VALUES ('The Bachelor', 1, 1, '2002-03-25', 10, 4.0), ('The Bachelor', 1, 2, '2002-04-01', 10, 4.4), ('The Bachelor', 1, 3, '2002-04-08', 9, 4.2), ('The Bachelor', 1, 4, '2002-04-15', 11, 4.6), 
								('The Bachelor', 1, 5, '2002-04-22', 13, 5.7);

INSERT INTO Activity VALUES ('limo arrivals', '2002-03-25'), ('rose ceremony', '2002-03-25'), ('group date', '2002-04-01'), 
											('rose ceremony', '2002-04-01'), ('one-on-one', '2002-04-08');

INSERT INTO ActivityShownInEpisode  VALUES ('limo arrivals', '2002-03-25', 'The Bachelor', 1, 1), ('rose ceremony', '2002-03-25', 'The Bachelor', 1, 1), 
								('group date', '2002-04-01', 'The Bachelor', 1, 2), ('rose ceremony', '2002-04-01', 'The Bachelor', 1, 2), ('one-on-one', '2002-04-08', 'The Bachelor', 1, 3);
                                
INSERT INTO Rose VALUES ('ceremony', 1), ('ceremony', 2), ('ceremony', 3), ('ceremony', 4), ('ceremony', 5), ('last rose', 6), ('ceremony', 44), ('final rose', 30), ('last rose', 90), ('one-on-one', 32), ('two-on-one', 100);

INSERT INTO RoseDuringEvent VALUES ('ceremony', 1, 'rose ceremony'), ('ceremony', 2, 'rose ceremony'), ('ceremony', 3, 'rose ceremony'), ('ceremony', 4, 'rose ceremony'), ('last rose', 6, 'rose ceremony');

INSERT INTO RoseOnActivity  VALUES ('ceremony', 1, 'rose ceremony', '2002-03-25'), ('ceremony' ,2, 'rose ceremony','2002-03-25'), ('ceremony' ,3, 'rose ceremony', '2002-03-25'), ('ceremony' ,4 ,'rose ceremony', '2002-03-25'), ('ceremony',5, 'rose ceremony', '2002-03-25'); 

INSERT INTO CastMember (name, age, hometown, occupation) VALUES ('Alex Michel', 31, 'Charlottesville, VA', 'Management Consultant'), 
('Amanda Marsh', 23, 'Chanute, KS', 'Event Planner'), ('Trista Rehn', 29, 'Miami, FL', 'Miami Heat Dancer' ), 
('Shannon Oliver', 24, 'Dallas, TX', 'Financial Management Consultant'), ('Kim', 24, 'Tempe, AZ', 'Nanny'), ('Ashley Iaconetti', 26, 'Great Falls, VA', 'Journalist'), 
('Jared Haibon', 26, 'Warwick, RI', 'Restaurant Manager'), ('Nick Viall', 33, 'Waukesha, WI','Software Sales Executive'), ('Corinne Olympios', 24, 'Miami, FL', 'Business Owner'), 
('JoJo Fletcher', 24, 'Dallas, TX', 'Real Estate Developer'), ('Hannah Brown', 24, 'Tuscaloosa, AL', 'Miss Alabama 2018'), ('Colton Underwood', 24, 'Washington, IL', 'Former Pro Football Player'); 

INSERT INTO CastGivesRoseNumber VALUES (1, 2,'ceremony' ,1), (1, 3,'ceremony', 2), (1, 4,'ceremony', 3), (1, 5,'ceremony', 4), (1, 2,'ceremony', 5);

INSERT INTO Relationship VALUES ('married'), ('engaged'), ('dating'), ('broken up'), ('divorced'), ('broken engagement');

INSERT INTO CastInRelationship VALUES  (1,3, 'broken up'), (1,4, 'broken up'), (1, 5, 'broken up'), (6, 7, 'married');

INSERT INTO CastInRelationship VALUES (1, 2, 'broken engagement');

INSERT INTO Instagram VALUES ('ashley_iaconetti', 1100000), ('jaredhaibon', 713000), ('nickviall', 1100000), ('colympios', 707000), ('joelle_fletcher', 2200000);

INSERT INTO CastHasInstaAccount  VALUES (6, 'ashley_iaconetti'), (7, 'jaredhaibon'), (8, 'nickviall'), (9, 'colympios'), (10, 'joelle_fletcher');

INSERT INTO CastAppearsInShow VALUES (1, 'The Bachelor', 1, 'lead'), (2, 'The Bachelor', 1, 'contestant'), (3, 'The Bachelor', 1,'contestant'), (4, 'The Bachelor', 1, 'contestant'), (5, 'The Bachelor', 1, 'contestant');

INSERT INTO CastParticipatesInActivity VALUES (1, 'limo arrivals', '2002-03-25', false), (2, 'limo arrivals', '2002-03-25', false), (3, 'limo arrivals', '2002-03-25', false), (4, 'limo arrivals', '2002-03-25', false), (5, 'limo arrivals', '2002-03-25', false);


INSERT INTO TVShow VALUES ('The Bachelor', 23, 98), ('The Bachelorette', 14, 92);

INSERT INTO LeadFormerlyContestantOfShow VALUES (8, 'The Bachelorette', 10, 2), (8, 'The Bachelorette', 11, 2), (10, 'The Bachelor', 20, 2), (11, 'The Bachelor', 23, 7), (12, 'The Bachelorette', 14, 4);

INSERT INTO ContestantDates  VALUES (2,1), (3,1), (4,1), (5,1), (9, 8);

