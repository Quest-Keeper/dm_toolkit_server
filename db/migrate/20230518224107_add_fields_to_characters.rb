class AddFieldsToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :race, :string
    add_column :characters, :gender, :string
    add_column :characters, :age, :string
    add_column :characters, :name, :string
    add_column :characters, :description, :string
  end
end
