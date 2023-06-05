class Updatecondidatures < ActiveRecord::Migration[7.0]
  def change
    add_column :candidatures, :offre_id, :uuid
    add_index  :candidatures, :offre_id
    add_column :candidatures, :user_id, :uuid
    add_index  :candidatures, :user_id
    add_index :candidatures, [:offre_id, :user_id], unique: true
  end
end
