class CreateTanks < ActiveRecord::Migration[6.0]
  def change
    create_table :tanks do |t|
      t.string :name
      t.text :detail

      t.timestamps
    end
  end
end
