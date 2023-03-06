class CreateMountains < ActiveRecord::Migration[7.0]
  def change
    create_table :mountains do |t|
      t.string :name
      t.string :kana
      t.integer :height
      t.string :pre1
      t.string :pre2
      t.string :pre3
      t.string :pre4
      t.string :area
      t.string :mont_area
      t.string :alias1
      t.string :alias2
      t.string :alias3
      t.string :alias4

      t.timestamps
    end
  end
end
