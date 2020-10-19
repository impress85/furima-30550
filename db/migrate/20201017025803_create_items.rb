class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                   null: false
      t.integer :price,                  null: false
      t.text    :describe,               null: false
      t.references :user,                null: false, forign_key: true
      t.integer :category_id,            null: false
      t.integer :condition_id,           null: false
      t.integer :shipping_cost_payer_id, null: false
      t.integer :prefecture_id,         null: false
      t.integer :shipping_day_id,       null: false
      t.timestamps
    end
  end
end
