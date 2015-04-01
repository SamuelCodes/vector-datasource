DO $$
BEGIN

--------------------------------------------------------------------------------
-- planet_osm_line
--------------------------------------------------------------------------------

-- indexes on existing columns
PERFORM mz_create_partial_index_if_not_exists('planet_osm_line_mz_road_level_index', 'planet_osm_line', 'mz_road_level', 'mz_road_level IS NOT NULL');
PERFORM mz_create_partial_index_if_not_exists('planet_osm_line_waterway', 'planet_osm_line', 'waterway', 'waterway IS NOT NULL');

-- indexes on functions
CREATE INDEX planet_osm_line_road_level_index ON planet_osm_line(mz_calculate_road_level(highway, railway, aeroway)) WHERE mz_calculate_road_level(highway, railway, aeroway) IS NOT NULL;

END $$;
