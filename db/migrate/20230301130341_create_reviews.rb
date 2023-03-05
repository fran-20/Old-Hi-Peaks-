class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mountain, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.integer :score
      t.integer :level
      t.date :startdate
      t.string :alltime
      t.string :activetime
      t.integer :image

      t.timestamps
    end
  end
end
