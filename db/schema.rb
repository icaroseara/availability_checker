Sequel.migration do
  change do
    create_table(:availabilities) do
      Integer :year
      Integer :month
      String :days, :size=>255
    end
    
    create_table(:schema_info) do
      Integer :version, :default=>0, :null=>false
    end
  end
end
