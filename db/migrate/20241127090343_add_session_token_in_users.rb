class AddSessionTokenInUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :session_token, :string, null: true
  end

  def down
    remove_column :users, :session_token
  end
end
