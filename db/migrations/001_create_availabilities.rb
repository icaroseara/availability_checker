Sequel.migration do
  change do
    create_table(:availabilities) do
      Fixnum :year
      Fixnum :month
      String :days
    end
  end
end
