require 'pry'
require 'sequel'
require 'sequel/extensions/migration'

require_relative "../lib/availability"

module DbSetup
  def db
    @db ||= create_db("db/schema.rb")
  end

  private

  def create_db(schema_location)
    Sequel.sqlite.tap do |db|
      eval(
        File.read(File.expand_path("../../#{schema_location}", __FILE__)))
        .apply(db, :up)
    end
  end
end

RSpec.configure do |config|
  config.include DbSetup
end
