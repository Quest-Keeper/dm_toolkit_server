class RenameCharactersToCharacter < ActiveRecord::Migration[7.0]
  def change
    rename_table :characters, :character
  end  
end
