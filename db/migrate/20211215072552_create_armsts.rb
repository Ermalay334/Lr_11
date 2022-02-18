class CreateArmsts < ActiveRecord::Migration[6.1]
  def change
    create_table :armsts do |t|
      t.integer :number
      t.string :decomp

      t.timestamps
    end
  end
end
