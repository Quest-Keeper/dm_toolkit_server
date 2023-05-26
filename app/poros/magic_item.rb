class MagicItem
  attr_reader :name,
              :description,
              :type,
              :rarity

  def initialize(data)
    @name = data[:name]
    @description = data[:desc]
    @type = data[:type]
    @rarity = data[:rarity]
  end
end