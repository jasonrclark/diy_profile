class CreateTromplers < ActiveRecord::Migration
  def change
    create_table :tromplers do |t|
      t.string :name
      t.string :title
      t.integer :age

      t.timestamps
    end
  end
end
