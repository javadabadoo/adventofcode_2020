\c aoc_day07;

DROP TYPE type_bag;
CREATE TYPE type_bag AS (
	bag_id integer,
	bag_name varchar(40)
);

DROP TYPE type_bag_relationship;
CREATE TYPE type_bag_relationship AS (
  bag_id integer,
  quantity integer,
  related_bag_id integer
);

DROP TYPE type_realted_bag;
CREATE TYPE type_realted_bag AS (
  bag_id integer,
  bag_name varchar(40),
  quantity integer
);
