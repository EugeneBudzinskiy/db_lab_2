-- registration data
ALTER TABLE zno_data
    DROP COLUMN regname,
    DROP COLUMN areaname,
    DROP COLUMN tername,
    DROP COLUMN tertypename;


-- eo
ALTER TABLE zno_data
    DROP COLUMN eoname,
    DROP COLUMN eotypename,
    DROP COLUMN eoparent,
    DROP COLUMN eoregname,
    DROP COLUMN eoareaname,
    DROP COLUMN eotername;


-- ukr
ALTER TABLE zno_data
    DROP COLUMN ukrptname,
    DROP COLUMN ukrptregname,
    DROP COLUMN ukrptareaname,
    DROP COLUMN ukrpttername;


-- hist
ALTER TABLE zno_data
    DROP COLUMN histptname,
    DROP COLUMN histptregname,
    DROP COLUMN histptareaname,
    DROP COLUMN histpttername;


-- math
ALTER TABLE zno_data
    DROP COLUMN mathptname,
    DROP COLUMN mathptregname,
    DROP COLUMN mathptareaname,
    DROP COLUMN mathpttername;


-- phys
ALTER TABLE zno_data
    DROP COLUMN physptname,
    DROP COLUMN physptregname,
    DROP COLUMN physptareaname,
    DROP COLUMN physpttername;


-- chem
ALTER TABLE zno_data
    DROP COLUMN chemptname,
    DROP COLUMN chemptregname,
    DROP COLUMN chemptareaname,
    DROP COLUMN chempttername;


-- bio
ALTER TABLE zno_data
    DROP COLUMN bioptname,
    DROP COLUMN bioptregname,
    DROP COLUMN bioptareaname,
    DROP COLUMN biopttername;


-- geo
ALTER TABLE zno_data
    DROP COLUMN geoptname,
    DROP COLUMN geoptregname,
    DROP COLUMN geoptareaname,
    DROP COLUMN geopttername;


-- eng
ALTER TABLE zno_data
    DROP COLUMN engptname,
    DROP COLUMN engptregname,
    DROP COLUMN engptareaname,
    DROP COLUMN engpttername;


-- fra
ALTER TABLE zno_data
    DROP COLUMN fraptname,
    DROP COLUMN fraptregname,
    DROP COLUMN fraptareaname,
    DROP COLUMN frapttername;


-- deu
ALTER TABLE zno_data
    DROP COLUMN deuptname,
    DROP COLUMN deuptregname,
    DROP COLUMN deuptareaname,
    DROP COLUMN deupttername;


-- spa
ALTER TABLE zno_data
    DROP COLUMN spaptname,
    DROP COLUMN spaptregname,
    DROP COLUMN spaptareaname,
    DROP COLUMN spapttername;
