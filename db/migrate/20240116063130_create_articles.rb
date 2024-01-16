class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer :category_id ,null: false
      t.integer :detail_id ,null: false
      t.integer :shipping_detail_id ,null: false
      t.integer :prefecture_id ,null: false
      t.integer :shippng_day_id ,null: false

      t.timestamps
    end
  end
end
