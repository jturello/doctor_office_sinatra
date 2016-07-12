require('spec_helper')

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
