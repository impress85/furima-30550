class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :price
      t.text    :describe
      t.references :user,  forign_key: true
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_cost_payer_id
      t.integer :prefectures_id
      t.integer :shipping_days_id
      t.timestamps
    end
  end
end
