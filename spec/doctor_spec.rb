require('rspec')
require('doctor')
require('pg')

DB = PG.connect({:dbname => "doctors_office_test"})

# binding.pry

describe('Doctor') do
  describe('#initialize') do
    it('instantiates a doctor object') do
      expect(Doctor.new({:name => 'John Smith', :specialty => 'cardiologist'}).class).to eq(Doctor)
    end
  end

  describe('#save') do
    it('saves a doctor with name and specialty in the database') do
      doc = Doctor.new({:name => 'Tim Ber', :specialty => 'cardiologist'})
      doc.save()
      result = DB.exec("SELECT id, name FROM doctors WHERE id = #{doc.id};")
      expect(result.getvalue(0,0).to_i).to eq(doc.id)
      expect(result.getvalue(0,1)).to eq(doc.name)
      puts result.getvalue(0, 1)
      puts result.first().fetch("name")

    end
  end




end
