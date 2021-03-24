\c postgres
DROP DATABASE aoc_day07;
CREATE DATABASE aoc_day07;
\c aoc_day07;

CREATE TABLE bag (
  bag_id serial PRIMARY KEY,
  bag_name varchar(40) NOT NULL CHECK (bag_name <> ''),
  UNIQUE(bag_name)
);

CREATE TABLE bag_relationship (
  bag_id integer,
  quantity integer NOT NULL,
  related_bag_id integer,
  CONSTRAINT fk_bag_id FOREIGN KEY (bag_id) REFERENCES bag (bag_id),
  CONSTRAINT fk_related_bag_id FOREIGN KEY (related_bag_id) REFERENCES bag (bag_id)
);
