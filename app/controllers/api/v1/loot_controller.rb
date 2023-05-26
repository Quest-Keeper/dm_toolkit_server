class Api::V1::LootController < ApplicationController
  def generate
    def index
    service = Open5eApiService.new

    magic_items = service.get_magic_items(params[:type])
    weapons = service.get_weapons(params[:type])
    armor = service.get_armor(params[:type])
    spells = service.get_spells(params[:type])

    combined_data = magic_items + weapons + armor + spells

    filtered_data = filter_data(combined_data, params[:rarity])

    loot = select_random_loot(filtered_data, params[:amount])

    render json: loot
    end
  end

  private
  def filter_data(data, rarity)
    # The `rarity` parameter is expected to be a string that matches one of the possible rarity levels.
    # In this case, the method would iterate over the data and select only those items where the 'rarity' key's value matches the passed rarity parameter.
    # Note that the actual keys and structure of your data might be different. Adjust accordingly.
  
    data.select { |item| item[:rarity] == rarity }
  end
  
  def select_random_loot(data, amount)
    # The `amount` parameter is expected to be a string that can be converted to an integer.
    # It represents the number of items you want to select from the data.
    # The `sample` method is used to randomly select a specified number of elements from an array.
    # If `amount` is larger than the size of `data`, `sample` will return a copy of `data`.
    # Note that it will raise an error if `amount` is negative. You might want to add a check for that.
  
    amount = amount.to_i
    amount = [amount, data.size].min # ensure we don't try to sample more items than exist
    data.sample(amount)
  end
end