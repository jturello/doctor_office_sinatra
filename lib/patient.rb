class Patient

  attr_reader :dob, :name, :id

  define_method(:initialize) do |args|
    @name = args[:name]
    @dob = args[:dob]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO patients (name, dob) VALUES ('#{@name}', '#{@dob}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

end
