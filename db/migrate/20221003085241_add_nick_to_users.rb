class AddNickToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nick, :string
  end
end
