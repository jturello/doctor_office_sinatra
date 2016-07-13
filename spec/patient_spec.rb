require('spec_helper')

describe('Patient') do

  describe('#initialize') do

    it('instantiates a patient object') do
      expect(Patient.new({:name => 'Timmy Tommy', :dob => '1999-01-01'}).class).to eq(Patient)
    end

    it('instatiates a patient object with date of birth') do
      expect(Patient.new({:name => 'Timmy Tommy', :dob => '1999-01-01'}).dob).to eq('1999-01-01')
    end

    it('instatiates a patient object with a name') do
      expect(Patient.new({:name => 'Timmy Tommy', :dob => '1999-01-01'}).name).to eq('Timmy Tommy')
    end
  end

  describe('#save') do

    it('saves a Patient with name in the database') do
      patient = Patient.new({:name => 'Johny Jones', :dob => '1989-12-15'})
      patient.save()
      result = DB.exec("SELECT name FROM patients WHERE id = #{patient.id};")
      expect(result.getvalue(0,0)).to eq(patient.name)
    end

    it('saves a Patient with dob to the database') do
      patient = Patient.new({:name => 'Jules Verne', :dob => '1940-01-01'})
      patient.save()
      result = DB.exec("SELECT dob FROM patients WHERE id = #{patient.id};")
      expect(result.getvalue(0,0)).to eq(patient.dob)
    end

    it("assigns the Patient object's id from the value returned from the database") do
      patient = Patient.new({:name => 'Bob Jones', :dob => '1960-07-01'})
      patient.save()
      result = DB.exec("SELECT id FROM patients WHERE id = #{patient.id};")
      expect(result.getvalue(0,0).to_i).to eq(patient.id)
    end
  end

  describe('#assign_doctor') do
    it('assigns patient to doctor - adding doctor.id as foreign key on Patient object/record') do
      doc = Doctor.new({:name => 'Jenna Jenkins', :specialty => 'internal medicine'})
      doc.save()
      patient = Patient.new({:name => 'Bob Jones', :dob => '1960-07-01'})
      patient.save()
      patient.assign_doctor(doc.id)
      expect(Doctor.find(patient.doctor_id)).to eq(doc)
    end
  end

end
