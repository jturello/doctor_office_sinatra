class Patient

  attr_reader :dob, :name, :id, :doctor_id

  define_method(:initialize) do |args|
    @name = args[:name]
    @dob = args[:dob]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO patients (name, dob) VALUES ('#{@name}', '#{@dob}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:assign_doctor) do |doctor_id|
    @doctor_id = doctor_id
    puts "there"
    puts doctor_id
    puts self.id
    puts "UPDATE patients SET doctor_id = #{doctor_id} WHERE id = #{self.id} RETURNING doctor_id;"
    result = DB.exec("UPDATE patients SET doctor_id = #{doctor_id} WHERE id = #{self.id};")
    puts result.values
  end

end
