\c aoc_day07;

DROP FUNCTION fn_find_all_outer_bags;
CREATE OR REPLACE FUNCTION fn_find_all_outer_bags(_bag_name varchar(40))
  RETURNS SETOF type_realted_bag AS
$$
    DECLARE
        bags type_realted_bag%rowtype;
    BEGIN
--        FOR bags IN
--            SELECT * FROM fn_find_outer_bags(_bag_name)
--        LOOP
--            raise notice '_bag_name: %', _bag_name;
--            RETURN QUERY SELECT * FROM fn_find_all_outer_bags(bags.bag_name);
--        end loop;

    RETURN QUERY WITH RECURSIVE recursive_bag AS (
        SELECT * FROM fn_find_outer_bags('posh tan')
        UNION
        SELECT outer_bag.* FROM recursive_bag b
        INNER JOIN fn_find_all_outer_bags(b.bag_name) outer_bag ON TRUE
    )
    SELECT DISTINCT bag_id, bag_name, quantity FROM recursive_bag;

        --RETURN;
    END
$$
LANGUAGE 'plpgsql' VOLATILE;
