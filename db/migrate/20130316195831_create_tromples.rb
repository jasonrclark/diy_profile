class CreateTromples < ActiveRecord::Migration
  def change
    create_table :tromples do |t|
      t.string :name
      t.integer :intensity

      t.timestamps
    end
  end
end
