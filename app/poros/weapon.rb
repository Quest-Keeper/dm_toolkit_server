class Weapon
  attr_reader :name,
              :category,
              :damage_dice,
              :damage_type
  
  def initialize(data)
    @name = data[:name]
    @category = data[:category]
    @damage_dice = data[:damage_dice]
    @damage_type = data[:damage_type]
  end
end