require('rspec')
require('doctor')
require('patient')
require('pg')

puts "in spec_helper.rb"

DB = PG.connect({:dbname => 'doctors_office_test'})

binding.pry
