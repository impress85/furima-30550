class AddFirstNameKatakanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_katakana, :string
  end
end
