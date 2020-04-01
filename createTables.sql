USE bachel_er;

CREATE TABLE Company( 
company_id INTEGER,
name CHAR(30),
PRIMARY KEY (company_id) 
);

CREATE TABLE TVShow( 
title CHAR(20), 
season INTEGER, 
rating INTEGER,
PRIMARY KEY (title, season) 
);

CREATE TABLE CompanyProducesShow( 
company_id INTEGER, 
title CHAR(20), 
season INTEGER,
PRIMARY KEY (company_id, title, season),
FOREIGN KEY (company_id) 
REFERENCES Company(company_id) 
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (title, season) 
REFERENCES TVShow(title, season)
ON UPDATE CASCADE 
ON DELETE CASCADE 
);

CREATE TABLE EpisodeAired(
title CHAR(20), 
season INTEGER,
episode_number INTEGER, 
air_date DATE, 
viewership INTEGER, 
rating FLOAT, 
PRIMARY KEY (title, season, episode_number),
FOREIGN KEY (title, season) 
REFERENCES TVShow(title, season)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE Activity( 
activity_type CHAR(20), 
air_date DATE,
PRIMARY KEY (activity_type, air_date)
);

CREATE TABLE ActivityShownInEpisode( 
activity_type CHAR(20),
air_date DATE,
title CHAR(20) NOT NULL,
season INTEGER NOT NULL,
episode_number INTEGER NOT NULL,
PRIMARY KEY (title, season, episode_number, air_date, activity_type),
FOREIGN KEY (activity_type, air_date) 
REFERENCES Activity(activity_type, air_date)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (title, season, episode_number) 
REFERENCES EpisodeAired(title, season, episode_number)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE Rose( 
rose_type CHAR(20) DEFAULT 'ceremony',
rose_number INTEGER,
PRIMARY KEY (rose_type, rose_number)
);

## likely won't use??
CREATE TABLE RoseDuringEvent(
rose_type CHAR(20),
rose_number INTEGER,
activity_type CHAR(20),
PRIMARY KEY (rose_type, rose_number, activity_type),
FOREIGN KEY (rose_type, rose_number) 
REFERENCES Rose(rose_type, rose_number)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (activity_type) 
REFERENCES Activity(activity_type)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE RoseOnActivity( 
rose_type CHAR(20),
rose_number INTEGER,
activity_type CHAR(20), 
air_date DATE,
PRIMARY KEY (rose_number, air_date),
FOREIGN KEY (rose_type, rose_number) 
REFERENCES Rose(rose_type, rose_number)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (activity_type, air_date) 
REFERENCES Activity(activity_type, air_date)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE CastMember( 
cast_id INT NOT NULL AUTO_INCREMENT,
name CHAR(20), 
age INTEGER, 
hometown CHAR(20), 
occupation CHAR(50),
PRIMARY KEY (cast_id)
);

CREATE TABLE RoseTypeNumber( 
rose_type CHAR(20),
rose_number INTEGER,
PRIMARY KEY (rose_type, rose_number),
FOREIGN KEY (rose_type, rose_number) 
REFERENCES Rose(rose_type, rose_number)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE CastGivesRoseNumber( 
giver_id INTEGER,
receiver_id INTEGER,
rose_type CHAR(20),
rose_number INTEGER,
PRIMARY KEY (giver_id, receiver_id, rose_number),
FOREIGN KEY (giver_id) 
REFERENCES CastMember(cast_id)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (receiver_id) 
REFERENCES CastMember(cast_id)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (rose_type, rose_number) 
REFERENCES Rose(rose_type, rose_number)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE Relationship( 
status CHAR(20),
PRIMARY KEY (status)
);

CREATE TABLE CastInRelationship( 
member1_id INTEGER, 
member2_id INTEGER, 
status CHAR(20),
PRIMARY KEY (member1_id, member2_id, status),
FOREIGN KEY (member1_id) 
REFERENCES CastMember (cast_id)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (member2_id) 
REFERENCES CastMember (cast_id)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (status) 
REFERENCES Relationship(status)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE Instagram(
username CHAR(20), 
followers INTEGER,
PRIMARY KEY (username)
);

CREATE TABLE CastHasInstaAccount( 
cast_id INTEGER,
username CHAR(20),
PRIMARY KEY (cast_id, username),
FOREIGN KEY (cast_id) 
REFERENCES CastMember (cast_id)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (username) 
REFERENCES Instagram(username) 
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE CastAppearsInShow(
cast_id INTEGER, 
title CHAR(20) NOT NULL, 
season INTEGER NOT NULL,
role CHAR(20),
PRIMARY KEY (cast_id, title, season),
FOREIGN KEY (cast_id) 
REFERENCES CastMember (cast_id)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (title, season) 
REFERENCES TVShow(title, season)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE CastParticipatesInActivity( 
cast_id INTEGER, 
activity_type CHAR(20), 
air_date DATE, 
eliminated BOOLEAN,
PRIMARY KEY (cast_id, activity_type, air_date),
FOREIGN KEY (cast_id) 
REFERENCES CastMember (cast_id)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (activity_type, air_date) 
REFERENCES Activity(activity_type, air_date)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE LeadFormerlyContestantOfShow(
lead_id INTEGER, 
title CHAR(20), 
season INTEGER, 
placement INTEGER,
PRIMARY KEY (lead_id, title, season),
FOREIGN KEY (lead_id) 
REFERENCES CastMember (cast_id)
ON UPDATE CASCADE 
ON DELETE CASCADE,
FOREIGN KEY (title, season) 
REFERENCES TVShow(title, season)
ON UPDATE CASCADE 
ON DELETE CASCADE
);

CREATE TABLE ContestantDates( 
contestant_id INTEGER, 
lead_id INTEGER,
PRIMARY KEY (contestant_id),
FOREIGN KEY (lead_id) 
REFERENCES CastMember (cast_id)
ON UPDATE CASCADE 
ON DELETE CASCADE
);


