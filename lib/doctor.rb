class Doctor
  attr_reader :name, :specialty, :id

  define_method(:initialize) do |args|
    @name = args[:name]
    @specialty = args[:specialty]
    @id = args[:id].to_i
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT id, name, specialty FROM doctors WHERE id = #{id};")
    return Doctor.new({:id => result.getvalue(0,0), :name => result.getvalue(0,1), :specialty => result.getvalue(0,2)})
  end

  define_method(:==) do |other_obj|
    (self.name == other_obj.name) && (self.specialty == other_obj.specialty) && (self.id == other_obj.id)
  end

end
