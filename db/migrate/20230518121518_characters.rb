class Characters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :race
      t.string :gender
      t.string :age
      t.string :name
      t.string :description
      
      t.timestamps
    end
  end
end
