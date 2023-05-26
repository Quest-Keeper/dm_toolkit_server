class Armor 
  attr_reader :name,
              :category,
              :ac_string
  
  def initialize(data)
    @name = data[:name]
    @category = data[:category]
    @ac = data[:ac_string]
  end
end