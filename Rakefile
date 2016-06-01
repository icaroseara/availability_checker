require 'sequel'

namespace :db do
  desc "Run sequel migrations"
  task :migrate do
    Sequel.extension :migration
    db_path = Pathname.new(File.expand_path("../db/", __FILE__))

    db = Sequel.sqlite
    db.extension :schema_dumper

    Sequel::Migrator.run(db, db_path.join("migrations"))

    File.open(db_path.join("schema.rb"), "w") do |f|
      f.write(db.dump_schema_migration)
    end
  end
end
