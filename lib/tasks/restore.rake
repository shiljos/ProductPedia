namespace :db do
  task import: :environment do
    import_path = "~/backups"
    sql_file = "PostgreSQL.sql"
    # za sada, sami raspakujte ovaj fajl
    database_config = Rails.configuration.database_configuration[Rails.env]

    # Unpack
    # system "tar xf ides_backup.tar -C #{import_path}"
    # system "gzip -df #{import_path}/#{sql_file}.gz"

    # Import
    system "psql --username=#{database_config['username']} -h localhost #{database_config['database']} < #{import_path}/#{sql_file}"
  end
end