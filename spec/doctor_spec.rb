require('spec_helper')


describe('Doctor') do
  describe('#initialize') do
    
    it('instantiates a doctor object') do
      expect(Doctor.new({:name => 'John Smith', :specialty => 'cardiologist'}).class).to eq(Doctor)
    end

    it('assigns the id returned from the database as the doctor object') do
      doc = Doctor.new({:name => 'Bob Jones', :specialty => 'internal medicine'})
      doc.save()
      result = DB.exec("SELECT id, name FROM doctors WHERE id = #{doc.id};")
      expect(result.getvalue(0,0).to_i).to eq(doc.id)
    end
  end

  describe('#save') do
    it('saves a doctor with name and specialty in the database') do
      doc = Doctor.new({:name => 'Tim Ber', :specialty => 'cardiologist'})
      doc.save()
      result = DB.exec("SELECT id, name FROM doctors WHERE id = #{doc.id};")
      expect(result.getvalue(0,1)).to eq(doc.name)
    end

    describe('#specialty') do
      it("returns the doctor's specialty") do
        expect(Doctor.new({:name => 'Tim Ber', :specialty => 'cardiologist'}).specialty).to eq('cardiologist')
      end
    end

    describe('#name') do
      it("returns the doctor's name") do
        expect(Doctor.new({:name => 'Tim Ber', :specialty => 'cardiologist'}).name).to eq('Tim Ber')\
      end
    end
  end




end
