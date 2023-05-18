class DropCharacterTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :character
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
