class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mountain, null: false, foreign_key: true
      t.date :date
      t.string :nights
      t.time :time
      t.integer :stamina
      t.integer :score
      t.integer :level
      t.string :title
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
