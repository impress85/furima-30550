class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :price
      t.text    :describe
      t.references :user,  forign_key: true
      t.timestamps
    end
  end
end
