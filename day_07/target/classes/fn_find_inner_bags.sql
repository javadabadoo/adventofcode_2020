\c aoc_day07;

DROP FUNCTION fn_find_inner_bags;
CREATE OR REPLACE FUNCTION fn_find_inner_bags(_bag_name varchar(40))
  RETURNS SETOF type_realted_bag AS
$$
    DECLARE
    BEGIN
        RETURN QUERY
            SELECT
                bag.bag_id,
                bag.bag_name,
                bag_relationship.quantity
            FROM
                bag
            INNER JOIN
                bag_relationship ON bag.bag_id = bag_relationship.related_bag_id
            WHERE
                bag_relationship.bag_id=(SELECT bag_id FROM bag b WHERE b.bag_name = _bag_name);
    END
$$
  LANGUAGE 'plpgsql' VOLATILE;
