class AddFamilyNameKatakanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name_katakana, :string
  end
end
