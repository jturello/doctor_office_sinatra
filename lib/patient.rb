class Patient

  attr_reader :dob, :name

  define_method(:initialize) do |args|
    @name = args[:name]
    @dob = args[:dob]
  end


end
