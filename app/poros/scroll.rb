class Scroll
  attr_reader :name,
              :description,
              :level,
              :uses
          
  def initialize(data)
    @name = data[:name]
    @description = data[:desc]
    @level = data[:level]
    @uses = uses
  end

  private

  def uses
    rand 1..4
  end
end