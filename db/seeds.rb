# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# instruments seed
instruments = [
  "Soprano Cornet", 
  "Solo Cornet 1", "Solo Cornet 2", "Solo Cornet 3", "Solo Cornet 4", 
  "2nd Cornet", "3rd Cornet", "Repiano Cornet",
  "Flugelhorn", "Solo Horn", "1st Horn", "2nd Horn", 
  "1st Baritone", "2nd Baritone", 
  "1st Trombone", "2nd Trombone", "Bass Trombone", 
  "1st Euphonium", "2nd Euphonium", "Euphonium", 
  "Eb Bass", "Bb Bass", 
  "Percussion 1", "Percussion 2", "Percussion 3", "Percussion 4"]
instruments.each do |name|
  inst = Instrument.find_by_name(name)
  if inst.nil?
    Instrument.create(:name => name)
  end
end
