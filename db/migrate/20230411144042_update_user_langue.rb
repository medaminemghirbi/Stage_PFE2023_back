class UpdateUserLangue < ActiveRecord::Migration[7.0]
  def change
    add_index :user_langues, [:langue_id, :user_id], unique: true
  end
end
