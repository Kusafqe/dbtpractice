{{
    codegen.generate_source(
        schema_name = 'google_sheets',
        database_name = 'ALUMNO3_DEV_BRONZE_DB',
        table_names = ['BUDGET' ],
        generate_columns = True,
        include_descriptions=True,
        include_data_types=True,
        name='desarrollo',
        include_database=True,
        include_schema=True
        )
}}