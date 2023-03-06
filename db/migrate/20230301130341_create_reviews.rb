class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mountain, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :number_of_nights
      t.integer :rest_time
      t.integer :score
      t.integer :level
      t.string :start_point
      t.string :route
      t.string :title
      t.text :content
      
      t.integer :image1
      t.integer :image2
      t.integer :image3

      t.timestamps
    end
  end
end
