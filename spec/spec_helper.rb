require('rspec')
require('doctor')
require('patient')
require('pg')

DB = PG.connect({:dbname => 'doctors_office_test'})
