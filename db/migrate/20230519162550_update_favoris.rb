class UpdateFavoris < ActiveRecord::Migration[7.0]
  def change
    add_index :favoris, [:offre_id, :user_id], unique: true
  end
end
