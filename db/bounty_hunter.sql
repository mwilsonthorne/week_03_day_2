DROP TABLE bountys;

CREATE TABLE bountys (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
species VARCHAR(255),
bounty_value INT,
homeworld VARCHAR(255)

)
;
