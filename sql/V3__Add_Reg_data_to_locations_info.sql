INSERT INTO locations_info (region_name, area_name, territory_name, territory_type)
    SELECT DISTINCT REGNAME, AREANAME, TERNAME, TerTypeName FROM zno_data;
