class Doctor
  attr_reader :name, :specialty, :id

  define_method(:initialize) do |args|
    @name = args[:name]
    @specialty = args[:specialty]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end


end
