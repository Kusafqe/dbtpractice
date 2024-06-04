{{
    codegen.generate_source(
        schema_name = 'DBT_CGAMEZ',
        database_name = 'ALUMNO3_DEV_SILVER_DB',
        table_names = ['dim_date' ],
        generate_columns = True,
        include_descriptions=True,
        include_data_types=True,
        name='desarrollo',
        include_database=True,
        include_schema=True
        )
}}