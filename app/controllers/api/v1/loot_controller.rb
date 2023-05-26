class Api::V1::LootController < ApplicationController
  def index
    service = Open5eApiService.new

    magic_items = service.get_magic_items
    magic_items_objects = magic_items[:results].map do |item|
      MagicItem.new(item)
    end

    weapons = service.get_weapons
    weapons_objects = weapons[:results].map do |weapon|
      Weapon.new(weapon)
    end

    armor = service.get_armor
    armor_objects = armor[:results].map do |armor|
      Armor.new(armor)
    end
    
    spells = service.get_spells
    spells_objects = spells[:results].map do |spell|
      Scroll.new(spell)
    end

    filtered_magic_items = filter_data(magic_items_objects, params[:rarity])

    combined_data = if params[:type] == 'magic'
      filtered_magic_items + spells_objects
    elsif params[:type] == 'non-magic'
      weapons_objects + armor_objects
    elsif params[:type] == 'mixed'
      filtered_magic_items + weapons_objects + armor_objects + spells_objects
    else
      render json: { error: 'Invalid type' }, status: :bad_request
      return
    end
    
    loot = select_random_loot(combined_data, params[:amount])

    render json: { data: loot }
  end

  private
  def filter_data(data, rarity)
    data.select do |item|
      item.rarity == rarity 
    end
  end
  
  def select_random_loot(data, amount)
    amount = amount.to_i
    amount = [amount, data.size].min
    data.sample(amount)
  end
end